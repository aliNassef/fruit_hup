import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class SearchItemListTile extends StatelessWidget {
  const SearchItemListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text('فراوله'),
        leading: Icon(
          Icons.watch_later_outlined,
          color: AppColors.gray400,
        ),
        trailing: Icon(
          Icons.clear,
          color: AppColors.gray950,
          weight: 1.5,
        ),
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }
}
