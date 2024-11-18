import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class StopWatchAtomic extends StatefulWidget {
  const StopWatchAtomic({super.key});

  @override
  State<StopWatchAtomic> createState() => _StopWatchAtomicState();
}

class _StopWatchAtomicState extends State<StopWatchAtomic> {
  @override
  Widget build(BuildContext context) {
    final int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;
    return CountdownTimer(
      widgetBuilder: (context, currentTime) {
        return Text(
          '${currentTime!.min ?? '00'}: ${currentTime.sec ?? '00'}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );

      },
      onEnd: () {
        print("Fim");
      },
      endTime: endTime,
    );
  }
}
