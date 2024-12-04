import 'package:go_router_example/model.dart';

abstract class PaginationState {}

class PaginationInitial extends PaginationState {}

class PaginationLoading extends PaginationState {}

class PaginationLoaded extends PaginationState {
  final List<PostModel> posts;
  final int currentPage;

  PaginationLoaded({
    required this.posts,
    required this.currentPage,
  });
}

class PaginationError extends PaginationState {
  final String errorMessage;

  PaginationError({required this.errorMessage});
}
