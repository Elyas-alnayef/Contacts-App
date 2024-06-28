part of 'company_cubit.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}
final class CompanyLoadingState extends CompanyState {}
final class CompanyLoadiedState extends CompanyState {}
final class CompanyEnableFormState extends CompanyState {}
final class CompanyFailerState extends CompanyState {}



