import 'dart:convert';

class UserModel {
  final DateTime createdAt;
  final String name;
  final String avatar;
  final String company;
  final String description;
  final String id;

  UserModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.company,
    required this.description,
    required this.id,
  });

  UserModel copyWith({
    DateTime? createdAt,
    String? name,
    String? avatar,
    String? company,
    String? description,
    String? id,
  }) {
    return UserModel(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      company: company ?? this.company,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'name': name});
    result.addAll({'avatar': avatar});
    result.addAll({'company': company});
    result.addAll({'description': description});
    result.addAll({'id': id});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      createdAt: DateTime.parse(map['createdAt']),
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      company: map['company'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(createdAt: $createdAt, name: $name, avatar: $avatar, company: $company, description: $description, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.createdAt == createdAt &&
      other.name == name &&
      other.avatar == avatar &&
      other.company == company &&
      other.description == description &&
      other.id == id;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
      name.hashCode ^
      avatar.hashCode ^
      company.hashCode ^
      description.hashCode ^
      id.hashCode;
  }
}
