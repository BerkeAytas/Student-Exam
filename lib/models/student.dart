class Student{
  int id;
  String firstname;
  String lastname;
  int grade;
  String status;

  Student(String firstname, String lastname, int grade){
    this.firstname  = firstname;
    this.lastname   = lastname;
    this.grade      = grade;
  }
  Student.withId(int id, String firstname, String lastname, int grade){
    this.id         = id;
    this.firstname  = firstname;
    this.lastname   = lastname;
    this.grade      = grade;
  } 

  String get getStatus{
    String massage = "";
    if (this.grade >= 50){
      massage = "Geçti";
    }else if (this.grade >= 40) {
      massage = "Bütünlemeye Kaldı";
    }else{
      massage = "Kaldı";
    }
    return massage;
  }
}

