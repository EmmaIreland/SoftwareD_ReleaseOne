package surveyTool
class ProjectTeamAssignmentController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
       
       
    def index = {
        redirect(action: "list", params: params)
    }
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [projectTeamAssignmentInstanceList: ProjectTeamAssignment.list(params), projectTeamAssignmentInstanceTotal: ProjectTeamAssignment.count()]
    }
    def create = {
        def projectTeamAssignmentInstance = new ProjectTeamAssignment()
        projectTeamAssignmentInstance.properties = params
        return [projectTeamAssignmentInstance: projectTeamAssignmentInstance]
    }
    def save = {
        def projectTeamAssignmentInstance = new ProjectTeamAssignment(params)
        if (projectTeamAssignmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'projectTeamAssignment.created.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), projectTeamAssignmentInstance.id, projectTeamAssignmentInstance.project, projectTeamAssignmentInstance.team])}"
            redirect(controller:"project", action: "show", id: projectTeamAssignmentInstance.project.id)
        }
        else {
            render(view: "create", model: [projectTeamAssignmentInstance: projectTeamAssignmentInstance])
        }
    }
       
       
        def saveAndCreateAnother = {
                def projectTeamAssignmentInstance = new ProjectTeamAssignment(params)
                if (projectTeamAssignmentInstance.save(flush: true)) {
                        flash.message = "${message(code: 'projectTeamAssignment.created.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), projectTeamAssignmentInstance.id, projectTeamAssignmentInstance.project, projectTeamAssignmentInstance.team])}"
                        redirect(action: "create")
                }
                else {
                        render(view: "create", model: [projectTeamAssignmentInstance: projectTeamAssignmentInstance])
                }
        }
    def show = {
        def projectTeamAssignmentInstance = ProjectTeamAssignment.get(params.id)
        if (!projectTeamAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [projectTeamAssignmentInstance: projectTeamAssignmentInstance]
        }
    }
    def edit = {
        def projectTeamAssignmentInstance = ProjectTeamAssignment.get(params.id)
        if (!projectTeamAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [projectTeamAssignmentInstance: projectTeamAssignmentInstance]
        }
    }
    def update = {
        def projectTeamAssignmentInstance = ProjectTeamAssignment.get(params.id)
        if (projectTeamAssignmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (projectTeamAssignmentInstance.version > version) {
                   
                    projectTeamAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment')] as Object[], "Another user has updated this ProjectTeamAssignment while you were editing")
                    render(view: "edit", model: [projectTeamAssignmentInstance: projectTeamAssignmentInstance])
                    return
                }
            }
            projectTeamAssignmentInstance.properties = params
            if (!projectTeamAssignmentInstance.hasErrors() && projectTeamAssignmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), projectTeamAssignmentInstance.id])}"
                redirect(action: "show", id: projectTeamAssignmentInstance.id)
            }
            else {
                render(view: "edit", model: [projectTeamAssignmentInstance: projectTeamAssignmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
    }
    def delete = {
        def projectTeamAssignmentInstance = ProjectTeamAssignment.get(params.id)
        if (projectTeamAssignmentInstance) {
            try {
                projectTeamAssignmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projectTeamAssignment.label', default: 'ProjectTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
    }
}