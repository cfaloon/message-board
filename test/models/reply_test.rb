require "test_helper"

class ReplyTest < ActiveSupport::TestCase

  def test_presence_validations
    assert replies(:one).save
  end
end
