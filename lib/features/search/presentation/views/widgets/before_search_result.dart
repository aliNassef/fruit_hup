import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/search_cubit/search_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class BeforeSearchResult extends StatelessWidget {
  const BeforeSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'عمليات البحث الأخيرة',
          style: AppStyles.textStyle16SB.copyWith(
            color: AppColors.gray950,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            context.read<SearchCubit>().deleteAllQueries();
          },
          child: Text(
            'حذف الكل',
            style: AppStyles.textStyle13R.copyWith(
              color: AppColors.gray400,
            ),
          ),
        ),
      ],
    );
  }
}
