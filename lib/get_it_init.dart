import 'package:admin_app/data/add_constituency.dart';
import 'package:admin_app/data/add_new_candidate.dart';
import 'package:admin_app/data/add_party.dart';
import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_constituencies.dart';
import 'package:admin_app/data/fetch_parties.dart';
import 'package:admin_app/data/fetch_parties_and_constituencies.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/repository/add_candidate_repository.dart';
import 'package:admin_app/repository/add_constituency_repository.dart';
import 'package:admin_app/repository/add_party_repository.dart';
import 'package:admin_app/repository/fetch_candidates_repository.dart';
import 'package:admin_app/repository/fetch_constituency_repository.dart';
import 'package:admin_app/repository/fetch_parties_repository.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:get_it/get_it.dart';

import 'repository/fetch_parties_and_constituencies_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HTTPClient>(HTTPClient());
  getIt.registerSingleton<FetchTally>(FetchTally());
  getIt.registerSingleton<FetchCandidates>(FetchCandidates());
  getIt.registerSingleton<FetchParties>(FetchParties());
  getIt.registerSingleton<FetchPartiesAndConstituencies>(
      FetchPartiesAndConstituencies());
  getIt.registerSingleton<FetchConstituencies>(FetchConstituencies());
  getIt.registerSingleton<AddNewCandidate>(AddNewCandidate());
  getIt.registerSingleton<AddParty>(AddParty());
  getIt.registerSingleton<AddConstituency>(AddConstituency());
  getIt.registerSingleton<FetchTallyRepository>(FetchTallyRepository());
  getIt.registerSingleton<FetchCandidatesRepository>(
      FetchCandidatesRepository());
  getIt.registerSingleton<FetchPartiesRepository>(FetchPartiesRepository());
  getIt.registerSingleton<FetchPartiesAndConstituenciesRepository>(
      FetchPartiesAndConstituenciesRepository());
  getIt.registerSingleton<FetchConstituenciesRepository>(
      FetchConstituenciesRepository());
  getIt.registerSingleton<AddCandidateRepository>(AddCandidateRepository());
  getIt.registerSingleton<AddConstituencyRepository>(
      AddConstituencyRepository());
  getIt.registerSingleton<NetworkCore>(NetworkCore());
}
