# pharmaplay_client

A new Flutter project.

## Getting Started

 "args" : [ "-d" , "chrome" , "--web-port" , "9099", "--web-renderer" ,  "html"],


This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

===============================
take the image from the user in the flutter app;

convert the image in the base64 format;
send to the backend by rest api in json format;
in the spring app convert the string into a blob data and save in the database;
when you need to read that:

retrieve the blob from the db;

convert to the string;
send to flutter;
convert to real image;
i usually face up this requirement with this approach and it works really well. i write bellow a simple function from/to blob/string that you can use

toBlob

public static Blob toBlob(String s) throws SQLException {
   if (Objects.nonNull(s)) {
      return new SerialBlob(s.getBytes(StandardCharsets.UTF_8));
   } else return null;
}
toString

public static String toString(Blob b) throws SQLException {
   if (Objects.nonNull(b)) {
     return new String(b.getBytes(1L, (int) b.length()), StandardCharsets.UTF_8);
   } else return null;
}
