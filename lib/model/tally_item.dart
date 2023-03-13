import 'package:admin_app/model/candidate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tally_item.g.dart';

@JsonSerializable()
class TallyItem {
  final Candidate candidate;
  final int voteCount;
  TallyItem(this.candidate, this.voteCount);

  factory TallyItem.fromJson(Map<String, dynamic> json) =>
      _$TallyItemFromJson(json);

  Map<String, dynamic> toJson() => _$TallyItemToJson(this);
}
