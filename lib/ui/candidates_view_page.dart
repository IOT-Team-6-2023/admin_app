import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:admin_app/repository/fetch_candidates_repository.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:intl/intl.dart';

class CandidatesViewPage extends StatelessWidget {
  const CandidatesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<List<Candidate>, String>>(
      future: getIt<FetchCandidatesRepository>().fetchCandidates(),
      builder: (BuildContext context,
          AsyncSnapshot<Either<List<Candidate>, String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return snapshot.data!.fold(
            (l) {
              return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn2(
                    label: Text('Name'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Party'),
                  ),
                  DataColumn(
                    label: Text('Constituency'),
                  ),
                  DataColumn(
                    label: Text('Date Of Birth'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  l.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                          Text("${l[index].firstName} ${l[index].lastName}")),
                      DataCell(Text(l[index].party_name.toString())),
                      DataCell(Text(l[index].constituency_name.toString())),
                      DataCell(Text(DateFormat('dd-MM-yyyy')
                          .format(l[index].dateOfBirth))),
                    ],
                  ),
                ),
              );
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
