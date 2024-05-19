import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

void main() {
  runApp(const RearchBootstrapper(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: KeyTestWidget(),
      ),
    );
  }
}

class KeyTestWidget extends RearchConsumer {
  const KeyTestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final focusNode = use.focusNode(
      onKeyEvent: (node, event) {
        print('onKeyEvent -- ${event.logicalKey}');

        return KeyEventResult.ignored;
      },
    );

    use.callonce(() => Future.microtask(focusNode.requestFocus));

    return Focus(
      focusNode: focusNode,
      child: Container(
        color: Colors.yellow.withOpacity(0.6),
      ),
    );
  }
}
