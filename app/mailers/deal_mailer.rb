class DealMailer < ApplicationMailer
  include Roadie::Rails::Automatic
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.deal_mailer.request.subject
  #
  def request_deal
    @user = params[:user] # Instance variable => available in view
    @deal = params[:deal]

    sql_query = " \
    SELECT tasks.name, tasks.description
    FROM deals
    JOIN assignments
    ON deals.assignment_id = assignments.id
    JOIN tasks
    ON assignments.task_id = tasks.id
    WHERE deals.id = #{@deal.id};"

    @initial_task = Deal.connection.execute(sql_query)[0]

    sql_query = " \
    SELECT tasks.name, tasks.description
    FROM deals
    JOIN assignments
    ON deals.assignment_proposal_id = assignments.id
    JOIN tasks
    ON assignments.task_id = tasks.id
    WHERE deals.id = #{@deal.id};"

    @proposal_task = Deal.connection.execute(sql_query)[0]

    sql_query = " \
    SELECT users.first_name, users.last_name, users.email
    FROM deals
    JOIN assignments
    ON deals.assignment_proposal_id = assignments.id
    JOIN tasks
    ON assignments.task_id = tasks.id
    JOIN users
    ON assignments.user_id = users.id
    WHERE deals.id = #{@deal.id};"

    @target_user = Deal.connection.execute(sql_query)[0]

    mail(to: @target_user["email"], subject: "#{@user.first_name} proposed you a deal for your task #{@proposal_task["name"]}")
    # This will render a view in `app/views/user_mailer`!
  end
end
