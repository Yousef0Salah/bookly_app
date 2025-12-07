import 'package:bookly/Features/Splash/presentation/views/spalsh_view.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SpalshView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kBookDetails,builder: (context, state) => const BookDetailsView(),)
    ],
  );
}
