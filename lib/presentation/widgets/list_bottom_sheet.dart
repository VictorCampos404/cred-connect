import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/core/utils/app_router.dart';
import 'package:cred_connect/presentation/widgets/custom_check_box.dart';
import 'package:cred_connect/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class BottomSheetItem {
  String text;
  dynamic id;
  bool isCheck;

  BottomSheetItem({
    required this.id,
    required this.text,
    required this.isCheck,
  });
}

class ListBottomSheet {
  static void show({
    required BuildContext context,
    required String title,
    required List<BottomSheetItem> items,
    bool isDismissible = true,
    required Function(dynamic id) onSelect,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
          ),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Spaces.x2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.medium.copyWith(fontSize: 20),
                      ),
                    ),
                    if (isDismissible)
                      CustomIconButton(
                        onTap: () {
                          AppRouter.pop();
                        },
                        icon: CustomIcons.close_fill,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: _ListBottomSheetBody(
                  title: title,
                  items: items,
                  onSelect: onSelect,
                  isDismissible: isDismissible,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ListBottomSheetBody extends StatefulWidget {
  final String title;
  final List<BottomSheetItem> items;
  final bool? isDismissible;
  final Function(dynamic id) onSelect;
  const _ListBottomSheetBody({
    required this.title,
    required this.items,
    this.isDismissible,
    required this.onSelect,
  });

  @override
  State<_ListBottomSheetBody> createState() => __ListBottomSheetBodyState();
}

class __ListBottomSheetBodyState extends State<_ListBottomSheetBody> {
  void setCheck(index) {
    for (int i = 0; i < widget.items.length; i++) {
      widget.items[i].isCheck = false;
    }
    setState(() {
      widget.items[index].isCheck = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(
          left: Spaces.x2,
          right: Spaces.x2,
          top: Spaces.x2,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < widget.items.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: Spaces.x2),
                  child: Material(
                    color: AppColors.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: AppColors.buttonBorder, width: 1),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        setCheck(i);
                        widget.onSelect(widget.items[i].id);
                        AppRouter.pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(Spaces.x2),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: Spaces.x2),
                              child: CustomCheckBox(
                                isCheck: widget.items[i].isCheck,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.items[i].text,
                                style: AppTextStyles.normal.copyWith(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
