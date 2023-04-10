import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/data/test_data/test_data.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchConstituencies {
  Future<List<Constituency>> fetchConstituencies() async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri = networkCore.getURI('/votingAPI/constituency');
    final response = await getIt<HTTPClient>().get(
      uri: uri,
    ) as Response;
    Iterable listConstituencies = json.decode(response.body);
    List<Constituency> candidates = List<Constituency>.from(
        listConstituencies.map((model) => Constituency.fromJson(model)));
    return candidates;
  }
}
