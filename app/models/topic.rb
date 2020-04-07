class Topic < ApplicationRecord
  belongs_to :admin_user

  validates_presence_of :title, :body

  validates :slug, uniqueness: true, allow_blank: true

  before_create :set_slug
  before_update :set_slug
  before_save   :set_seo_keywords, :set_seo_description  

  default_scope -> { order('sort_number ASC') }

  def set_slug
    if self.slug.blank?
      self.slug = PinYin.of_string(title.gsub(/\s/, '')).join('-')
    end
  end

  def set_seo_keywords
    if not self.seo_keywords.blank?
      self.seo_keywords = self.seo_keywords.gsub(/,|，/, ',').gsub(/\s/, '')
    end
  end

  def set_seo_description
    if self.seo_description.blank?
      self.seo_description = ActionView::Base.full_sanitizer.sanitize(body).first(200)
    end
  end

  def keyword_list
    self.seo_keywords.split(/,|，/)
  end

  def summary
    ActionView::Base.full_sanitizer.sanitize(body).first(300)
  end

end
