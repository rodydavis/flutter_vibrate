import 'dart:async';

import 'package:flutter/services.dart';

enum FeedbackType {
  success,
  error,
  warning,
  selection,
  impact,
  heavy,
  medium,
  light
}

class Vibrate {
  static const MethodChannel _channel = const MethodChannel('vibrate');
  static const Duration _DEFAULT_VIBRATION_DURATION =
      const Duration(milliseconds: 500);

  /// Vibrate for 500ms on Android, and for the default time on iOS (about 500ms as well)
  static Future vibrate() => _channel.invokeMethod(
      'vibrate', {"duration": _DEFAULT_VIBRATION_DURATION.inMilliseconds});

  /// Whether the device can actually vibrate or not
  static Future<bool> get canVibrate async {
    final bool isOn = (await _channel.invokeMethod('canVibrate')) ?? false;
    return isOn;
  }

  static void feedback(FeedbackType type) {
    switch (type) {
      case FeedbackType.impact:
        _channel.invokeMethod('impact');
        break;
      case FeedbackType.error:
        _channel.invokeMethod('error');
        break;
      case FeedbackType.success:
        _channel.invokeMethod('success');
        break;
      case FeedbackType.warning:
        _channel.invokeMethod('warning');
        break;
      case FeedbackType.selection:
        _channel.invokeMethod('selection');
        break;
      case FeedbackType.heavy:
        _channel.invokeMethod('heavy');
        break;
      case FeedbackType.medium:
        _channel.invokeMethod('medium');
        break;
      case FeedbackType.light:
        _channel.invokeMethod('light');
        break;
      default:
    }
  }

  /// Vibrates with [pauses] in between each vibration
  /// Will always vibrate once before the first pause
  /// and once after the last pause

  static Future vibrateWithPauses(Iterable<Duration> pauses) async {
    for (Duration d in pauses) {
      vibrate();
      //Because the native vibration is not awaited, we need to wait for
      //the vibration to end before launching another one
      await new Future.delayed(_DEFAULT_VIBRATION_DURATION);
      await new Future.delayed(d);
    }
    vibrate();
  }
}
