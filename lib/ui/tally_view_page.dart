import 'package:admin_app/data/fetch_tally.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/tally_item.dart';
import 'package:admin_app/repository/fetch_tally_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class TallyViewPage extends StatelessWidget {
  const TallyViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<List<TallyItem>, String>>(
      future: getIt<FetchTallyRepository>().fetchTally(),
      builder: (BuildContext context,
          AsyncSnapshot<Either<List<TallyItem>, String>> snapshot) {
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
                    label: Text('Votes'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  l.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(
                          "${l[index].candidate.firstName} ${l[index].candidate.lastName}")),
                      DataCell(Text(l[index].candidate.party.name)),
                      DataCell(Text(l[index].voteCount.toString())),
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
        return Text('No Data');
      },
    );
  }
}
