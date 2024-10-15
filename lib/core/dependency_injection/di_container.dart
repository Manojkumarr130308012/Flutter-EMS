import 'package:get_it/get_it.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/features/2_workorder/data/data_sources/remote/workorder_api_service.dart';
import 'package:oriens_eam/features/2_workorder/data/repositories/workorder_repository_impl.dart';
import 'package:oriens_eam/features/2_workorder/domain/repositories/workorder_repository.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/get_saved_workordrs.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/get_workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/remove_workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/save_workorder.dart';
import 'package:oriens_eam/features/2_workorder/presentation/bloc/local/local_workorder_bloc.dart';
import 'package:oriens_eam/features/2_workorder/presentation/bloc/workorder_bloc.dart';
import 'package:oriens_eam/features/3_workorder_details/1_wod_domain/workorder_status_api.dart';
import 'package:oriens_eam/features/4_service_request/service_request_domain/service_request_api.dart';
import 'package:oriens_eam/features/4_service_request/service_request_domain/service_request_repo.dart';

import '../../features/2_workorder/data/data_sources/local/database_helper.dart';
import '../../features/3_workorder_details/1_wod_domain/workorder_status_repo.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register the AppDatabase instance
  sl.registerSingleton<AppDatabase>(AppDatabase.instance);

  // Access the AppDatabase instance using GetIt
  AppDatabase appDatabase = sl.get<AppDatabase>();

  try {
    // Initialize the database
    final isarInstance = await appDatabase.init();

    if (isarInstance != null) {
      print("Database initialized successfully");
      // Now you can use 'isarInstance' for database operations
    } else {
      print("Failed to initialize the database");
    }
  } catch (e) {
    print("Error initializing database: $e");
  }
  /////////////////////////// DIO \\\\\\\\\\\\\\\\\\\\\\\\\\
  sl.registerSingleton<DioManager>(DioManager.instance);

  /////////////////////////// SERVICE REQUEST \\\\\\\\\\\\\\\\\\\\\\\\\\

  sl.registerSingleton<ServiceRequestApiService>(ServiceRequestApiService(dioManager: sl()));

  sl.registerSingleton(ServiceRequestRepo(serviceRequestApiService: sl()));

  /////////////////////////// PROBLEM \\\\\\\\\\\\\\\\\\\\\\\\\\

  // Dependencies
  // sl.registerSingleton<ProblemApiService>(ProblemApiService(sl()));

  // sl.registerSingleton<ProblemRepository>(ProblemRepositoryImpl(
  //   sl(),
  // ));
  //
  // //UseCases
  // sl.registerSingleton<GetProblemUseCase>(GetProblemUseCase(sl()));

  //Blocs
  // sl.registerFactory<String>((sl) => sl());
  // sl.registerFactory<ProblemBloc>(() => ProblemBloc(sl(), sl()));

  /////////////////////////// WORK ORDER \\\\\\\\\\\\\\\\\\\\\\\\\\

  // 1. WORK ORDER API SERVICE
  sl.registerSingleton<WorkOrderApiService>(
    WorkOrderApiService(dioManager: sl()),
  );

  // 2. WORK ORDER REPOSITORY
  sl.registerSingleton<WorkOrderRepository>(
    WorkOrderRepositoryImpl(sl(), sl()),
  );

  // 3. WORK ORDER USE CASES
  sl.registerSingleton<GetWorkOrderUsecase>(
    GetWorkOrderUsecase(
      sl(),
    ),
  );

  sl.registerSingleton<GetSavedWorkOrderUseCase>(GetSavedWorkOrderUseCase(sl()));

  sl.registerSingleton<SaveWorkOrderUseCase>(SaveWorkOrderUseCase(sl()));

  sl.registerSingleton<RemoveWorkOrderUseCase>(RemoveWorkOrderUseCase(sl()));

  // 4. WORK ORDER BLOC
  sl.registerFactory<WorkorderBloc>(
    () => WorkorderBloc(
      sl(),
    ),
  );

  sl.registerFactory<LocalWorkorderBloc>(
    () => LocalWorkorderBloc(
      sl(),
      sl(),
      sl(),
    ),
  );

  // 5. WORK ORDER STATUS SERVICE
  sl.registerSingleton<WorkOrderStatusApiService>(
    WorkOrderStatusApiService(
      dioManager: sl(),
    ),
  );
  sl.registerSingleton(
    WorkOrderStatusRepo(
      workOrderStatusApiService: sl(),
    ),
  );
}
