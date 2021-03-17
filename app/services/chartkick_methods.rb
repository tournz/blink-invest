class ChartkickMethods

  def self.pie_chart_method(users, project)
    pie_data = []
    total_funded = 0
    users.each do |user|
      user_project_amount = user.subscriptions.where(project: project).sum(&:amount)
      user_percentage = 100 * user_project_amount / project.amount
      user_percentage = user_percentage.round(0)
      total_funded += user_percentage
      pie_data << [user.name, user_percentage]
    end
    total_funded -= 100
    pie_data << ["Not funded", total_funded.abs]
  end
end
