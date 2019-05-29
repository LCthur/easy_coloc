module ApplicationHelper
  def delayed?(assignment)
    assignment.deadline < Date.today
  end

  def full_name(first_name, last_name)
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
