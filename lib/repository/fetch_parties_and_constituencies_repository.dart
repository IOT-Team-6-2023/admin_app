import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_parties.dart';
import 'package:admin_app/data/fetch_parties_and_constituencies.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';
import 'package:tuple/tuple.dart' as tuple;

class FetchPartiesAndConstituenciesRepository {
  Future<Either<tuple.Tuple2<List<Party>, List<Constituency>>, String>>
      fetchPartiesAndConstituencies() async {
    try {
      return left<tuple.Tuple2<List<Party>, List<Constituency>>, String>(
          (await getIt<FetchPartiesAndConstituencies>()
              .fetchPartiesAndConstituencies()));
    } on Exception catch (e) {
      return right<tuple.Tuple2<List<Party>, List<Constituency>>, String>(
          e.toString());
    }
  }
}
