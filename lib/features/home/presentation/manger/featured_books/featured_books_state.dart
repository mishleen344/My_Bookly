part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}
final class FeaturedBooksLoading extends FeaturedBooksState {}
final class FeaturedBooksFailure extends FeaturedBooksState {
 final String errMessage;
   FeaturedBooksFailure(this.errMessage);
}
final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;
  FeaturedBooksSuccess(this.books);
}
