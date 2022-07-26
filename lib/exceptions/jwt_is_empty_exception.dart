class JwtIsEmptyException implements Exception {
  late String errorMessage = 'Jwt is null!';

  @override
  String toString() => errorMessage;
}
