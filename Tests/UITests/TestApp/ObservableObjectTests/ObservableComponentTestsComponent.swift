//
// This source file is part of the CardinalKit open-source project
//
// SPDX-FileCopyrightText: 2022 CardinalKit and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import CardinalKit
import SwiftUI


class ObservableComponentTestsComponent<ComponentStandard: Standard>: Module {
    var message: String
    
    
    init(message: String) {
        self.message = message
    }
}