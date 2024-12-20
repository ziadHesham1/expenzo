import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelsOptionsWidget extends StatefulWidget {
  final Function(String) onChanged;
  final List<String> chip;
  final String? initValue;
  const LabelsOptionsWidget({
    super.key,
    required this.chip,
    required this.onChanged,
    this.initValue,
  });

  @override
  State<LabelsOptionsWidget> createState() => _LabelsOptionsWidgetState();
}

class _LabelsOptionsWidgetState extends State<LabelsOptionsWidget> {
  String value = '';
  @override
  void initState() {
    super.initState();
    value = widget.initValue ?? widget.chip.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Label',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        Center(
          child: ChipsChoice.single(
            wrapped: true,
            // wrapCrossAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            value: widget.initValue,
            onChanged: (val) {
              setState(() {
                widget.onChanged(val);
              });
            },
            choiceItems: widget.chip
                .map(
                  (e) => C2Choice(
                    label: e,
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
