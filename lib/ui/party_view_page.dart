import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:admin_app/repository/fetch_candidates_repository.dart';
import 'package:admin_app/repository/fetch_parties_repository.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:intl/intl.dart';

class PartiesViewPage extends StatelessWidget {
  const PartiesViewPage({super.key});

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
              return DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn2(
                    label: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    size: ColumnSize.L,
                  ),
                ],
                rows: List<DataRow>.generate(
                  l.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(l[index].name)),
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
