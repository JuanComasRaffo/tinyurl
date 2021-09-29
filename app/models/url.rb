# == Schema Information
#
# Table name: urls
#
#  id           :bigint           not null, primary key
#  short_url    :string           not null
#  initial_url  :string           not null
#  clicks_count :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Url < ApplicationRecord
  MAX_LENGTH = 6
  validates :short_url, :initial_url, uniqueness: true
  validates :short_url, length: { maximum: MAX_LENGTH }
  validate :is_valid_url
  before_save :create_short_url
  has_many :clicks

  private

  def create_short_url
    self.short_url = (0...MAX_LENGTH).map{('A'..'Z').to_a[rand(26)]}.join
  end

  def is_valid_url
    uri =  URI.parse(self.initial_url)
    unless uri.is_a?(URI::HTTP) && !uri.host.nil?
      errors.add(:initial_url, "INVALID URL")
    end
  end
end
