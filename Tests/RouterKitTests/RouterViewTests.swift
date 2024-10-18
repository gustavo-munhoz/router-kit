//
//  RouterViewTests.swift
//  RouterKit
//
//  Created by Felipe Passos on 18/10/24.
//

import SwiftUI
import Testing
@testable import RouterKit

@Suite("RouterView Tests")
struct RouterViewTests {
    @Test("Should initialize RouterView correctly", arguments: [true, false])
    func shouldInitializeCorrectly(_ showBackButton: Bool) {
        let rootView = MockRoute()
        
        let view = RouterView(rootView: rootView, showBackButton: showBackButton)
        
        #expect(view.router != nil)
        #expect(view.router.stack.isEmpty)
    }
    
    @Test("Should navigate to another view", arguments: [true, false])
    func shouldNavigate(_ showBackButton: Bool) {
        let rootView = MockRoute()
        let anotherView = MockRoute()
        
        let view = RouterView(rootView: rootView, showBackButton: showBackButton)
        
        view.router.push(to: anotherView)
        
        #expect(view.router.stack.last == anotherView)
    }
}