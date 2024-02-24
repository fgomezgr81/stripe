import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagoCompletoPage extends StatelessWidget {
  const PagoCompletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Pago realziado!'),
      ),
      body:const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.star,color: Colors.white24,size: 100,),
          SizedBox(height: 20,),
          Text('Pago realizado correctamente!',style: TextStyle(color: Colors.white,fontSize: 22),)
        ],
      ),),
    );
  }
}