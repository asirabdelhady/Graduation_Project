import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/tAttraction_model.dart';



class TourDatabase {
  static final TourDatabase instance = TourDatabase._init();

  static Database? _database;
  TourDatabase._init();

  Future<Database?> get database async{
    if(_database!= null) return _database;

    _database = await _initDB('tour.db');
    return _database!;

  }
  Future<Database> _initDB(String filePath)async {

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version)async{
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    final floatType= 'FLOAT';
    await db.execute('''
    CREATE TABLE $tAttractionsTable (
    ${TAttractionFields.id}$idType,
    ${TAttractionFields.name}$textType,
    ${TAttractionFields.latitude}$textType,
    ${TAttractionFields.longitude}$textType,
    ${TAttractionFields.distance}$floatType,
    ${TAttractionFields.imagePath}$textType,
    ${TAttractionFields.rating}$floatType,
    ${TAttractionFields.location}$textType,
    ${TAttractionFields.description} $textType,
    )
    ''');
  }

  Future<TAttractions> create(TAttractions tAttractions) async {
    final db = await instance.database;
    final id = await db!.insert(tAttractionsTable, tAttractions.toJson());
    return tAttractions.copy(id: id);
  }

  Future<TAttractions> readTAttraction(int id)async{
    final db = await instance.database;

    final maps = await db!.query(
        tAttractionsTable,
      columns:TAttractionFields.values,
      where: '${TAttractionFields.id}= ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty){
      return TAttractions.fromJson(maps.first);
    }else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<TAttractions>> readAllTAttractions()async{
    final db = await instance.database;

    final result = await db!.query(tAttractionsTable);

    return result.map((json)=> TAttractions.fromJson(json)).toList();
  }

  Future<int> update(TAttractions tAttractions)async{
    final db = await instance.database;

    return db!.update(
      tAttractionsTable,
      tAttractions.toJson(),
      where: '${TAttractionFields.id}= ?',
      whereArgs: [tAttractions.id]

    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tAttractionsTable,
      where: '${TAttractionFields.id}= ?',
      whereArgs: [id],
    );
  }

  Future close()async{
    final db = await instance.database;
    db!.close();
  }
}