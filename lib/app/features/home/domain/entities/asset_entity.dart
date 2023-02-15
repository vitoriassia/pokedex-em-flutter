// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/core/extension/date_time_ext.dart';

class AssetEntity extends Equatable {
  final double value;
  final DateTime date;
  final int index;
  const AssetEntity(
      {required this.value, required this.date, required this.index});

  String get dateToString => date.convertToSimpleDate;

  String get day => '(${(index + 1)})';

  @override
  List<Object> get props => [value, date];
}
