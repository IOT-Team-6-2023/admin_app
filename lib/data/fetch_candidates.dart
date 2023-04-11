import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/data/test_data/test_data.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchCandidates {
  Future<List<Candidate>> fetchCandidates() async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri = networkCore.getURI('/votingAPI/candidates');
    final response = await getIt<HTTPClient>().get(
      uri: uri,
    ) as Response;
    Iterable listCandidates = json.decode(response.body);
    List<Candidate> candidates = List<Candidate>.from(
        listCandidates.map((model) => Candidate.fromJson(model)));
    return candidates;
  }
}
