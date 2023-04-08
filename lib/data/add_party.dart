import 'dart:convert';

import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class AddParty {
  Future<Party> addParty(Party party) async {
    // final response = await getIt<HTTPClient>().post(
    //     uri: Uri(
    //         scheme: 'https',
    //         host: 'dart.dev',
    //         path: '/guides/libraries/library-tour',
    //         fragment: 'numbers'),
    //     body: candidate.toJson()) as Response;
    // if (response.statusCode != 201) {}
    return Future<Party>.value(party);
  }
}
