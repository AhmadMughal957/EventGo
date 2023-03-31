import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventgo/Classes/caatalogmodel.dart';
import 'package:eventgo/EventDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var images;
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()
      ..init(context);
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Live Events',
        style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height:scaler.getHeight(90),
                width: scaler.getWidth(100),
                color: Colors.white,
                child: StreamBuilder(
                  stream: Events(),
                    builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }
                    else if(snapshot.hasData){
                      final users=snapshot.data!;

                      return ListView.builder(
                        itemCount: users.length,
                          itemBuilder: (context, index){
                          return Center(
                            child: Column(
                              children: [
                                InkWell(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height:scaler.getHeight(30),
                                        width: scaler.getWidth(95),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),

                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: '${users[index].images[0]}',
                                          imageBuilder: (context, imageProvider) => ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                      ),
                                      Padding(
                                        padding: scaler.getPaddingLTRB(5,22,0,0),
                                        child: Container(
                                          alignment:Alignment.center,
                                          height:scaler.getHeight(5),
                                          width: scaler.getWidth(30),
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Text('${users[index].address}'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetail(
                                      fees:users[index].fees,
                                      name: users[index].name,
                                      image: users[index].images,
                                      city: users[index].address,
                                      date: users[index].date,
                                      time: users[index].time,
                                      desc: users[index].desc,)));
                                  },
                                ),
                                SizedBox(
                                  height: scaler.getHeight(2),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height:scaler.getHeight(5),
                                      width: scaler.getWidth(50),
                                      child: Text('${users[index].name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: scaler.getTextSize(12),
                                        fontStyle: FontStyle.italic
                                      ),),
                                    ),
                                    Container(
                                      height:scaler.getHeight(5),
                                      width: scaler.getWidth(20),
                                      child: Text('${users[index].type}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: scaler.getTextSize(12),
                                            fontStyle: FontStyle.italic
                                        ),),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: scaler.getPaddingLTRB(8,0,0,0),
                                  child: Row(
                                    children: [
                                    Text('${users[index].date},',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold,
                                            fontSize: scaler.getTextSize(12),
                                            fontStyle: FontStyle.italic
                                        )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('${users[index].time}',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.bold,
                                              fontSize: scaler.getTextSize(12),
                                              fontStyle: FontStyle.italic
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:60 ,
                                )
                              ],
                            ),
                          );
                          });
                    }else return Text('');
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Stream<List<dynamic>> Events()=>
      FirebaseFirestore.instance.collection('Events')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Catalogmodel.fromJson(doc.data()))
              .toList());
}
