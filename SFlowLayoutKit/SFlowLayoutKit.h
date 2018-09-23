//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SFlowLayoutKit.h
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      09/22/2018: Created by Cyrex on 09/22/2018
//

#import <UIKit/UIKit.h>

//! Project version number for SFlowLayoutKit.
FOUNDATION_EXPORT double SFlowLayoutKitVersionNumber;

//! Project version string for SFlowLayoutKit.
FOUNDATION_EXPORT const unsigned char SFlowLayoutKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SFlowLayoutKit/PublicHeader.h>
#if __has_include(<SFlowLayoutKit/SFlowLayoutKit.h>)
    #import <SFlowLayoutKit/SWaterFallFlowLayout.h>
#else
    #import "SWaterFallFlowLayout.h"
#endif
