import 'package:http_interceptor/http_interceptor.dart';
import 'package:flutterbytebank/http/interceptors/logging_interceptor.dart';

final InterceptedClient client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);
const String baseUrl = 'http://your_ip:8080/transactions';
