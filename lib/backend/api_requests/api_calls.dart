import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SMS OTP Group Code

class SmsOtpGroup {
  static String getBaseUrl() => 'https://apis.aligo.in/';
  static Map<String, String> headers = {};
  static PostOTPCall postOTPCall = PostOTPCall();
}

class PostOTPCall {
  Future<ApiCallResponse> call({
    String? receiver = '',
    String? msg = '',
  }) async {
    final baseUrl = SmsOtpGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Post OTP',
      apiUrl: '${baseUrl}send/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'key': "5fypoudprylezxf7jj1fsd2gb83djnyo",
        'user_id': "jucoc",
        'sender': "01079077153",
        'receiver': receiver,
        'msg': msg,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SMS OTP Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
