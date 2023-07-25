import 'package:dio/dio.dart';

enum DataSource {
  SUCCESS(200,"Success"),
  NO_CONTENT(201,"Success, But no content."),
  BAD_REQUEST(400,"Bad request, Try again later."),
  FORBIDDEN(403,"Forbidden, Try again later."),
  UNAUTHORISED(401,"Unauthorised, Try again later."),
  NOT_FOUND(404,"Not found, Try again later."),
  INTERNAL_SERVER_ERROR(500,"Internal server error."),
  CONNECT_TIMEOUT(-1,"connect timeout, Try again later."),
  CANCEL(-2,"Canceled, Try again later."),
  RECEIVE_TIMEOUT(-3,"Receive timeout, Try again later"),
  SEND_TIMEOUT(-4,"Send timeout, Try again later"),
  CACHE_ERROR(-5,"Cache error, Try again later"),
  NO_INTERNET(-6,"No internet, Try again later"),
  DEFAULT(-7,"Unknown error, Try again later");
  const DataSource(this.code,this.message);
  final int code;
  final String message;
}


