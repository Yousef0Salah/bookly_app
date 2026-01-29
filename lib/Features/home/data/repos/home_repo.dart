import 'package:bookly/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchBestNewsetBooks();
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks({
    required String query,
  });
}
