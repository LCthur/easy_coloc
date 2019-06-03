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
end
