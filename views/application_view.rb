class ApplicationView
  PAGE_WIDTH = `tput cols`.to_i
  PAGE_HEIGHT = `tput lines`.to_i - 6

  def initialize(locals = {})
    @locals = locals
    @body_line_count = 0
    clear_terminal
  end

  def header
    separator
    puts '#' + 'MICROWEB'.center(PAGE_WIDTH - 2) + '#'
    separator
    line
  end

  def footer
    line
    puts '  Copyright 2018  '.center(PAGE_WIDTH, '#')
  end

  def separator
    puts '=' * PAGE_WIDTH
  end

  def body(&content)
    yield content
    return if @body_line_count > PAGE_HEIGHT
    (PAGE_HEIGHT - @body_line_count).times do
      puts '#' + ' ' * (PAGE_WIDTH - 2) + '#'
    end
  end

  def line(text = ' ')
    available_width = PAGE_WIDTH - 4
    lines = text.chars.each_slice(available_width).map{ |item| item.join }
    lines.each do |content|
      puts '# ' + content.ljust(available_width) + ' #'
    end
    @body_line_count += lines.size
  end
end
