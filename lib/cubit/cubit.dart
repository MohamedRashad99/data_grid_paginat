import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:go_router_example/cubit/state.dart';
import 'package:go_router_example/model.dart';

class PaginationCubit extends Cubit<PaginationState> {
  final Dio dio;
  final int pageSize;

  PaginationCubit({required this.dio, this.pageSize = 10})
      : super(PaginationInitial());

  Future<void> fetchPosts(int page) async {
    emit(PaginationLoading());
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        queryParameters: {
          '_page': page,
          '_limit': pageSize,
        },
      );

      if (response.statusCode == 200) {
        final List<PostModel> posts = (response.data as List)
            .map((item) => PostModel.fromJson(item))
            .toList();

        emit(PaginationLoaded(posts: posts, currentPage: page));
      } else {
        emit(PaginationError(errorMessage: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(PaginationError(errorMessage: e.toString()));
    }
  }
}
