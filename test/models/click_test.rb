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
require 'test_helper'

class ClickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
