import 'package:bookly/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures,List<BookModel>>>  fetchBestSellerBooks();
  Future<Either<Failures,List<BookModel>>>  fetchFeaturedBooks();
}
