import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/cart_items.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCart>(cartRemoveFromCart);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSucessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCart(
      CartRemoveFromCart event, Emitter<CartState> emit) {
    if (cartItems.contains(event.removedItem)) {
      cartItems.remove(event.removedItem);
      emit(CartSucessState(cartItems: cartItems));
    }
  }
}
