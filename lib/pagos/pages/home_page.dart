

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripeapp/pagos/bloc/pagar/pagar_bloc.dart';
import 'package:stripeapp/pagos/data/tarjetas.dart';
import 'package:stripeapp/pagos/helpers/helpers.dart';
import 'package:stripeapp/pagos/pages/tarjeta_page.dart';
import 'package:stripeapp/pagos/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos stripe'),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.add)),
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            width: size.width,
            height: size.height,
            top: 100,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9,
              ),
              itemCount: tarjetas.length,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (_,i){
                final tarjeta =tarjetas[i];
            
              return GestureDetector(
                child: Hero(
                  tag: tarjeta.cardNumber,
                  child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden,
                      expiryDate: tarjeta.expiracyDate,
                      cardHolderName: tarjeta.cardHolderName,
                      cvvCode: tarjeta.cvv,
                      showBackView: false,
                      
                  ),
                ),
                onTap: (){
                  final selectTarjeta =BlocProvider.of<PagarBloc>(context);
                  selectTarjeta.add(OnSelectTarjeta(tarjeta));
                  Navigator.push(context, navegarFadeIn(context,  TarjetaPage(tarjeta: tarjeta,)));
                },
              );
            }),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton()
            ),

        ],
      )
    );
  }
}