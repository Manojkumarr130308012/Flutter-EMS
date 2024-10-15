// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'problem_api_service.dart';
//
// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************
//
// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers
//
// class _ProblemApiService implements ProblemApiService {
//   _ProblemApiService(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'https://demoapi.orienseam.com/api';
//   }
//
//   final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<HttpResponse<List<ProblemModel>>> getProblems(
//       String failureClassId) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio.fetch<List<dynamic>>(
//         _setStreamType<HttpResponse<List<ProblemModel>>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/problems/getall/053d0246-5232-4d63-adf0-801a045c29ef',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     var value = _result.data!
//         .map((dynamic i) => ProblemModel.fromJson(i as Map<String, dynamic>))
//         .toList();
//     final httpResponse = HttpResponse(value, _result);
//     return httpResponse;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
//
//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }
//
//     final url = Uri.parse(baseUrl);
//
//     if (url.isAbsolute) {
//       return url.toString();
//     }
//
//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }