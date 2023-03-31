import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventgo/Classes/Person%20Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class EventDetail extends StatefulWidget {
  var fees;
  var name;
  var image=[];
  var city;
  var desc;
  var date;
  var time;

  EventDetail({required this.fees,required this.image,required this.city,required this.desc, required this.name,required this.time,required this.date});

  @override
  State<EventDetail> createState() => _EventDetailState(fees:fees,name:name,city:city,desc:desc,date:date,time:time,image: image);
}

class _EventDetailState extends State<EventDetail> {
  var fees;var name;var city;
var desc;
var date;
var time;
var image=[];
var Person_name;
var cnic;
var Complete_address;
var Person_Phone;
_EventDetailState({required this.fees,required this.name,required this.image, required this.city,required this.desc,required this.date,required this.time});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()
      ..init(context);
    print(image[0]);
    return Scaffold(
      appBar:AppBar(
          iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title:Text('Event Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: scaler.getTextSize(12),
            color: Colors.black
          ),)
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: scaler.getPaddingLTRB(0,0,65,0),
              child: Container(
                height: scaler.getHeight(3),
                width: scaler.getWidth(25),
                child: Text(city,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: scaler.getTextSize(13),
                ),),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: scaler.getPaddingLTRB(0,0,2,0),
              child: Container(
                height:scaler.getHeight(10),
                width: scaler.getWidth(90),
                child: Text(desc,
                style: TextStyle(
                    fontSize: scaler.getTextSize(12),
                    fontStyle: FontStyle.italic
                ),),
              ),
            ),
            Padding(
              padding: scaler.getPaddingLTRB(4, 0, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                height: scaler.getHeight(45),
                width: scaler.getWidth(100),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          Container(

                            height: scaler.getHeight(45),
                            width: scaler.getWidth(50),
                            child: CachedNetworkImage(
                              imageUrl: '${image[index]}',
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
                          SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: scaler.getPaddingLTRB(3, 2, 0, 0),
              child: Card(
                child: Container(
                  height: scaler.getHeight(20),
                  width: scaler.getWidth(100),
                  child: Padding(
                    padding: scaler.getPaddingLTRB(3, 2, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.drive_file_rename_outline),
                            SizedBox(
                              width: 10,
                            ),
                            Text(name)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(city)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range),
                            SizedBox(
                              width: 10,
                            ),
                            Text(date),
                            SizedBox(
                              width: 5,
                            ),
                            Text(time),
                          ],
                        ),
                        Padding(
                          padding: scaler.getPaddingLTRB(3, 2, 50, 0),
                          child: Container(
                            height: 20,
                              width: 400,
                              child: Text('Registration-Fees: \$${fees}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 250,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.purple
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 600,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children:  <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Person-Details',style: TextStyle(fontSize: 30),),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: scaler.getHeight(8),
                                  width: scaler.getWidth(80),
                                  child: TextFormField(
                                    decoration:  InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                          borderSide: BorderSide.none,
                                        ),

                                        hintStyle: TextStyle(color: Colors.black38,fontFamily: "WorkSansLight"),
                                        filled: true,
                                        fillColor: Color(0xFFE7ECEF),
                                        hintText: 'Enter Your Complete Name'),
                                    onChanged: (value) {
                                      Person_name=value;
                                    },
                                  ),
                                ),
                                Container(
                                  height: scaler.getHeight(8),
                                  width: scaler.getWidth(80),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration:  InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone_android,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                          borderSide: BorderSide.none,
                                        ),

                                        hintStyle: TextStyle(color: Colors.black38,fontFamily: "WorkSansLight"),
                                        filled: true,
                                        fillColor: Color(0xFFE7ECEF),
                                        hintText: 'Enter Your Mobile No'),
                                    onChanged: (value) {
                                      Person_Phone=value;
                                    },
                                  ),
                                ),
                                Container(
                                  height: scaler.getHeight(8),
                                  width: scaler.getWidth(80),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration:  InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.perm_identity_sharp,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                          borderSide: BorderSide.none,
                                        ),

                                        hintStyle: TextStyle(color: Colors.black38,fontFamily: "WorkSansLight"),
                                        filled: true,
                                        fillColor: Color(0xFFE7ECEF),
                                        hintText: 'Enter Your CNIC-No'),
                                    onChanged: (value) {
                                      cnic=value;
                                    },
                                  ),
                                ),
                                Container(
                                  height: scaler.getHeight(8),
                                  width: scaler.getWidth(80),
                                  child: TextFormField(
                                    decoration:  InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.home_outlined,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                                          borderSide: BorderSide.none,
                                        ),

                                        hintStyle: TextStyle(color: Colors.black38,fontFamily: "WorkSansLight"),
                                        filled: true,
                                        fillColor: Color(0xFFE7ECEF),
                                        hintText: 'Enter Your Complete-Address'),
                                    onChanged: (value) {
                                      Complete_address=value;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:10,top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    height: 40,
                                    width: 300,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                        backgroundColor: Colors.purple
                                      ),
                                        onPressed: (){
                                          createUser();
                                        }, child: Text('Confirm')),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text(
                  'Register ',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
  Future createUser( ) async{
    final docUser=FirebaseFirestore.instance.collection('Register_Persons').doc(Person_name);

    final user=Details(
        name: Person_name,
        phone: Person_Phone,
        cnic: cnic,
        address: Complete_address
    );
    final json=user.toJson();
    await docUser.set(json);
  }
}
