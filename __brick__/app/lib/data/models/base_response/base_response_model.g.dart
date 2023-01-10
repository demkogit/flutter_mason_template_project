// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseRepository _$BaseResponseRepositoryFromJson(
        Map<String, dynamic> json) =>
    BaseResponseRepository(
      results: json['results'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseRepositoryToJson(
        BaseResponseRepository instance) =>
    <String, dynamic>{
      'results': instance.results,
      'message': instance.message,
    };
