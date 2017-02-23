class Job < ActiveRecord::Base
  attr_accessor :company_params

  extend FriendlyId
  enum status: [:pending, :published, :reproved, :removed]

  scope :visible, lambda {
    where(status: Job.statuses[:published]).order(updated_at: :desc)
  }
  scope :awaiting_approval, -> { where(status: Job.statuses[:pending]) }

  friendly_id :slug_candidates, use: [:slugged, :finders]
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
  validates :link, format: URI.regexp(%w(http https)), allow_blank: true

  def ad
    "Startup: <strong>#{company.title}</strong>" \
      "<br/>Área: <strong>#{category.title}</strong>" \
      "<br/>Regime de contratação: <strong>#{job_type.title}</strong>"
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def company_name
    company.title if company.present?
  end

  def slug_candidates
    [
      [:title, :company_name]
    ]
  end

  def search_data
    {
      title: title,
      description: description,
      company_name: company.title,
      job_type_name: job_type.title,
      category_name: category.title,
      location: location,
      status: status
    }
  end

  def remove(email, token)
    if author_email == email && self.token == token
      removed!
    else
      false
    end
  end

  def self.query(query, page)
    if query.nil?
      Job.visible.page(page)
    else
      search(
        query,
        where: {
          status: "published"
        },
        fields: [
          "title^10",
          "description",
          "location",
          "company_name",
          "job_type_name",
          "category_name"],
        page: page,
        per_page: 10)
    end
  end

  def send_mail_to_admins
    JobMailer.job_created(self).deliver_later
  end

  def send_approved_mail
    JobMailer.job_approved(self).deliver_later
  end

  def send_reproved_mail
    JobMailer.job_reproved(self).deliver_later
  end
end
