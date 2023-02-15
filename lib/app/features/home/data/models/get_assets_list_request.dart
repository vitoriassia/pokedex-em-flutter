import 'package:equatable/equatable.dart';

class GetAssetsListRequest extends Equatable {
  final String code;
  final int limitAssets;
  const GetAssetsListRequest({
    required this.code,
    required this.limitAssets,
  });

  @override
  List<Object> get props => [code, limitAssets];
}
