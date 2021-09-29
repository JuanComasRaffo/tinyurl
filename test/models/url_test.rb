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
require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
