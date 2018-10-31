class BaseView
  def display_elements(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1} - " + element.to_s
    end
  end

  def ask_for(label)
    # class is a reserved word
    # klass = self.class
    klass_name = self.class.to_s.gsub(/sView/, "").downcase
    puts "What's the #{label} of the #{klass_name}?"
    gets.chomp
  end
end
