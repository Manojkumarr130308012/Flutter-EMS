import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:oriens_eam/core/utils/extensions/widget_extension.dart';
import 'package:oriens_eam/core/utils/gaps.dart';
import 'package:oriens_eam/features/11_problem/presentation/bloc/problem_bloc.dart';
import 'package:oriens_eam/features/11_problem/presentation/bloc/problem_cubit.dart';
import 'package:oriens_eam/features/4_1_service_request_details/service_request_details_presentation/view/service_request_details_page.dart';
import 'package:oriens_eam/features/4_service_request/service_request_domain/service_request_repo.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/widgets/failure_class_dropdown_search_field.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/widgets/mobile_scanner.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/widgets/problem_code_dropdown_search_field.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/widgets/work_type_dropdown_search_field.dart';
import 'package:oriens_eam/features/7_assets/presentation/bloc/asset_cubit.dart';
import 'package:oriens_eam/features/7_assets/presentation/bloc/single_asset_cubit.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../core/dependency_injection/di_container.dart';
import '../../../7_assets/domain/asset_repo.dart';
import '../../service_request_data/service_request.dart';
import '../../service_request_domain/add_service_request_api.dart';
import '../bloc/service_request/service_request_bloc.dart';
import '../bloc/service_request/service_request_state.dart';
import '../widgets/asset_dropdown_field.dart';
import '../widgets/location_dropdown_field.dart';

class ServiceRequestPage extends StatefulWidget {
  const ServiceRequestPage({super.key});

  @override
  State<ServiceRequestPage> createState() => _ServiceRequestPageState();
}

class _ServiceRequestPageState extends State<ServiceRequestPage> {
  final ServiceRequestBloc _bloc = ServiceRequestBloc(sl<ServiceRequestRepo>());

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController assetController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController failureClassController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController workTypeController = TextEditingController();

  AddServiceRequestApi createServiceRequest =
      AddServiceRequestApi(dioManager: sl());

  final FocusNode focusNode = FocusNode();
  final FocusScopeNode _node = FocusScopeNode();
  List<ServiceRequest> serviceReq = [];
  List<ServiceRequest> filteredServiceReq = [];

  List<String> sortOptions = ["New", "Wocreated"];
  String? selectedServiceRequest;

  void _onFilterApplied(List<ServiceRequest> filteredOrders) {
    setState(() {
      filteredServiceReq = filteredOrders;
    });
  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Column(
              children: [Text("Please Choose an option"), Divider()],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          _getImageFromCamera();
                        },
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text("Camera")),
                    ElevatedButton.icon(
                        onPressed: () {
                          _getImageFromGallery();
                        },
                        icon: const Icon(Icons.image_outlined),
                        label: const Text("Gallery")),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _bloc.fetchServiceRequest();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    focusNode.dispose();
    _node.dispose();

    //Clear
    nameController.clear();
    descriptionController.clear();
    assetController.clear();
    locationController.clear();
    failureClassController.clear();
    problemController.clear();
    workTypeController.clear();
    //Dispose
    nameController.dispose();
    descriptionController.dispose();
    assetController.dispose();
    locationController.dispose();
    failureClassController.dispose();
    problemController.dispose();
    workTypeController.dispose();
    super.dispose();
  }

  void filterRequests(String status) {
    setState(() {
      if (status == "All") {
        filteredServiceReq = serviceReq;
      } else {
        if (selectedServiceRequest == "All") {
          filteredServiceReq = filteredServiceReq
              .where((request) => request.status == status)
              .toList();
        } else {
          filteredServiceReq =
              serviceReq.where((request) => request.status == status).toList();
        }
      }
      selectedServiceRequest = status.capitalize();
    });
  }

  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  int differenceInDays(int? index, state) {
    final date = DateFormat("yyyy-MM-dd")
        .format(state.serviceRequests[index].createdDate);
    final createdDate = DateTime.parse(date);
    final currentDate = DateTime.now();
    final days = (currentDate.difference(createdDate).inDays).round();
    return days;
  }

  int differenceInWeeks(int? index, state) {
    final date = DateFormat("yyyy-MM-dd")
        .format(state.serviceRequests[index].requestedDate);
    final requestedDate = DateTime.parse(date);
    final currentDate = DateTime.now();
    final weeks = (currentDate.difference(requestedDate).inDays / 7).round();
    return weeks;
  }

