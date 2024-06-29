import 'package:flutter/material.dart';

class ErrorPicturesWidget extends StatelessWidget {
  final int errorCode;

  const ErrorPicturesWidget({required this.errorCode, super.key});

  final Map<int, Map<String, String>> errorDetails = const {
    404: {
      'text': 'Página não encontrada',
      'image': 'assets/404.png',
    },
    500: {
      'text': 'Erro interno do servidor',
      'image': 'assets/500.png',
    },
  };

  @override
  Widget build(BuildContext context) {
    final errorText = errorDetails[errorCode]?['text'] ?? 'Erro desconhecido';
    final errorImage =
        errorDetails[errorCode]?['image'] ?? 'assets/default.png';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(errorImage),
        const SizedBox(height: 16),
        Text(
          errorText,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
