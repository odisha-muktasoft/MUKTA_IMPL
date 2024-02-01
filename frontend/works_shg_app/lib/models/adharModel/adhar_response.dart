import 'package:freezed_annotation/freezed_annotation.dart';

part 'adhar_response.freezed.dart';
part 'adhar_response.g.dart';

@freezed
class AdharCardResponse with _$AdharCardResponse {
  const factory AdharCardResponse({
    @JsonKey(name: 'status')
    String? status,
    @JsonKey(name: 'txn')
    String? txn,
    
       
  }) = _AdharCardResponse;

  factory AdharCardResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AdharCardResponseFromJson(json);
}