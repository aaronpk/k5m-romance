class Shareholder < ActiveRecord::Base
  attr_accessible :code, :shares, :name
  has_many :votes
  has_many :questions
  
  def self.make_code
    unless defined?(@@romance) && defined?(@@business)
      @@romance = File.open(
        File.join(Rails.root,"lib","corpora","romance.txt")
      ).readlines
      @@business = File.open(
        File.join(Rails.root,"lib","corpora","business.txt")
      ).readlines
    end
    romance = @@romance.sample.strip
    business = @@business.sample.strip
    number = (rand(90)+10).to_s
    "#{romance}-#{business}-#{number}"
  end
  
end
