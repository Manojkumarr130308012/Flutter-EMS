// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:oriens_eam/features/4_service_request/service_request_domain/add_service_request_api.dart';
//
// import '../../../service_request_data/service_request.dart';
//
// part 'add_service_request_state.dart';
//
// class AddServiceRequestCubit extends Cubit<AddServiceRequestState> {
//   AddServiceRequestCubit() : super(AddServiceRequestInitial());
//
//   void addServiceRequest(ServiceRequest serviceRequest) {
//     try {
//       emit(AddingServiceRequestState());
//       AddServiceRequestApi.addServiceRequest(serviceRequest);
//     } catch (e) {
//       emit(AddServiceRequestErrorState(error: "Error Adding Service request"));
//     }
//   }
// }
