import 'package:admin_app/model/candidate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tally_item.g.dart';

@JsonSerializable()
class TallyItem {
  final int candidate_id;
  final String candidate_name;
  final String count;
  TallyItem(this.candidate_id, this.count, this.candidate_name);

  factory TallyItem.fromJson(Map<String, dynamic> json) =>
      _$TallyItemFromJson(json);

  Map<String, dynamic> toJson() => _$TallyItemToJson(this);
}
