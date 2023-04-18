import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwordo/app.dart';
import 'package:qwordo/repository/jogos_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JogosRepository()),
      ],
      child: const QWordoApp(),
    ),
  );
}