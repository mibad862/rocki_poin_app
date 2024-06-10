import 'package:flutter/foundation.dart';

class TapCounter extends ChangeNotifier {
  int _tapCount = 0;

  int get tapCount => _tapCount;

  void incrementTap() {
    if (_tapCount < 100) {
      _tapCount++;
      notifyListeners();
    }
  }

  String get statusText {
    if (_tapCount >= 100) {
      return 'Connected';
    } else {
      return _tapCount.toString();
    }
  }
}
