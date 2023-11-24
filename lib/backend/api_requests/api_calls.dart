import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ApiCallForWeb';

/// Start Cloudpayments Group Code

class CloudpaymentsGroup {
  static PayByCardCopyCall payByCardCopyCall = PayByCardCopyCall();
  static CheckDSCopyCall checkDSCopyCall = CheckDSCopyCall();
  static RecieptCopyCall recieptCopyCall = RecieptCopyCall();
}

class PayByCardCopyCall {
  Future<ApiCallResponse> call({
    String? publicId = '',
    int? amount,
    String? cardCryptogramPacket = '',
    String? email = '',
    String? accountId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PayByCardCopyCall',
        'variables': {
          'publicId': publicId,
          'amount': amount,
          'cardCryptogramPacket': cardCryptogramPacket,
          'email': email,
          'accountId': accountId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic isSuccess(dynamic response) => getJsonField(
        response,
        r'''$.Success''',
      );
  dynamic urlForConfirm(dynamic response) => getJsonField(
        response,
        r'''$.Model.AcsUrl''',
      );
  dynamic transactionId(dynamic response) => getJsonField(
        response,
        r'''$.Model.TransactionId''',
      );
  dynamic paReq(dynamic response) => getJsonField(
        response,
        r'''$.Model.PaReq''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.Message''',
      );
  dynamic successMessage(dynamic response) => getJsonField(
        response,
        r'''$.Model.CardHolderMessage''',
      );
  dynamic accountId(dynamic response) => getJsonField(
        response,
        r'''$.Model.AccountId''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.Model.Token''',
      );
  dynamic reasonCode(dynamic response) => getJsonField(
        response,
        r'''$.Model.ReasonCode''',
      );
}

class CheckDSCopyCall {
  Future<ApiCallResponse> call({
    int? transactionId,
    String? paRes = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CheckDSCopyCall',
        'variables': {
          'transactionId': transactionId,
          'paRes': paRes,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.Model.CardHolderMessage''',
      );
  dynamic isSuccess(dynamic response) => getJsonField(
        response,
        r'''$.Success''',
      );
  dynamic accountID(dynamic response) => getJsonField(
        response,
        r'''$.Model.AccountId''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.Model.Token''',
      );
}

class RecieptCopyCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RecieptCopyCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Cloudpayments Group Code

/// Start GetResponse Group Code

class GetResponseGroup {
  static SendEmailRegisterCall sendEmailRegisterCall = SendEmailRegisterCall();
  static TransactionalemailsCall transactionalemailsCall =
      TransactionalemailsCall();
  static AddContactCall addContactCall = AddContactCall();
}

class SendEmailRegisterCall {
  Future<ApiCallResponse> call({
    String? subject = '',
    String? email = '',
    String? name = '',
    String? templateID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendEmailRegisterCall',
        'variables': {
          'subject': subject,
          'email': email,
          'name': name,
          'templateID': templateID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class TransactionalemailsCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TransactionalemailsCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AddContactCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? campaignId = '',
    String? name = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AddContactCall',
        'variables': {
          'email': email,
          'campaignId': campaignId,
          'name': name,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End GetResponse Group Code

class CertCall {
  static Future<ApiCallResponse> call({
    String? fio = '',
    String? kurs = '',
    String? date = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CertCall',
        'variables': {
          'fio': fio,
          'kurs': kurs,
          'date': date,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic link(dynamic response) => getJsonField(
        response,
        r'''$.filename''',
      );
}

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
