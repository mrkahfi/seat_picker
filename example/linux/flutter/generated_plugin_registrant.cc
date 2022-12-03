//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <seat_picker/seat_picker_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) seat_picker_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SeatPickerPlugin");
  seat_picker_plugin_register_with_registrar(seat_picker_registrar);
}
