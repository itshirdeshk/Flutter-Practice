// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSucessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSucessState({
    required this.cartItems,
  });
  
}
