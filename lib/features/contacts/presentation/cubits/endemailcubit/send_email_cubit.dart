import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:contacts_app/features/contacts/domain/usecases/send_email.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'send_email_state.dart';

class SendEmailCubit extends Cubit<SendEmailState> {
  final SendContactEmailUseCase sendContactEmailUseCase;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController toController = TextEditingController();
  TextEditingController ccController = TextEditingController();
  TextEditingController bccController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  SendEmailCubit({required this.sendContactEmailUseCase})
      : super(SendEmailInitialState());
  Future<void> sendEmail({required SendContactEmailUseCaseParams params}) async {
    var response = await sendContactEmailUseCase.call(params);
    response.fold((l) => emit(SendEmailFailureState(message: l.message)),
        (r) => emit(SendEmailSuccesState("Message Sended")));
  }

  void toVauleChanged() {
    if (state is SendEmailInitialState) {
      emit((state as SendEmailInitialState).copyWith(to: toController.text));
    } else {
      emit(SendEmailInitialState(to: toController.text));
    }
  }

  void ccVauleChanged() {
    if (state is SendEmailInitialState) {
      emit((state as SendEmailInitialState).copyWith(cc: ccController.text));
    } else {
      emit(SendEmailInitialState(cc: ccController.text));
    }
  }

  void bccVauleChanged() {
    if (state is SendEmailInitialState) {
      emit((state as SendEmailInitialState).copyWith(bcc: bccController.text));
    } else {
      emit(SendEmailInitialState(bcc: bccController.text));
    }
  }

  void subjectVauleChanged() {
    if (state is SendEmailInitialState) {
      emit((state as SendEmailInitialState)
          .copyWith(subject: subjectController.text));
    } else {
      emit(SendEmailInitialState(subject: subjectController.text));
    }
  }

  void bodyVauleChanged() {
    if (state is SendEmailInitialState) {
      emit(
          (state as SendEmailInitialState).copyWith(body: bodyController.text));
    } else {
      emit(SendEmailInitialState(body: bodyController.text));
    }
  }
}
