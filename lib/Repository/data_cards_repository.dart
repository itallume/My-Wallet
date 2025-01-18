import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_wallet/Models/card_model.dart';

class DataCardsRepository{
  final FlutterSecureStorage storage;

  DataCardsRepository({required this.storage});

  Future<void> create(String title) async {
    int id = await generateId();
    final jsonData = {
      'id': id,
      'title': title,
      'topics': [],
    };
    await storage.write(key: '${jsonData['id']}', value: jsonEncode(jsonData));
  }

  Future<CardModel> read(int? id) async{
    if (id == null) {
      throw Exception("ID não pode ser nulo.");
    }
    final cardData = await storage.read(key: id.toString());
    if(cardData != null){
      return CardModel.fromJson(jsonDecode(cardData));
    }
    throw Exception("Card inexistente $id");
  }

  Future<List<CardModel>> readAll() async {
    final allKeys = await storage.readAll();
    return allKeys.values
        .map((value) => CardModel.fromJson(jsonDecode(value)))
        .toList();
  }

  Future<void> update(CardModel newCard) async{
    try{
      read(newCard.id);
    }catch(e){
      throw Exception("Card inexistente: ${newCard.id}");
    }
  
    final jsonData = newCard.toJson();
    await storage.write(key: '${newCard.id}', value: jsonEncode(jsonData));
  }

  Future<void> delete(int id) async {
    try {
      await storage.delete(key: id.toString());
    } catch (e) {
      throw Exception("Card inexistente: $id");
    }
  }

  Future<int> generateId() async{
    final allData = await storage.readAll();
    final intKeys = allData.keys
          .map((key) => int.tryParse(key))
          .where((id) => id != null)
          .cast<int>();
    final maxId = intKeys.isNotEmpty ? intKeys.reduce((a, b) => a > b ? a : b) : 0; 
    return maxId + 1;
  }

}