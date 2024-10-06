import 'package:hive/hive.dart';

part 'wand_data.g.dart';

@HiveType(typeId: 1)
class WandData extends HiveObject{
  @HiveField(0)
  String? wood;
  @HiveField(1)
  String? core;
  @HiveField(2)
  int? length;

  WandData({
    this.wood,
    this.core,
    this.length,});

  WandData.fromJson(dynamic json) {
    wood = json['wood'];
    core = json['core'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wood'] = wood;
    map['core'] = core;
    map['length'] = length;
    return map;
  }
}