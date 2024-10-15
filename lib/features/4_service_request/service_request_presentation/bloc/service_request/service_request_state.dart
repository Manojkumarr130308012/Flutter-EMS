import '../../../service_request_data/service_request.dart';

abstract class ServiceRequestState {}

class ServiceRequestLoadingState extends ServiceRequestState {}

class ServiceRequestLoadedState extends ServiceRequestState {
  final List<ServiceRequest> serviceRequests;
  ServiceRequestLoadedState(this.serviceRequests);
}

class ServiceRequestErrorState extends ServiceRequestState {
  final String error;
  ServiceRequestErrorState(this.error);
}
