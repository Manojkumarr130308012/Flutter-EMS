part of 'internet_connectivity_bloc.dart';

@immutable
abstract class InternetConnectivityState {}

class InternetConnectivityInitial extends InternetConnectivityState {}

class InternetConnectedState extends InternetConnectivityState {
  InternetConnectedState();
}

class InternetLostState extends InternetConnectivityState {
  InternetLostState();
}

// part of 'internet_bloc.dart';
//
// @immutable
// abstract class InternetState {}
//
// class InternetInitial extends InternetState {}
//
// class ConnectedState extends InternetState {
//   final String message;
//
//   ConnectedState({required this.message});
// }
//
// class NotConnectedState extends InternetState {
//   final String message;
//
//   NotConnectedState({required this.message});
// }
