import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwordo/pages/inicio.dart';

class QWordoApp extends StatelessWidget {
  const QWordoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QWordo',
      theme: ThemeData(
        primaryColor: const Color(0xffa38bfe),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff15151e),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xffa38bfe))
        ),
        scaffoldBackgroundColor: const Color(0xff15151e),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xffa38bfe),
          onPrimary: Color(0xffe2e1f5),
          secondary: Color(0xfff4937d),
          onSecondary: Color(0xffe2e1f5),
          error: Color(0xffea4c89),
          onError: Color(0xffe2e1f5),
          background: Color(0xff15151e),
          onBackground: Color(0xffe2e1f5),
          surface: Color(0xff262636),
          onSurface: Color(0xffe2e1f5),
        ),
        textTheme: GoogleFonts.oxygenMonoTextTheme(Theme.of(context).textTheme),
        // textStyle: TextStyle(color: Color(0xffe2e1f5)
          // titleTextStyle: TextStyle(
          //     color: Color(0xffd4d4e6),
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold
          // ),
      ),
      home: InicioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}