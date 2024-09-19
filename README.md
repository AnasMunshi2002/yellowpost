# yellowpost

This  is an API   Calling application designed specifically  to interact with the jsonplaceholder API to  retrieve posts.

Architectural choice  : The application is built using a straightforward architecture , deliberately avoiding any state management approaches to keep the design simple and efficient.

Packages  utilized in this application include :
http:  This package is  essential  for making HTTP requests and handling   responses effectively.
google_fonts: This allows for the use of various Google Fonts within the application, enhancing the visual appeal.
fluttertoast: This package is used for displaying toast messages to provide feedback to users in a non-intrusive manner.
hive: A lightweight and fast key-value database that is utilized for local  storage needs.
visibility_detector : ^0.2.2  : This helps in determining whether a widget is currently visible on the screen or not , enabling optimized performance.

HOW TO RUN:
To successfully run this application, simply take the APK file and install it on any Android smartphone you have. Once installed, you can open the application directly from your phone but remember to keep the internet on.

If you are using an Android Virtual Device (AVD) , the process is slightly different. First , unzip the provided ZIP file and then open it with any Integrated Development Environment ( IDE ) of your choice.

Before proceeding , execute the following commands in your terminal to ensure everything is correctly set up:

Run the command flutter clean to remove any previous build artifacts.
Then , execute flutter pub get to fetch the necessary dependencies for the project.
Next , launch your AVD by using the command flutter emulators --launch "AVD ID" , replacing "AVD ID" with the appropriate identifier for your emulator.
Finally , run the application using the flutter run command to start the project on the AVD.
