import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Flutter Developer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Input N"),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _onGenerateSeries(context, 1),
                  child: const Text("1"),
                ),
                ElevatedButton(
                  onPressed: () => _onGenerateSeries(context, 2),
                  child: const Text("2"),
                ),
                ElevatedButton(
                  onPressed: () => _onGenerateSeries(context, 3),
                  child: const Text("3"),
                ),
                ElevatedButton(
                  onPressed: () => _onGenerateSeries(context, 4),
                  child: const Text("4"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Text(
                  "Result:\n${state.result}",
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onGenerateSeries(BuildContext context, int type) {
    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid number")),
      );
      return;
    }
    context.read<AppBloc>().add(GenerateSeries(input, type));
  }
}
