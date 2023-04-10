// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      json['firstName'] as String,
      json['lastName'] as String,
      _fromJson(json['dateOfBirth'] as String),
      json['party'] as int,
      json['constituency'] as int,
      constituency_name: json['constituency_name'] as String?,
      party_name: json['party_name'] as String?,
      middleName: json['middleName'] as String?,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('middleName', instance.middleName);
  val['lastName'] = instance.lastName;
  val['dateOfBirth'] = _toJson(instance.dateOfBirth);
  val['party'] = instance.party;
  val['party_name'] = instance.party_name;
  val['constituency'] = instance.constituency;
  val['constituency_name'] = instance.constituency_name;
  return val;
}
