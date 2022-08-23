import 'package:devcademy_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hideLeading;
  final bool showSearch;
  final bool showOptions;
  final bool isTransparent;

  const SearchBar({
    Key? key,
    this.title = '',
    this.hideLeading = false,
    this.showSearch = false,
    this.showOptions = false,
    this.isTransparent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: hideLeading
            ? null
            : IconButton(
                iconSize: 24,
                icon: SvgPicture.asset(Assets.icons.back,
                    color: ThemeColors.teal800),
                onPressed: () => Navigator.of(context).pop(),
              ),
        backgroundColor: isTransparent ? Colors.transparent : ThemeColors.white,
        elevation: isTransparent ? 0 : 4,
        iconTheme: IconThemeData(
          color: ThemeColors.teal800,
        ),
        title: Text(
          title,
          style:
              textTheme.headline6!.merge(TextStyle(color: ThemeColors.teal800)),
        ),
        actions: [
          if (showSearch)
            IconButton(
              iconSize: 24,
              icon: SvgPicture.asset(Assets.icons.search),
              color: ThemeColors.teal800,
              onPressed: () =>
                  router.navigateTo(context, Routes.searchFilterScreen),
            ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
