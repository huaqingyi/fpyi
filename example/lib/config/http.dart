import 'package:dio/dio.dart';

BaseOptions httpConfig = BaseOptions(
  baseUrl: 'http://140.143.99.204',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  // headers: {
  //   Headers.contentLengthHeader: postData.length, // set content-length
  // },
);
