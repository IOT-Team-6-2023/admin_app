import 'package:admin_app/services/http_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HTTPClient>(HTTPClient());
}
