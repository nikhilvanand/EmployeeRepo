class Geo{
  String lat;//": "-68.6102",
  String lng;//": "-47.0653"
Geo(this.lat,this.lng);
Geo.fromJson(Map<String,dynamic> json):lat=json['lat'],lng=json['lng'];
Map<String,dynamic> toMap(){
  return {
  "lat":lat,
  "lng":lng,
};
}
}
class Company{
  String name;
  String catchPhrase;
  String bs;
  Company(this.bs,this.catchPhrase,this.name);
  Company.fromJson(Map<String,dynamic> json):name=json['name'],catchPhrase=json['catchPhrase'],bs=json['bs'];
  Map<String,dynamic> toMap(){
    return {
      "name":name,
      "catchPhrase":catchPhrase,
      "bs":bs,
    };
  }
}
class Address{
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
Address(this.city,this.street,this.suite,this.zipcode,this.geo);
Address.fromJson(Map<String,dynamic> json):
      city=json['city'],
      street=json['street'],
      suite=json['suite'],
      zipcode=json['zipcode'],
      geo=Geo.fromJson(json['geo']);
  Map<String,dynamic> toMap(){
    return {
      "street":street,
      "suite":suite,
      "zipcode":zipcode,
      "geo":geo.toMap(),
    };
  }
}
class Employee{
  int id;
  String name;
  String username;
  String email;
  String profile_image;
  Address address;
  String phone;
  String website;
  Company company;
  Employee(this.name,this.id,this.email,this.phone,this.profile_image,this.username,this.website,this.address,this.company);
  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
      json['name'],
      json['id'],
      json['email'],
      json['phone'] ?? '',
    json['profile_image'],
      json['username'],
      json['website']??'',
    Address.fromJson(json['address']),
    Company.fromJson(json['company'])
  );
 Map<String, dynamic> toMap() {
  return {
  "id": id,
  "name": name,
  "email": email,
  "phone": phone,
    "profile_image": profile_image,
    "username": username,
    "website": website,
    "address": address.toMap(),
    "company": company.toMap(),
  };
  }
}