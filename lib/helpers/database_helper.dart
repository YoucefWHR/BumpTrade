import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {


  static final DatabaseManager _database = DatabaseManager._();


  static DatabaseManager get instance => _database;


  Completer<Database> _databaseCompleter;


  DatabaseManager._();


  Future<Database> get database async {

    if (_databaseCompleter == null) {
      
      _databaseCompleter = Completer();
  
      _openDatabase();
    }
    return _databaseCompleter.future;
  }

  Future<void> _openDatabase() async {
   
    final Directory dir = await getApplicationDocumentsDirectory();
   
    final String databasePath = join(dir.path, 'stockmarketappdatabase.db');

    final Database database = await databaseFactoryIo.openDatabase(databasePath);

    _databaseCompleter.complete(database);
  }

}
