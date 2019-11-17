require 'route'
Dir[File.join(APP_ROOT, 'controllers/*.rb')].each { |controller| require controller }

class Server
  def start
    clear_terminal
    show_instructions
    request = {}
    until request[:path] == 'quit'
      print '[URL] https://www.nustechnology.com/'
      request = { path: gets.chomp }
      return if request[:path] == 'quit'
      routes(request)
      dispatch(request)
    end
  end

  def routes(request)
    @controller_name, @action_name = Router.parse(request[:path])
                                           .values_at(:controller, :action)
  end

  def dispatch(request)
    controller_class_name = "#{titleize(@controller_name)}Controller"
    controller = Object.const_get(controller_class_name).new(
      request,
      @controller_name,
      @action_name
    )
    controller.send @action_name
  end
end
