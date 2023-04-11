import 'dart:convert';

import 'package:admin_app/data/core/network_core.dart';
import 'package:admin_app/data/test_data/test_data.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchTally {
  Future<List<TallyItem>> fetchTally() async {
    NetworkCore networkCore = getIt<NetworkCore>();
    Uri uri = networkCore.getURI('/votingAPI/voteCount');
    final response = await getIt<HTTPClient>().get(
      uri: uri,
    ) as Response;
    Iterable listTallyItems = json.decode(response.body);
    List<TallyItem> tally = List<TallyItem>.from(
        listTallyItems.map((model) => TallyItem.fromJson(model)));
    return tally;
  }
}
