import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_connectivity_event.dart';
part 'internet_connectivity_state.dart';

class InternetConnectivityBloc
    extends Bloc<InternetConnectivityEvent, InternetConnectivityState> {
  StreamSubscription? _subscription;
  InternetConnectivityBloc() : super(InternetConnectivityInitial()) {
    on<InternetConnectivityEvent>((event, emit) {
      if (event is InternetConnectedEvent) {
        emit(InternetConnectedState());
      } else if (event is InternetLostEvent) {
        emit(InternetLostState());
      }
    });
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(InternetConnectedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
//
// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:meta/meta.dart';
//
// part 'internet_event.dart';
// part 'internet_state.dart';
//
// class InternetBloc extends Bloc<InternetEvent, InternetState> {
//   StreamSubscription? _subscription;
//   InternetBloc() : super(InternetInitial()) {
//     on<InternetEvent>((event, emit) {
//       if (event is ConnectedEvent) {
//         emit(ConnectedState(message: "Connected"));
//       } else if (event is NotConnectedEvent) {
//         emit(NotConnectedState(message: "Not Connected"));
//       }
//     });
//
//     _subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.wifi ||
//           result == ConnectivityResult.mobile) {
//         add(ConnectedEvent());
//       } else {
//         add(NotConnectedEvent());
//       }
//     });
//   }
//   @override
//   Future<void> close() {
//     _subscription!.cancel();
//     return super.close();
//   }
// }
