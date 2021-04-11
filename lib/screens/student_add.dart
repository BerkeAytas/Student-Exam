import 'package:example/models/student.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  //StudentAdd(List<Student> sutudent){
    //this.student= student;
  //}
  //yukarısı aşağısı ile aynı işlevde
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
      }
    
    }
    
  class _StudentAddState extends State<StudentAdd>{
    var formKey = GlobalKey<FormState>();
    var student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Yeni Öğrenci"),
    ),
    body: Container(
      margin: EdgeInsets.all(10.0),
      child: Form(key:formKey,child: Column(children: <Widget>[
      buildFirstNameField(),
      buildLastNameField(),
      buildGradeNumField(),
      buildSubmitButton()
      ],
      ),
      ),
    ),
    );
  }
      buildFirstNameField() {
        return TextFormField(decoration: InputDecoration(labelText:"Öğrenci Adı:",hintText: "Örn:Berke"),
        onSaved: (String value){
          student.firstname = value; 
        },
        );
}
      buildLastNameField() {
        return TextFormField(decoration: InputDecoration(labelText:"Öğrenci Soyadı:",hintText: "Örn:Aytas"),
        onSaved: (String value){
          student.lastname = value; 
        },
        );
}
      Widget buildGradeNumField() {
        return TextFormField(decoration: InputDecoration(labelText:"Aldığı Not:",hintText: "Örn:85"),
        onSaved: (String value){
          student.grade = int.parse(value); 
        },
        );
}
Widget buildSubmitButton(){
  return ElevatedButton(
    child: Text("Kaydet"),
    onPressed: (){
      formKey.currentState.save();
      widget.students.add(student);
      Navigator.pop(context);
    },
  );
}
}