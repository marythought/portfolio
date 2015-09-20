require "test_helper"

feature "OAuth::LoggingIn" do
  scenario "sign in with twitter works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter, {
                             uid: '12345',
                             info: { nickname: 'test_twitter_user' }
                             })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    click_on "Log in with Twitter"
    page.must_have_content "you are signed in"

    # Courtesy of: https://gist.github.com/ivanoats/7071730
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end

  scenario "sign in with github works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, { uid: '12345',
                                        info: { nickname: 'test_github_user' }
                                       })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    click_on "Log in with Github"
    page.must_have_content "you are signed in"

    # Courtesy of: https://gist.github.com/ivanoats/7071730
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end
end
