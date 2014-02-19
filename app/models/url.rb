class Url < ActiveRecord::Base
  validates_format_of :url, :with => URI::regexp(%w(http https)), presence: :true
end
