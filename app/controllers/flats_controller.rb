class FlatsController < ApplicationController
  def index
    @flat = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @assignments_today_delayed = @flat.assignments.where(deadline: Date.today).order(deadline: :asc)
    @assignments_day1 = @flat.assignments.where(deadline: Date.today + 1)
    @assignments_day2 = @flat.assignments.where(deadline: Date.today + 2)
    @assignments_day3 = @flat.assignments.where(deadline: Date.today + 3)
    @assignments_day4 = @flat.assignments.where(deadline: Date.today + 4)
    @assignments_day5 = @flat.assignments.where(deadline: Date.today + 5)
    @assignments_day6 = @flat.assignments.where(deadline: Date.today + 6)
  end
end
