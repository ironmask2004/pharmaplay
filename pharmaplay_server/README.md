A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

This sample code handles HTTP GET requests to `/` and `/echo/<message>`

# Running the sample

## Running with the Dart SDK 

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:
```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```


 
  add to       ~/.bashrc
  export PHARMAPLAY_HOST='localhost'
  export PHARMAPLAY_PORT='9093'
  -----

  .env 

APP_NAME='PharmaPlay Server'
secretKey = '25BBD3FF-975D-4D45-8FFF-B3FA92155CFF'
dbName = 'pharmadb'
serverPort = '9093'
serverHost = 'localhost'
dbServerPort = '5432'
dbServerHost = 'localhost'
redisHost = 'localhost'
redisPort = '6379'

-----------
 SELECT md0."medicineID",
    md0.tradeName,
    md0.caliber,
    md0."formulaID",
    frm0.formula,
    md0."medicineFactoryID",
    fac0."medicineFactoryName",
    md0."chemicalNameID",
    chmn0."chemicalName",
    md0."genericNameID",
    grn0.genericName,
    md0."pharmaFormID",
    ff0."pharmaForm",
    md0."licenseNumber",
    md0."licenseDate" AS licensedate
   FROM pharmaplay.medicines000 md0
     LEFT JOIN pharmaplay.factory000 fac0 ON md0."medicineFactoryID" = fac0."medicineFactoryID"
     LEFT JOIN pharmaplay."pharmaForm000" ff0 ON md0."pharmaFormID" = ff0."pharmaFormID"
     LEFT JOIN pharmaplay.formula000 frm0 ON md0."formulaID" = frm0."formulaID"
     LEFT JOIN pharmaplay."chemicalNames000" chmn0 ON md0."chemicalNameID" = chmn0."chemicalNameID"
     LEFT JOIN pharmaplay."genericNames000" grn0 ON md0."genericNameID" = grn0."genericNameID";