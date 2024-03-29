import surveyTool.Course;
import surveyTool.Student;

import surveyTool.Manager;
import surveyTool.Project;
import surveyTool.Team;
import surveyTool.ProjectTeamAssignment;

class BootStrap {

	def noData() {
		return Student.count() == 0
	}
	
    def init = { servletContext -> 
		if (noData()) {
		Manager sheepHerder = new Manager(name:'Sheep Herder Paul').save(failOnError:true)
		Manager catHerder = new Manager(name:'Cat Herder Greg').save(failOnError:true)
		
		Course amish101 = new Course(courseName:'Amish 101', term:'Fall', year:'2012', manager:sheepHerder).save(failOnError:true)
		Course basketWeaving = new Course(courseName:'Basket Weaving 3301',term:'Fall', year:'2012', manager:catHerder).save(failOnError:true)
		
		Student roger = new Student(name:'Roger', email:'roger@email.com').save(failOnError:true)
		Student jebadiah = new Student(name:'Jebadiah',email:'jeb@email.com').save(failOnError:true)
		Student gertrude = new Student(name:'Gertrude',email:'gert@email.com').save(failOnError:true)
		
		
		Project butterChurning = new Project(name:'Butter Churning', description:'', course:amish101).save(failOnError:true)
		Project gatherHay = new Project(name:'Gathering Hay', description:'Gathering a lot!',course:basketWeaving).save(failOnError:true)
		
		Team awesomeHats = new Team(name:'Awesome Hats', course:amish101, comments:'Pretty awesome hats').save(failOnError:true)
		Team beardedBandits = new Team(name:'Bearded Bandits', course:basketWeaving, comments:'Pretty awesome beards').save(failOnError:true)
		Team animalLovers = new Team(name:'Animal Lovers', course:basketWeaving, comments:'').save(failOnError:true)
	
		ProjectTeamAssignment pAssignment = new ProjectTeamAssignment(project:gatherHay, team:beardedBandits).save(failOnError:true)
		ProjectTeamAssignment pAssignment2 = new ProjectTeamAssignment(project:gatherHay, team:animalLovers).save(failOnError:true)
		}
    }
    def destroy = {
    }
}
