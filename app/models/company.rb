class Company < ActiveRecord::Base
  extend FriendlyId
  has_many :jobs
  paginates_per 40

  friendly_id :title, :use => [:slugged, :finders]
end
