import 'package:admin_app/data/add_new_candidate.dart';
import 'package:admin_app/data/fetch_candidates.dart';
import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

class AddCandidateRepository {
  Future<Either<Candidate, String>> addCandidate(Candidate candidate) async {
    try {
      return left<Candidate, String>(
          await getIt<AddNewCandidate>().addNewCandidate(candidate));
    } on Exception catch (e) {
      return right<Candidate, String>(e.toString());
    }
  }
}
