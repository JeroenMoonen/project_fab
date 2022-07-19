import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtStorage {
  final storage = const FlutterSecureStorage();

  Future<void> saveJwt({token}) async {
    await storage.write(key: 'jwt', value: token);
  }

  Future<String?> getJwt() async {
    return await storage.read(key: 'jwt');
  }
}
