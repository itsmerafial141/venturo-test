import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../core/colors/color_swatch.dart';
import '../../core/fonts/fonts.dart';
import '../../core/values/const/double_const.dart';

class BottomAppbarSearch extends StatefulWidget implements PreferredSizeWidget {
  const BottomAppbarSearch({
    super.key,
    required this.refreshController,
    required this.onSearchSubmitted,
    required this.onSearchReset,
    required this.onFilterSearchTapped,
    required this.controller,
  });

  final Function(List<RefreshController>) onSearchSubmitted;
  final Future<void> Function(List<RefreshController>) onSearchReset;
  final Function(BuildContext) onFilterSearchTapped;
  final TextEditingController controller;
  final List<RefreshController> refreshController;

  @override
  State<BottomAppbarSearch> createState() => _BottomAppbarSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _BottomAppbarSearchState extends State<BottomAppbarSearch> {
  bool isSearchEmpty = true;

  void onSearchChange(String search) {
    if (search.isEmpty) {
      isSearchEmpty = true;
    } else {
      isSearchEmpty = false;
    }
    setState(() {});
    log(isSearchEmpty.toString());
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  void initState() {
    widget.controller.addListener(() {
      onSearchChange(widget.controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (_) => widget.onSearchSubmitted(
                  widget.refreshController,
                ),
                onChanged: onSearchChange,
                controller: widget.controller,
                maxLines: 1,
                style: CustomFonts.montserratRegular12,
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isSearchEmpty || widget.controller.text.isNotEmpty)
                        MaterialButton(
                          onPressed: () async {
                            await widget
                                .onSearchReset(
                                  widget.refreshController,
                                )
                                .then((value) =>
                                    onSearchChange(widget.controller.text));
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ConstDouble.DEFAULT_BORDER_RADIUES,
                            ),
                          ),
                          minWidth: 10,
                          child: const Icon(
                            Icons.close_rounded,
                            color: CustomSwatch.TEXT,
                            size: 20,
                          ),
                        ),
                      MaterialButton(
                        onPressed: () => widget.onFilterSearchTapped(context),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ConstDouble.DEFAULT_BORDER_RADIUES,
                          ),
                        ),
                        minWidth: 10,
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: CustomSwatch.DISABLE[500],
                        ),
                      ),
                    ],
                  ),
                  isDense: false,
                  hintText: "Cari product...",
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: CustomSwatch.DISABLE[500],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
