package surveyTool
class TeamController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
       
    def index = {
        redirect(action: "list", params: params)
    }
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [teamInstanceList: Team.list(params), teamInstanceTotal: Team.count()]
    }
    def create = {
        def teamInstance = new Team()
        teamInstance.properties = params
        return [teamInstance: teamInstance]
    }
       
       
    def save = {
        def teamInstance = new Team(params)
        if (teamInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.name])}"
            redirect(action: "show", id: teamInstance.id)
        }
        else {
            render(view: "create", model: [teamInstance: teamInstance])
        }
    }
       
        def saveAndAssignStudent = {
                def teamInstance = new Team(params)
                if (teamInstance.save(flush: true)) {
                        flash.message = "${message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.name])}"
                        redirect(controller:"studentTeamAssignment", action: "create")
                }
                else {
                        render(view: "create", model: [teamInstance: teamInstance])
                }
        }
       
        def saveAndAssignProject = {
                def teamInstance = new Team(params)
                if (teamInstance.save(flush: true)) {
                        flash.message = "${message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.name])}"
                        redirect(controller:"projectTeamAssignment", action: "create")
                }
                else {
                        render(view: "create", model: [teamInstance: teamInstance])
                }
        }
       
        def saveAndCreateAnotherTeam = {
                def teamInstance = new Team(params)
                if (teamInstance.save(flush: true)) {
                        flash.message = "${message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.name])}"
                        redirect(controller:"team", action: "create")
                }
                else {
                        render(view: "create", model: [teamInstance: teamInstance])
                }
        }
       
    def show = {
        def teamInstance = Team.get(params.id)
        if (!teamInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
        else {
            [teamInstance: teamInstance]
        }
    }
    def edit = {
        def teamInstance = Team.get(params.id)
        if (!teamInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [teamInstance: teamInstance]
        }
    }
    def update = {
        def teamInstance = Team.get(params.id)
        if (teamInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (teamInstance.version > version) {
                   
                    teamInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'team.label', default: 'Team')] as Object[], "Another user has updated this Team while you were editing")
                    render(view: "edit", model: [teamInstance: teamInstance])
                    return
                }
            }
            teamInstance.properties = params
            if (!teamInstance.hasErrors() && teamInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.name])}"
                redirect(action: "show", id: teamInstance.id)
            }
            else {
                render(view: "edit", model: [teamInstance: teamInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
    }
    def delete = {
        def teamInstance = Team.get(params.id)
        if (teamInstance) {
            try {
                teamInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
    }
}