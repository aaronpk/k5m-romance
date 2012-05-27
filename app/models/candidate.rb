class Candidate < ActiveRecord::Base
  attr_accessible :name, :text
  has_many :questions
  has_many :votes

  def percent_yes
    vote_summary[:yes_percent]
  end

  def percent_no
    vote_summary[:no_percent]
  end

  def vote_summary
    votes_yes = Shareholder.joins(:votes).where(:votes => {:value => 1}).collect{|s| s.shares}.sum
    votes_no = Shareholder.joins(:votes).where(:votes => {:value => 0}).collect{|s| s.shares}.sum
    {
      total: votes_yes + votes_no,
      yes: votes_yes,
      no: votes_no,
      yes_percent: (votes_yes * 100.0 / (votes_yes + votes_no)).round,
      no_percent: (votes_no * 100.0 / (votes_yes + votes_no)).round
    }
  end
end
