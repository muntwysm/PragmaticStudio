require_relative 'project'


class GrantProject < Project

  def remove_funds
    puts "#{name} is a grant project, therefore funds cannot be removed!"
  end

end
