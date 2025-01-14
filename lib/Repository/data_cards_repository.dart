import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_wallet/Models/card_model.dart';

class DataCardsRepository{
  final FlutterSecureStorage storage;

  DataCardsRepository({required this.storage});

  Future<void> create(CardModel card) async {
    card.id = await generateId();
    final jsonData = card.toJson();
    await storage.write(key: '${jsonData['id']}', value: jsonEncode(jsonData));
  }

  Future<CardModel?> read(int? id) async{
    final cardData = await storage.read(key: id.toString());
    if(cardData == null){
      return null;
    }
    return CardModel.fromJson(jsonDecode(cardData));
  }

  Future<List<CardModel>> readAll() async {
    final allKeys = await storage.readAll();
    return allKeys.values
        .map((value) => CardModel.fromJson(jsonDecode(value)))
        .toList();
  }

  Future<void> update(CardModel newCard) async{
    if(read(newCard.id) == null){
      throw Exception("Card inexistente: ${newCard.id}");
    }
    final jsonData = newCard.toJson();
    await storage.write(key: '${jsonData['id']}', value: jsonEncode(jsonData));
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