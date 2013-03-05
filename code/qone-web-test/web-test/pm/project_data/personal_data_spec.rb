require_relative '../../load_helper'
module WebTest
  module Pm
    module ProjectData
      class PersonalDataSpec
        describe 'personal data page' do
          before :all do
            driver = Support::Login.login
            @page_container = WebDriver.create_page_container :pm, driver
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            @project_list_page = @page_container.project_list_page
            @personal_data_page = @page_container.personal_data_page

            @project_list_page.to_this_page
            project_name = @pm_profiles['project_list']['project_name']
            @project_list_page.enter_project project_name
            @personal_data_page.to_this_page
          end

          after :all do
            @page_container.close
          end
          describe 'menu and link page test?' do
            it 'menu page test' do
              expect_top_title = @pm_profiles['project_data']['personal_data']
              actual_top_title = @personal_data_page.top_title
              actual_top_title.should == expect_top_title
            end

            it 'member alteration button test ' do
              expect = @pm_profiles['project_data']['member_alteration_history']
              actual = @personal_data_page.member_alteration_menu_test
              actual.should == expect
            end


          end


        end #describe


      end # PersonalDataSpec
    end # ProjectData
  end # Pm
end #WebTest

