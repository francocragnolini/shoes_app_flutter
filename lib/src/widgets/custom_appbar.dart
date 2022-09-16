import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String texto;
  // Constructor
  CustomAppbar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          //Para el caso de dispositivos que no tienen el notch
          margin: EdgeInsets.only(top: 30),
          //padding: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Row(children: [
            Text(
              texto,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            //TOMA TODO EL ESPACIO DISPONIBLE
            Spacer(),
            Icon(
              Icons.search,
              size: 30,
            )
          ]),
        ),
      ),
    );
  }
}
