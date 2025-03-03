//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

@testable import SpeziAlternova
import SwiftUI
import XCTest
import XCTRuntimeAssertions


final class StandardInjectionTests: XCTestCase {
    final class StandardInjectionTestComponent: Component {
        @StandardActor var standard: MockStandard
        
        let expectation: XCTestExpectation
        
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        
        func configure() {
            Task {
                await standard.fulfill(expectation: expectation)
            }
        }
    }
    
    class StandardInjectionTestApplicationDelegate: SpeziAppDelegate {
        let expectation: XCTestExpectation
        
        
        override var configuration: Configuration {
            Configuration(standard: MockStandard()) {
                StandardInjectionTestComponent(expectation: expectation)
            }
        }
        
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
    }
    
    
    func testComponentFlow() async throws {
        let expectation = XCTestExpectation(description: "Component")
        expectation.assertForOverFulfill = true
        
        let standardInjectionTestApplicationDelegate = await StandardInjectionTestApplicationDelegate(
            expectation: expectation
        )
        _ = await standardInjectionTestApplicationDelegate.spezi
        
        await fulfillment(of: [expectation], timeout: 0.01)
    }
    
    func testInjectionPrecondition() throws {
        try XCTRuntimePrecondition {
            _ = _StandardPropertyWrapper<MockStandard>().wrappedValue
        }
    }
}
