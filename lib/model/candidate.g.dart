// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      json['firstName'] as String,
      json['lastName'] as String,
      DateTime.parse(json['date-of-birth'] as String),
      Party.fromJson(json['party'] as Map<String, dynamic>),
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
  val['date-of-birth'] = instance.dateOfBirth.toIso8601String();
  val['party'] = instance.party;
  return val;
}
