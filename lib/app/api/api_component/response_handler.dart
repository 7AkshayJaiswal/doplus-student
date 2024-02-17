class ResponseData<T> {
  final bool statusSuccess;
  final T? data;
  final int statusCode;
  final String? errorMessage;

  ResponseData({
    required this.statusSuccess,
    required this.statusCode,
    this.data,
    this.errorMessage,
  });
}