/////////////////////////// BUILD METHOD \\\\\\\\\\\\\\\\\\\\\\\\\\
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade200,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(240),
            child: Material(
              elevation: 4,
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      context.local.service_request,
                      style: const TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                  ),

                  /* ------------------ 1_Search Field ------------------ */
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: TextField(
                      onChanged: (value) => _searchSearvice(value, serviceReq),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          isDense: true,
                          // Added this
                          contentPadding: const EdgeInsets.all(8),
                          hintText: "Search By SR Name",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          prefixIconColor: Colors.grey.shade400),
                    ),
                  ),
                  const SizedBox(height: 10),
                  /* ------------------ 2_Filters Section ------------------ */
                  Row(
                    children: sortOptions
                        .map(
                          (category) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: FilterChip(
                              label: Text(category),
                              selected: selectedServiceRequest == category,
                              onSelected: (selected) {
                                setState(() {
                                  filterRequests(selected
                                      ? category.toUpperCase()
                                      : "All");
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 10),

                  /* ------------------ Sort By Section ------------------ */
                  SortBySection(
                    checkBoxListTileModel: checkBoxListTileModel,
                    filteredReq: filteredServiceReq,
                    onFiltered: _onFilterApplied,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          floatingActionButton: Align(
            alignment: const Alignment(1, 0.95),
            child: FloatingActionButton.small(
              onPressed: () {
                buildAddRequestPopUp(context);
              },
              child: const Icon(Icons.add),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          /////////////////////////// BODY \\\\\\\\\\\\\\\\\\\\\\\\\\
          body: BlocConsumer<ServiceRequestBloc, ServiceRequestState>(
            bloc: _bloc,
            listener: (BuildContext context, ServiceRequestState state) {
              if (state is ServiceRequestErrorState) {
                SnackBar snackBar = SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is ServiceRequestLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              if (state is ServiceRequestLoadedState) {
                serviceReq = state.serviceRequests;
                if (filteredServiceReq.isEmpty) {
                  filteredServiceReq = state.serviceRequests;
                }
                if (filteredServiceReq.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        /////////////////////////// SERVICE REQUEST LISTS \\\\\\\\\\\\\\\\\\\\\\\\\\
                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredServiceReq.length,
                            itemBuilder: (context, index) {
                              int days = differenceInDays(index, state);
                              int weeks = differenceInWeeks(index, state);
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ServiceRequestDetailsPage(
                                        serviceRequest:
                                            state.serviceRequests[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: const EdgeInsets.all(10),
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.green[400]!,
                                                Colors.green[600]!
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Text(
                                            filteredServiceReq[index].status ??
                                                "",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                filteredServiceReq[index]
                                                        .serviceRequestName ??
                                                    "",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Aeon',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "#${filteredServiceReq[index].code?.trim()}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Aeon',
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(color: Colors.grey[300]),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.75,
                                          child: Text(
                                            filteredServiceReq[index]
                                                        .description ==
                                                    null
                                                ? ""
                                                : filteredServiceReq[index]
                                                        .description ??
                                                    "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Aeon',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        /* ------------------ Other Details - Last Line ------------------ */
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              (() {
                                                if (days <= 1) {
                                                  return "$days Day ago";
                                                } else if (days > 1 &&
                                                    days <= 7) {
                                                  return "$days Days ago";
                                                } else if (days >= 7) {
                                                  return "$weeks Week ago";
                                                } else if (days >= 14) {
                                                  return "$weeks Weeks ago";
                                                } else {
                                                  return "";
                                                }
                                              })(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  const Center(
                    child: Text("No Data Available"),
                  );
                }
              }
              return const Center(
                child: Icon(Icons.refresh),
              );
            },
          ),
        ),
      ),
    );
  }

  /////////////////////////// BUILD ADD REQUEST POP UP \\\\\\\\\\\\\\\\\\\\\\\\\\
  Future<dynamic> buildAddRequestPopUp(BuildContext context) {
    BarcodeCapture? barcode;
    String scanValue;

    final _formKey = GlobalKey<FormState>();

    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AssetBloc(),
              ),
              BlocProvider(
                create: (context) => SingleAssetCubit(),
              ),
              BlocProvider(
                create: (context) => ProblemCubit(),
              ),
            ],
            child: BlocConsumer<AssetBloc, AssetsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final ProblemCubit problemCubit =
                    BlocProvider.of<ProblemCubit>(context);

                final SingleAssetCubit singleAssetCubit =
                    BlocProvider.of<SingleAssetCubit>(context);

                bool isAssetSelected = false;
                bool isLocationSelected = false;

                String failureClassID = "";
                String problem = "";
                String assetID = "";
                String locationID = "";
                String workTypeValue = "";
                String? singleAssetLocationCode = "";
                String? singleAssetFailureClassID = "";

                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: SizedBox(
                      height: 740,
                      child: Scaffold(
                        body: CupertinoPopupSurface(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        nameController.clear();
                                        descriptionController.clear();
                                        assetController.clear();
                                        locationController.clear();
                                        failureClassController.clear();
                                        problemController.clear();
                                        workTypeController.clear();
                                        // context.pop();
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                    const Text(
                                      'New Request',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final assetValue =
                                            await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const Scanner(),
                                          ),
                                        );
                                        setState(() {
                                          // scanValue = assetValue;
                                          assetController.text = assetValue;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.qr_code_scanner_outlined,
                                        color: Colors.blue,
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(
                                  thickness: 2,
                                  height: 0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Form(
                                    key: _formKey,
                                    child: FocusScope(
                                      node: _node,
                                      child: ListView(
                                        children: [
                                          /////////////////////////// SERVICE REQUEST NAME FILED \\\\\\\\\\\\\\\\\\\\\\\\\\
                                          TextFormField(
                                            controller: nameController,
                                            maxLength: 100,
                                            // textInputAction: TextInputAction.next,
                                            decoration: const InputDecoration(
                                              label:
                                                  Text("Service Request name"),
                                              hintText: "Service Request name",
                                              counterText: "",
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            onEditingComplete: _node.nextFocus,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Service request name is required';
                                              }
                                              return null;
                                            },
                                          ),

                                          gapH12,

                                          /////////////////////////// DESCRIPTION FILED \\\\\\\\\\\\\\\\\\\\\\\\\\
                                          TextFormField(
                                            controller: descriptionController,
                                            maxLength: 100,
                                            // textInputAction: TextInputAction.next,
                                            onEditingComplete: _node.nextFocus,
                                            decoration: const InputDecoration(
                                              counterText: "",
                                              label: Text("Description"),
                                              hintText: "Description",
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                          gapH12,

                                          /////////////////////////// ASSET NAME FILED \\\\\\\\\\\\\\\\\\\\\\\\\\

                                          AssetNameDropDownSearchField(
                                            controller: assetController,
                                            // onSearchTextChanged: (value) {
                                            //   setState(() {
                                            //     locationController.text = "";
                                            //     isAssetSelected = true;
                                            //   });
                                            //   return null;
                                            // },
                                            onSuggestionTap:
                                                (SearchFieldListItem<String>
                                                    x) async {
                                              FocusScope.of(context)
                                                  .requestFocus(focusNode);
                                              setState(() {
                                                assetID = x.item!;
                                              });

                                              AssetRepo.getAssetsById(assetID)
                                                  .then((value) {
                                                setState(() {
                                                  isAssetSelected = true;
                                                  singleAssetLocationCode =
                                                      value.data?.result
                                                          ?.locationName!;
                                                  locationID = value
                                                          .data
                                                          ?.result
                                                          ?.locationId ??
                                                      "";
                                                  locationController.text =
                                                      singleAssetLocationCode ??
                                                          "...";

                                                  singleAssetFailureClassID = value
                                                          .data
                                                          ?.result
                                                          ?.failureClassName ??
                                                      "";
                                                  failureClassID = value
                                                          .data
                                                          ?.result
                                                          ?.failureClassesId ??
                                                      "";
                                                  failureClassController.text =
                                                      singleAssetFailureClassID ??
                                                          "...";
                                                });
                                                problemCubit.fetchProblems(
                                                    failureClassID);
                                              }, onError: (error, stacktrace) {
                                                print(
                                                    'Error getting value: #error');
                                              });
                                            },
                                          ),
                                          gapH12,

                                          /////////////////////////// LOCATION FILED \\\\\\\\\\\\\\\\\\\\\\\\\\

                                          !isAssetSelected
                                              ? LocationDropDownSearchField(
                                                  controller:
                                                      locationController,
                                                  // initialValue: SearchFieldListItem(
                                                  //   state.asset[6].locationName ?? "",
                                                  //   child: Text(state.asset[6].locationName ?? ""),
                                                  // ),
                                                  onSuggestionTap:
                                                      (SearchFieldListItem<
                                                              String>
                                                          x) {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            focusNode);
                                                    setState(() {
                                                      locationID = x.item!;
                                                      isLocationSelected = true;
                                                    });
                                                  },
                                                  assetId: assetID,
                                                )
                                              : TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      locationController,
                                                  maxLength: 100,
                                                  // textInputAction: TextInputAction.next,
                                                  onEditingComplete:
                                                      _node.nextFocus,
                                                  decoration:
                                                      const InputDecoration(
                                                    counterText: "",
                                                    label: Text("Location"),
                                                    hintText: "Location",
                                                    border:
                                                        OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ),

                                          gapH12,

                                          /////////////////////////// FAILURE CLASS FILED \\\\\\\\\\\\\\\\\\\\\\\\\\

                                          !isAssetSelected
                                              ? FailureClassDropDownSearchField(
                                                  onChanged: (string) async {
                                                    // await problemCubit.fetchProblems(failureClassID);
                                                  },
                                                  controller:
                                                      failureClassController,
                                                  onSuggestionTap:
                                                      (SearchFieldListItem<
                                                              String>
                                                          x) async {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            focusNode);
                                                    setState(() {
                                                      failureClassID = x.item!;
                                                    });
                                                    problemCubit.fetchProblems(
                                                        failureClassID);
                                                  },
                                                )
                                              : TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      failureClassController,
                                                  maxLength: 100,
                                                  // textInputAction: TextInputAction.next,
                                                  onEditingComplete:
                                                      _node.nextFocus,
                                                  decoration:
                                                      const InputDecoration(
                                                    counterText: "",
                                                    label:
                                                        Text("Failure Class"),
                                                    hintText: "Failure Class",
                                                    border:
                                                        OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ),

                                          gapH12,

                                          /////////////////////////// PROBLEM FIELD  \\\\\\\\\\\\\\\\\\\\\\\\\\

                                          BlocBuilder<ProblemCubit,
                                              OldWayProblemState>(
                                            bloc: problemCubit,
                                            builder: (context, state) {
                                              // IF LOADING STATE : Shows Empty Search Field
                                              if (state
                                                  is OldWayProblemLoadingState) {
                                                return SearchField(
                                                  hint: "Select Failure Class",
                                                  searchInputDecoration:
                                                      const InputDecoration(
                                                    label: Text("Problem"),
                                                    border:
                                                        OutlineInputBorder(),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue)),
                                                  ),
                                                  suggestions: []
                                                      .map((e) =>
                                                          SearchFieldListItem(e,
                                                              child: Text(e)))
                                                      .toList(),
                                                  onSuggestionTap: (x) {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            focusNode);
                                                    // FocusScope.of(context).nextFocus();
                                                  },
                                                );
                                              }

                                              // IF LOADED STATE
                                              if (state
                                                  is OldWayProblemLoadedState) {
                                                return ProblemsDropDownSearchField(
                                                  controller: problemController,
                                                  onSuggestionTap:
                                                      (SearchFieldListItem<
                                                              String>
                                                          x) {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    // FocusScope.of(context).nextFocus();
                                                    setState(() {
                                                      problem = x.item!;
                                                    });
                                                  },
                                                  failureClassId:
                                                      failureClassID,
                                                );
                                              }

                                              // ELSE
                                              return SearchField(
                                                hint: "No Problem Available",
                                                searchInputDecoration:
                                                    const InputDecoration(
                                                  label: Text("Problem"),
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue)),
                                                ),
                                                suggestions: [
                                                  "No Problem Available"
                                                ]
                                                    .map((e) =>
                                                        SearchFieldListItem(e,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10.0),
                                                              child: Text(
                                                                e,
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                            )))
                                                    .toList(),
                                                onSuggestionTap: (x) {
                                                  FocusScope.of(context)
                                                      .requestFocus(focusNode);
                                                  // FocusScope.of(context).nextFocus();
                                                },
                                                suggestionsDecoration:
                                                    SuggestionDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade400),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                              0.5), //color of shadow
                                                      spreadRadius:
                                                          2, //spread radius
                                                      blurRadius:
                                                          5, // blur radius
                                                      offset:
                                                          const Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                validator: (x) {
                                                  final problem = [
                                                    "No Problem Available"
                                                  ].map((e) => e).toList();

                                                  if (x!.isEmpty ||
                                                      x.contains(
                                                          "No Problem Available")) {
                                                    return 'Please Enter a Valid Problem';
                                                  }
                                                  return null;
                                                },
                                              );
                                            },
                                          ),

                                          gapH12,

                                          /////////////////////////// WORK TYPE DROPDOWN \\\\\\\\\\\\\\\\\\\\\\\\\\
                                          WorkTypeDropDownSearchField(
                                            controller: workTypeController,
                                            onSuggestionTap:
                                                (SearchFieldListItem<String>
                                                    x) {
                                              FocusScope.of(context)
                                                  .requestFocus(focusNode);
                                              // FocusScope.of(context).nextFocus();
                                              setState(() {
                                                workTypeValue = x.item!;
                                              });
                                            },
                                          ),
                                          const Divider(
                                            thickness: 2,
                                          ),

                                          ListTile(
                                            title: Text(
                                              context.local.image,
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  onPressed: _showImageDialog,
                                                  icon: const Icon(Icons
                                                      .arrow_forward_ios_outlined),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0, right: 8),
                                            child: Divider(
                                              thickness: 1,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                foregroundColor:
                                                    Colors.white, // foreground
                                                fixedSize: Size(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  40,
                                                ),
                                              ),
                                              onPressed: () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  final data = {
                                                    "serviceRequestName":
                                                        nameController.text,
                                                    "description":
                                                        descriptionController
                                                            .text,
                                                    "assetId": assetID,
                                                    "locationId": locationID,
                                                    "failureClassId":
                                                        failureClassID,
                                                    "problemId": problem,
                                                    "workType": workTypeValue,
                                                    "createdDate":
                                                        "2024-01-04T06:28:43.489Z",
                                                  };

                                                  await createServiceRequest
                                                      .addServiceRequest(data);
                                                  nameController.clear();
                                                  descriptionController.clear();
                                                  assetController.clear();
                                                  locationController.clear();
                                                  failureClassController
                                                      .clear();
                                                  problemController.clear();
                                                  workTypeController.clear();

                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                            "A new service request has been created successfully."),
                                                      ),
                                                    );
                                                    Future.delayed(
                                                            const Duration(
                                                                seconds: 2))
                                                        .then((value) =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop());
                                                  }
                                                }
                                              },
                                              child: const Text(
                                                "Submit",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: MediaQuery.of(context).viewInsets.bottom + 40,
                                // ),
                                // SizedBox(height: _animation.value),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          );
        });
  }

  Widget buildSegment(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.black),
    );
  }

  void _getImageFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
  }

  void _getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  /// Function used for search functionality
  void _searchSearvice(
      String enteredKeyword, List<ServiceRequest>? serviceReq) {
    List<ServiceRequest>? results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        filteredServiceReq = serviceReq!;
      });
    } else {
      results = serviceReq
          ?.where(
            (element) => element.serviceRequestName!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()),
          )
          .toList();
      setState(() {
        filteredServiceReq = results!;
      });
    }
  }
}

