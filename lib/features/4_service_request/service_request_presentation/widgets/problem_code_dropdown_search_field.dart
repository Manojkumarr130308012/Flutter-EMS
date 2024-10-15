// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:oriens_eam/features/11_problem/domain/usecase/get_problem.dart';
// import 'package:oriens_eam/features/11_problem/presentation/bloc/problem_bloc.dart';
// import 'package:searchfield/searchfield.dart';
//
// import '../../../../core/dependency_injection/di_container.dart';
// import '../../../../core/utils/methods.dart';
// import '../../../11_problem/domain/repository/problem_repository.dart';
//
// class ProblemDropDownSearchField extends StatefulWidget {
//   final String fci;
//   final TextEditingController controller;
//   final GetProblemUseCase usecase;
//   final dynamic Function(SearchFieldListItem<String>) onSuggestionTap;
//   const ProblemDropDownSearchField(
//       {super.key,
//       required this.controller,
//       required this.onSuggestionTap,
//       required this.fci,
//       required this.usecase});
//
//   @override
//   State<ProblemDropDownSearchField> createState() => _ProblemDropDownSearchFieldState();
// }
//
// class _ProblemDropDownSearchFieldState extends State<ProblemDropDownSearchField> {
//   @override
//   void initState() {
//     sl<ProblemRepository>().getProblems("053d0246-5232-4d63-adf0-801a045c29ef");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     FocusNode focusNode = FocusNode();
//     return BlocProvider<ProblemBloc>(
//       create: (context) => ProblemBloc(widget.usecase, widget.fci),
//       child: BlocBuilder<ProblemBloc, ProblemState>(
//         bloc: ProblemBloc(widget.usecase, widget.fci),
//         builder: (context, state) {
//           print("fci-------- : ${widget.fci}");
//           if (state is ProblemLoading) {
//             return Stack(
//               children: [
//                 const CupertinoActivityIndicator(),
//                 SearchField(
//                   controller: widget.controller,
//                   searchInputDecoration: const InputDecoration(
//                       label: Text("Problem Name"),
//                       focusedBorder: InputBorder.none,
//                       border: InputBorder.none),
//                   suggestions: const [],
//                 ),
//               ],
//             );
//           }
//           if (state is ProblemLoaded) {
//             focusNode.addListener(() {
//               if (focusNode.hasFocus) {
//                 sl<ProblemRepository>().getProblems("053d0246-5232-4d63-adf0-801a045c29ef");
//               }
//             });
//             return SearchField(
//               focusNode: focusNode,
//               controller: widget.controller,
//               searchInputDecoration: const InputDecoration(
//                   label: Text("Problem Name"),
//                   focusedBorder: InputBorder.none,
//                   border: InputBorder.none),
//               suggestions: state.problems!
//                   .map(
//                     (e) => SearchFieldListItem(
//                       e.problemName ?? "",
//                       item: e.id,
//                       child: Text(e.problemName ?? ""),
//                     ),
//                   )
//                   .toList(),
//               onSuggestionTap: widget.onSuggestionTap,
//               validator: (x) {
//                 if (x!.isEmpty || isNotContained(state.problems!, x)) {
//                   return 'Please Enter a Valid Problem';
//                 }
//                 return null;
//               },
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////
/// Old Way
/////////////////////////////////////////////////////////////

import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/11_problem/presentation/bloc/problem_bloc.dart';
import 'package:oriens_eam/features/11_problem/presentation/bloc/problem_cubit.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../core/utils/methods.dart';

class ProblemsDropDownSearchField extends StatefulWidget {
  final TextEditingController controller;

  final dynamic Function(SearchFieldListItem<String>) onSuggestionTap;

  final String failureClassId;
  const ProblemsDropDownSearchField({
    super.key,
    required this.controller,
    required this.onSuggestionTap,
    required this.failureClassId,
  });

  @override
  State<ProblemsDropDownSearchField> createState() => _ProblemsDropDownSearchFieldState();
}

class _ProblemsDropDownSearchFieldState extends State<ProblemsDropDownSearchField> {
  final ProblemCubit _problemCubit = ProblemCubit();

  @override
  void initState() {
    _problemCubit.fetchProblems(widget.failureClassId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProblemCubit(),
      child: BlocBuilder<ProblemCubit, OldWayProblemState>(
        bloc: _problemCubit,
        builder: (context, state) {
          if (state is OldWayProblemLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is OldWayProblemLoadedState) {
            if (state.problem.isEmpty) {
              return SearchField(
                suggestions: [
                  'Problem Not Available',
                ]
                    .map(
                      (e) => SearchFieldListItem(
                        e,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            e,
                            style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                searchInputDecoration: const InputDecoration(
                  label: Text("Problem"),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(),
                ),
              );
            }
            return SearchField<String>(
              controller: widget.controller,
              textInputAction: TextInputAction.done,
              onSearchTextChanged: (query) {
                final filter = state.problem
                    .where((element) =>
                        element.problemName?.toLowerCase().contains(query.toLowerCase()) ?? false)
                    .toList();
                return filter
                    .map((e) => SearchFieldListItem<String>(e.problemName ?? "",
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(e.problemName ?? "",
                              style: TextStyle(fontSize: 24, color: Colors.red)),
                        )))
                    .toList();
              },
              searchInputDecoration: const InputDecoration(
                label: Text("Problem"),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(),
              ),
              suggestions: state.problem
                  .map(
                    (e) => SearchFieldListItem(
                      e.problemName ?? "",
                      item: e.id,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          e.problemName ?? "",
                          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onSuggestionTap: widget.onSuggestionTap,
              suggestionsDecoration: SuggestionDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 5, // blur radius
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              validator: (x) {
                final problem = state.problem.map((e) => e.problemName).toList();
                print("Problem List is : $problem");
                if (x!.isEmpty || isNotContained(problem, x)) {
                  print("Problem x is : $x");
                  return 'Please Enter a Valid Problem';
                }
                return null;
              },
            );
          }
          return SearchField(
            suggestions: [
              'Problem Not Available',
            ].map((e) => SearchFieldListItem(e, child: Text(e))).toList(),
            searchInputDecoration: const InputDecoration(
              label: Text("Problem"),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              border: OutlineInputBorder(),
            ),
          );
        },
      ),
    );
  }
}
