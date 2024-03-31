import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CustomDateFom extends HookConsumerWidget {
  const CustomDateFom(
      {super.key, this.label, this.onSelected, this.controller});

  final String? label;
  final ValueChanged<DateTime>? onSelected;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDatetime = useState(DateTime.now());
    final displayFormat = DateFormat('yyyy年MM月dd日');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null ? Text(label!) : Container(),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final DateTime? selectedValue = await showDatePicker(
                locale: const Locale("ja"),
                context: context,
                initialDate: selectedDatetime.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2500));
            if (selectedValue != null) {
              selectedDatetime.value = selectedValue;
              if(controller != null){
                controller!.text = selectedValue.toString();
              }
              if (onSelected != null) {
                onSelected!(selectedValue);
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(color: Colors.grey)),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  displayFormat.format(selectedDatetime.value),
                  style: const TextStyle(color: Colors.black),
                )),
          ),
        ),
      ],
    );
  }
}
