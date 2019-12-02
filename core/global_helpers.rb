module GlobalHelpers
  def titleize(snake_string)
    snake_string.split('_').map(&:capitalize).join
  end

  def underscore(camel_cased_word)
    return camel_cased_word unless /[A-Z-]|::/.match?(camel_cased_word)
    acronyms_underscore_regex = /(?:(?<=([A-Za-z\d]))|\b)((?=a)b)(?=\b|[^a-z])/
    word = camel_cased_word.to_s.gsub("::", "/")
    word.gsub!(acronyms_underscore_regex) { "#{$1 && '_' }#{$2.downcase}" }
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end

  def show_instructions
    puts 'Please enter the address you want to visit'
    puts 'For examples: '
    puts '  https://www.microweb.com/home'
    puts '  https://www.microweb.com/about'
    puts 'Type "quit" to exit the application'
    puts
  end

  def clear_terminal
    system 'clear'
  end
end
