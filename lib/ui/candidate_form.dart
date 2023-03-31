import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/model/candidate.dart';
import 'package:admin_app/model/party.dart';
import 'package:admin_app/repository/add_candidate_repository.dart';
import 'package:flutter/material.dart';

class CandidateFormWidget extends StatefulWidget {
  const CandidateFormWidget({super.key, required this.parties});
  final List<Party> parties;
  @override
  _CandidateFormWidgetState createState() => _CandidateFormWidgetState();
}

class _CandidateFormWidgetState extends State<CandidateFormWidget> {
  String? _first_name;
  String? _last_name;
  DateTime? _dob;
  Party? _party;
  final _formKey = GlobalKey<FormState>();

  int status = 1;

  @override
  void initState() {
    super.initState();
    _party = widget.parties[0];
  }

  @override
  Widget build(BuildContext context) {
    return Text('Form goes here');
  }
}
