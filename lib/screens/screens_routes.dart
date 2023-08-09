// in this file I have exported all the different screens so that so that it is easier to import them somewhere else

//The screens_routes.dart file appears to be an additional file used to organize the code related to the different screens or pages of the app.

//In this file, the different screen classes (HomeScreen, DiscoverScreen, and ArticleScreen) are exported, which makes them available to be imported and used in other files of the app.

//Exporting these screen classes from a separate file can help to modularize the code and make it more organized.

//For example, if there are multiple screens or pages in an app, having a separate file to export all the screen classes can make it easier to manage and update those screens without having to search through the main app file.

//Additionally, it can be helpful to separate the screen classes into their own file to make it easier to work on specific screens without being overwhelmed by the rest of the code in the main app file.

//Overall, the screens_routes.dart file serves to organize and modularize the code related to the app's different screens or pages, making it easier to manage and maintain the app over time.

//If you don't use a screens_routes.dart file to organize and export the screen classes used in the app, you might end up with a larger and more difficult to manage codebase.
//
// In the absence of a separate file, you would need to import each screen class directly into the main app file. This could make the main app file longer and harder to navigate, especially if there are many screen classes in the app.
//
// Additionally, if you have multiple files that need to use the same screen classes, you would need to import those classes in each file. This can lead to code duplication and make it harder to keep track of which files are using which screen classes.
//
// Using a separate screens_routes.dart file to export the screen classes can help to mitigate these issues by centralizing the screen classes in one file and making them easier to import and use throughout the app.
//
// In summary, not using a screens_routes.dart file won't necessarily cause problems, but it could make the codebase harder to manage over time. Organizing screen classes into a separate file can make the codebase easier to navigate and reduce code duplication.

/// CONCLUSION: > instead of importing all the screens for each route in main screen we export all those screens here in an independent file and then just simply import this independent file into main screen.
///                Thus it works as if all the screens have been imported to main.dart

export 'article_screen.dart';
export 'discover_screen.dart';
export 'home_screen.dart';