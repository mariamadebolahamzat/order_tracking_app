# order_tracking_app

This Flutter application is a simple order-tracking app that allows users to sign in with Google using Firebase Authentication. Once signed in, users can view their order details, including order ID, date, items, quantity, price, and real-time order status. The app provides a seamless experience for users to switch between the order overview page and the detailed order status page.

## About Codebase
The codebase prioritizes maintainability and reusability. It leverages Riverpod for state management, promoting clean separation of concerns. The architecture follows a Domain-Driven Design (DDD) approach, further enhancing code organization. This structure separates the Presentation layer (user interface) from the domain and business logic layers.

## Tools used
- Flutter

## External Technology
- Firebase Authentication: Provides user authentication using Google login.
- Ably Realtime: Enables real-time updates for the order status within the app.
- Riverpod: State management library for a centralized and reactive approach to managing application state
- Equatable: Used for value object comparisons
- Firebase (Core, Auth): Enables user authentication and core functionalities.
- Timelines: used for order tracking timeline
- Intl: used for date and time formatting 
- Flutter Screenutil: used for responsive UI

## APK file

https://drive.google.com/file/d/1m0MMmmEfLOjeYvUKSy1GbCsZkjS95OFC/view?usp=drive_link

## DEMO VIDEO


## How to run the app
This guide covers running the app on your development machine using Flutter. 
- Prerequisites: 
    - Flutter development environment: Ensure you have Flutter installed and configured on your development machine. Refer to the official documentation for setup instructions: https://docs.flutter.dev/get-started/install.
    - Android device or emulator: You'll need a physical Android device or an emulator to run the app.
- Steps:
  - Clone the repository: git clone https://github.com/mariamadebolahamzat/order_tracking_app.git
  - Navigate to the project directory: cd order_tracking_app
  - Install dependencies: flutter pub get
  - Run the app: flutter run
  - Create an Ably Account:
      - Visit the Ably website: https://ably.com/
      - Sign up for a new account or log in to your existing account.
  - Obtain your Ably API Key:
      - Navigate to your Ably dashboard.
      - Locate the section where you can view or generate your API key. (The specific steps for finding your API key may vary depending on the Ably interface updates)
  - Configure Ably API Key in the Code:
      - Within the project's source code, locate the designated area for configuring the Ably API key. (It is in the ably service file in the services folder)
      - Replace the placeholder or default value with your obtained Ably API key.
  - On the dashboard, locate the "Dev Console" tab. This is where you need to create a channel name.
  - After inputting the channel name, click on the attach channel button to create it.
  - Create a client ID, which serves as the order ID.
  - The app leverages Ably Realtime to display the order status updates.
  - The event name used for order status updates is "order-status".
  - The message data within this event will contain the actual order status message, such as:
      - ORDER PLACED
      - ORDER ACCEPTED
      - ORDER PICK UP IN PROGRESS
      - ORDER ON THE WAY TO CUSTOMER
      - ORDER ARRIVED
      - ORDER DELIVERED
  - You can switch between the "Track Status" page and the "Overview" page to see how the orders are tracked in real-time.
 





