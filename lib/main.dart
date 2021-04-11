import 'package:example/screens/student_add.dart';
import 'package:flutter/material.dart';

import 'models/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData( primarySwatch: Colors.red,)
      );
  }
  
}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}
class _HomeScreenState extends State{
  List <Student> students = [
    Student.withId(1,"Berke","Aytas",95), 
    Student.withId(2,"Cihan","Taylan",45),
    Student.withId(3,"Nehir","Aytas",35),
  ];

  Student selectedStudent =Student.withId(0, "", "", 0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Öğrenci Takip Sistemi"),),
      body: buildBody()
    );
  }
      
        Widget buildBody() {
          return Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title:Text(students[index].firstname +" "+ students[index].lastname),
                      subtitle: Text("Sınavdan Aldığı Not :"+ students[index].grade.toString()+" ["+students[index].getStatus+"] "),
                      leading: CircleAvatar(backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg")),
                      trailing: buildStatusIcon(students[index].grade),
                      onTap: (){
                        setState(() {
                          this.selectedStudent = students[index];
                        });
                      },
                      onLongPress: (){
                        print("uzun basıldı");
                      },
                    );
                  }),
              ),
                                    Text("Seçili Öğrenci :"+selectedStudent.firstname),
                                    Row(children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    onSurface: Colors.red,
  ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add),
                                              SizedBox(width: 5.0,),
                                              Text("Yeni Öğrenci")
                                            ],
                                          ),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    onSurface: Colors.red,
  ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add),
                                              SizedBox(width: 5.0,),
                                              Text("Güncelle")
                                            ],
                                          ),
                                          onPressed: (){
                                            print("Güncelle");
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
    primary: Colors.red,
    
  ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add),
                                              SizedBox(width: 5.0,),
                                              Text("Sil")
                                            ],
                                          ),
                                          onPressed: (){
                                            print("Sil");
                                          },
                                        ),
                                      )
                                    ],
                                    )
            ],
          );
        }
                      
                       Widget buildStatusIcon(int grade) {
                         if(grade >= 50){
                           return Icon(Icons.done);
                         }else if (grade >=40){
                           return Icon(Icons.album);
                         }else{
                           return Icon(Icons.clear);
                         }
                        }

}
//5.12