import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/core/services/api/response/data_wrapper_response.dart';
import 'package:pokedex_app/app/core/services/api_service.dart';
import 'package:pokedex_app/app/features/home/data/models/asset_model.dart';
import 'package:pokedex_app/app/features/home/data/models/get_assets_list_request.dart';
import 'package:pokedex_app/app/features/home/domain/datasources/asset_variation_remote_data_source.dart';
import 'package:pokedex_app/app/features/home/domain/entities/asset_entity.dart';

class AssetVariationRemoteDataSourceImpl
    extends AssetVariationRemoteDataSource {
  final ApiService _apiService;

  AssetVariationRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<AssetEntity>> getAssetsList(
    GetAssetsListRequest request,
  ) async {
    return remoteDataSourceExceptionHandlerScope(
      () async {
        final response =
            await _apiService.getDataFrom('/finance/chart/${request.code}.SA');

        final data = DataWrapperResponse.fromJson(
          response.data['chart']["result"][0],
          response.statusCode,
        );

        return _getAssetsListFromJson(
          data.result,
          request.limitAssets,
        );
      },
    );
  }

  List<AssetEntity> _getAssetsListFromJson(dynamic json, int limitOfAssets) {
    final List<AssetEntity> list = [];

    for (var i = 0; i < limitOfAssets; i++) {
      list.add(AssetModel.fromJson(json, i));
    }
    return list;
  }
}



// ================= AVISO ==================== //
//    Eu tentei fazer por Dia como voces pediram porem a 
//    API pela minha conversão (Que pode estar errada, mas nao consegui identicar se foi problema dela, 
//    ou se la retorna somente do dia 13)
//    só vinha do dia 13 entao para que aparecesse mais
//    itens eu mative os 30 primeiro da list.
//    Mas a lógica esta comentada aqui.

// ================= AVISO ==================== //

// List<AssetEntity> _getAssetsListFromJson(dynamic json, int limitOfAssets) {
//     final List<AssetEntity> list = [];

//     for (var i = 0; i < json['timestamp'].length; i++) {
//       print(i);
//       if (list.length == limitOfAssets) break;
//       if (list.isNotEmpty) {
//         final DateTime newDate =
//             (json['timestamp'][i] as int).dateTimeFromTimeStamp;
//         print(
//           'day ${newDate.day}',
//         );

//         if (!isSameDay(list.last.date, newDate)) {
//           list.add(AssetModel.fromJson(json, i));
//         }
//       } else {
//         list.add(AssetModel.fromJson(json, i));
//       }
//     }
//     return list;
//   }

//   bool isSameDay(DateTime previous, DateTime newDate) =>
//       previous.day == newDate.day &&
//       previous.month == newDate.month &&
//       previous.year == newDate.year;
// }
