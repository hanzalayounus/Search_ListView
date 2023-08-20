class StudentNew {
  String? id;
  String? name;
  String? phone;
  String? email;
  List<String>? language;
  String? grade;

  StudentNew(
      {this.id, this.name, this.phone, this.email, this.language, this.grade});

  StudentNew.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    language = List<String>.from(json['language']);
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['language'] = this.language;
    data['grade'] = this.grade;
    return data;
  }
}
