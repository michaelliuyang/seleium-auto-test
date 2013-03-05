require_relative '../../load_helper'

module WebTest
  module Rm
    module RequirementsTrack
      describe 'requirements track matrix page' do
        before :all do
          @rm_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @sa_login_name =@rm_profiles['sa_login_name']
          @login_passwd =@rm_profiles['login_passwd']
          @driver = Support::Login.login(:name => @sa_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @requirements_track_matrix_page = @page_container.requirements_track_matrix_page
          @requirements_track_matrix_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'requirements track matrix page accessed?'do
          expect = @rm_profiles['requirements_track']['requirements_track_matrix']
          actual = @requirements_track_matrix_page.top_title
          actual.should == expect
        end
      end #describe
    end#ProductList
  end #Rm
end #Webtest