import 'package:admin_app/model/party.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candidate.g.dart';

final _dateFormatter = DateFormat('yyyy-MM-dd');
DateTime _fromJson(String date) => _dateFormatter.parse(date);
String _toJson(DateTime date) => _dateFormatter.format(date);

@JsonSerializable()
class Candidate {
  final String firstName;
  @JsonKey(includeIfNull: false)
  final String? middleName;
  final String lastName;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime dateOfBirth;

  int party;
  String party_name;

  Candidate(
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.party,
    this.party_name, {
    this.middleName,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
