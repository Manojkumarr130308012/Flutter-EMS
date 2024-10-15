import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/workorder.dart';

/////////////////////////////////////////////////////////////
/// ISAR LOCAL DATABASE
/////////////////////////////////////////////////////////////

class AppDatabase {
  AppDatabase._privateConstructor();
  static final AppDatabase _instance = AppDatabase._privateConstructor();
  static AppDatabase get instance => _instance;

  late Isar isarInstance;

  // init() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   if (Isar.instanceNames.isEmpty) {
  //     isarInstance = await Isar.open([WorkOrderModelSchema], directory: dir.path);
  //   }
  //   // Check if isarInstance is not null after initialization
  //   print("Database created successfully");
  // }

  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      isarInstance = await Isar.open([WorkOrderModelSchema], directory: dir.path);
    }

    return isarInstance;
  }

  insertFresh(List<WorkOrderModel> workOrders) async {
    await isarInstance.writeTxn(() async {
      await isarInstance.clear();
      for (WorkOrderModel element in workOrders) {
        await isarInstance.workOrderModels.put(element);
      }
    });
  }

  insertOneWorkOrder(WorkOrderModel workOrder) async {
    late int id;
    await isarInstance.writeTxn(() async {
      id = await isarInstance.workOrderModels.put(workOrder);
    });
    return id;
  }

  getSavedWorkOrders() async {
    IsarCollection<WorkOrderModel> workOrderCollection = isarInstance.collection<WorkOrderModel>();
    List<WorkOrderModel?> workOrders = await workOrderCollection.where().findAll();
    return workOrders;
  }

  removeSavedWorkOrder(WorkOrderModel workOrder) async {
    await isarInstance.writeTxn(() async {
      await isarInstance.workOrderModels.delete(workOrder.id);
    });
  }

  void updateSync(WorkOrderModel workOrderModel) async {
    workOrderModel.isSynced = true;
    await isarInstance.writeTxn(() async {
      await isarInstance.workOrderModels.put(workOrderModel);
    });
  }

  // getUnsyncedData() async {
  //   IsarCollection<WorkOrderModel> workOrderCollection = isarInstance.collection<WorkOrderModel>();
  //   List<WorkOrderModel?> workOrders = await workOrderCollection.filter().isSyncedEqualTo(false).findAll();
  //   return medicines;
  // }
}
