//
//  Spec.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/20.
//  Copyright © 2020 tempYsoup. All rights reserved.
//

import UIKit

public struct Specs {
    public struct Color {
        public let facebook = UIColor(hex: 0x4267B2)
        public let red = UIColor.red
        public let white = UIColor.white
        public let black = UIColor.black
        public let gray = UIColor.lightGray
    }
    
    public struct FontSize {
        
    }
    
    public struct Font {
        
    }
    
    public struct ImageName {
        public let friends = "fb_friends"
        public let events = "fb_events"
        public let groups = "fb_groups"
        public let education = "fb_education"
        public let townHall = "fb_town_hall"
        public let instantGames = "fb_games"
        public let settings = "fb_settings"
        public let privacyShortcuts = "fb_privacy_shortcuts"
        public let helpSupport = "fb_help_and_support"
        public let placeholder = "fb_placeholder"
    }
    
    public static var color: Color {
      return Color()
    }
    
    public static var fontSize: FontSize {
      return FontSize()
    }
    
    public static var font: Font {
      return Font()
    }
    
    public static var imageName: ImageName {
      return ImageName()
    }
}
