// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Party _$PartyFromJson(Map<String, dynamic> json) => Party(
      json['name'] as String,
      json['party_id'] as int? ?? -1,
    );

Map<String, dynamic> _$PartyToJson(Party instance) => <String, dynamic>{
      'name': instance.name,
      'party_id': instance.party_id,
    };
