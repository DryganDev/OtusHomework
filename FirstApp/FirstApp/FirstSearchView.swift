//
//  FirstSearchView.swift
//  FirstApp
//
//  Created by Artsiom Sazonau on 9.01.21.
//

import SwiftUI

struct FirstSearchView: View {
    
    @Binding var isTapped: Bool
    
    var body: some View {
        Button("Hello, World") {
            isTapped.toggle()
        }
    }
}

struct FirstSearchView_Previews: PreviewProvider {
        
    static var previews: some View {
        StatefulPreviewWrapper(false) {
            FirstSearchView(isTapped: $0)
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
