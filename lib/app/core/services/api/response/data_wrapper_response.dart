import 'package:equatable/equatable.dart';

class DataWrapperResponse<T> extends Equatable {
  final bool? success;
  final T? result;
  const DataWrapperResponse({this.success, this.result});

  @override
  List<Object?> get props => [
        success,
        result,
      ];

  factory DataWrapperResponse.fromJson(dynamic json, int? statusCode) {
    return DataWrapperResponse<T>(
      success: statusCode == 200 || statusCode == 201,
      result: _getDataToJson<T>(json),
    );
  }

  // Fazendo esse tratamento pela inconcistencia das repostas da API
  static T? _getDataToJson<T>(dynamic json) {
    switch (json.runtimeType) {
      case String:
        return json;
      default:
        return getValuesJson(json);
    }
  }

  // fazendo isso pela inconcistencia das respostas da API
  static dynamic getValuesJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      return json['data'];
    } else {
      return json;
    }
  }
}
