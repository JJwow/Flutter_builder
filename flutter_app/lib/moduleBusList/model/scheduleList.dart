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