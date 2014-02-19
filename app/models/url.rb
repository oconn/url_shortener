class Url < ActiveRecord::Base
  validates_format_of :url, :with => URI::regexp(%w(http https)), presence: true, uniqueness: true
  validates :short_url, uniqueness: true, presence: true

  def self.gen_short_url
    short = (0...8).map { (65 + rand(26)).chr }.join
    # Url.select(:url short)
  end
end
