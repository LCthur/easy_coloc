module ApplicationHelper
  FRENCH_DAYS = {
    "Today"     =>  "Aujourd'hui",
    "Monday"    =>  "Lundi",
    "Tuesday"   =>  "Mardi",
    "Wednesday" =>  "Mercredi",
    "Thursday"  =>  "Jeudi",
    "Friday"    =>  "Vendredi",
    "Saturday"  =>  "Samedi",
    "Sunday"    =>  "Dimanche"
  }

  FRENCH_MONTHS = {
    "January"   =>  "janvier",
    "February"  =>  "février",
    "March"     =>  "mars",
    "April"     =>  "avril",
    "May"       =>  "mai",
    "June"      =>  "juin",
    "July"      =>  "juillet",
    "August"    =>  "août",
    "September" =>  "septembre",
    "October"   =>  "octobre",
    "November"  =>  "novembre",
    "December"  =>  "décembre"
  }

  def delayed?(assignment)
    assignment.deadline < Date.today
  end

  def full_name(first_name, last_name)
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def day_french(day)
    FRENCH_DAYS[day]
  end

  def month_french(month)
    FRENCH_MONTHS[month]
  end

  def complete_date(date)
    "#{day_french(date.strftime('%A'))}, Le #{date.strftime('%-d')}
     #{month_french(date.strftime('%B'))} #{date.strftime('%Y')}"
  end

  def deals_array
    # recup de tous les deals proposes au current_user
    return Deal.joins("INNER JOIN assignments
                          ON deals.assignment_proposal_id = assignments.id").where("assignments.user_id = #{current_user.id}").where(chosen: nil)
  end

  def issues_against_me_array
    return Issue.joins("INNER JOIN assignments ON issues.assignment_id = assignments.id").where("assignments.user_id = #{current_user.id}").where("assignments.done_state = false")
  end
end
