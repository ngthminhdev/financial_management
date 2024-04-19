import 'package:auto_size_text/auto_size_text.dart';
import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';

class AdviceWidget extends StatefulWidget {
  const AdviceWidget({super.key});

  @override
  State<AdviceWidget> createState() => _AdviceWidgetState();
}

class _AdviceWidgetState extends State<AdviceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.115,
      ),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: appColors.purple,
          width: 1,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: AutoSizeText(
          '“Những đồng tiền giống như những nô lệ – nếu không theo dõi, chúng sẽ đi khỏi”',
          maxLines: 3,
          minFontSize: 14,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
