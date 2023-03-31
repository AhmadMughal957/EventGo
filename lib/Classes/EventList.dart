import 'package:eventgo/Classes/caatalogmodel.dart';
import 'package:flutter/cupertino.dart';

class EventList extends ChangeNotifier{
  List items=[];
  void add(Catalogmodel item){
    items.add(item);
  }

}