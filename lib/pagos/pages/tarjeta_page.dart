import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripeapp/pagos/models/tarjeta_credito.dart';

import '../bloc/pagar/pagar_bloc.dart';
import '../widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  TarjetaCredito tarjeta;
  TarjetaPage({Key? key, required this.tarjeta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos stripe'),
        leading: IconButton(onPressed: (){
          final selectTarjeta =BlocProvider.of<PagarBloc>(context);
                  selectTarjeta.add(OnDesactivarTarjeta());
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
              cardNumber: tarjeta.cardNumberHidden,
              expiryDate: tarjeta.expiracyDate,
              cardHolderName: tarjeta.cardHolderName,
              cvvCode: tarjeta.cvv,
              showBackView: false,
            ),
          ),
          Positioned(bottom: 0, child: TotalPayButton()),
        ],
      ),
    );
  }
}
