import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:search_app/controllers/student_controller.dart';

class StudentView extends StatefulWidget {
  const StudentView({Key? key}) : super(key: key);

  @override
  _StudentViewState createState() => _StudentViewState();
}

class _StudentViewState extends StateMVC<StudentView> {
   late StudentController _con;

   _StudentViewState() : super(StudentController()) {
    _con = StudentController();
  }
  @override
  void initState() {
    //_con = StudentController();
    _con.getStudentListNew();
    _con.getStudentList();

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                  setState(() {
                  _con.searchQuery(value);
                });
              } ,
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)

              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _con.searchListNew.isNotEmpty ?
              ListView.builder(
                itemCount: _con.searchListNew.length,
                itemBuilder: (BuildContext context,int index) => Card(
                  key: ValueKey(_con.searchListNew[index].id),
                  color: Colors.purpleAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                   /* leading: Text(
                      _con.searchList[index].id.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white
                      ),
                    ),*/
                    title: Text(
                        _con.searchListNew[index].name!,
                         style: const TextStyle(
                             color: Colors.white
                         ),
                    ),
                    subtitle: Text(
                        _con.searchListNew[index].grade!.toString(),
                        style: const TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                ),
              ):
              const Text("no data to show"),

            ),
          ],
        ),
      ),
    );
  }
}