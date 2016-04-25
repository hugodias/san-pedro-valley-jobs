class Job < ActiveRecord::Base
  extend FriendlyId
  scope :published, -> { where(status: "published") }

  friendly_id :title, :use => [:scoped, :finders], :scope => :company
  searchkick language: "brazilian"

  paginates_per 10
  has_secure_token

  belongs_to :job_type
  belongs_to :category
  belongs_to :company

  validates :title, presence: true
  validates :job_type, presence: true
  validates :category, presence: true
  validates :company, presence: true
  validates :author, presence: true
  validates :author_email, presence: true
  validates :link, :format => URI::regexp(%w(http https)), allow_blank: true

  enum status: [:pending, :published, :reproved, :removed]

  after_create :send_mail_to_admins

  def search_data
    {
      title: title,
      description: description,
      company_name: company.title,
      location: location,
      status: status
    }
  end

  def remove(email, token)
    if self.author_email == email && self.token == token
      self.removed!
    else
      false
    end
  end

  def self.query(query, page)
    if query == "*"
      Job.published.page(page).order("created_at DESC")
    else
      self.search query,
        where: {status: "published"},
        fields: ['title^10', 'description', 'location', 'company_name'],
        page: page,
        per_page: 10
    end
  end

  def send_mail_to_admins
    JobMailer.job_created(self).deliver_later
  end
end
