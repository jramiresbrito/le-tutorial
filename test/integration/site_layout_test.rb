require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select   'a[href=?]', root_path, count: 2
    assert_select   'a[href="https://github.com/jramiresbrito"]'
    assert_select   'a[href="https://linkedin.com/in/joaoramires"]'
    assert_select   'a[href=?]', signup_path
    assert_select   'a[href=?]', login_path
    get signup_path
    assert_select 'title', full_title('Sign Up')
    user = users(:joao)
    log_in_as(user)
    get root_path
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href="https://github.com/jramiresbrito"]'
    assert_select 'a[href="https://linkedin.com/in/joaoramires"]'
    assert_select 'a[href=?]', users_path
    assert_select 'a[href=?]', user_path(user)
    assert_select 'a[href=?]', edit_user_path(user)
  end
end
