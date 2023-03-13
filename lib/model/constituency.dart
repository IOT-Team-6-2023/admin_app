import 'package:json_annotation/json_annotation.dart';

part 'constituency.g.dart';

@JsonSerializable()
class Constituency {
  final String name;
  Constituency(
    this.name,
  );

  factory Constituency.fromJson(Map<String, dynamic> json) =>
      _$ConstituencyFromJson(json);

  Map<String, dynamic> toJson() => _$ConstituencyToJson(this);
}
