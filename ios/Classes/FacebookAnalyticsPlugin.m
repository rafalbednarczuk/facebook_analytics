#import "FacebookAnalyticsPlugin.h"
#import <facebook_analytics/facebook_analytics-Swift.h>

@implementation FacebookAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFacebookAnalyticsPlugin registerWithRegistrar:registrar];
}
@end
