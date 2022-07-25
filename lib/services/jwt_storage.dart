import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtStorage {
  final storage = const FlutterSecureStorage();

  Future<void> saveJwt({token}) async {
    await storage.write(key: 'jwt', value: token);
  }

  Future<bool> hasJwt() async {
    return await storage.containsKey(key: 'jwt');
  }

  Future<void> removeJwt({token}) async {
    await storage.delete(key: 'jwt');
  }

  Future<String?> getJwt() async {
    return await storage.read(key: 'jwt');
  }
}
