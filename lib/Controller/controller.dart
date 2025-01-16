import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_wallet/Models/card_model.dart';
import 'package:my_wallet/Models/topic_model.dart';
import 'package:my_wallet/Repository/data_cards_repository.dart';

class Controller {

  late DataCardsRepository cardsRepository;

  Controller(){
    cardsRepository = DataCardsRepository(storage: FlutterSecureStorage()); // AJEITAR!!
  }

  Future<List<Widget>> getAllCards(context) async {
    if (cardsRepository == null) {
      throw Exception("Uninitialized cards repository");
    }

    final cards = await cardsRepository.readAll();

    if (cards.isEmpty) {
      return [
        Center(
          child: Text(
            "Nenhum card disponível",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ];
    }
    
    return cards.map((cardModel) {
      return cardModel.toWidget(context);
    }).toList();

    
  }

  void createCard(CardModel cardModel){
    cardsRepository.create(cardModel);
  }

  Future<CardModel> getCard(int? id){
    if (cardsRepository == null){
      throw Exception("uninitialized cards repository");
    }
    try{
      return cardsRepository!.read(id);
    }
    catch(e){
      throw Exception(e.runtimeType);
    }
    
  }

}