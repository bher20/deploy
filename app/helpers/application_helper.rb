module ApplicationHelper
  def to_boolean(str)
    str.downcase == 'true' || str == '1'
  end
end
