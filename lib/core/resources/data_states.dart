import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? exception;
  final Object? error;
  const DataState({this.data, this.exception, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException exception) : super(exception: exception);
}

class FailedException<T> extends DataState<T> {
  const FailedException(Object error) : super(error: error);
}
