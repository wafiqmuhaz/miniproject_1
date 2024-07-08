import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;

  UserBloc(this.apiService) : super(UserInitial()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await apiService.fetchUser();
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}