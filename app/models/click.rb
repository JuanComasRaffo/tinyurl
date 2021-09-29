# == Schema Information
#
# Table name: clicks
#
#  id         :bigint           not null, primary key
#  url_id     :bigint
#  ip         :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Click < ApplicationRecord
  belongs_to :url, counter_cache: true
end
