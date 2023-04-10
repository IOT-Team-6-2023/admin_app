import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/data/test_data/test_data.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class FetchPartiesAndConstituencies {
  Future<Tuple2<List<Party>, List<Constituency>>>
      fetchPartiesAndConstituencies() async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri1 = networkCore.getURI('/votingAPI/party');
    Uri uri2 = networkCore.getURI('/votingAPI/constituency');
    final responses = await Future.wait([
      getIt<HTTPClient>().get(
        uri: uri1,
      ),
      getIt<HTTPClient>().get(
        uri: uri2,
      )
    ]);
    Iterable listParties = json.decode(responses[0].body);
    Iterable listConstituencies = json.decode(responses[1].body);
    List<Party> parties =
        List<Party>.from(listParties.map((model) => Party.fromJson(model)));
    List<Constituency> constituencies = List<Constituency>.from(
        listConstituencies.map((model) => Constituency.fromJson(model)));
    return Tuple2<List<Party>, List<Constituency>>(parties, constituencies);
  }
}
