class Student {
  int? id;
  String? name;
  int? age;

  Student( {required int this.id,required String this.name,required int this.age});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}