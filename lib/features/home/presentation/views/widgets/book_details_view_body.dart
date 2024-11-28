import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/similar_book_section.dart';

import '../../../data/models/book_model/book_model.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(slivers: [SliverFillRemaining(
      hasScrollBody: false,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(bookModel: bookModel,),
              const Expanded(
                child: SizedBox(
                  height: 40,
                ),
              ),
              const  SimilarBookSection(),
              const    SizedBox(
                height: 20,
              ),
            ],
          ),
        )
    )],);
  }
}