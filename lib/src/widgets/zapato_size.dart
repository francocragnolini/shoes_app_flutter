import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

//FONDO NARANJA CON LA ZAPATILLA

//Contenedor naranja
class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  ZapatoSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ZapatoDescPage();
            },
          ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 2 : 30,
          vertical: fullScreen ? 3 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
          ),
          child: Column(
            children: [
              // Aqui va zapato con sombra
              _ZapatoConSombra(),

              if (!fullScreen) _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

// compuesto por una imagen(zapatilla) y una sombra
// por eso una un stack para colocar uno sobre otro
class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          // sombra
          // el posicion es para bajar la sombra(contenedor), debajo de la zapatilla
          Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),

          //zapatilla
          //Image(image: AssetImage("assets/imgs/azul.png")),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

//Zapato tallas
class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

//CAJA DE TALLE
class _TallaZapatoCaja extends StatelessWidget {
  //propiedades
  final double numero;

  //constructor
  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    // cambiar los datos de los talles con provider
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            /*TODO: boxshadow*/
            // Agrega sombra a la caja con talle 9
            if (numero == zapatoModel.talla)
              BoxShadow(
                  color: Color(0xffF1A23A),
                  blurRadius: 10,
                  offset: Offset(0, 5))
          ],
          color: numero == zapatoModel.talla ? Colors.red : Colors.white,
        ),
        child: Text(
          "${numero.toString().replaceAll(".0", "")}",
          style: TextStyle(
              color: numero == zapatoModel.talla
                  ? Colors.white
                  : Color(0xffF1A23A),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//Sombra del zapato
class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // rota el contenedor para alinear la sombra
    return Transform.rotate(
      angle: -0.5,
      //contenedor para hacer la sombra de la zapatilla
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
            ]),
      ),
    );
  }
}
