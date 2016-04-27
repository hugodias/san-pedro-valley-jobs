class Company < ActiveRecord::Base
  extend FriendlyId
  has_many :jobs

  friendly_id :title, :use => [:slugged, :finders]
end
