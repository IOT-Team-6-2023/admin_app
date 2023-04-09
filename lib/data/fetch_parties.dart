import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/data/test_data/test_data.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchParties {
  Future<List<Party>> fetchParties() async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri = networkCore.getURI('/votingAPI/party');
    final response = await getIt<HTTPClient>().get(
      uri: uri,
    ) as Response;
    Iterable listParties = json.decode(response.body);
    List<Party> candidates =
        List<Party>.from(listParties.map((model) => Party.fromJson(model)));
    return candidates;
  }
}
