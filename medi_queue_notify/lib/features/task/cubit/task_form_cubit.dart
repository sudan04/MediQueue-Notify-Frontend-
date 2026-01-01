import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_form_state.dart';

class TaskFormCubit extends Cubit<TaskFormState> {
  TaskFormCubit() : super(TaskFormInitial());
}
