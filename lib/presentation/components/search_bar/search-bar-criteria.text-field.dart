import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';

class SearchBarCriteriaTextField extends StatefulWidget {
  final String hintText;
  final Color? color;
  final Function(String text) onSearch;
  final FocusNode? focusNode;
  final bool haveAdvancedSearch;
  final TextEditingController searchController;

  const SearchBarCriteriaTextField({
    super.key,
    required this.hintText,
    required this.onSearch,
    this.haveAdvancedSearch = false,
    this.focusNode,
    this.color = Style.white,
    required this.searchController,
  });

  @override
  State<SearchBarCriteriaTextField> createState() => _SearchBarCriteriaTextFieldState();
}

class _SearchBarCriteriaTextFieldState extends State<SearchBarCriteriaTextField> {
  bool isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        if (mounted) {
          setState(() {
            isSearchFocused = widget.focusNode!.hasFocus;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      //padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 55.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, style: BorderStyle.solid, color: Style.secondaryColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  controller: widget.searchController,
                  onChanged: (text) {
                    widget.onSearch(text);
                  },
                  focusNode: widget.focusNode,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                    hintText: isSearchFocused ||
                            widget.searchController.text.isNotEmpty
                        ? ""
                        : widget.hintText,
                    suffixIcon: widget.searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              widget.searchController.clear();
                             widget.onSearch("");
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Style.black,
                              size: 20,
                            ),
                          )
                        : null,
                    prefixIcon: isSearchFocused ||
                            widget.searchController.text.isNotEmpty
                        ? null
                        : const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.search,
                              color: Style.black,
                              size: 30,
                            ),
                          ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Style.secondaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            widget.haveAdvancedSearch ? InkWell(
              onTap: (){},
              child: Container(
                width: 55.0.w,
                height: 55.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Style.secondaryColor, width: 1, style: BorderStyle.solid)
                ),
                child: const Icon(
                  Icons.filter_alt_sharp,
                  color: Style.black,
                  size: 20,
                ),
              ),
            ) : SizedBox()
          ],
        ),
      ),
    );
  }
}
