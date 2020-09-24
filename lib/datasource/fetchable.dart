import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test_assignment/datasource/async.dart';
import 'package:http/http.dart' as http;

abstract class FetchDataSource extends AsyncData {
  int _fetchCounter = 0;
  bool hasError = false;
  Map<String, dynamic> errorData;
  bool needsAuthentication = false;

  @mustCallSuper
  void resetData() {
    super.resetData();
    hasError = false;
    errorData = null;
    needsAuthentication = false;
  }

  Future<http.Response> executeRequest(
    String Url, {
    String method = 'get',
    Map<String, dynamic> data,
    Map<String, dynamic> headers,
  }) async {
    isLoading = true;
    _fetchCounter += 1;

    print("Executing request: ${method.toUpperCase()} $Url/$_fetchCounter");

    http.Response response;
    Exception exception;
    try {
      if (method == 'put') {
        response = await http.put(Url,
            headers: headers, body: json.encode(data).toString());
      } else if (method == 'post') {
        response = await http.post(Url, body: data);
      } else if (method == 'delete') {
        response = await http.delete(Url, headers: headers);
      } else {
        response = await http.get(Url);
      }
    } catch (exp) {
      exception = exp;
      print(exp);
    }

    if (response != null) {
      needsAuthentication = response.statusCode == 401;
      hasError = !(response.statusCode >= 200 && response.statusCode <= 299);
      if (hasError) {
        try {
          errorData = json.decode(response.body);
        } catch (e) {
          errorData = null;
        }
      } else {
        errorData = null;
      }
    }

    if (exception != null) {
      needsAuthentication = false;
      hasError = true;
      errorData = new Map();
      errorData['errMsg'] = exception.toString();
    }

    _fetchCounter--; // one api success, decrease the counter.
    return response;
  }

  Future<http.Response> fetchPost(String endpointUrl) async {
    return executeRequest(endpointUrl, method: 'get');
  }

  Future<http.Response> postUser(String endpointUrl,
      {Map<String, dynamic> data}) async {
    return executeRequest(endpointUrl, method: 'post', data: data);
  }

  Future<http.Response> putUser(String endpointUrl,
      {Map<String, dynamic> data}) async {
    return executeRequest(endpointUrl, method: 'put', data: data);
  }

  Future<http.Response> deleteUser(
    String endpointUrl,
    Map<String, String> headers,
  ) async {
    return executeRequest(
      endpointUrl,
      method: 'delete',
      headers: headers,
    );
  }
}
