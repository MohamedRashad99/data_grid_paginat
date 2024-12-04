import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example/cubit/cubit.dart';
import 'package:go_router_example/cubit/state.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PaginatedPlutoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PlutoGrid with Pagination')),
      body: BlocProvider(
        create: (context) => PaginationCubit(dio: Dio())..fetchPosts(1),
        child: BlocBuilder<PaginationCubit, PaginationState>(
          builder: (context, state) {
            if (state is PaginationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PaginationError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is PaginationLoaded) {
              final posts = state.posts;

              return Column(
                children: [
                  Expanded(
                    child: PlutoGrid(
                      columns: [
                        PlutoColumn(
                          title: 'ID',
                          field: 'id',
                          type: PlutoColumnType.number(),
                          readOnly: true,
                        ),
                        PlutoColumn(
                          title: 'Title',
                          field: 'title',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Body',
                          field: 'body',
                          type: PlutoColumnType.text(),
                        ),
                      ],
                      rows: posts.map((post) {
                        return PlutoRow(cells: {
                          'id': PlutoCell(value: post.id),
                          'title': PlutoCell(value: post.title),
                          'body': PlutoCell(value: post.body),
                        });
                      }).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (index) {
                      final pageNumber = index + 1;
                      return TextButton(
                        onPressed: () {
                          context
                              .read<PaginationCubit>()
                              .fetchPosts(pageNumber);
                        },
                        child: Text(
                          '$pageNumber',
                          style: TextStyle(
                            color: state.currentPage == pageNumber
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}
