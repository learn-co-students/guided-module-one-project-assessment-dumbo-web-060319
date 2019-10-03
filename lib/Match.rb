class Match < ActiveRecord::Base
  belongs_to :show
  belongs_to :wrestler_one, class_name: "Wrestler"
  belongs_to :wrestler_two, class_name: "Wrestler"
end

