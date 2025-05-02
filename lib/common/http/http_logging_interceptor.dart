import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class HttpLoggingInterceptor extends InterceptorContract {
  final logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    logger.i('Request:');
    logger.i('Method: ${request.method}');
    logger.i('URL: ${request.url}');
    logger.i('Headers: ${request.headers}');

    if (request is Request) {
      logger.i('Body: ${request.body}');
    }

    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    logger.i('Response:');
    logger.i('Status: ${response.statusCode}');
    logger.i('Headers: ${response.headers}');

    if (response is Response) {
      logger.i('Body: ${response.body}');
    }

    return response;
  }
}
