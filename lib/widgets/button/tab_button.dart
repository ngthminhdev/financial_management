import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';

class FMTabButton extends StatefulWidget {
  final List<String> tabTitles;
  final Function(int)? onTabChange;

  const FMTabButton({required this.tabTitles, this.onTabChange, super.key});

  @override
  State<FMTabButton> createState() => _FMTabButtonState();
}

class _FMTabButtonState extends State<FMTabButton> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: appColors.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: List.generate(
          widget.tabTitles.length,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _index = index;
                });
                if (widget.onTabChange != null) {
                  widget.onTabChange!(index);
                }
              },
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 100,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                decoration: BoxDecoration(
                  color: _index == index ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: _index == index
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.2), // Màu và độ trong suốt của shadow
                            spreadRadius: 2, // Độ lan rộng của shadow
                            blurRadius: 5, // Độ mờ của shadow
                            offset: const Offset(
                                0, 3), // Độ dịch chuyển của shadow (x, y)
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  widget.tabTitles[index],
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      ),
    );
  }
}