/////////////////////////// SORT BY SECTION  \\\\\\\\\\\\\\\\\\\\\\\\\\
class SortBySection extends StatefulWidget {
  final List<CheckBoxListTileModel> checkBoxListTileModel;
  final List<ServiceRequest> filteredReq;
  final Function(List<ServiceRequest>) onFiltered;

  const SortBySection(
      {super.key,
      required this.checkBoxListTileModel,
      required this.filteredReq,
      required this.onFiltered});

  @override
  State<SortBySection> createState() => _SortBySectionState();
}

class _SortBySectionState extends State<SortBySection> {
  String selectedTitle = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  buildShowModalBottomSheet(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.sort_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(selectedTitle.isNotEmpty
                        ? selectedTitle
                        : "Sort By"), // Show selected title or default text
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(" ${widget.filteredReq.length} Results"),
        ],
      ),
    );
  }

  /////////////////////////// SHOW MODAL BOTTOM SHEET \\\\\\\\\\\\\\\\\\\\\\\\\\
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 3,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                Text(
                  context.local.sort_by,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),

                /* ------------------ List View ------------------ */
                Expanded(
                  child: ListView.separated(
                      itemCount: widget.checkBoxListTileModel.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: Center(
                            child: ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              title: Text(
                                widget.checkBoxListTileModel[index].title,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              trailing:
                                  widget.checkBoxListTileModel[index].isCheck
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.blue,
                                        )
                                      : null,
                              selectedColor: Colors.blue,
                              onTap: () {
                                _updateSelectedTitle(
                                    index); // Update selected tile
                                _filterReqOrder(
                                    widget.checkBoxListTileModel[index].title,
                                    widget.filteredReq);
                                Navigator.pop(context);
                              },
                              onLongPress: () {},
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  void _updateSelectedTitle(int index) {
    setState(() {
      // Unselect all tiles first
      for (var tile in widget.checkBoxListTileModel) {
        tile.isCheck = false;
      }
      // Select the tapped tile
      widget.checkBoxListTileModel[index].isCheck = true;
      selectedTitle = widget.checkBoxListTileModel[index].title;
    });
  }

  /// Function used for search functionality
  void _filterReqOrder(
      String filteredKeyword, List<ServiceRequest>? serviceRequest) {
    if (filteredKeyword == "Created at") {
      serviceRequest?.sort((a, b) {
        if (a.createdDate == null && b.createdDate == null) return 0;
        if (a.createdDate == null) return 1; // Null names go last
        if (b.createdDate == null) return -1; // Null names go last
        return a.createdDate!.compareTo(b.createdDate!);
      });
    } else if (filteredKeyword == "Request Name") {
      serviceRequest?.sort((a, b) {
        if (a.serviceRequestName == null && b.serviceRequestName == null)
          return 0;
        if (a.serviceRequestName == null) return 1; // Null names go last
        if (b.serviceRequestName == null) return -1; // Null names go last
        return a.serviceRequestName!.compareTo(b.serviceRequestName!);
      });
    } else {}
    widget.onFiltered(serviceRequest!);
  }
}

class CheckBoxListTileModel {
  String title;
  bool isCheck;

  CheckBoxListTileModel({required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(title: "Created at", isCheck: false),
      CheckBoxListTileModel(title: "Request Name", isCheck: false),
      CheckBoxListTileModel(title: "Location", isCheck: false),
    ];
  }
}
