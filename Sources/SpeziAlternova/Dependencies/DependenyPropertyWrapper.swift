//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import XCTRuntimeAssertions


/// Refer to ``Component/Dependency`` for information on how to use the `@Dependency` property wrapper. Do not use the `_DependencyPropertyWrapper` directly.
@propertyWrapper
public class _DependencyPropertyWrapper<C: Component>: ComponentDependency {
    // swiftlint:disable:previous type_name
    // We want the _DependencyPropertyWrapper type to be hidden from autocompletion and document generation.
    
    public let defaultValue: () -> C
    private var dependency: C?
    
    
    /// The dependency that is resolved by ``Spezi``
    public var wrappedValue: C {
        guard let dependency else {
            preconditionFailure(
                """
                A `_DependencyPropertyWrapper`'s wrappedValue was accessed before the dependency was activated.
                Only access dependencies once the component has been configured and the Spezi initialization is complete.
                """
            )
        }
        return dependency
    }
    
    
    /// Refer to ``Component/Dependency`` for information on how to use the `@Dependency` property wrapper. Do not use the `_DependencyPropertyWrapper` directly.
    public init(wrappedValue defaultValue: @escaping @autoclosure () -> C) {
        self.defaultValue = defaultValue
    }
    
    
    /// Refer to ``Component/Dependency`` for information on how to use the `@Dependency` property wrapper. Do not use the `_DependencyPropertyWrapper` directly.
    public init() where C: DefaultInitializable {
        self.defaultValue = { C() }
    }
    
    
    public func gatherDependency(dependencyManager: DependencyManager) {
        dependencyManager.require(C.self, defaultValue: defaultValue())
    }
    
    public func inject(dependencyManager: DependencyManager) {
        dependencyManager.inject(C.self, into: self)
    }
    
    public func inject(dependency: C) {
        precondition(
            self.dependency == nil,
            "Already injected a component: \(String(describing: dependency))"
        )
        self.dependency = dependency
    }
}
