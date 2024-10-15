import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/widgets/appbar_search_filed.dart';
import 'package:oriens_eam/features/8_location/presentation/bloc/location_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../2_workorder/3_wo_presentation/view/calender_page.dart';
import '../widgets/location_sort_by_widget.dart';

/////////////////////////////////////////////////////////////
/// LOCATION PAGE
/////////////////////////////////////////////////////////////

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<CheckBoxListTileModel> checkBoxListTileModel = CheckBoxListTileModel.getUsers();

  final LocationBloc _bloc = LocationBloc();

  @override
  void initState() {
    _bloc.fetchLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170),
          child: Material(
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      context.local.location,
                      style: const TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),

                  /* ------------------ 1_Search Field ------------------ */

                  const AppBarSearchField(title: "Search all Location"),
                  const SizedBox(
                    height: 10,
                  ),
                  /* ------------------ Sort By Section ------------------ */

                  BlocBuilder<LocationBloc, LocationState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is LocationLoadingState) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      if (state is LocationLoadedState) {
                        return LocationSortByWidget(
                          checkBoxListTileModel: checkBoxListTileModel,
                          results: state.locations.length > 1
                              ? " ${state.locations.length} Results"
                              : " ${state.locations.length} Result",
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocConsumer<LocationBloc, LocationState>(
          bloc: _bloc,
          listener: (BuildContext context, LocationState state) {
            if (state is LocationErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(OriensSnackBar(error: state.error) as SnackBar);
            }
          },
          builder: (BuildContext context, state) {
            if (state is LocationLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state is LocationLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    /////////////////////////// LOCATIONS LISTS \\\\\\\\\\\\\\\\\\\\\\\\\\
                    Expanded(
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: state.locations.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(4),
                              semanticContainer: false,
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    /////////////////////////// LOCATION TITLE \\\\\\\\\\\\\\\\\\\\\\\\\\
                                    Text(
                                      state.locations[index].locationName ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    Row(
                                      children: [
                                        Icon(
                                          Icons.bar_chart,
                                          color: Colors.grey.shade600,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          state.locations[index].locationCode ?? "LocationCode",
                                          style: TextStyle(color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey.shade600,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          state.locations[index].locationDesc ?? "Location",
                                          style: TextStyle(color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text("An error Occurred!"),
            );
          },
        ),
      ),
    );
  }
}
