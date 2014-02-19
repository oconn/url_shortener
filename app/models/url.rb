class Url < ActiveRecord::Base
  validates_format_of :url, :with => URI::regexp(%w(http https)), presence: true
  validates :short_url, uniqueness: true, presence: true
  belongs_to :user
end
