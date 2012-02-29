package surveyTool

class ManagerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	


    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [managerInstanceList: Manager.list(params), managerInstanceTotal: Manager.count()]
    }

    def create = {
        def managerInstance = new Manager()
        managerInstance.properties = params
        return [managerInstance: managerInstance]
    }

    def save = {
        def managerInstance = new Manager(params)
        if (managerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'manager.label', default: 'Manager'), managerInstance.name])}"
            redirect(action: "show", id: managerInstance.id)
        }
        else {
            render(view: "create", model: [managerInstance: managerInstance])
        }
    }

    def show = {
        def managerInstance = Manager.get(params.id)
        if (!managerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), params.id])}"
            redirect(action: "list")
        }
        else {
            [managerInstance: managerInstance]
        }
    }

    def edit = {
        def managerInstance = Manager.get(params.id)
        if (!managerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [managerInstance: managerInstance]
        }
    }

    def update = {
        def managerInstance = Manager.get(params.id)
        if (managerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (managerInstance.version > version) {
                    
                    managerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'manager.label', default: 'Manager')] as Object[], "Another user has updated this Manager while you were editing")
                    render(view: "edit", model: [managerInstance: managerInstance])
                    return
                }
            }
            managerInstance.properties = params
            if (!managerInstance.hasErrors() && managerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'manager.label', default: 'Manager'), managerInstance.id])}"
                redirect(action: "show", id: managerInstance.id)
            }
            else {
                render(view: "edit", model: [managerInstance: managerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def managerInstance = Manager.get(params.id)
        if (managerInstance) {
            try {
                managerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'manager.label', default: 'Manager'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'manager.label', default: 'Manager'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manager.label', default: 'Manager'), params.id])}"
            redirect(action: "list")
        }
    }
}
