class CityGetModel{
  List<CityGetModelList> result;

  CityGetModel({required this.result});

  factory CityGetModel.fromJson(Map<String, dynamic> json) => CityGetModel(
    result: List<CityGetModelList>.from(json["result"].map((x)=> CityGetModelList.fromJson(x)))
  );
  
}

class CityGetModelList{
  String name;
  String id;

  CityGetModelList({
    required this.name,
    required this.id,
  });

  factory CityGetModelList.fromJson(Map<String, dynamic> json) => CityGetModelList(
    name: json["name"] ?? "",
    id: json["id"] ?? "",
  );
}