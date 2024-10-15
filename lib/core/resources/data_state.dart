import 'package:dio/dio.dart';

/* In order to determine the state of the request being sent to the server and its response,
this wrapper class can be used to Wrap Network call.*/

abstract class DataState<T> {
  final T? data;
  final DioException? error;
  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
