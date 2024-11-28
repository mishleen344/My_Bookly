

import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/similar_book_list_view.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBookListView(),

      ],
    );
  }
}
