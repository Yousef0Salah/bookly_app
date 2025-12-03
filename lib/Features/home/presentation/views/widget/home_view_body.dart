import 'package:bookly/Features/home/presentation/views/widget/best_seller_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:bookly/Features/home/presentation/views/widget/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widget/featured_list_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const CustomAppBar(),
              ),
              const FeaturedBooksListView(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
