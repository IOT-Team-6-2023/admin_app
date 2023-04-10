import 'package:admin_app/data/add_new_candidate.dart';
import 'package:admin_app/data/add_constituency.dart';
import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

import '../model/constituency.dart';

class AddConstituencyRepository {
  Future<Either<Constituency, String>> addConstituency(
      Constituency constituency) async {
    try {
      return left<Constituency, String>(
          await getIt<AddConstituency>().addConstituency(constituency));
    } on Exception catch (e) {
      return right<Constituency, String>(e.toString());
    }
  }
}
