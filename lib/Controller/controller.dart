import 'package:my_wallet/Models/card_model.dart';
import 'package:my_wallet/Repository/data_cards_repository.dart';

class Controller {

  DataCardsRepository? cardsRepository;

  Controller({this.cardsRepository});

  Future<CardModel> getCard(int? id){
    if (cardsRepository == null){
      throw Exception("uninitialized cards repository");
    }
    try{
      final card = cardsRepository!.read(id);
      return card;
    }
    catch(e){
      print("fazer algo aqui");
      throw Exception(e.runtimeType);
    }
    
  }

}