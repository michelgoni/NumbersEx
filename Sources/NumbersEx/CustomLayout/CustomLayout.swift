//
//  CustomLayoutProperties.swift
//  
//
//  Created by Michel Goñi on 8/5/23.
//

import Foundation
import SwiftUI

public struct CustomLayoutProperties {
    public var landscape: Bool
    public var dimensValues: CustomDimensValues
    public var customFontSize: CustomFontSize
    public var height: CGFloat
    public var width: CGFloat
    
    public init(landscape: Bool, dimensValues: CustomDimensValues, customFontSize: CustomFontSize, height: CGFloat, width: CGFloat) {
        self.landscape = landscape
        self.dimensValues = dimensValues
        self.customFontSize = customFontSize
        self.height = height
        self.width = width
    }
}

public struct CustomDimensValues {
    public let small: CGFloat
    public let smallMedium: CGFloat
    public let medium: CGFloat
    public let mediumLarge: CGFloat
    public let large: CGFloat
    public let extraLarge: CGFloat
    public init(height: CGFloat, width: CGFloat) {
        let widthToCalculate = height<width ? height : width
        switch widthToCalculate {
        case _ where widthToCalculate<700:
                    small = 7
                    smallMedium = 10
                    medium = 12
                    mediumLarge = 15
                    large = 17
                    extraLarge = 22
                case _ where widthToCalculate>=700 && widthToCalculate<1000:
                    small = 14
                    smallMedium = 16
                    medium = 19
                    mediumLarge = 22
                    large = 24
                    extraLarge = 29
                case _ where widthToCalculate>=1000:
                    small = 17
                    smallMedium = 20
                    medium = 23
                    mediumLarge = 25
                    large = 28
                    extraLarge = 32
                default:
                    small = 5
                    smallMedium = 8
                    medium = 10
                    mediumLarge = 13
                    large = 15
                    extraLarge = 20
        }
    }
}

@available(iOS 13.0, *)
public struct ResponsiveView<Content: View>: View {
    public var content: (CustomLayoutProperties) -> Content
    public init(content: @escaping (CustomLayoutProperties) -> Content) {
        self.content = content
    }
    public var body: some View {
        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            let landScape = height<width
            let dimensValues = CustomDimensValues(height: height, width: width)
            let customFontSize = CustomFontSize(height: height, width: width)
            content(
                CustomLayoutProperties(
                    landscape: landScape,
                    dimensValues: dimensValues,
                    customFontSize: customFontSize,
                    height: height,
                    width: width
                )
            )
        }
    }
}

public struct CustomFontSize {
    public let small: CGFloat
    public let smallMedium: CGFloat
    public let medium: CGFloat
    public let mediumLarge: CGFloat
    public let large: CGFloat
    public let extraLarge: CGFloat
    
    public init(height: CGFloat, width: CGFloat) {
        let widthToCalculate = height<width ? height : width
        switch widthToCalculate {
        case _ where widthToCalculate<700:
            small = 8
            smallMedium = 11
            medium = 14
            mediumLarge = 16
            large = 18
            extraLarge = 25
        case _ where widthToCalculate>=700 && widthToCalculate<1000:
            small = 15
            smallMedium = 18
            medium = 22
            mediumLarge = 26
            large = 30
            extraLarge = 40
        case _ where widthToCalculate>=1000:
            small = 20
            smallMedium = 24
            medium = 28
            mediumLarge = 32
            large = 36
            extraLarge = 45
        default:
            small = 8
            smallMedium = 11
            medium = 14
            mediumLarge = 16
            large = 18
            extraLarge = 25
        }
    }
}

