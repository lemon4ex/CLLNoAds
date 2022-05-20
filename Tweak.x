#import <Foundation/Foundation.h>

#define XLOG(log, ...)	NSLog(@"[CLLNoAds] " log, ##__VA_ARGS__)

%hook GDTSplashAd
- (void)showSplashAd {}
%end
%hook CLLSDKNativeAd
- (void)setAdEntityArray:(id)array {}
%end
%hook CLLAdvertiseUtility
- (void)setAdEntity:(id)entity {}
%end
%hook CLLAdvertise
- (void)setAdEntity:(id)entity {}
%end
%hook CLLAdvertiseSplashView
- (void)setAdEntity:(id)entity {}
%end
%hook CLLAdvertiseDetailInfoModel
- (void)setAdEntity:(id)entity {}
%end

%ctor {
	XLOG(@"loaded in %s (%d)", getprogname(), getpid());

	// Add any personal initializations
	%init();
}