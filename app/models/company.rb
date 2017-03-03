class Company < ActiveRecord::Base
  extend FriendlyId
  has_many :jobs, -> { Job.visible }
  paginates_per 40

  friendly_id :title, use: [:slugged, :finders]

  validates_uniqueness_of :title, :case_sensitive => false

end
