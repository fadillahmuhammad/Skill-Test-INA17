import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final String result;

  const AppState({required this.result});

  @override
  List<Object> get props => [result];
}
