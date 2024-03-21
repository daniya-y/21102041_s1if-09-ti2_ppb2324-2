import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/user.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  List<User> user = [];

  void addContact({required String username, required int number}) async {
    emit(ContactInitial());
    user.add(User(name: username, number: number));
    emit(ContactLoading());
    await Future.delayed(
        const Duration(seconds: 2), () => emit(ContactLoaded(user: user)));
  }

  void removeUser({required int index}) {
    emit(ContactInitial());
    user.removeAt(index);
    if (user.isEmpty) {
      emit(ContactInitial());
    } else {
      emit(ContactLoaded(user: user));
    }
  }
}