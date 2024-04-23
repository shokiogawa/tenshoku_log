import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanshoku_log/feature/selection_compony/repository/selection_company_repository.dart';
import 'package:tanshoku_log/feature/selection_compony/usecase/selection_company_usecase.dart';
import 'package:tanshoku_log/urility/loading_provider.dart';
import 'package:tanshoku_log/widgets/custom_button.dart';
import 'package:tanshoku_log/widgets/custom_date_form.dart';
import 'package:tanshoku_log/widgets/drop_down_status_list.dart';
import '../../../widgets/custome_text_form.dart';

class HomePageFloatingActionButton extends HookConsumerWidget {
  const HomePageFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(selectionCompanyRepositoryProvider);
    return FloatingActionButton(onPressed: () {

      ref.watch(fetchSelectionCompanyUseCaseProvider.notifier).search();

      // マップ開く
      // Navigator.of(context).pushNamed('/map_page');
    });
  }
}
