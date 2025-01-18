import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_wallet/Models/card_model.dart';
import 'package:my_wallet/Models/topic_model.dart';
import 'package:my_wallet/Repository/data_cards_repository.dart';
import 'package:my_wallet/Widgets/card_widget.dart';

class Controller {

  late DataCardsRepository cardsRepository;

  Controller(){
    cardsRepository = DataCardsRepository(storage: FlutterSecureStorage()); // AJEITAR!!
  }

  Future<List<Widget>> getAllCards() async {
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
      return CardWidget(cardModel: cardModel);
    }).toList();

    
  }

  void createCard(String title){
    cardsRepository.create(title);
  }

  Future<CardModel> getCard(int? id){
    try{
      return cardsRepository.read(id);
    }
    catch(e){
      throw Exception(e.runtimeType);
    }
    
  }

  Future<void> addTopicToCard(String topicName, String content, int id) async{
    
    if(topicName.isEmpty){
      throw Exception("Nome do tópico não pode ser nulo");
    }
    if(content.isEmpty){
      throw Exception("Conteúdo do tópico não pode ser nulo");
    }
    try{
      CardModel card = await cardsRepository.read(id);
      card.addTopic(TopicModel(name: topicName, content: content));
      cardsRepository.update(card);
    }catch(e){
      print("TRATAR!!!!!!");
    }
  }

}