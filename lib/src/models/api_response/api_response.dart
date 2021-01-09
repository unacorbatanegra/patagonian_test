class ApiResponse<T> {
  final int statusCode;
  T data;
  ApiResponse({
    this.statusCode,
    this.data,
  });
  bool get hasError => statusCode != 200;
  String get errorMessage => _getErrorMessage();

  String _getErrorMessage() {
    switch (statusCode) {
      case 200:
        return '';
      case 404:
        return 'We can\'t find your song :(';
      case 403:
        return 'You don\'t have access to this';
      case 500:
        return 'Server error';
      default:
        return '';
    }
  }
}
