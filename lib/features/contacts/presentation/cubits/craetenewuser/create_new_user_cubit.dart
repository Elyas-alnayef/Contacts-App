import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_new_user_state.dart';

class CreateNewUserCubit extends Cubit<CreateNewUserState> {
  CreateNewUserCubit() : super(CreateNewUserInitial());
}
