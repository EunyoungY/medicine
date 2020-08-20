import 'package:flutter/cupertino.dart';

class JoinOrLogin extends ChangeNotifier{
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toogle() {
    _isJoin = !_isJoin;
    notifyListeners(); //let other widget that data has changed
  }

}
