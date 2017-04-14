require "test_helper"

class PostTest < ActiveSupport::TestCase

  def test_presence_validations
    assert posts(:one).valid?
    refute posts(:untitled).valid?
    refute posts(:no_content).valid?
    refute posts(:orphan).valid?
  end
end
