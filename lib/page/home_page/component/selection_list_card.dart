import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tanshoku_log/widgets/drop_down_status_list.dart';
import '../../../feature/selection_compony/usecase/query/read_model/selection_company.dart';
import 'card_url_area.dart';

class SelectionListCard extends StatelessWidget {
  const SelectionListCard({super.key, required this.selectionCompany});

  final SelectionCompany selectionCompany;

  @override
  Widget build(BuildContext context) {
    final scheduledFormat = DateFormat(' M月dd日 h:mm');
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 会社名
                    Text(selectionCompany.name ?? "",
                        style: Theme.of(context).textTheme.titleMedium),

                    // ステータス
                    DropDownStatusList(
                        onChanged: (int? value) {}, type: DropDownType.normal)
                  ],
                ),

                const SizedBox(height: 5),

                const SizedBox(height: 5),
                // 次回予定
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    Text(scheduledFormat
                        .format(selectionCompany.nextScheduledDate!)),
                    const SizedBox(width: 10),
                    const Icon(Icons.event),
                    Text("${selectionCompany.selectionStatusName}"),
                  ],
                ),
              ],
            ),
            const Divider(),
            selectionCompany.url == null
                ? Container()
                : CardUrlArea(hpUrl: selectionCompany.url!)
          ],
        ),
      ),
    );
  }
}
