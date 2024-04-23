import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_app_bar.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_body.dart';
import 'package:tanshoku_log/page/home_page/main/home_page_floating_action_button.dart';
import 'package:tanshoku_log/urility/location_permission.dart';

import '../../feature/selection_compony/usecase/selection_company_usecase.dart';
import '../../urility/loading_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_date_form.dart';
import '../../widgets/custome_text_form.dart';
import '../../widgets/drop_down_status_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    checkLocationSetting();
    return Scaffold(
        floatingActionButton: const HomePageFloatingActionButton(),
        appBar: const HomePageAppBar(),
        body: const HomePageBody(),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            currentIndex.value = index;
            // 追加ボタン押下時
            if (index == 1) {
              // 登録フォーム開く
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const AddSelectionCompanyModal();
                  });
            }
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.add), label: "追加"),
            NavigationDestination(icon: Icon(Icons.add), label: "追加"),
            NavigationDestination(icon: Icon(Icons.delete), label: "削除")
          ],
          selectedIndex: currentIndex.value,
        ));
  }
}

class AddSelectionCompanyModal extends HookConsumerWidget {
  const AddSelectionCompanyModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUseCase = ref.watch(selectionCompanyUseCaseProvider);
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
              Container(child: (() {
                switch (asyncUseCase) {
                // 正常処理
                  case AsyncData(:final value):
                    return CustomButton(
                      text: "追加する",
                      buttonColor: Theme.of(context).primaryColor,
                      onPressed: () async {
                        try {
                          // ローディング開始
                          ref.watch(loadingNotifierProvider.notifier).show();
                          await ref
                              .read(selectionCompanyUseCaseProvider.notifier)
                              .addInvoke(
                              companyNameController.text,
                              memoController.text,
                              urlController.text,
                              selectedDateTime)
                              .then((value) => Navigator.of(context).pop());
                        } on Exception catch (e) {
                          print(e);
                        } finally {
                          ref.watch(loadingNotifierProvider.notifier).hide();
                        }
                      },
                    );
                // ローディング処理
                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              })())
            ],
          ),
        ),
      ),
    );
  }
}