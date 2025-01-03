class PaginableParamsModel {
  final String? query;
  final int limit;
  final int offset;

  PaginableParamsModel({
    this.query,
    this.limit = 20,
    this.offset = 0,
  });
}
