import 'package:equatable/equatable.dart';

import '../../model/user_model.dart';

// UserState: class abstrak yang mewakili semua kemungkinan status.
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

// UserInitial: Status awal.
class UserInitial extends UserState {}

// UserLoading: Menunjukkan bahwa data pengguna sedang dimuat.
class UserLoading extends UserState {}

// UserLoaded: Menunjukkan bahwa data pengguna telah berhasil dimuat, dengan data pengguna yang dimuat.
class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

// UserError: Menunjukkan kesalahan terjadi saat memuat data pengguna, dengan pesan kesalahan.
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
