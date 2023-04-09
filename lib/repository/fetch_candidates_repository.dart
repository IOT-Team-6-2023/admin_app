import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

class FetchCandidatesRepository {
  Future<Either<List<Candidate>, String>> fetchCandidates() async {
    try {
      List<Candidate> candidates =
          await getIt<FetchCandidates>().fetchCandidates();
      return left<List<Candidate>, String>(candidates);
    } on Exception catch (e) {
      return right<List<Candidate>, String>(e.toString());
    }
  }
}
