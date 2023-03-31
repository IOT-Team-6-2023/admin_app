import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_parties.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

class FetchPartiesRepository {
  Future<Either<List<Party>, String>> fetchParties() async {
    try {
      return left<List<Party>, String>(
          await getIt<FetchParties>().fetchParties());
    } on Exception catch (e) {
      return right<List<Party>, String>(e.toString());
    }
  }
}
