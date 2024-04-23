enum SelectionResultMasterEnum {
  // 選考中
  inSelection(1),
  // 結果待ち
  waitResult(2),
  // 合格
  passed(3),
  // 不合格
  failure(4);

  final int value;

  const SelectionResultMasterEnum(this.value);
}
