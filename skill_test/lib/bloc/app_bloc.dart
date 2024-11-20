import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(result: "")) {
    on<GenerateSeries>((event, emit) {
      String result = _generateSeries(event.n, event.type);
      emit(AppState(result: result));
    });
  }

  String _generateSeries(int n, int type) {
    List<String> series = [];
    switch (type) {
      case 1:
        series = List.generate(n, (i) => (i + 1).toString());
        break;
      case 2:
        List<int> ascending = List.generate(n, (i) => i + 1);
        List<int> descending = List.generate(n - 1, (i) => n - 1 - i);
        series =
            [...ascending, ...descending].map((e) => e.toString()).toList();
        break;
      case 3:
        List<String> series = List.generate(n, (i) {
          int firstDigit = i + 1;
          int secondDigit = i;
          return '$firstDigit$secondDigit';
        });
        String result = series.join(' ');
        return result.toString();
        // ignore: dead_code
        break;
      case 4:
        series = List.generate(n, (i) {
          int num = i + 1;
          if (num % 5 == 0) return "LIMA";
          if (num % 7 == 0) return "TUJUH";
          return num.toString();
        });
        break;
    }
    return series.join(" ");
  }
}
