class VoteHistory < ActiveRecord::Base
  attr_accessible :value, :candidate_text, :candidate_id, :shareholder_id
  belongs_to :candidate
  belongs_to :shareholder
  validates_presence_of :value, :candidate_id, :shareholder_id
end
