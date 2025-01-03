class DefaultResponseModel<T> {
  final T? data;
  final String? error;

  DefaultResponseModel({
    this.data,
    this.error,
  });

  bool get isSuccess => error == null;
}
