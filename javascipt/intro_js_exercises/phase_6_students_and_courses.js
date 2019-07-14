// Student constructor and prototypes
const Student = function(lastName, firstName) {
  this.lastName = lastName;
  this.firstName = firstName;
  this.courses = [];
};

Student.prototype.name = function() {
  return `${this.firstName} ${this.lastName}`;
};

Student.prototype.hasConflict = function(course) {
  for (let i = 0; i < this.courses.length; i++) {
    if (this.courses[i].conflictsWith(course))
      return true;
  }
  return false;
};

Student.prototype.enroll = function(course) {
  if (course.students.includes(this)) {
    console.log(`Student already enrolled in ${course.name}`);
  } else if (this.hasConflict(course)) {
    console.log(`${course.name} has conflict with another enrolled course`);
  } else {
    course.students.push(this);
    this.courses.push(course);
    console.log("Course added.");
  }
};

Student.prototype.courseLoad = function() {
  let courseLoadHash = {};
  this.courses.forEach((course) => {
    if (Object.keys(courseLoadHash).includes(course.dept))
      courseLoadHash[course.dept] = courseLoadHash[course.dept] + course.credits;
    else
      courseLoadHash[course.dept] = course.credits;
  });

  return courseLoadHash;
}

// Course constructor and prototypes
const Course = function(name, dept, credits, timeBlock, daysArr) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.students = [];
  this.daysArr = daysArr;
  this.timeBlock = timeBlock;
};

Course.prototype.addStudent = function(student) {
  student.enroll(this); 
};

Course.prototype.conflictsWith = function(course) {
  const doesDaysConflict = () => {
    for (let i = 0; i < this.daysArr.length; i++) {
      if (course.daysArr.includes(this.daysArr[i])) {
        return true;
      }
    }
    return false;
  };

  if (this.timeBlock == course.timeBlock && doesDaysConflict())
    return true;
  else
    return false;
};
