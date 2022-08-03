#import "OpenPdfPlugin.h"
#if __has_include(<open_pdf/open_pdf-Swift.h>)
#import <open_pdf/open_pdf-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "open_pdf-Swift.h"
#endif

@implementation OpenPdfPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOpenPdfPlugin registerWithRegistrar:registrar];
}
@end
