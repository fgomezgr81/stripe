import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripeapp/pagos/bloc/pagar/pagar_bloc.dart';
import 'package:stripeapp/pagos/pages/home_page.dart';
import 'package:stripeapp/pagos/pages/pago_completo.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: ((context) => PagarBloc())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Map App',
        debugShowCheckedModeBanner: false,
         routes: {
          'home': (_) => const HomePage(),
          'pago_completo': (_) => const PagoCompletoPage(),
        },
        theme: ThemeData.light().copyWith(
            primaryColor: const Color(0xff284879),
            scaffoldBackgroundColor: const Color(0xff21232A)),
        home: const HomePage());
  }
}
