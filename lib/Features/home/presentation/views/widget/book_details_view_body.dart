import 'package:bookly/Features/home/presentation/views/widget/books_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widget/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),

                const BookDetailsSection(),
                const Expanded(child: SizedBox(height: 50)),

                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
