require_relative 'auditable'
class Die
  include Auditable
  def roll
    rand(1..6)
    audit
    @number
  end

end
