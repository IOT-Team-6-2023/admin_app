import 'package:admin_app/model/party.dart';
import 'package:admin_app/repository/add_candidate_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../get_it_init.dart';
import '../model/candidate.dart';
import '../repository/fetch_parties_repository.dart';

class AddCandidatePage extends StatefulWidget {
  const AddCandidatePage({super.key});

  @override
  State<AddCandidatePage> createState() => AddCandidatePageState();
}

class AddCandidatePageState extends State<AddCandidatePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController candidateFirstNameController =
      TextEditingController();

  final TextEditingController candidateLastNameController =
      TextEditingController();

  final ValueNotifier<DateTime> candidateDob =
      ValueNotifier<DateTime>(DateTime.now());

  Party noneParty = Party("None", -1);

  final ValueNotifier<Party> candidateParty =
      ValueNotifier<Party>(Party("", -1));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: candidateDob.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != candidateDob) {
      candidateDob.value = picked;
    }
  }

  @override
  void initState() {
    candidateParty.value = noneParty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dartz.Either<List<Party>, String>>(
      future: getIt<FetchPartiesRepository>().fetchParties(),
      builder: (BuildContext context,
          AsyncSnapshot<dartz.Either<List<Party>, String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return snapshot.data!.fold(
            (l) {
              if (!l.contains(noneParty)) l.add(noneParty);
              return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Candidate First Name",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          controller: candidateFirstNameController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Candidate Last Name",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          controller: candidateLastNameController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: candidateDob,
                        builder: (BuildContext context, DateTime value,
                            Widget? child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('Date of birth'),
                              subtitle: Text(
                                  '${candidateDob.value.day}/${candidateDob.value.month}/${candidateDob.value.year}'),
                              trailing: Icon(Icons.calendar_today),
                              onTap: () => _selectDate(context),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: candidateParty,
                        builder:
                            (BuildContext context, Party value, Widget? child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<Party>(
                              value: candidateParty.value,
                              onChanged: (Party? newValue) {
                                print(newValue!.name);
                                print(candidateParty!.value);
                                candidateParty.value = newValue!;
                                print(candidateParty.value.name);
                              },
                              items: l.map((Party party) {
                                return DropdownMenuItem<Party>(
                                  value: party,
                                  child: Text(party.name),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (candidateParty.value.party_id == -1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please select an appropriate party other than None')),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Adding Candidate')),
                                );
                                await getIt<AddCandidateRepository>()
                                    .addCandidate(Candidate(
                                        candidateFirstNameController.text,
                                        candidateLastNameController.text,
                                        candidateDob.value,
                                        candidateParty.value.party_id,
                                        candidateParty.value.name));
                              }
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ));
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
