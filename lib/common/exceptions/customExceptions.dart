// We are creating a custom exception that will holds
//  exception value. The CustomException implement exception classs
//it contains a string message
class CustomException implements Exception {
  final String? message;
  const CustomException({this.message = 'Something went wrong'});

  @override
  String toString() => 'CustomException {message:$message}';
}
