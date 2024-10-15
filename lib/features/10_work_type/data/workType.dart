import 'dart:convert';

WorkType workTypeFromJson(String str) => WorkType.fromJson(json.decode(str));

String workTypeToJson(WorkType data) => json.encode(data.toJson());

class WorkType {
  final String? text;
  final String? value;
  final bool? selected;

  WorkType({
    this.text,
    this.value,
    this.selected,
  });

  WorkType copyWith({
    String? text,
    String? value,
    bool? selected,
  }) =>
      WorkType(
        text: text ?? this.text,
        value: value ?? this.value,
        selected: selected ?? this.selected,
      );

  factory WorkType.fromJson(Map<String, dynamic> json) => WorkType(
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
