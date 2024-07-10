import 'package:bloc/bloc.dart';
import 'package:miniproject_1/bloc/product_bloc/product_event.dart';
import 'package:miniproject_1/bloc/product_bloc/product_state.dart';
import 'package:miniproject_1/services/api_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc(this.apiService) : super(ProductLoading()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiService.fetchProducts();
        emit(ProductLoaded(products: products));
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });
  }
}
