import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenerateSeries extends AppEvent {
  final int n;
  final int type;

  GenerateSeries(this.n, this.type);

  @override
  List<Object> get props => [n, type];
}
