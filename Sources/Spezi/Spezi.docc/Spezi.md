# ``Spezi``

<!--
                  
This source file is part of the Stanford Spezi open-source project

SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)

SPDX-License-Identifier: MIT
             
-->

Open-source framework for rapid development of modern, interoperable digital health applications.

## Overview

> Note: Refer to the <doc:Setup> instructions on how to integrate Spezi into your application!

Spezi introduces a standards-based modular approach to building digital health applications. A standard builds the shared repository of data mapped to a common understanding that is used to exchange data between Spezi modules.

We differentiate between five different types of modules:
- **Standard**: Acts as a shared repository and common ground of communication between modules. We, e.g., provide the FHIR standard as a great standard to build your digital health applications.
- **Data Sources**: Provide input to a standard and utilize the standard's data source registration functionality and adapters to transform data into the standardized format. Examples include the HealthKit data source.
- **Data Source User Interfaces**: Data source user interfaces are data sources that also present user interface components. This, e.g., includes the questionnaire module in the Spezi Swift Package.
- **Data Storage Providers**: Data storage providers obtain elements from a standard and persistently store them. Examples include uploading the data to a cloud storage provider such as the Firebase module.
- **Research Application User Interface**: Research application user interfaces display additional context in the application and include the onboarding, consent, and contacts modules to display great digital health applications.

![System Architecture of the Spezi Framework](SystemArchitecture)

> Note: Spezi relies on an ecosystem of modules. Think about what modules you want to build and contribute to the open-source community! Refer to <doc:ModuleCapabilities> to learn more about building your modules.

## Topics

### Spezi Setup

- <doc:Setup>
- ``Spezi/Spezi``
- ``SpeziAppDelegate``
- ``Standard``

### Component

- ``Component``

### Modules

- <doc:ModuleCapabilities>
- ``Module``

### Configuration

- ``Configuration``
- ``ComponentBuilder``
- ``ComponentCollection``

### Data Sources

- ``DataSourceRegistry``
- ``Adapter``

### Data Storage Providers

- ``DataStorageProvider``
- ``EncodableAdapter``

### Shared Repository

- <doc:Shared-Repository>
- ``SharedRepository``
- ``RepositoryAnchor``
- ``KnowledgeSource``
- ``SpeziAnchor``
- ``SpeziStorage``

### Utilities

- ``AnyArray``
- ``AnyOptional``