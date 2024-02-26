part of 'pagar_bloc.dart';

sealed class PagarEvent extends Equatable {
  const PagarEvent();
   @override
  List<Object> get props => [];
}

class OnSelectTarjeta extends PagarEvent{
  final TarjetaCredito tarjeta;
  final bool isTarjeta;
  
 const OnSelectTarjeta({
  required this.isTarjeta,
  required this.tarjeta});
}

class OnDesactivarTarjeta extends PagarEvent{}
