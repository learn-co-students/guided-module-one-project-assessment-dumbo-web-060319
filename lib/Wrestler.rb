class Wrestler < ActiveRecord::Base
  has_many :matches
  has_many :wrestler_one_matches, class_name: "Match", foreign_key: :wrestler_one_id # matches where I've fought as wrestler_one
  has_many :wrestler_two_matches, class_name: "Match", foreign_key: :wrestler_two_id # matches where I've fought as wrestler_two

  has_many :wrestler_twos, through: :wrestler_one_matches # wrestler twos that I've faced in matches as wrestler_one
  has_many :wrestler_ones, through: :wrestler_two_matches # wrestler ones that I've faced in matches as wrestler_two

  has_many :wrestler_one_shows, through: :wrestler_one_matches, class_name: 'Show', source: :show
  has_many :wrestler_two_shows, through: :wrestler_two_matches, class_name: 'Show', source: :show

  def shows
    wrestler_one_shows.concat(wrestler_two_shows)
  end

  def matches
    wrestler_one_matches.concat(wrestler_two_matches)
  end

  def opponents
    wrestler_twos.concat(wrestler_ones)
  end

  
end