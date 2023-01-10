import 'package:{{app_name}}/data/models/base_response/base_response_model.dart';
import 'package:{{app_name}}/domain/services/request_handler.dart';

abstract class Requster {
  static final _rh = RequestHandler();

  static Future<T> getObject<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = BaseResponseRepository.fromJson(
      (await _rh.get<Map<String, dynamic>>(
        path,
      ))
          .data!,
    );

    final obj = fromJson(response.results as Map<String, dynamic>);

    return obj;
  }

  static Future<List<T>> getListOfObjects<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = BaseResponseRepository.fromJson(
      (await _rh.get<Map<String, dynamic>>(
        path,
      ))
          .data!,
    );

    final list = (response.results as List<dynamic>)
        .map((dynamic e) => fromJson(e as Map<String, dynamic>))
        .toList();

    return list;
  }
}
