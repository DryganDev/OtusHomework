//
//  CombinedState.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 27.02.21.
//

import Foundation
import SwiftUI

@propertyWrapper
struct CombinedState<T, V> {
    
    @Binding private var first: T
    @Binding private var second: V
    
    var wrappedValue: T
    
}
