// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2026/05/28
// Description: 
// -------------------------------------------------------------------
class TraceConfig {
  // flutter run --dart-define=ENABLE_TRACE=true
  static const bool isEnabled =bool.fromEnvironment("ENABLE_TRACE", defaultValue: false);
}