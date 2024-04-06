import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_definition.g.dart';

@Riverpod(keepAlive: true)
Future<Database> futureDb(FutureDbRef ref) async {
  const tableName = 'tenshoku_log.db';
  final path = await getDatabasesPath();
  final joinPath = join(path, tableName);
  // マイグレーション
  final db = await openDatabase(
    joinPath,
    version: 1,
    onCreate: (newDb, version) async {
      print("マイグレーションスタート");
      print(version);
      await newDb.transaction((txn) async{
        // 選考会社テーブル
        await txn.execute('''
          CREATE TABLE selection_companies(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
           memo TEXT,
           url TEXT,
           nextScheduledDate TEXT,
           agentId INTEGER,
           selectionStatusMasterId INTEGER NOT NULL,
           selectionResultMasterId INTEGER NOT NULL,
           orderNumber INTEGER,
           createdAt TEXT NOT NULL,
           updatedAt TEXT NOT NULL,
           foreign key (agentId) references agents(id),
           foreign key (selectionStatusMasterId) references agents(id),
           foreign key (selectionResultMasterId) references agents(id)
          );
          ''');

        // 選考合否マスタテーブル
        await txn.execute('''
         CREATE TABLE selection_result_masters(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
           createdAt TEXT NOT NULL,
           updatedAt TEXT NOT NULL
         );
      ''');

        // 選考ステータスマスタテーブル
        await txn.execute('''
         CREATE TABLE selection_status_masters(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
           createdAt TEXT NOT NULL,
           updatedAt TEXT NOT NULL
         );
      ''');

        // エージェントテーブル
        await txn.execute('''
          CREATE TABLE agents(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
           memo TEXT,
           url TEXT,
           createdAt TEXT NOT NULL,
           updatedAt TEXT NOT NULL
          );
      ''');

        // 選考日テーブル
        await txn.execute('''
          CREATE TABLE selection_dates(
           id INTEGER PRIMARY KEY,
           selectionCompanyId INTEGER NOT NULL,
           selectionResultMasterId INTEGER NOT NULL,
           selectionStatusMasterId INTEGER NOT NULL,
           selectionDate TEXT NOT NULL,
           createdAt TEXT NOT NULL,
           updatedAt TEXT NOT NULL
          );
      ''');

        // メモテーブル
        await txn.execute('''
          CREATE TABLE memos(
           id INTEGER PRIMARY KEY,
           content TEXT NOT NULL,
           createdAt TEXT NOT NULL,
           updatedAt TEXT NOT NULL
          );''');

        // 選考結果マスタ初期値登録
        await txn.rawInsert('''
      INSERT INTO selection_result_masters(name,createdAt,updatedAt) VALUES
      ('選考中','2024-01-01', '2024-01-01'),
      ('結果待ち','2024-01-01', '2024-01-01'),
      ('合格','2024-01-01', '2024-01-01'),
      ('お見送り','2024-01-01', '2024-01-01');
      ''');

        // 選考ステータスマスタ初期値登録
        await txn.rawInsert('''
          INSERT INTO selection_status_masters(name,createdAt,updatedAt) VALUES
          ('カジュアル面談','2024-01-01', '2024-01-01'),
          ('書類選考','2024-01-01', '2024-01-01'),
          ('1次面接','2024-01-01', '2024-01-01'),
          ('2次面接','2024-01-01', '2024-01-01'),
          ('3次面接','2024-01-01', '2024-01-01'),
          ('最終面接','2024-01-01', '2024-01-01'),
          ('採用','2024-01-01', '2024-01-01'),
          ('お見送り','2024-01-01', '2024-01-01'),
          ('辞退','2024-01-01', '2024-01-01');
      ''');
      });
    },
    // version up時に呼ばれるメソッド
    onUpgrade: (newDB, oldVersion, newVersion) {},
    // version down時に呼ばれるメソッド
    onDowngrade: (newDB, oldVersion, newVersion) {},
  );

  return db;
}
