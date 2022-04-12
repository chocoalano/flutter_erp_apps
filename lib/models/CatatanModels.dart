import 'dart:convert';

class CatatanModels {
  final int id;
  final int user_id;
  final String title;
  final String notes;

  CatatanModels(this.id, this.user_id, this.title, this.notes);

  factory CatatanModels.fromJson(Map<String, dynamic> json) {
    return CatatanModels(
        json["id"], json["user_id"], json["title"], json["notes"]);
  }

  static List<CatatanModels> parseList(List<dynamic> list) {
    return list.map((i) => CatatanModels.fromJson(i)).toList();
  }
}
