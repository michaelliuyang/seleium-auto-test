require_relative '../load_helper'

module WebTest
  module Login
    describe "login page" do
      before :all do
        @profiles = Helper::ReadProfiles
        browser = @profiles.browser
        driver = Selenium::WebDriver.for browser.to_sym
        @page_container = WebDriver.create_page_container :login,driver
      end

      after :all do
        @page_container.close
      end

      it "login should be success?" do
        url = @profiles.url
        login_name = @profiles.login_name
        login_pwd = @profiles.login_pwd
        login_page = @page_container.login_page("#{url}/pm").open
        login_page.login login_name,login_pwd
        login_page.current_url.should == "#{url}/pm/home/dashboard/dashboard.jsp"
      end
    end
  end
end