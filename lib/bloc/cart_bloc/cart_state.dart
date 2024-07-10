import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:miniproject_1/model/cart_model.dart';

@immutable
abstract class CartState extends Equatable {}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final CartModel cart;
  CartLoaded(this.cart);

  @override
  List<Object?> get props => [cart];
}

class CartError extends CartState {
  final String error;
  CartError(this.error);

  @override
  List<Object?> get props => [error];
}
