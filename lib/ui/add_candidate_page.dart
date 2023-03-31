import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:admin_app/repository/add_candidate_repository.dart';
import 'package:admin_app/repository/fetch_candidates_repository.dart';
import 'package:admin_app/repository/fetch_parties_repository.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:admin_app/ui/candidate_form.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:intl/intl.dart';

class AddCandidatePage extends StatelessWidget {
  const AddCandidatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<List<Party>, String>>(
      future: getIt<FetchPartiesRepository>().fetchParties(),
      builder: (BuildContext context,
          AsyncSnapshot<Either<List<Party>, String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return snapshot.data!.fold(
            (l) {
              return CandidateFormWidget(parties: l);
            },
            (r) {
              return Center(child: Text(snapshot.data!.getOrElse(() => "")));
            },
          );
        }
      },
    );
  }
}
