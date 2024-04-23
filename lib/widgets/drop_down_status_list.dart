import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/feature/selection_status_master/usecase/query/fetch_selection_status_master_list/fetch_selection_status_master_list_usecase.dart';

enum DropDownType { normal, formField }

class DropDownStatusList extends HookConsumerWidget {
  const DropDownStatusList(
      {super.key,
      this.label,
      required this.onChanged,
      required this.type,
      this.initialValue = 1});

  final String? label;
  final void Function(int?) onChanged;
  final int? initialValue;
  final DropDownType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = useState(initialValue);
    final asyncValue = ref.watch(futureFetchSelectionStatusMasterListProvider);
    switch (asyncValue) {
      // 正常処理
      case AsyncData(:final value):
        switch (type) {
          case DropDownType.normal:
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: DropdownButton(
                    underline: const SizedBox(),
                    icon: null,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                    value: selectedValue.value,
                    items: value
                        .map((e) => DropdownMenuItem(
                            value: e.id, child: Text(e.name ?? "")))
                        .toList(),
                    onChanged: (int? value) {
                      selectedValue.value = value ?? 0;
                      onChanged(value);
                    }),
              ),
            );
          case DropDownType.formField:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label != null ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(label!),
                ) : Container(),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder()),
                    value: selectedValue.value,
                    items: value
                        .map((e) => DropdownMenuItem(
                            value: e.id, child: Text(e.name ?? "")))
                        .toList(),
                    onChanged: (int? value) {
                      selectedValue.value = value ?? 0;
                      onChanged(value);
                    }),
              ],
            );
        }
      // エラー処理
      case AsyncError(:final error):
        return Center(child: Text('Error: $error'));
      // ローディング処理
      default:
        return const Center(child: CircularProgressIndicator());
    }
    ;
  }
}
