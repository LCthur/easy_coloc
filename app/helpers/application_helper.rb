module ApplicationHelper

  def full_name(first_name, last_name)
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
