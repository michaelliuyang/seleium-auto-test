require_relative '../../load_helper'

module WebTest
  module Pm
    module ProjectInformation
      describe 'base information page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm, driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @base_information_page = @page_container.base_information_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @base_information_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link test' do

          it 'base information menu click success?' do
            base_information_title = @pm_profiles['project_information']['base_information_title']
            actual_top_title = @base_information_page.top_title
            actual_top_title.should == base_information_title
          end

          it 'base information tab page link' do
            base_information_tab_title = @pm_profiles['project_information']['base_information_tab_title']
            actual_sign = @base_information_page.base_information_tab_check
            actual_sign.should == base_information_tab_title
          end

          it 'project staff tab page link' do
            project_staff_tab_sign = @pm_profiles['project_information']['project_staff_tab_sign']
            actual_sign = @base_information_page.project_staff_tab_check
            actual_sign.should == project_staff_tab_sign
          end

          it 'work condition tab page link' do
            work_condition_tab_sign = @pm_profiles['project_information']['work_condition_tab_sign']
            actual_sign = @base_information_page.work_condition_tab_check
            actual_sign.should == work_condition_tab_sign
          end

          it 'interested party tab page link' do

            interested_party_sign = @pm_profiles['project_information']['interested_party_sign']
            actual_sign = @base_information_page.interested_party_tab_check
            actual_sign.should == interested_party_sign
          end

          it 'person change page link' do
            person_chang_title = @pm_profiles['project_information']['person_chang_title']
            actual_title = @base_information_page.person_change_page_check
            actual_title.should == person_chang_title
          end

          it 'person change tree page link' do
            change_person_tree_title = @pm_profiles['project_information']['person_tree_title']
            actual_title =@base_information_page.change_person_tree_page_check
            actual_title.should == change_person_tree_title
          end

          it 'project person tree page link' do
            project_person_title = @pm_profiles['project_information']['person_tree_title']
            actual_title =@base_information_page.project_person_tree_page_check
            actual_title.should == project_person_title
          end

          it 'project qa tree page link' do
            project_qa_title = @pm_profiles['project_information']['person_tree_title']
            actual_title =@base_information_page.project_qa_tree_page_check
            actual_title.should == project_qa_title
          end

          it 'project ma tree page link' do
            project_ma_title = @pm_profiles['project_information']['person_tree_title']
            actual_title =@base_information_page.project_ma_tree_page_check
            actual_title.should == project_ma_title
          end

          #it 'project role page link' do #youwenti
          #  project_role_sign = @pm_profiles['project_information']['project_role_sign']
          #  actual_sign =@base_information_page.project_role_page_check
          #  actual_sign.should == project_role_sign
          #end

          it 'person change history page link' do
            person_change_history_title = @pm_profiles['project_information']['person_change_history_title']
            actual_title =@base_information_page.person_change_history_page_check
            actual_title.should == person_change_history_title
          end

          it 'person change history view page link' do
            person_change_history_title = @pm_profiles['project_information']['person_change_history_title']
            actual_title =@base_information_page.person_change_history_view_page_check
            actual_title.should == person_change_history_title
          end

          it 'project work environment page link' do
            project_work_environment_title = @pm_profiles['project_information']['project_work_environment_title']
            actual_title = @base_information_page.project_work_environment_page_check
            actual_title.should == project_work_environment_title
          end

          it 'standard work environment page link' do
            standard_work_environment_title = @pm_profiles['project_information']['standard_work_environment_title']
            actual_title = @base_information_page.standard_work_environment_page_check
            actual_title.should == standard_work_environment_title
          end

          it 'new add page link' do
            new_add_title = @pm_profiles['project_information']['new_add_title']
            actual_title = @base_information_page.new_add_page_check
            actual_title.should == new_add_title
          end

          it 'import organization link' do
            person_tree_title = @pm_profiles['project_information']['person_tree_title']
            actual_title = @base_information_page.import_organization_page_check
            actual_title.should == person_tree_title
          end

          it 'interested party view link' do
            interested_part_view_title = @pm_profiles['project_information']['interested_part_view_title']
            actual_title = @base_information_page.interested_party_view_page_check
            actual_title.should == interested_part_view_title
          end

          it 'interested party alter link' do
            interested_part_alter_title = @pm_profiles['project_information']['interested_part_alter_title']
            actual_title = @base_information_page.interested_party_alter_page_check
            actual_title.should == interested_part_alter_title
          end
        end
      end
    end #ProjectInformation
  end # Pm
end # WebTest