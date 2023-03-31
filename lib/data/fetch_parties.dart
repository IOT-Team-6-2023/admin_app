import 'dart:convert';

import 'package:admin_app/data/test_data/test_data.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchParties {
  Future<List<Party>> fetchParties() async {
    // final response = await getIt<HTTPClient>().get(
    //   uri: Uri(
    //       scheme: 'https',
    //       host: 'dart.dev',
    //       path: '/guides/libraries/library-tour',
    //       fragment: 'numbers'),
    // ) as Response;
    Iterable listParties = json.decode(mockPartiesResponse);
    List<Party> candidates =
        List<Party>.from(listParties.map((model) => Party.fromJson(model)));
    return candidates;
  }
}
