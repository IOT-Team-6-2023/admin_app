import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HTTPClient>(HTTPClient());
  getIt.registerSingleton<FetchTally>(FetchTally());
  getIt.registerSingleton<FetchTallyRepository>(FetchTallyRepository());
}
