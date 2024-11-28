import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/widgits/custom_error_widget.dart';
import 'package:my_bookly/core/widgits/custom_loading_indcator.dart';
import 'package:my_bookly/features/home/presentation/manger/newest_books/newest_books_cubit.dart';

import 'book_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10.0),
                  child: BookListViewItem(bookModel: state.books[index],),
                );
              });
        }
        else if(state is NewestBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage,);
        }
        else
          {
            return const CustomLoadingIndicator();
          }
      },
    );
  }
}
