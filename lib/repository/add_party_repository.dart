import 'package:admin_app/data/add_new_candidate.dart';
import 'package:admin_app/data/add_party.dart';
import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

import '../model/party.dart';

class AddPartyRepository {
  Future<Either<Party, String>> addParty(Party party) async {
    try {
      return left<Party, String>(await getIt<AddParty>().addParty(party));
    } on Exception catch (e) {
      return right<Party, String>(e.toString());
    }
  }
}
