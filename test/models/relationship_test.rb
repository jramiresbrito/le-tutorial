require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:joao).id,
                                     followed_id: users(:cica).id)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

  test "should follow and unfollow a user" do
    cica = users(:cica)
    joao = users(:joao)

    assert_not cica.following?(joao)
    cica.follow(joao)
    assert cica.following?(joao)
    assert joao.followers.include?(cica)
    cica.unfollow(joao)
    assert_not cica.following?(joao)
    assert_not joao.followers.include?(cica)
  end

  test "should not follow themselves" do
    joao = users(:joao)

    assert_not joao.following?(joao)
    assert_raise(User::InvalidStateException) { joao.follow(joao) }
    assert_not joao.following?(joao)
  end
end
