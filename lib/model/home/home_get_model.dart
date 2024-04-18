class HomeGetModel{
  List<HomeGetModelList> result;
  
  HomeGetModel({required this.result});

  factory HomeGetModel.fromJson(Map<String, dynamic> json)=> HomeGetModel(
    result: List<HomeGetModelList>.from(json["result"].map((x)=> HomeGetModelList.fromJson(x)))
  );
}

class HomeGetModelList{
  String name;
  String address;
  String email;
  String phoneNumber;
  String city;
  String id;

  HomeGetModelList({
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.id,
  });

  factory HomeGetModelList.fromJson(Map<String, dynamic> json) => HomeGetModelList(
    name: json["name"] ?? "",
    address: json["address"] ?? "",
    email: json["email"] ?? "",
    phoneNumber: json["phoneNumber"] ?? "",
    city: json["city"] ?? "",
    id: json["id"] ?? "",
  );
}