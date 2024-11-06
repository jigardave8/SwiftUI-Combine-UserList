# SwiftUI-Combine-UserList

A simple iOS app that demonstrates fetching and displaying a list of users using **SwiftUI** and **Combine**. 



This project includes structured MVVM architecture, a basic network service layer, and organized naming conventions.

## Features

- **SwiftUI & Combine**: Uses Combine for asynchronous network calls and SwiftUI for a declarative UI.
- **MVVM Architecture**: Separates business logic, data fetching, and view representation for clean, maintainable code.
- **Network Handling**: A simple `UserNetworkService` handles API calls with Combine’s `URLSession` publisher.

## Project Structure

- **Model** (`UserModel.swift`): Defines the data structure for a User.
- **Network Service** (`UserNetworkService.swift`): Contains network code to fetch user data.
- **ViewModel** (`UserListViewModel.swift`): Manages data flow between the service and the SwiftUI view.
- **View** (`UserListView.swift`): Displays a list of users or an error message if fetching fails.

## Screenshots


<p align="center">
    <img src="https://github.com/user-attachments/assets/4ba8f3cb-8f50-492f-a2c6-d882a4be7a2b" alt="Simulator Screenshot" width="300" height="300">
</p>



## Technologies Used

- **Swift 5**
- **SwiftUI**
- **Combine**
- **Xcode 12+**

## Getting Started

### Prerequisites

- **Xcode 12+** is required.
- **macOS Catalina or later** is recommended.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/jigardave8/SwiftUI-Combine-UserList.git
    cd SwiftUI-Combine-UserList
    ```

2. Open the project in Xcode:

    ```bash
    open SwiftUI-Combine-UserList.xcodeproj
    ```

3. Run the project in the Xcode simulator.

## Usage

1. Launch the app on the simulator or a connected iOS device.
2. The app will fetch a list of users from a mock JSON API and display their names and emails.
3. In case of an error, an error message will appear in place of the list.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License.

---

