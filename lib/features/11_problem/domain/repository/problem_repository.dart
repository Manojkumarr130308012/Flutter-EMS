import 'package:oriens_eam/features/11_problem/domain/entities/problem.dart';

import '../../../../core/resources/data_state.dart';

abstract class ProblemRepository {
  // API methods
  Future<DataState<List<ProblemEntity>>> getProblems(String failureClassId);

  // // Database methods
  // Future<List<ProblemEntity>> getSavedArticles();
  //
  // Future<void> saveArticle(ProblemEntity article);
  //
  // Future<void> removeArticle(ProblemEntity article);
}
