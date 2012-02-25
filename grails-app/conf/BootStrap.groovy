import surveyTool.Course;
import surveyTool.Student;
import surveyTool.Enrollment;

class BootStrap {

    def init = { servletContext -> 
		Course amish101 = new Course(courseName:'Amish 101').save(failOnError:true)
		Course basketWeaving = new Course(courseName:'Basket Weaving 3301').save(failOnError:true)
		
		Student roger = new Student(name:'Roger').save(failOnError:true)
		Student jebadiah = new Student(name:'Jebadiah').save(failOnError:true)
		Student gertrude = new Student(name:'Gertrude').save(failOnError:true)
		
		Enrollment enroll = new Enrollment(course:basketWeaving,student:roger).save(failOnError:true)
		Enrollment enroll2 = new Enrollment(course:basketWeaving,student:gertrude).save(failOnError:true)
		
		
		
    }
    def destroy = {
    }
}
