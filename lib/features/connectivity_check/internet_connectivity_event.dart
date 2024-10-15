part of 'internet_connectivity_bloc.dart';

@immutable
abstract class InternetConnectivityEvent {}

class InternetConnectedEvent extends InternetConnectivityEvent {}

class InternetLostEvent extends InternetConnectivityEvent {}
