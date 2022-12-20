#include "include/seat_picker/seat_picker_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "seat_picker_plugin.h"

void SeatPickerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  seat_picker::SeatPickerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
