import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_parties.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/repository/fetch_candidates_repository.dart';
import 'package:admin_app/repository/fetch_parties_repository.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HTTPClient>(HTTPClient());
  getIt.registerSingleton<FetchTally>(FetchTally());
  getIt.registerSingleton<FetchCandidates>(FetchCandidates());
  getIt.registerSingleton<FetchParties>(FetchParties());
  getIt.registerSingleton<FetchTallyRepository>(FetchTallyRepository());
  getIt.registerSingleton<FetchCandidatesRepository>(
      FetchCandidatesRepository());
  getIt.registerSingleton<FetchPartiesRepository>(FetchPartiesRepository());
}
