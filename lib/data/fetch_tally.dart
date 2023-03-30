import 'dart:convert';

import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:admin_app/services/http_client.dart';
import 'package:http/http.dart';

class FetchTally {
  Future<List<TallyItem>> fetchTally() async {
    // final response = await getIt<HTTPClient>().get(
    //   uri: Uri(
    //       scheme: 'https',
    //       host: 'dart.dev',
    //       path: '/guides/libraries/library-tour',
    //       fragment: 'numbers'),
    // ) as Response;
    Iterable listTallyItems = json.decode("""[{
"candidate": {
"firstName": "John",
"middleName": null,
"lastName": "Doe",
"date-of-birth": "1990-01-01T00:00:00Z",
"party": {
"name": "Independent"
}
},
"voteCount": 123
}]""");
    List<TallyItem> tally = List<TallyItem>.from(
        listTallyItems.map((model) => TallyItem.fromJson(model)));
    return Future.value(tally);
  }
}
