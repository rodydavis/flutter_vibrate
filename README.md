[![Buy Me A Coffee](https://img.shields.io/badge/Donate-Buy%20Me%20A%20Coffee-yellow.svg)](https://www.buymeacoffee.com/rodydavis)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WSH3GVC49GNNJ)
![github pages](https://github.com/rodydavis/flutter_vibrate/workflows/github%20pages/badge.svg)
[![GitHub stars](https://img.shields.io/github/stars/rodydavis/flutter_vibrate?color=blue)](https://github.com/rodydavis/flutter_vibrate)
[![flutter_vibrate](https://img.shields.io/pub/v/flutter_vibrate.svg)](https://pub.dev/packages/flutter_vibrate)

# Vibrate

A Flutter plugin to vibrate the device. 
This uses all the current Haptic Feedback APIs from Apple and provides similar feedback on Android.

> [!WARNING]
> This project has moved here: https://github.com/rodydavis/packages.dart

## Getting Started

Make sure you add the following permissions to your Android Manifest
``` xml
<uses-permission android:name="android.permission.VIBRATE"/>
```
## Usage
``` dart
// Import package
import 'package:flutter_vibrate/flutter_vibrate.dart';
```

### Vibration
``` dart
// Check if the device can vibrate
bool canVibrate = await Vibrate.canVibrate;

// Vibrate
// Vibration duration is a constant 500ms because
// it cannot be set to a specific duration on iOS.
Vibrate.vibrate();

// Vibrate with pauses between each vibration
final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
];
// vibrate - sleep 0.5s - vibrate - sleep 1s - vibrate - sleep 0.5s - vibrate
Vibrate.vibrateWithPauses(pauses);
```
### Haptic Feedback
``` dart
// Choose from any of these available methods
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

var _type = FeedbackType.impact;
Vibrate.feedback(_type);
```
## Documentation
#### Android

https://developer.android.com/reference/android/view/HapticFeedbackConstants

#### iOS

https://developer.apple.com/design/human-interface-guidelines/ios/user-interaction/feedback/

