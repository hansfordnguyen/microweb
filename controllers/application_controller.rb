Dir[File.join(APP_ROOT, 'views/*.rb')].each { |view| require view }
Dir[File.join(APP_ROOT, 'models/*.rb')].each { |model| require model }

class ApplicationController
  attr_reader :request, :controller, :action

  def initialize(request, controller, action)
    @request = request
    @controller = controller
    @action = action
  end

  def render(template, locals = {})
    controller_name = titleize(controller)
    view_class_name = "#{controller_name}View"
    view = Object.const_get(view_class_name).new(locals)
    view.send template
  end
end
