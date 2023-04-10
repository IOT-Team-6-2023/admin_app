// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constituency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Constituency _$ConstituencyFromJson(Map<String, dynamic> json) => Constituency(
      json['name'] as String,
      json['constituency_id'] as int? ?? -1,
    );

Map<String, dynamic> _$ConstituencyToJson(Constituency instance) =>
    <String, dynamic>{
      'name': instance.name,
      'constituency_id': instance.constituency_id,
    };
