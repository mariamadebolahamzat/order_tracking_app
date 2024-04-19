import 'dart:async';

import '../domain/order/enums/status_enum.dart';

abstract class IAblyService {
  StreamController<StatusEnum> get orderSC;
  void initListeners();
  void dispose();
}
