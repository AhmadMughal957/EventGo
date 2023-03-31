class Details{
  var name;
  var phone;
  var cnic;
  var address;

  Details({required this.name, required this.phone, required this.cnic, required this.address});

  Map<String, dynamic> toJson()=>{
    'phone':phone,
    'cnic':cnic,
    'address':address,
    'name':name,
  };
  static Details fromJson(Map<String, dynamic> json)=>Details(
      phone:json['phone'],
      cnic:json['cnic'],
      name: json['name'],
      address:json['address'],

  );
}