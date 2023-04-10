import 'package:json_annotation/json_annotation.dart';

part 'constituency.g.dart';

@JsonSerializable()
class Constituency {
  final String name;
  final int constituency_id;
  Constituency(this.name, [this.constituency_id = -1]);

  factory Constituency.fromJson(Map<String, dynamic> json) =>
      _$ConstituencyFromJson(json);

  Map<String, dynamic> toJson() => _$ConstituencyToJson(this);
}
