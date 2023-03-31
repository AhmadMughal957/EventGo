import 'package:flutter/material.dart';
class Catalogmodel{
  var fees;
  List images;
  var name;
  var date;
  var time;
  var address;
  var type;
  var desc;

  Catalogmodel({required this.fees,required this.images,required this.desc,required this.type,required this.date,required this.time,required this.name,required this.address});

  Map<String, dynamic> toJson()=>{
    'fees':fees,
    'images':images,
    'desc':desc,
    'date':date,
    'time':time,
    'address':address,
    'name':name,
    'type':type,
  };
  static Catalogmodel fromJson(Map<String, dynamic> json)=>Catalogmodel(
      fees:json['fees'],
      desc:json['desc'],
      images:json['images'],
      date: json['date'],
      time: json['time'],
      name: json['name'],
      address:json['address'],
      type:json['type']
  );
}
