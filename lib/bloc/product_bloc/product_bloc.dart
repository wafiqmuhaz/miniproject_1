// class CartBloc extends Bloc<CartEvent, CartState> {
//   final ApiService apiService;
//   CartBloc(this.apiService) : super(CartLoading()) {
//     on<GetCartsEvent>((event, emit) async {
//       emit(CartLoading());
//       try {
//         final carts = await apiService.fetchCart();
//         emit(CartLoaded(carts));
//       } catch (e) {
//         emit(CartError(e.toString()));
//       }
//     });
//   }