import surveyTool.Course;
import surveyTool.Student;
import surveyTool.Enrollment;
import surveyTool.Manager;
import surveyTool.Project;
import surveyTool.Group;
import surveyTool.StudentGroupAssignment;

class BootStrap {

    def init = { servletContext -> 
		Manager sheepHerder = new Manager(name:'Sheep Herder Paul').save(failOnError:true)
		Manager catHerder = new Manager(name:'Cat Herder Greg').save(failOnError:true)
		
		Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder).save(failOnError:true)
		Course basketWeaving = new Course(courseName:'Basket Weaving 3301', manager:catHerder).save(failOnError:true)
		
		Student roger = new Student(name:'Roger').save(failOnError:true)
		Student jebadiah = new Student(name:'Jebadiah').save(failOnError:true)
		Student gertrude = new Student(name:'Gertrude').save(failOnError:true)
		
		Enrollment enroll = new Enrollment(course:basketWeaving,student:roger).save(failOnError:true)
		Enrollment enroll2 = new Enrollment(course:basketWeaving,student:gertrude).save(failOnError:true)
		
		Project butterChurning = new Project(name:'Butter Churning', course:amish101).save(failOnError:true)
		Project gatherHay = new Project(name:'Gathering Hay', course:basketWeaving).save(failOnError:true)
		
		Group awesomeHats = new Group(name:'Awesome Hats', project:butterChurning).save(failOnError:true)
		Group beardedBandits = new Group(name:'Bearded Bandits', project:gatherHay).save(failOnError:true)
		Group animalLovers = new Group(name:'Animal Lovers', project:gatherHay).save(failOnError:true)
		
		StudentGroupAssignment assignment = new StudentGroupAssignment(student:roger, group:awesomeHats)
		StudentGroupAssignment assignment2 = new StudentGroupAssignment(student:gertrude, group:awesomeHats)
		
		
		
    }
    def destroy = {
    }
}
