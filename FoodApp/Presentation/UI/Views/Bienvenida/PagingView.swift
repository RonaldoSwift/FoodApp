//
//  PagingView.swift
//  FoodApp
//
//  Created by Ronaldo on 16/03/23.
//

import SwiftUI

struct PagingView<Content>: View where Content: View {
    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content
    
    @State private var offset = CGFloat.zero
    @State private var dragging = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GeometryReader { (geometryProxy: GeometryProxy) in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        self.content()
                            .frame(width: geometryProxy.size.width,
                                   height: geometryProxy.size.height)
                            .clipped()
                    }
                }
                .content.offset(x: self.offset(in: geometryProxy), y: 0)
                .frame(width: geometryProxy.size.width, alignment: .leading)
                .gesture(
                    DragGesture()
                        .onChanged { (value: DragGesture.Value) in
                            self.dragging = true
                            self.offset = -CGFloat(self.index) * geometryProxy.size.width + value.translation.width
                        }
                        .onEnded { (value: DragGesture.Value) in
                            let predictedEndOffset = -CGFloat(self.index) * geometryProxy.size.width + value.predictedEndTranslation.width
                            let predictedIndex = Int(round(predictedEndOffset / -geometryProxy.size.width))
                            self.index = self.clampedIndex(from: predictedIndex)
                            withAnimation(.easeOut) {
                                self.dragging = false
                            }
                        }
                )
            }
            .clipped()
        }
        .frame(width: 338, height: 500)
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if dragging {
            return max(min(offset, 0), -CGFloat(maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(index) * geometry.size.width
        }
    }
    
    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, index - 1), index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
}

struct PagingView_Previews: PreviewProvider {
    static var previews: some View {
        PagingView<Text>(index: .constant(0), maxIndex: 5, content: { Text("testing") })
    }
}
