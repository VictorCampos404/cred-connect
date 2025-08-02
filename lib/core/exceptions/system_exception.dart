import 'package:cred_connect/core/models/models.dart';

class SystemException implements Exception {
  String title;
  String message;

  SystemException({required this.title, required this.message});

  factory SystemException.unknow() {
    return SystemException(
      title: "Erro inesperado!",
      message:
          "Algo inesperado aconteceu, espere alguns minutos e tente novamente",
    );
  }

  RequestResult toRequestResult() {
    return RequestResult(status: false, title: title, message: message);
  }
}
