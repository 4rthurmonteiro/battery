import 'dart:async';

import 'package:flutter/services.dart';

class Battery {
  static const MethodChannel _channel = MethodChannel('battery');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int?> get getBatteryLevel async {
    final int? battery = await _channel.invokeMethod('getBatteryLevel');
    return battery;
  }

  static Future<bool?> get isCharging async {
    final bool? isCharging = await _channel.invokeMethod('isCharging');
    return isCharging;
  }

  static Future<num?> get timeToFinishCharge async {
    final num? time = await _channel.invokeMethod('timeToFinishCharge');
    return time;
  }
}
