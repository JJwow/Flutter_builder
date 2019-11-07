//生成json和model映射需要的包
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'scheduleList.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class ScheduleListResponse{
  List <ScheduleList>  scheduleList;
  ScheduleListResponse({
    this.scheduleList,
  });
  //不同的类使用不同的mixin即可
  factory ScheduleListResponse.fromJson(Map<String, dynamic> json) => _$ScheduleListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleListResponseToJson(this);
}
///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class ScheduleList {
  String departure;
  String destination;
  String dptStation;
  String arrStation;
  String displayArrStation;
  String dptDateTime;
  String ticketLeft;
  String ticketPrice;
  String coachType;
  String remark;
  String runTime;

  ScheduleList({
    this.departure,
    this.destination,
    this.dptStation,
    this.arrStation,
    this.displayArrStation,
    this.dptDateTime,
    this.ticketLeft,
    this.ticketPrice,
    this.coachType,
    this.remark,
    this.runTime,
  });

  //不同的类使用不同的mixin即可
  factory ScheduleList.fromJson(Map<String, dynamic> json) => _$ScheduleListFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleListToJson(this);

  ScheduleList.withMap(Map<String, dynamic> parsedMap) {
    this.departure         = parsedMap["departure"];
    this.destination       = parsedMap["destination"];
    this.dptStation        = parsedMap["dptStation"];
    this.arrStation        = parsedMap["arrStation"];
    this.displayArrStation = parsedMap["displayArrStation"];
    this.dptDateTime       = parsedMap["dptDateTime"];
    this.ticketLeft        = parsedMap["ticketLeft"];
    this.ticketPrice       = parsedMap["ticketPrice"];
    this.coachType         = parsedMap["coachType"];
    this.remark            = parsedMap["remark"];
    this.runTime           = parsedMap["runTime"];
  }
}