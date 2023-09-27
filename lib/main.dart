import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryapp/page.dart';

void main() async {
  runApp(const ProviderScope(child: TryApp()));
}

class TryApp extends ConsumerWidget {
  const TryApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: Okay(),
    );
  }
}
