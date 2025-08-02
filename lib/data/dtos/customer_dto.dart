import 'package:cred_connect/core/enums/gender_type.dart';
import 'package:collection/collection.dart';

class CustomerDto {
  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  GenderType? gender;
  String? nid;
  String? address;
  DateTime? createdAt;

  CustomerDto({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
    this.nid,
    this.address,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate?.toIso8601String(),
      'gender': gender?.name,
      'nid': nid,
      'address': address,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory CustomerDto.fromMap(Map<String, dynamic> map) {
    return CustomerDto(
      id: map['id'],
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      birthDate: map['birthDate'] == null
          ? null
          : DateTime.parse(map['birthDate'] as String),
      gender: GenderType.values.firstWhereOrNull(
        (element) => element.name == map['gender'],
      ),
      nid: map['nid'],
      address: map['address'],
      createdAt: map['createdAt'] == null
          ? null
          : DateTime.parse(map['createdAt'] as String),
    );
  }
}
