import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:mobile_me/common/http/http_logging_interceptor.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<http.Client>(
    InterceptedClient.build(interceptors: [HttpLoggingInterceptor()]),
  );
}
