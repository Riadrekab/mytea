
import 'package:flutter/cupertino.dart';

class Commande {
  String nomP;
  int quantite;
  Commande.constructor(this.nomP, this.quantite);
}
class LiCommande extends ChangeNotifier{
  List<Commande> _liCmd=[];
  List<Commande> get getLi{
    return _liCmd;
  }

  Commande itemLi(int i) {
    return _liCmd[i];
  }

  void addCmd(Commande cmd) {
    _liCmd.add(cmd);
    notifyListeners();
  }

  void del(int i) {
    _liCmd.removeAt(i);
    notifyListeners();
  }
  int len() {
    return _liCmd.length;
  }
}