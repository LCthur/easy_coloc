class FlatsController < ApplicationController
  def index
    @flat = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @assignments_done = @flat.assignments.where(done_state: true).order(updated_at: :desc)
    @assignments_today_late = @flat.assignments.where("deadline <= ?", Date.today).where(done_state: false).order(deadline: :asc)
    @assignments_day1 = @flat.assignments.where(deadline: Date.today + 1).where(done_state: false)
    @assignments_day2 = @flat.assignments.where(deadline: Date.today + 2).where(done_state: false)
    @assignments_day3 = @flat.assignments.where(deadline: Date.today + 3).where(done_state: false)
    @assignments_day4 = @flat.assignments.where(deadline: Date.today + 4).where(done_state: false)
    @assignments_day5 = @flat.assignments.where(deadline: Date.today + 5).where(done_state: false)
    @assignments_day6 = @flat.assignments.where(deadline: Date.today + 6).where(done_state: false)
  end
end
