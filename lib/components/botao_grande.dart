import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotaoGrande extends StatelessWidget {
  Color cor;
  String texto;
  IconData icone;
  Function() onTap;

  BotaoGrande({Key? key, required this.cor, required this.texto, required this.icone, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(28.0))),
              backgroundColor: MaterialStateProperty.all<Color>(cor)
          ),
          onPressed: () => { onTap.call() },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(icone, size: 48),
                  Text(texto, style: TextStyle(fontSize: 16), textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
