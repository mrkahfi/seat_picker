#import "SeatPickerPlugin.h"
#if __has_include(<seat_picker/seat_picker-Swift.h>)
#import <seat_picker/seat_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "seat_picker-Swift.h"
#endif

@implementation SeatPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSeatPickerPlugin registerWithRegistrar:registrar];
}
@end
