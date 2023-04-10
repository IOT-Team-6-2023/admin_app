import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class AddConstituency {
  Future<Constituency> addConstituency(Constituency constituency) async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri = networkCore.getURI('/votingAPI/constituency');
    final response = await getIt<HTTPClient>()
        .post(uri: uri, body: constituency.toJson()) as Response;
    if (response.statusCode != 201) {
      throw Exception("API error");
    }
    return Future<Constituency>.value(constituency);
  }
}
