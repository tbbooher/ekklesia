class Issue < ActiveRecord::Base
  has_many :positions

  validates_presence_of :description

  def self.fetch(num)
    Issue.all.shuffle.slice(0..num)
  end
end
