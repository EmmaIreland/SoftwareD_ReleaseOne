package surveyTool

class StudentTeamAssignmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [studentTeamAssignmentInstanceList: StudentTeamAssignment.list(params), studentTeamAssignmentInstanceTotal: StudentTeamAssignment.count()]
    }

    def create = {
        def studentTeamAssignmentInstance = new StudentTeamAssignment()
        studentTeamAssignmentInstance.properties = params
        return [studentTeamAssignmentInstance: studentTeamAssignmentInstance]
    }

    def save = {
        def studentTeamAssignmentInstance = new StudentTeamAssignment(params)
        if (studentTeamAssignmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), studentTeamAssignmentInstance.id])}"
            redirect(action: "show", id: studentTeamAssignmentInstance.id)
        }
        else {
            render(view: "create", model: [studentTeamAssignmentInstance: studentTeamAssignmentInstance])
        }
    }

    def show = {
        def studentTeamAssignmentInstance = StudentTeamAssignment.get(params.id)
        if (!studentTeamAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [studentTeamAssignmentInstance: studentTeamAssignmentInstance]
        }
    }

    def edit = {
        def studentTeamAssignmentInstance = StudentTeamAssignment.get(params.id)
        if (!studentTeamAssignmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [studentTeamAssignmentInstance: studentTeamAssignmentInstance]
        }
    }

    def update = {
        def studentTeamAssignmentInstance = StudentTeamAssignment.get(params.id)
        if (studentTeamAssignmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (studentTeamAssignmentInstance.version > version) {
                    
                    studentTeamAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment')] as Object[], "Another user has updated this StudentTeamAssignment while you were editing")
                    render(view: "edit", model: [studentTeamAssignmentInstance: studentTeamAssignmentInstance])
                    return
                }
            }
            studentTeamAssignmentInstance.properties = params
            if (!studentTeamAssignmentInstance.hasErrors() && studentTeamAssignmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), studentTeamAssignmentInstance.id])}"
                redirect(action: "show", id: studentTeamAssignmentInstance.id)
            }
            else {
                render(view: "edit", model: [studentTeamAssignmentInstance: studentTeamAssignmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def studentTeamAssignmentInstance = StudentTeamAssignment.get(params.id)
        if (studentTeamAssignmentInstance) {
            try {
                studentTeamAssignmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'studentTeamAssignment.label', default: 'StudentTeamAssignment'), params.id])}"
            redirect(action: "list")
        }
    }
}
