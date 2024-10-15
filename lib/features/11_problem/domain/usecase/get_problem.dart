import 'package:oriens_eam/features/11_problem/domain/entities/problem.dart';
import 'package:oriens_eam/features/11_problem/domain/repository/problem_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class GetProblemUseCase implements UseCase<DataState<List<ProblemEntity>>, String> {
  final ProblemRepository _problemRepository;

  GetProblemUseCase(
    this._problemRepository,
  );

  @override
  Future<DataState<List<ProblemEntity>>> call({String? params}) {
    return _problemRepository.getProblems(params!);
  }
}
