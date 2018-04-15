class Meal < ApplicationRecord
  #scope :today, -> {
  #  where("created_at > ?", Time.now.beginning_of_day)
  #}

  scope :today, -> {
    where("start_time > ?", Time.now.beginning_of_day)
  }

  #Meal.group("DATE(start_time)").sum(:calories)
  #Meal.order("DATE(start_time)").group("DATE(start_time)").sum(:calories)

  belongs_to :user
end
