class Geo{
  String lat;//": "-68.6102",
  String lng;//": "-47.0653"
Geo(this.lat,this.lng);
Geo.fromJson(Map<String,dynamic> json):lat=json['lat'],lng=json['lng'];
}
class Company{
  String name;//": "Romaguera-Jacobson",
  String catchPhrase;//": "Face to face bifurcated interface",
  String bs;//": "e-enable strategic applications"
  Company(this.bs,this.catchPhrase,this.name);
  Company.fromJson(Map<String,dynamic> json):name=json['name'],catchPhrase=json['catchPhrase'],bs=json['bs'];
}
class Address{
  String street;//": "Douglas Extension",
  String suite;//": "Suite 847",
  String city;//": "McKenziehaven",
  String zipcode;//// ": "59590-4157",
  Geo geo;
Address(this.city,this.street,this.suite,this.zipcode,this.geo);
Address.fromJson(Map<String,dynamic> json):city=json['city'],
      street=json['street'],
      suite=json['suite'],
      zipcode=json['zipcode'],
      geo=Geo.fromJson(json['zipcode']);
}
class Employee{
  int id;
  String name; //"Clementine Bauch",
  String username;//": "Samantha",
  String email;//: "Nathan@yesenia.net",
  String profile_image;//":"https://randomuser.me/api/portraits/men/2.jpg",
  //Address address;
  String phone;//": "1-463-123-4447",
  String website;//": null,
  //Company company;//": {
  Employee(this.name,this.id,this.email,this.phone,this.profile_image,this.username,this.website);
  Employee.fromJson(Map<String,dynamic> json):id=json['zipcode'],
  name=json['name'],
  username=json['username'],
  email=json['email'],
  profile_image=json['profile_image'],
  //address=json['address'],
  phone=json['phone'],
  website=json['website'];
  //company=json['company'];
  // toMap()

 Map<String, dynamic> toMap() {
  return {
  "id": id,
  "name": name,
  "email": email,
  "phone": phone,
    "profile_image": profile_image,
    "username": username,
    "website": website,
  };
  }
}