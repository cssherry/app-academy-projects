function Student(firstName, lastName){
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

function Course(name, department, credits){
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

Student.prototype.name = function(){
  return this.firstName + " " + this.lastName;
};

Student.prototype.enroll = function(course){
  if (this.courses.indexOf(course) === -1) {
    this.courses.push(course);
  }
};

Course.prototype.addStudent = function(student){
  if (this.students.indexOf(student) === -1) {
    this.students.push(student);
    student.enroll(this);
  };
};

Student.prototype.courseLoad = function() {
  var studentLoad = {};
  this.courses.forEach (function(course) {
    if (studentLoad[course.department] === undefined ) {
      studentLoad[course.department] = course.credits;
    } else {
      studentLoad[course.department] += course.credits;
    }
  });
  return studentLoad;
};

var pat = new Student("Pat", "Lo");
var sherry = new Student("Sherry", "Zhou");
var algebra = new Course("Algebra", "Math", 4);
var biology = new Course("Biology", "Science", 4);
var calculus = new Course("Calculus", "Math", 5);

algebra.addStudent(pat);
algebra.addStudent(sherry);
biology.addStudent(pat);
calculus.addStudent(sherry);
