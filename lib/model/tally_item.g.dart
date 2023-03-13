// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tally_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TallyItem _$TallyItemFromJson(Map<String, dynamic> json) => TallyItem(
      Candidate.fromJson(json['candidate'] as Map<String, dynamic>),
      json['voteCount'] as int,
    );

Map<String, dynamic> _$TallyItemToJson(TallyItem instance) => <String, dynamic>{
      'candidate': instance.candidate,
      'voteCount': instance.voteCount,
    };
