import 'package:oriens_eam/features/13_parts/asset_parts/domain/entities/asset_parts.dart';

import '../../../../../core/resources/data_state.dart';

abstract class WorkOrderRepository {
  // API Call
  Future<DataState<List<AssetPartsEntity>>> getAssetParts();
}
