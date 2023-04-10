import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_constituencies.dart';
import 'package:admin_app/data/fetch_parties.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

class FetchConstituenciesRepository {
  Future<Either<List<Constituency>, String>> fetchConstituencies() async {
    try {
      return left<List<Constituency>, String>(
          await getIt<FetchConstituencies>().fetchConstituencies());
    } on Exception catch (e) {
      return right<List<Constituency>, String>(e.toString());
    }
  }
}
