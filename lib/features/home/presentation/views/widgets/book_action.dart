
import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/functions/launch_url.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/widgits/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  8.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ), text: 'Free',
              )),
          Expanded(
              child: CustomButton(
                onPressed: (){
                 launchCustomUrl(context, bookModel.volumeInfo.previewLink);
                },
                fontSize: 16,
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ), text: getText(bookModel),
              )),
        ],
      ),
    );
  }

String  getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null)
      {
        return "Not Available";
      }
    else
      {
        return 'Free Preview';
      }
}
}
