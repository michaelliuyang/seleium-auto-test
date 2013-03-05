require_relative '../../load_helper'

module WebTest
  module Rm
    module RequirementsTrack
      describe 'requirements task track  page' do
        before :all do
          @rm_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @sa_login_name =@rm_profiles['sa_login_name']
          @login_passwd =@rm_profiles['login_passwd']
          @driver = Support::Login.login(:name => @sa_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @requirements_task_track_page = @page_container.requirements_task_track_page
          @requirements_task_track_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'requirements task track page accessed?'do
          expect = @rm_profiles['requirements_track']['requirements_task_track']
          actual = @requirements_task_track_page.top_title
          actual.should == expect
        end
      end #describe
    end#ProductList
  end #Rm
end #Webtest