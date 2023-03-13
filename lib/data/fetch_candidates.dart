import 'dart:convert';

import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchCandidates {
  Future<List<Candidate>> fetchCandidates() async {
    final response = await getIt<HTTPClient>().get(
      uri: Uri(
          scheme: 'https',
          host: 'dart.dev',
          path: '/guides/libraries/library-tour',
          fragment: 'numbers'),
    ) as Response;
    Iterable listCandidates = json.decode(response.body);
    List<Candidate> candidates = List<Candidate>.from(
        listCandidates.map((model) => Candidate.fromJson(model)));
    return candidates;
  }
}
