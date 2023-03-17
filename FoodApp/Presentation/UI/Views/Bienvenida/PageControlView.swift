//
//  PageControlView.swift
//  FoodApp
//
//  Created by Ronaldo on 16/03/23.
//

import SwiftUI

struct PageControlView: View {
    @Binding var index: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: 8){
            ForEach(0 ... maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index ? Color.white : Color.gray)
                    .frame(width: 8,height: 8)
            }
        }
        .padding(15)
    }
}

struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView(index: .constant(0), maxIndex: 5)
    }
}
