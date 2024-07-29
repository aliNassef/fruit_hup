import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/generated/l10n.dart';
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
          S.of(context).lastSearchInfo,
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
            S.of(context).deleteAll,
            style: AppStyles.textStyle13R.copyWith(
              color: AppColors.gray400,
            ),
          ),
        ),
      ],
    );
  }
}
