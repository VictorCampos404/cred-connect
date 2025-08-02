import 'package:collection/collection.dart';
import 'package:cred_connect/core/enums/term_type.dart';

class LoanDto {
  String? id;
  String? userId;
  String? customerId;
  double? amount;
  TermType? term;
  double? interestRate;
  DateTime? createdAt;

  LoanDto({
    this.id,
    this.userId,
    this.customerId,
    this.amount,
    this.term,
    this.interestRate,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'customerId': customerId,
      'amount': amount,
      'term': term?.name,
      'interestRate': interestRate,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory LoanDto.fromMap(Map<String, dynamic> map) {
    return LoanDto(
      id: map['id'],
      userId: map['userId'],
      customerId: map['customerId'],
      amount: map['amount'],
      term: TermType.values.firstWhereOrNull(
        (element) => element.name == map['term'],
      ),
      interestRate: map['interestRate'],
      createdAt: map['createdAt'] == null
          ? null
          : DateTime.parse(map['createdAt'] as String),
    );
  }
}
