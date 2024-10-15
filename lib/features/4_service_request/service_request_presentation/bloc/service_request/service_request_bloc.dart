import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/4_service_request/service_request_domain/service_request_repo.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/bloc/service_request/service_request_state.dart';

import '../../../../../core/resources/data_state.dart';

class ServiceRequestBloc extends Cubit<ServiceRequestState> {
  final ServiceRequestRepo serviceRequestRepo;
  ServiceRequestBloc(this.serviceRequestRepo) : super(ServiceRequestLoadingState());

  Future<void> fetchServiceRequest() async {
    final dataState = await serviceRequestRepo.getServiceRequestList();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ServiceRequestLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(ServiceRequestErrorState("Error Fetching Data"));
    }
  }
}
