import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../view_model/search_cubit/search_cubit.dart';

class SearchItemListTile extends StatelessWidget {
  const SearchItemListTile({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SearchCubit>().search.text = title;
      },
      child: ListTile(
        title: Text(
          title,
          style: AppStyles.textStyle16R.copyWith(
            color: AppColors.gray950,
          ),
        ),
        leading: Icon(
          Icons.watch_later_outlined,
          color: AppColors.gray400,
        ),
        trailing: InkWell(
          onTap: () {
            context.read<SearchCubit>().deleteSpecificQuery(index: index);
          },
          child: Icon(
            Icons.clear,
            color: AppColors.gray950,
            weight: 1.5,
          ),
        ),
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }
}
