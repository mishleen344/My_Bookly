part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;
  NewestBooksFailure(this.errMessage);
}
final class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  NewestBooksSuccess(this.books);
}
