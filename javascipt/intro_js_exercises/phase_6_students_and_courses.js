const Student = function(lastName, firstName) {
  this.lastName = lastName;
  this.firstName = firstName;
  this.courses = [];
};

Student.prototype.name = function() {
  return `${this.firstName} ${this.lastName}`;
};

Student.prototype.enroll = function(course) {
  if (course.students.includes(this)) {
    console.log(`Student already enrolled in ${course.name}`);
  } else {
    course.students.push(this);
    this.courses.push(course);
    console.log("Course added.");
  }
};

Student.prototype.courseLoad = function() {
  return this.courses.reduce((courseLoad, course) => {
    if (courseLoad.keys.includes(course.department))
      courseLoad[course.department] = courseLoad[course.department] + course.credits;
    else
      courseLoad[course.department] = course.credits;
  }, {});
}

const Course = function(name, dept, credits) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.students = [];
};

Course.prototype.addStudent = function(student) {
  student.enroll(this); 
};
