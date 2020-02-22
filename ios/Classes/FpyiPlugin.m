#import "FpyiPlugin.h"
#if __has_include(<fpyi/fpyi-Swift.h>)
#import <fpyi/fpyi-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fpyi-Swift.h"
#endif

@implementation FpyiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFpyiPlugin registerWithRegistrar:registrar];
}
@end
