
import 'dart:convert';

import 'package:search_app/models/Student.dart';
import 'package:http/http.dart' as http;
import '../models/studentNew.dart';


List<Student> _allUsers= <Student>[];
List<StudentNew> _allUsersNew= <StudentNew>[];

Future<List<Student>> getStudentList() async {
  print("after that came here");
    _allUsers.add(Student.fromJson({"id": 1, "name": "ahmed", "age": 22}));
   _allUsers.add(Student.fromJson({"id": 2, "name": "Umer", "age": 21}));
   _allUsers.add(Student.fromJson({"id": 3, "name": "Usman", "age": 28}));
   _allUsers.add(Student.fromJson({"id": 3, "name": "Zohaib", "age": 27}));
   _allUsers.add(Student.fromJson({"id": 5, "name": "Salman", "age": 29}));
   _allUsers.add(Student.fromJson({"id": 6, "name": "Sarmad", "age": 25}));
   return _allUsers;
}

Future<List<StudentNew>> getStudentListNew() async {
 String url= "http://192.168.1.12:3000/api/v1/user-get";

   final client = http.Client();
   final response = await http.get(Uri.parse(url));
   if(response.statusCode==200){
     print("Someting went right");
     final List<dynamic> data = jsonDecode(response.body);
     List<StudentNew> students  = data.map((student) => StudentNew.fromJson(student)).toList();
     _allUsersNew.addAll(students);
   }else{
     print("Someting went wrong");
   }
   
   return _allUsersNew;
}