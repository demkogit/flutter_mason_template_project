// ignore_for_file: depend_on_referenced_packages

import 'package:{{app_name}}/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  final String name;

  final String url;

  PersonModel({
    required this.name,
    required this.url,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$PersonModelFromJson(json);
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw ResponseParseException('PersonModel: $e');
    }
  }
}
