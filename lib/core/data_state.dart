abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required super.data});
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required super.error});
}
