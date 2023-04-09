import 'package:admin_app/model/party.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  final String firstName;
  @JsonKey(includeIfNull: false)
  final String? middleName;
  final String lastName;

  final DateTime dateOfBirth;

  int party;

  Candidate(
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.party, {
    this.middleName,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
