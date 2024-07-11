import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import 'user_event.dart';
import 'user_state.dart';

// BLoC adalah pola untuk manajemen status yang memisahkan logika bisnis dari UI.
//Di sini, UserBloc bertanggung jawab untuk mengelola status data pengguna.
class UserBloc extends Bloc<UserEvent, UserState> {
//ApiService apiService: dependensi yang akan dimasukkan ke UserBloc 
//untuk mengambil data pengguna dari API.
  final ApiService apiService;

  UserBloc(this.apiService) : super(UserInitial()) {
//on<LoadUserEvent> ketika sedang mengambil data, dan akan menjalankan UserLoading()
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await apiService.fetchUser();
//jika berhasil mengambil data maka UserLoaded(user)
        emit(UserLoaded(user));
      } catch (e) {
//UserError jika gagal.
        emit(UserError(e.toString()));
      }
    });
  }
}