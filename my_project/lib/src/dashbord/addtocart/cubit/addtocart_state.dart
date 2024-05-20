part of 'addtocart_cubit.dart';

@immutable
sealed class addtocartState {}

final class addtocartStateLoading extends addtocartState {}

final class addtocartStateLoaded extends addtocartState {}

final class addtocartStateEmpty extends addtocartState {}
