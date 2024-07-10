import 'package:equatable/equatable.dart';
import 'package:miniproject_1/model/product_model.dart';


abstract class ProductState extends Equatable {}


class ProductLoading extends ProductState {
   @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});

  @override
  List<Object> get props => [message];
}