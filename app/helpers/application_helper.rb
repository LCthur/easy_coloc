module ApplicationHelper
  def delayed?(assignment)
    assignment.deadline < Date.today
  end
end
