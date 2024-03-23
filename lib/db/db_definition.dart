import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbDefinition{
  final tableName = 'tenshoku_log.db';
  Future<void> migration()async{
    final path = await getDatabasesPath();
    final joinPath = join(path, tableName);
    // マイグレーション
    await openDatabase(
        joinPath,
        version: 1,
      onCreate: (newDb, version)async{
          await newDb.execute('''
          -- 選考会社テーブル
          CREATE TABLE selection_companies(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
           memo TEXT,
           url TEXT,
           next_scheduled_date TEXT,
           agent_id INTEGER,
           selection_status_master_id INTEGER
           foreign key (agent_id) references agents(id)
          );
          
          -- 選考合否マスタテーブル
          CREATE TABLE selection_result_masters(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
          );
          
          -- 選考ステータスマスタテーブル
          CREATE TABLE selection_status_masters(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
          );
          
          -- エージェントテーブル
          CREATE TABLE agents(
           id INTEGER PRIMARY KEY,
           name TEXT NOT NULL,
           memo TEXT,
           url TEXT
          );
          
          -- メモテーブル
          CREATE TABLE memos(
           id INTEGER PRIMARY KEY,
           content TEXT NOT NULL,
          );
          
          -- 選考合否マスタ初期値登録
          INSERT INTO selection_result_masters(name) VALUES('選考中');
          INSERT INTO selection_result_masters(name) VALUES('結果待ち');
          INSERT INTO selection_result_masters(name) VALUES('合格');
          INSERT INTO selection_result_masters(name) VALUES('お見送り');
          
          -- 選考ステータスマスタ初期値登録
          INSERT INTO selection_status_masters(name) VALUES('書類選考');
          INSERT INTO selection_status_masters(name) VALUES('1次面接');
          INSERT INTO selection_status_masters(name) VALUES('2次面接');
          INSERT INTO selection_status_masters(name) VALUES('3次面接');
          INSERT INTO selection_status_masters(name) VALUES('最終面接');
          INSERT INTO selection_status_masters(name) VALUES('採用');
          INSERT INTO selection_status_masters(name) VALUES('お見送り');
          ''');
      },
        // version up時に呼ばれるメソッド
      onUpgrade:(newDB, oldVersion, newVersion){},
      // version down時に呼ばれるメソッド
      onDowngrade: (newDB, oldVersion, newVersion){},
    );
  }
}