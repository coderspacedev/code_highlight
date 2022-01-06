#import "CodeHighlightPlugin.h"
#if __has_include(<code_highlight/code_highlight-Swift.h>)
#import <code_highlight/code_highlight-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "code_highlight-Swift.h"
#endif

@implementation CodeHighlightPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCodeHighlightPlugin registerWithRegistrar:registrar];
}
@end
