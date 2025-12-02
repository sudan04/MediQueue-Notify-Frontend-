import 'floor.dart';

class Home {
  final int? id;
  final String? name;
  final List<Floor>? floors;

  Home({
    this.id,
    this.name,
    this.floors,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      id: json['id'],
      name: json['name'],
      floors: json['floors'] != null
          ? (json['floors'] as List)
              .map((e) => Floor.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'floors': floors?.map((e) => e.toJson()).toList(),
    };
  }
}
