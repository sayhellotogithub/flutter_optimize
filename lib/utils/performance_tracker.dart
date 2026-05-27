// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2026/05/28
// Description:
// -------------------------------------------------------------------
import 'dart:developer';

import 'package:flutter/foundation.dart';

class PerformanceTracker {
  static final PerformanceTracker _instance = PerformanceTracker._internal();

  factory PerformanceTracker() {
    return _instance;
  }

  PerformanceTracker._internal();

  static Future<T> traceAsync<T>(
    String name,
    Future<T> Function() action,
  ) async {
    //In a non-debugging environment, you can choose to execute directly to reduce overhead.
    if (kReleaseMode) {
      return await action();
    }

    final task = TimelineTask();
    task.start(name);
    try {
      return await action();
    } finally {
      task.finish();
    }
  }

  static T traceSync<T>(String name, T Function() action) {
    if (kReleaseMode) return action();

    Timeline.startSync(name);
    try {
      return action();
    } finally {
      Timeline.finishSync();
    }
  }
}
