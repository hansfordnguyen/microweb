class Router
  @@defined_routes = {}

  def self.draw &block
    yield block
  end

  def self.parse(path)
    return { controller: 'home', action: 'page_not_found' } unless @@defined_routes.has_key?(path)
    @@defined_routes[path]
  end

  private

  def self.get(path, options)
    controller, action = options[:to].split('#')
    @@defined_routes[path] = { controller: controller, action: action }
  end
end
