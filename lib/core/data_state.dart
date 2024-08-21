abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState({this.data, this.error});
}

class DataSuccess extends DataState {
  DataSuccess({required super.data});
}

class DataFailed extends DataState {
  DataFailed({required super.error});
}
