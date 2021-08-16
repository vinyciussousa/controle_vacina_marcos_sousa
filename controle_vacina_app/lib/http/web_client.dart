// @dart=2.9

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptor/logging_interceptor.dart';

final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()]
);
const String baseUrl = '4cd8e6e07da0.ngrok.io';
const String api = 'api/v1/pessoas';


