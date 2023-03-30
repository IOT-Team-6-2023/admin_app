import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:dartz/dartz.dart';

class FetchTallyRepository {
  Future<Either<List<TallyItem>, String>> fetchTally() async {
    try {
      return left<List<TallyItem>, String>(
          await getIt<FetchTally>().fetchTally());
    } on Exception catch (e) {
      return right<List<TallyItem>, String>(e.toString());
    }
  }
}
