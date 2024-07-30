part of 'send_email_cubit.dart';

@immutable
sealed class SendEmailState {}

final class SendEmailInitialState extends SendEmailState {
  final String? to;
  final String? cc;
  final String? bcc;
  final String? subject;
  final String? body;
  SendEmailInitialState({this.to, this.cc, this.bcc, this.subject, this.body});
  SendEmailInitialState copyWith({
    String? to,
    String? cc,
    String? bcc,
    String? subject,
    String? body,
  }) {
    return SendEmailInitialState(
      to: to ?? this.to,
      cc: cc ?? this.cc,
      bcc: bcc ?? this.bcc,
      subject: subject ?? this.subject,
      body: body ?? this.body,
    );
  }
}

final class SendEmailFailureState extends SendEmailState {
  final String message;

  SendEmailFailureState({required this.message});
}

final class SendEmailSuccesState extends SendEmailState {
  final String message;
  SendEmailSuccesState(this.message);
}
