import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class AddNewCandidate {
  Future<Candidate> addNewCandidate(Candidate candidate) async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri = networkCore.getURI('/votingAPI/candidates');
    print("WHOO");
    print(candidate.toJson());
    final response = await getIt<HTTPClient>()
        .post(uri: uri, body: candidate.toJson()) as Response;
    print(response);
    if (response.statusCode != 201) {}
    return Future<Candidate>.value(candidate);
  }
}
