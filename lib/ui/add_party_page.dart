import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/repository/add_party_repository.dart';
import 'package:flutter/material.dart';

class AddPartyPage extends StatefulWidget {
  AddPartyPage({super.key, required this.changePageToTallyPage});
  VoidCallback changePageToTallyPage;

  @override
  State<AddPartyPage> createState() => _AddPartyPageState();
}

class _AddPartyPageState extends State<AddPartyPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController partyNameController = TextEditingController();

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
                  labelText: "Enter Party Name",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                controller: partyNameController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a party name';
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
                      const SnackBar(content: Text('Adding Party')),
                    );
                    await getIt<AddPartyRepository>()
                        .addParty(Party(partyNameController.text));
                    widget.changePageToTallyPage;
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
