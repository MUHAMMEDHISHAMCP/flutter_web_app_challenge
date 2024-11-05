# flutter_challenge

Flutter Web Application

Overview:

This web application provides a user-friendly interface for viewing and interacting with various events. Users can explore event details, RSVP by entering their name and email, and see a list of attendees.


Features:

> Clean and modern UI for listing expenses and displaying other details.

> Uses `flutter_bloc` for state management.

> Uses `http` for API calls.

> Uses `intl` for formatting dates, times.

> Uses `responsive_framework` for  build responsive e web interfaces.



Getting Started
Prerequisites:

Flutter SDK: Install Flutter
Dart SDK: Included with Flutter

Installation

Clone the repository:
git clone https://github.com/MUHAMMEDHISHAMCP/flutter_web_app_challenge.git

cd flutter_web_app_task


Install dependencies:
flutter pub get

Run the app:
flutter run

Project Structure:

> lib/bloc: State management, listeners, and data loading.

> lib/models: Data models.

> lib/screens: All screens, views, and modals.

> lib/services: API services.

> lib/utils: Helper code, constants, extensions.

> lib/widgets: All UI components.

> lib/main.dart: Application entry point.


dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  responsive_framework: ^1.5.1
  http: ^1.2.2
  flutter_bloc: ^8.1.6
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter


Key Features:

> `Event List` : Display a list of events with titles, dates, and short descriptions.
Each event is clickable, leading to a detailed event page.

> `Event Detail Page` : Shows comprehensive details about the selected event, including:
Title
Description
Date and time
Input fields for users to RSVP, capturing their name and email.

> `RSVP Functionality` : Validate user inputs for name and email.
Submit RSVP details using a state management solution (e.g., BLoC).
Show a success message upon successful RSVP submission or an error message in case of failure.

> `Attendees List` : Display a dynamic list of attendees for each event.


Additional Features:

Page Transition and Animation
Smooth page transitions and animations to enhance user experience


Submission:

The complete source code is available in this public GitHub repository. Follow the instructions in this README to set up and run the project. The project is well-structured and follows best practices in Flutter development.
