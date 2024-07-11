import 'package:equatable/equatable.dart';

//UserEvent: class abstrak yang mewakili semua kemungkinan kejadian.
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}
// LoadUserEvent: Kejadian spesifik yang memicu pemuatan data pengguna. disini dikosongkan
class LoadUserEvent extends UserEvent {}
