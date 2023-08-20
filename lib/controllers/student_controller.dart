import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/Student.dart';
import '../models/studentNew.dart';
import '../repository/student_repo.dart' as studentRepo;

class StudentController extends ControllerMVC {
  List<Student> stdList = <Student>[];
  List<Student> searchList = <Student>[];

  List<StudentNew> stdListNew = <StudentNew>[];
  List<StudentNew> searchListNew = <StudentNew>[];

  Future<void> getStudentList() async {
    stdList.clear();
    stdList = await studentRepo.getStudentList();
    searchList.addAll(stdList);
    print('result list value: ${searchList.elementAt(0).name}');
  }

  Future<void> getStudentListNew() async {
    stdListNew.clear();
    stdListNew = await studentRepo.getStudentListNew();
    searchListNew.addAll(stdListNew);
    //print('result list2 value: ${stdListNew.elementAt(1).name}');
  }

  void searchQuery(String enteredValue) {
    List<Student> results = [];
    if (enteredValue.isEmpty) {
      results.addAll(stdList);
    } else {
      results = stdList
          .where((user) =>
              (user).name!.toLowerCase().contains(enteredValue.toLowerCase()))
          .toList();
    }
    searchList.clear();
    print("hogya");
    searchList.addAll(results);
  }
}
