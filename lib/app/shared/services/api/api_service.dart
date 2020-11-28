import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'api_service.g.dart';

@Injectable()
class ApiService extends DioForNative {
  static const kApiUrl = "https://pokeapi.co/api/v2";
  ApiService()
      : super(BaseOptions(
          baseUrl: kApiUrl,
          connectTimeout: 5000,
          receiveTimeout: 5000,
        )) {
    interceptors.add(DioCacheManager(
      CacheConfig(
        baseUrl: kApiUrl,
        defaultMaxAge: Duration(minutes: 10),
      ),
    ).interceptor);
  }
}
