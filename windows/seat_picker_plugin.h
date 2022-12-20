#ifndef FLUTTER_PLUGIN_SEAT_PICKER_PLUGIN_H_
#define FLUTTER_PLUGIN_SEAT_PICKER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace seat_picker {

class SeatPickerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SeatPickerPlugin();

  virtual ~SeatPickerPlugin();

  // Disallow copy and assign.
  SeatPickerPlugin(const SeatPickerPlugin&) = delete;
  SeatPickerPlugin& operator=(const SeatPickerPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace seat_picker

#endif  // FLUTTER_PLUGIN_SEAT_PICKER_PLUGIN_H_
