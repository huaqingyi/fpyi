import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fpyi_example/config/http.dart';
import 'package:fpyi_example/libs/response.dart';

class PYIService {
  static Dio dio;
  static BuildContext $context;

  Dio get http {
    return PYIService.dio;
  }

  BuildContext get context {
    return PYIService.$context;
  }

  PYIService() {
    if (PYIService.dio == null) {
      PYIService.dio = Dio(httpConfig);

      PYIService.dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            print(options.headers);
            PYIService.dio.interceptors.requestLock.lock();
            final prefs = await SharedPreferences.getInstance();
            String token = prefs.getString('token');
            // if (token == null) {
            //   Navigator.of(context).pushNamed('/login');
            //   PYIService.dio.interceptors.requestLock.unlock();
            //   return options;
            // }
            options.headers['token'] = token;
            PYIService.dio.interceptors.requestLock.unlock();
            return options;
          },
          onResponse: (Response response) async {
            PYIResponse resp =
                PYIResponse.fromJson(jsonDecode(response.toString()));
            if (resp.code == 2) {
              return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('提示'),
                    content: SingleChildScrollView(
                      child: Text('登录失效, 请重新登录 .'),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                      )
                    ],
                  );
                },
              );
            } else if (resp.code == 0) {
              return resp;
            } else {
              resp.data = {};
              return resp;
            }
          },
        ),
      );
    }
  }
}
