//
//  Extensions.swift
//  twentyfour
//
//  Created by Sebastian Fox on 16.04.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

// MARK: - API
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    public func foreground<Overlay: View>(_ overlay: Overlay) -> some View {
        self.overlay(overlay).mask(self)
    }
}

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func coniferous(size: Int) -> Font {
        return Font.custom("Coniferous Demo", size: CGFloat(size))
    }
    
//    static func avenirNextRegular(size: Int) -> Font {
//        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
//    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App", size: CGFloat(size))
    }
    
    static func system(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App", size: CGFloat(size))
    }
    static func systemMedium(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App", size: CGFloat(size)).weight(.medium)
    }
    static func systemSemibold(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App", size: CGFloat(size)).weight(.semibold)
    }
    static func systemBold(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App", size: CGFloat(size)).weight(.bold)
    }
    static func systemLight(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App Light", size: CGFloat(size))
    }
    static func systemBook(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App Light", size: CGFloat(size))
    }
    static func systemExtrabold(size: Int) -> Font {
        return Font.custom("Airbnb Cereal App Extra Bold", size: CGFloat(size))
    }
//}

//static func system(size: Int) -> Font {
//    return Font.custom("SFProDisplay-Regular", size: CGFloat(size))
//}
//static func systemMedium(size: Int) -> Font {
//    return Font.custom("SFProDisplay-Regular", size: CGFloat(size)).weight(.medium)
//}
//static func systemSemibold(size: Int) -> Font {
//    return Font.custom("SFProDisplay-Regular", size: CGFloat(size)).weight(.semibold)
//}
//static func systemBold(size: Int) -> Font {
//    return Font.custom("SFProDisplay-Regular", size: CGFloat(size)).weight(.bold)
//}
//static func systemExtrabold(size: Int) -> Font {
//    return Font.custom("SFProDisplay-Regular", size: CGFloat(size))
//}
    
//    static func system(size: Int) -> Font {
//        return Font.custom("FONTSPRINGDEMO-ProximaNovaRegular", size: CGFloat(size))
//    }
//    static func systemMedium(size: Int) -> Font {
//        return Font.custom("FONTSPRINGDEMO-ProximaNovaMediumRegular", size: CGFloat(size))
//    }
//    static func systemSemibold(size: Int) -> Font {
//        return Font.custom("FONTSPRINGDEMO-ProximaNovaSemiboldRegular", size: CGFloat(size))
//    }
//    static func systemBold(size: Int) -> Font {
//        return Font.custom("FONTSPRINGDEMO-ProximaNovaBold", size: CGFloat(size))
//    }
//    static func systemExtrabold(size: Int) -> Font {
//        return Font.custom("FONTSPRINGDEMO-ProximaNovaExtraboldRegular", size: CGFloat(size))
//    }
    
    static func sfBold(size: Int) -> Font {
        return Font.custom("SFProDisplay-Bold", size: CGFloat(size))
    }
    
    static func sfSemibold(size: Int) -> Font {
        return Font.custom("SFProDisplay-Semibold", size: CGFloat(size))
    }
    
//    static func coniferous(size: Int) -> Font {
//        return Font.custom("Coniferous Demo", size: CGFloat(size))
//    }
    
    static func coconut(size: Int) -> Font {
        return Font.custom("Coconut Punch", size: CGFloat(size))
    }
//    static func avenirNextRegular(size: Int) -> Font {
//        return Font.custom("Coniferous", size: CGFloat(size))
//    }
}

func openMenu<T>(_ view: T)  {
    print("open")
}

// extension for keyboard to dismiss
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}


