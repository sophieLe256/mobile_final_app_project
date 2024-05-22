# Shopping SoleFusion Hub Flutter App
[![GitHub stars](https://img.shields.io/badge/Stars-0-yellow.svg?style=flat-square)](https://github.com/username/repository/stargazers)
[![Maintainability](https://img.shields.io/badge/Maintainability-100%25-brightgreen.svg?style=flat-square)](https://codeclimate.com/github/username/repository)

## :globe_with_meridians: Screenshots
![figma](https://github.com/sophieLe256/mobile_final_app_project/assets/102685323/127d9945-c5d7-47b3-99cf-c6d8d402b24f)

## :computer: Description
Welcome to the ***SoleFusion Hub*** ! 
- Developed a mobile shopping app using Flutter, featuring a collection of shoes available for purchase, user authentication, and favorite
item functionality integrated with Firebase.
- Implemented user-friendly login/logout features and Firebase integration for streamlined authentication and data management within the app.

## :iphone: Features
- **User Authentication:** Seamless user login and registration using Firebase Authentication.
- **Product Listing:** Display a collection of shoes with detailed views.
- **Favorites:** Users can add/remove shoes to/from their favorite list.
- **Shopping Cart:** Users can add shoes to the shopping cart for purchase.
- **Order History:** Track past orders and view order details.
- **User Profile:** Manage user information and settings.

## :hammer_and_wrench: Installation

To get started with the SoleFusion Hub Flutter app, follow these steps:

### Prerequisites

1. **Flutter**: Ensure you have Flutter installed on your system. You can download and install Flutter from [here](https://flutter.dev/docs/get-started/install).

2. **Dart**: Flutter comes with Dart, so you don't need to install it separately.

3. **Android Studio** (for Android) or **Xcode** (for iOS): Install the necessary tools for your target platform(s). Follow the official setup guides for [Android](https://flutter.dev/docs/get-started/editor?tab=androidstudio) and [iOS](https://flutter.dev/docs/get-started/editor?tab=ios).

4. **Firebase**: Set up a Firebase project and add the necessary configurations. You can follow the official guide [here](https://firebase.flutter.dev/docs/overview).

### Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/username/repository.git
   cd repository

2. **Install Dependencies**
- Navigate to the project directory and run the following command to install the necessary dependencies:
  ```bash
  flutter pub get
  
3. **Configure Firebase**

- Android:

  - Download the google-services.json file from your Firebase project and place it in the android/app directory.
  - Add the following classpath to your android/build.gradle file:
    ```bash
    classpath 'com.google.gms:google-services:4.3.3'

  - Add the following line to the end of the android/app/build.gradle file
    ```bash
    apply plugin: 'com.google.gms.google-services'
    
- iOS:

  - Download the GoogleService-Info.plist file from your Firebase project and place it in the ios/Runner directory.
  - Open the ios/Runner.xcworkspace in Xcode and drag the GoogleService-Info.plist into the project.
  - Ensure the podfile contains the following:
     ```bash
     platform :ios, '10.0'
     pod 'Firebase/Core'

4. **Run the App**

  - For Android:
    ```bash
    flutter run

   - For iOS:
     ```bash
     flutter run

Now, you should be able to run the SoleFusion Hub Flutter app on your device or emulator. For any issues or further details, refer to the official Flutter documentation or the Firebase documentation.
 ```bash
This section provides a step-by-step guide to set up and run your Flutter app, including the necessary prerequisites, cloning the repository, installing dependencies, configuring Firebase, and running the app on your target platform. If you need more specific details or further customization, let me know!

