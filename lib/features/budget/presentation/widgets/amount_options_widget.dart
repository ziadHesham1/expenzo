import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountOptionsWidget extends StatefulWidget {
  final Function(double) onChanged;
  final List<double> chip;
  const AmountOptionsWidget({
    super.key,
    required this.chip,
    required this.onChanged,
  });

  @override
  State<AmountOptionsWidget> createState() => _AmountOptionsWidgetState();
}

class _AmountOptionsWidgetState extends State<AmountOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Amount',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        Center(
          child: ChipsChoice.single(
            wrapped: true,
            // wrapCrossAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            value: -1,
            onChanged: (val) {
              setState(() {
                widget.onChanged(val.toDouble());
              });
            },
            choiceItems: widget.chip
                .map(
                  (e) => C2Choice(
                    label: e.toString(),
                    value: e,
                  ),
                )
                .toList(),
            choiceStyle: C2ChipStyle.filled(
              foregroundStyle: TextStyle(
                fontSize: 12.sp,
              ),
              selectedStyle: C2ChipStyle(
                foregroundStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.r),
                ),
                height: 40.h,
                backgroundColor: Colors.green,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              height: 35.h,
            ),
          ),
        ),
      ],
    );
  }
}
