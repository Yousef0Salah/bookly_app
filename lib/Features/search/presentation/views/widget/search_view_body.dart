import 'package:bookly/Features/home/presentation/manager/search_book/search_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:bookly/Features/search/presentation/views/widget/custom_search_text_field.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/core/widget/custom_loading_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFiield(),
          const SizedBox(height: 16),
          Text(
            'Search Result',
            style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
          ),
          const SizedBox(height: 16),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              if (state.books.length == 0) {
                return Center(
                  child: Text('Not Found', style: Styles.textStyle30),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(bookModel: state.books[index]),
                );
              }
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchLoading) {
          return CustomLoadingIndicator();
        } else {
          return Center(
            child: Text('Start Search  ', style: Styles.textStyle30),
          );
        }
      },
    );
  }
}
