class UserDto {
  String? id;
  String? name;
  String? phone;
  String? password;
  DateTime? createdAt;

  UserDto({this.id, this.name, this.phone, this.password, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      password: map['password'],
      createdAt:
          map['createdAt'] == null
              ? null
              : DateTime.parse(map['createdAt'] as String),
    );
  }
}
