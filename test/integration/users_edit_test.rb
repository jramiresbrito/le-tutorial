require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:joao)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: '',
                                              email: 'foo@bar',
                                              password: 'foo',
                                              password_confirmation: 'bar' } }
    assert_template 'users/edit'
  end

  test 'flash messages display 3 errors if patchs with all fields empty' do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), params: { user: { name: '',
                                              email: '',
                                              password: '',
                                              password_confirmation: '' } }
    assert_select 'div.alert', text: 'The form contains 3 errors.'
    assert_select 'li', text: "Name can't be blank"
    assert_select 'li', text: "Email can't be blank"
    assert_select 'li', text: "Email is invalid"
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = 'Foo Bar'
    email = 'foo@bar.com'
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: '',
                                              password_confirmation: '' } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
