import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_event.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_state.dart';
import 'package:miniproject_1/services/api_service.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ApiService apiService;
  CartBloc(this.apiService) : super(CartLoading()) {
    on<GetCartsEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final carts = await apiService.fetchCart();
        emit(CartLoaded(carts));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });
  }
}
