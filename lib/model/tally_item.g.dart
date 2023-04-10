// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tally_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TallyItem _$TallyItemFromJson(Map<String, dynamic> json) => TallyItem(
      json['candidate_id'] as int,
      json['count'] as String,
      json['candidate_name'] as String,
    );

Map<String, dynamic> _$TallyItemToJson(TallyItem instance) => <String, dynamic>{
      'candidate_id': instance.candidate_id,
      'candidate_name': instance.candidate_name,
      'count': instance.count,
    };
