import 'package:flutter/foundation.dart';

class BalanceModel with ChangeNotifier {
  double _totalBalance = 0.0;

  double get totalBalance => _totalBalance;

  void updateBalance(double newBalance) {
    _totalBalance = newBalance;
    notifyListeners();
  }
}
