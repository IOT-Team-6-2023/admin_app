import 'package:json_annotation/json_annotation.dart';

part 'party.g.dart';

@JsonSerializable()
class Party {
  final String name;
  final int party_id;
  Party(this.name, [this.party_id = -1]);

  factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

  Map<String, dynamic> toJson() => _$PartyToJson(this);
}
