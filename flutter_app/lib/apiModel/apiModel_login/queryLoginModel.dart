import 'package:json_annotation/json_annotation.dart';
part 'queryLoginModel.g.dart';
@JsonSerializable()
class QueryLoginModel{
  QueryLoginModel({this.code,this.desc});
  String code;
  String desc;
  factory QueryLoginModel.fromJson(Map<String, dynamic> json) => _$QueryLoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$QueryLoginModelToJson(this);
}
