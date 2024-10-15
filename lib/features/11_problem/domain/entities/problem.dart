import 'package:equatable/equatable.dart';

class ProblemEntity extends Equatable {
  final String? failureClassName;
  final String? failureClassCode;
  final String? failureClassId;
  final String? problemName;
  final String? problemCode;
  final String? problemDescription;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final String? createdDate;

  const ProblemEntity({
    this.failureClassName,
    this.failureClassCode,
    this.failureClassId,
    this.problemName,
    this.problemCode,
    this.problemDescription,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        failureClassName,
        failureClassCode,
        failureClassId,
        problemName,
        problemCode,
        problemDescription,
        id,
        isActive,
        isDeleted,
        createdDate,
      ];
}
