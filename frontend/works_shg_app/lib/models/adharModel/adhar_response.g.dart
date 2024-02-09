// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adhar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdharCardResponse _$$_AdharCardResponseFromJson(Map<String, dynamic> json) =>
    _$_AdharCardResponse(
      status: json['status'] as String?,
      txn: json['txn'] as String?,
      ret: json['ret'] as String?,
      err: json['err'] as String?,
      errMsg: json['errMsg'] as String?,
      responseCode: json['responseCode'] as String?,
      uidToken: json['uidToken'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_AdharCardResponseToJson(
        _$_AdharCardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'txn': instance.txn,
      'ret': instance.ret,
      'err': instance.err,
      'errMsg': instance.errMsg,
      'responseCode': instance.responseCode,
      'uidToken': instance.uidToken,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
    };
