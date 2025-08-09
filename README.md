# Test Dans Multi Pro
---

## Environment

- Swift version: 5.x
- iOS deployment target: 15.0
- Dependencies:
  - Alamofire (via Swift Package Manager)
  - Algorithms (via Swift Package Manager)
  - XcodeGen for project generation
- Modules:
  - Core
  - Domain
  - Data
  - App

---


## How to Open the Project

This project uses a **Makefile** to streamline generating and opening the Xcode project.

### Prerequisites

- [XcodeGen](https://github.com/yonaskolb/XcodeGen) installed on your machine (install via Homebrew: `brew install xcodegen`)
- Xcode installed (version 15.0 or later recommended)
- `make` command available in your terminal (usually preinstalled on macOS)

### Steps to Open

1. Open your terminal and navigate to the root folder of this project.

2. Generate the Xcode project by running:
      ```bash
   make generate
3. Open the generated Xcode project:
      ```bash
   make open
4. Alternatively, run both commands in one step:
      ```bash
   make all
5. To remove the generated project files, run:
      ```bash
   make clean

## Base URL or API that i Used
`https://picsum.photos/`

## Project Architecture

This project follows **Clean Architecture** principles to maintain a clear separation of concerns across modules:

- **Core**: Contains shared utilities, networking, and foundational components.
- **Domain**: Holds business logic, use cases, and entity models.
- **Data**: Implements repositories, data sources, and network interactions.
- **App**: The iOS application layer that contains UI and coordinates modules.

In addition, the UI layer adopts the **MVVM (Model-View-ViewModel)** design pattern to enhance maintainability and testability:

- **Model** represents the domain data.
- **ViewModel** handles presentation logic and state management.
- **View** is responsible for rendering UI components and binding to ViewModel.

This combination helps keep the code modular, scalable, and easier to maintain.


## Estimation
3 Hours


