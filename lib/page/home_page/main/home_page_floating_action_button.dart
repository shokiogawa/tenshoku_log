import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/db/model/selection_company_model/selection_company_model.dart';
import 'package:tanshoku_log/feature/selection_compony/repository/selection_company_repository.dart';
import 'package:tanshoku_log/widgets/custom_button.dart';
import 'package:tanshoku_log/widgets/custom_date_form.dart';
import 'package:tanshoku_log/widgets/drop_down_status_list.dart';
import '../../../feature/selection_compony/usecase/query/fetch_selection_company_list/fetch_selection_company_list_provider.dart';
import '../../../widgets/custome_text_form.dart';

class HomePageFloatingActionButton extends HookConsumerWidget {
  const HomePageFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(selectionCompanyRepositoryProvider);
    return FloatingActionButton(onPressed: () {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return const AddSelectionCompanyModal();
          });
    });
  }
}

class AddSelectionCompanyModal extends HookConsumerWidget {
  const AddSelectionCompanyModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyNameController = useTextEditingController();
    final memoController = useTextEditingController();
    final urlController = useTextEditingController();
    late DateTime? selectedDateTime = DateTime.now();
    late int statusValue = 1;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "選考中企業を追加する",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              // 会社名
              CustomTextForm(
                controller: companyNameController,
                label: "会社名",
              ),
              const SizedBox(height: 15),

              // メモ
              CustomTextForm(
                controller: memoController,
                label: "メモ",
              ),
              const SizedBox(height: 15),

              // URL
              CustomTextForm(
                controller: urlController,
                label: "URL",
              ),
              const SizedBox(height: 15),

              // ドロップダウンリスト
              DropDownStatusList(
                label: "次回選考",
                onChanged: (int? value) {
                  statusValue = value ?? 1;
                },
                type: DropDownType.formField,
              ),

              const SizedBox(height: 15),
              // 日付
              CustomDateFom(
                  label: "次回選考日",
                  onSelected: (DateTime value) {
                    selectedDateTime = value;
                  }),



              const SizedBox(height: 50),
              // 追加する
              CustomButton(
                text: "追加する",
                buttonColor: Theme.of(context).primaryColor,
                onPressed: () async {
                  final data = SelectionCompanyModel(
                      name: companyNameController.text,
                      memo: memoController.text,
                      url: urlController.text,
                      nextScheduledDate: selectedDateTime,
                      selectionResultMasterId: 1,
                      selectionStatusMasterId: statusValue,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now());
                  await ref
                      .read(selectionCompanyRepositoryProvider)
                      .add(data)
                      .then((value) => print('成功したました。'));
                  ref.invalidate(futureFetchSelectionCompanyListProvider);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
