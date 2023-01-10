// ignore_for_file: avoid_catches_without_on_clauses

import 'package:{{app_name}}/data/exceptions/response_parse_exception.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()

/// Модель ответа на запрос
class BaseResponseRepository {
  /// данные в ответе на запрос
  /// чаще всего бывает [Map] или [List]
  final dynamic results;

  // final Map<String, dynamic>? ubiquitous;

  /// результат выполнения запроса
  // final bool success;

  /// некое сообщение
  // ignore: comment_references
  /// обычно присутствует если [success] == false
  final String? message;

  // final int? code;

  const BaseResponseRepository({
    required this.results,
    // required this.success,
    // this.code,
    this.message,
    // this.ubiquitous,
  });

  factory BaseResponseRepository.fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());
    // if (json['success'] is! bool) {
    //   throw ResponseParseException('Ответ от сервера не содержит success');
    // }

    // if ((json['code'] as int?) == 403) {
    //   throw AccessError(json['message'] as String? ?? 'Ошибка доступа');
    // }

    // if (json['success'] == false) {
    //   throw SuccessFalse(json['message'] as String? ?? 'Произошла ошибка');
    // }

    try {
      final res = _$BaseResponseRepositoryFromJson(json);

      return res;
    } catch (e) {
      throw ResponseParseException('BaseResponseRepository: $e');
    }
  }

  Map<String, dynamic> toJson() => _$BaseResponseRepositoryToJson(this);
}
