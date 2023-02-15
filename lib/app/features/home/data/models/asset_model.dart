import 'package:pokedex_app/app/core/extension/number_ext.dart';
import 'package:pokedex_app/app/features/home/domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel(
      {required super.value, required super.date, required super.index});

  factory AssetModel.fromJson(dynamic json, int index) => AssetModel(
      value: (json['indicators']['quote'][0]['open'][index] as double)
          .roundDouble(2),
      date: (json['timestamp'][index] as int).dateTimeFromTimeStamp,
      index: index);
}
