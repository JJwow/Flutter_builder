// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleListResponse _$ScheduleListResponseFromJson(Map<String, dynamic> json) {
  return ScheduleListResponse(
      scheduleList: (json['scheduleList'] as List)
          ?.map((e) => e == null
              ? null
              : ScheduleList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ScheduleListResponseToJson(
        ScheduleListResponse instance) =>
    <String, dynamic>{'scheduleList': instance.scheduleList};

ScheduleList _$ScheduleListFromJson(Map<String, dynamic> json) {
  return ScheduleList(
      departure: json['departure'] as String,
      destination: json['destination'] as String,
      dptStation: json['dptStation'] as String,
      arrStation: json['arrStation'] as String,
      displayArrStation: json['displayArrStation'] as String,
      dptDateTime: json['dptDateTime'] as String,
      ticketLeft: json['ticketLeft'] as String,
      ticketPrice: json['ticketPrice'] as String,
      coachType: json['coachType'] as String,
      remark: json['remark'] as String,
      runTime: json['runTime'] as String);
}

Map<String, dynamic> _$ScheduleListToJson(ScheduleList instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'destination': instance.destination,
      'dptStation': instance.dptStation,
      'arrStation': instance.arrStation,
      'displayArrStation': instance.displayArrStation,
      'dptDateTime': instance.dptDateTime,
      'ticketLeft': instance.ticketLeft,
      'ticketPrice': instance.ticketPrice,
      'coachType': instance.coachType,
      'remark': instance.remark,
      'runTime': instance.runTime
    };
