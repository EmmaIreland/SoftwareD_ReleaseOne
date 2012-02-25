import surveyTool.Course;
import surveyTool.Student;
import surveyTool.Enrollment;
import surveyTool.Manager;
import surveyTool.Project;
import surveyTool.Team;
import surveyTool.StudentTeamAssignment;

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
		
		Team awesomeHats = new Team(name:'Awesome Hats', course:amish101).save(failOnError:true)
		Team beardedBandits = new Team(name:'Bearded Bandits', course:amish101).save(failOnError:true)
		Team animalLovers = new Team(name:'Animal Lovers', course:amish101).save(failOnError:true)
		
		StudentTeamAssignment assignment = new StudentTeamAssignment(student:roger, team:beardedBandits).save(failOnError:true)
		StudentTeamAssignment assignment2 = new StudentTeamAssignment(student:gertrude, team:animalLovers).save(failOnError:true)
		
		
		
    }
    def destroy = {
    }
}
