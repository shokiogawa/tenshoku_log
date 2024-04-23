import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tanshoku_log/feature/map/usecase/search_position_provider.dart';
import 'package:tanshoku_log/feature/selection_compony/usecase/selection_company_usecase.dart';
import 'package:tanshoku_log/urility/loading_provider.dart';
import 'package:tanshoku_log/widgets/custom_button.dart';
import 'package:tanshoku_log/widgets/drop_down_status_list.dart';
import '../../map_page/map_page.dart';
import 'card_url_area.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:intl/date_symbol_data_local.dart';

class SelectionCompanyCard extends HookConsumerWidget {
  const SelectionCompanyCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initializeDateFormatting('ja');
    final scheduledFormat = DateFormat(' M月dd日 HH:mm');
    final selectionCompany = ref.watch(selectionCompanyScopedProvider);

    final dateFormatForDayOfWeek = DateFormat.E('ja');
    final formatStrForDayOfWeek =
        dateFormatForDayOfWeek.format(selectionCompany.nextScheduledDate!);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          insetPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    // 会社名
                                    Text(selectionCompany.name ?? ""),
                                    Text(selectionCompany.memo ?? ""),
                                    Text(selectionCompany.url ?? ""),
                                    Text(selectionCompany.selectionStatusName ??
                                        ""),
                                    Text(selectionCompany.selectionResultName ??
                                        ""),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: CustomButton(
                                                text: "← 戻る",
                                                buttonColor: Colors.grey,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: CustomButton(
                                                text: "マップを見る",
                                                buttonColor: Colors.green,
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProviderScope(
                                                                  overrides: [
                                                                    selectionCompanyScopedProvider
                                                                        .overrideWithValue(
                                                                            selectionCompany)
                                                                  ],
                                                                  child:
                                                                      const GoogleMapPage())));
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomButton(
                                          text: "削除",
                                          onPressed: () {
                                            try {
                                              ref.watch(loadingNotifierProvider.notifier).show();
                                              ref
                                                  .read(
                                                      selectionCompanyUseCaseProvider
                                                          .notifier)
                                                  .delete(selectionCompany.id!);
                                              Navigator.of(context).pop();
                                            } on Exception catch (e) {
                                              print(e);
                                            } finally {
                                              ref.watch(loadingNotifierProvider.notifier).hide();
                                            }
                                          },
                                          buttonColor: Colors.red),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    });
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ProviderScope(overrides: [
                //           selectionCompanyScopedProvider
                //               .overrideWithValue(selectionCompany)
                //         ], child: const GoogleMapPage())));
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 会社名
                      Expanded(
                        flex: 4,
                        child: Text(
                          selectionCompany.name ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // ステータス
                      Expanded(
                        flex: 3,
                        child: DropDownStatusList(
                            initialValue:
                                selectionCompany.selectionStatusMasterId,
                            onChanged: (int? value) {
                              if (value != null) {
                                final newValue = selectionCompany.copyWith(
                                    selectionStatusMasterId: value);
                                ref
                                    .read(selectionCompanyUseCaseProvider
                                        .notifier)
                                    .updateInvoke(newValue);
                              }
                            },
                            type: DropDownType.normal),
                      )
                    ],
                  ),

                  const SizedBox(height: 5),

                  const SizedBox(height: 5),
                  // 次回予定
                  GestureDetector(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (value) {
                        final newValue =
                            selectionCompany.copyWith(nextScheduledDate: value);
                        ref
                            .read(selectionCompanyUseCaseProvider.notifier)
                            .updateInvoke(newValue);
                      },
                          currentTime: selectionCompany.nextScheduledDate,
                          minTime: DateTime(2010, 01, 01),
                          maxTime: DateTime(2099, 12, 31),
                          locale: picker.LocaleType.jp);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.schedule),
                        Text(
                            "${scheduledFormat.format(selectionCompany.nextScheduledDate!)} ($formatStrForDayOfWeek)"),
                        const SizedBox(width: 10),
                        const Icon(Icons.event),
                        Text("${selectionCompany.selectionStatusName}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            selectionCompany.url == null
                ? Container()
                : CardUrlArea(hpUrl: selectionCompany.url ?? "")
          ],
        ),
      ),
    );
  }
}
