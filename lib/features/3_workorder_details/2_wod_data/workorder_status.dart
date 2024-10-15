class WorkOrderStatus {
  final String text;
  final String value;
  final bool selected;

  WorkOrderStatus({
    required this.text,
    required this.value,
    required this.selected,
  });

  // factory WorkOrderStatus.fromRawJson(String str) => WorkOrderStatus.fromJson(json.decode(str));
  //
  // String toRawJson() => json.encode(toJson());

  factory WorkOrderStatus.fromJson(Map<String, dynamic> json) =>
      WorkOrderStatus(
        text: json["text"],
        value: json["value"],
        selected: json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
        "selected": selected,
      };
}
