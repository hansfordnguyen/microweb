def titleize(snake_string)
  snake_string.split('_').map(&:capitalize).join
end

def show_instructions
  puts 'Please enter the address you want to visit'
  puts 'For examples: '
  puts '  https://www.nustechnology.com/home'
  puts '  https://www.nustechnology.com/about'
  puts 'Type "quit" to exit the application'
  puts
end

def clear_terminal
  system 'clear'
end
