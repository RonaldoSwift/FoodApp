//
//  Extension.swift
//  FoodApp
//
//  Created by Ronaldo on 18/03/23.
//

import Foundation
import SwiftUI

extension View{
    func placeholder<Content: View>(
        when shouldShow: Bool,
        aligment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View
    {
        ZStack(alignment: aligment){
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
