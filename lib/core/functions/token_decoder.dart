import 'package:jwt_decode/jwt_decode.dart' as JwtDecoder;

Map<String, dynamic> tokenDecoder(String token) {
  return JwtDecoder.Jwt.parseJwt(token);
}
