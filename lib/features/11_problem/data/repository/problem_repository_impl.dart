// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:oriens_eam/features/11_problem/data/data_sources/remote/problem_api_service.dart';
// import 'package:oriens_eam/features/11_problem/data/model/problem.dart';
// import 'package:oriens_eam/features/11_problem/domain/repository/problem_repository.dart';
//
// import '../../../../core/resources/data_state.dart';
//
// class ProblemRepositoryImpl implements ProblemRepository {
//   final ProblemApiService _problemApiService;
//
//   ProblemRepositoryImpl(
//     this._problemApiService,
//   );
//
//   @override
//   Future<DataState<List<ProblemModel>>> getProblems(String failureClassId) async {
//     print("Get Problems Method Called");
//     try {
//       final httpResponse =
//           await _problemApiService.getProblems("053d0246-5232-4d63-adf0-801a045c29ef");
//
//       if (httpResponse.response.statusCode == HttpStatus.ok) {
//         print(httpResponse.data.toString());
//         return DataSuccess(httpResponse.data);
//       } else {
//         return DataFailed(DioException(
//             error: httpResponse.response.statusMessage,
//             response: httpResponse.response,
//             type: DioExceptionType.badResponse,
//             requestOptions: httpResponse.response.requestOptions));
//       }
//     } on DioException catch (e) {
//       return DataFailed(e);
//     }
//   }
//
//   // @override
//   // Future<List<ArticleModel>> getSavedArticles() async {
//   //   return _appDatabase.articleDAO.getArticles();
//   // }
//   //
//   // @override
//   // Future<void> removeArticle(ArticleEntity article) {
//   //   return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
//   // }
//   //
//   // @override
//   // Future<void> saveArticle(ArticleEntity article) {
//   //   return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
//   // }
// }
