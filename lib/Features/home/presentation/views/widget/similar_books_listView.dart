import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widget/custom_book_item.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(imageUrl: 'assets/images/book.jpg'),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
