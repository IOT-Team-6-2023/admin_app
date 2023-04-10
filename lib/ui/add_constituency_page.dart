import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/constituency.dart';
import 'package:admin_app/repository/add_constituency_repository.dart';
import 'package:flutter/material.dart';

class AddConstituencyPage extends StatefulWidget {
  AddConstituencyPage({super.key});

  @override
  State<AddConstituencyPage> createState() => _AddConstituencyPageState();
}

class _AddConstituencyPageState extends State<AddConstituencyPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController constituencyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Constituency Name",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                controller: constituencyNameController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a constituency name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Adding Constituency')),
                    );
                    await getIt<AddConstituencyRepository>().addConstituency(
                        Constituency(constituencyNameController.text));
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
