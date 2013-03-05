require_relative '../../load_helper'

module WebTest
  module Pm
    module ProjectInformation
      describe 'project estimate page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm, driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @project_estimate_page = @page_container.project_estimate_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @project_estimate_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link test' do
=begin
          it 'base information menu click success?' do
            project_estimate_title = @pm_profiles['project_information']['project_estimate_title']
            actual_top_title = @project_estimate_page.top_title
            actual_top_title.should == project_estimate_title
          end

          it 'project estimate list tab check'do
           project_estimate_list_tab_sign = @pm_profiles['project_information']['project_estimate_list_tab_sign']
           actual_sign = @project_estimate_page.project_estimate_list_tab_check
            actual_sign.should == project_estimate_list_tab_sign
          end

          it 'estimate tracking tab check'do
            estimate_tracking_tab_sign = @pm_profiles['project_information']['estimate_tracking_tab_sign']
            actual_sign = @project_estimate_page.estimate_tracking_tab_check
            actual_sign.should == estimate_tracking_tab_sign
          end

          it 'project estimate list print page check'do
            project_estimate_list_print_page_title = @pm_profiles['project_information']['project_estimate_title']
            actual_title = @project_estimate_page.project_estimate_list_print_page_check
            actual_title.should == project_estimate_list_print_page_title
          end


          it 'start project estimate page check'do
            start_project_estimate_title = @pm_profiles['project_information']['start_project_estimate_title']
            actual_title = @project_estimate_page.start_project_estimate_page_check
            actual_title.should == start_project_estimate_title
          end

          it 'estimate expert tree page check'do
            person_tree_title = @pm_profiles['project_information']['person_tree_title']
               actual_title = @project_estimate_page.estimate_expert_tree_page_check
            actual_title.should == person_tree_title
          end

          it 'choose project module page check'do
              choose_project_module_title = @pm_profiles['project_information']['choose_project_module']
            actual_title = @project_estimate_page.choose_project_module_page_check
            actual_title.should == choose_project_module_title
          end

          it 'input offline estimate page check'do
            offline_estimate_title = @pm_profiles['project_information']['start_project_estimate_title']
            actual_title = @project_estimate_page.input_offline_estimate_page_check
            actual_title.should == offline_estimate_title
          end
=end
          it 'view offline estimate page check'do
            view_title = @pm_profiles['project_information']['start_project_estimate_title']
             actual_title = @project_estimate_page.view_offline_estimate_page_check
            actual_title.should == view_title
          end
        #
        #  it 'apply offline estimate page check'do
        #   apply_estimate_result = @pm_profiles['project_information']['apply_estimate_result']
        #   actual_title = @project_estimate_page.apply_to_project_page_check
        #    actual_title.should == apply_estimate_result
        #  end
        #
        #  it 'alter_offline_estimate_page_check'do
        #      alter_title = @pm_profiles['project_information']['start_project_estimate_title']
        #     actual_title = @project_estimate_page.alter_offline_estimate_page_check
        #    actual_title.should == alter_title
        #  end
        #
        #  it 'offline_estimate_print_page_check'do
        #     offline_estimate_print_title = @pm_profiles['project_information']['project_estimate_title']
        #     actual_title = @project_estimate_page.offline_estimate_print_page_check
        #    actual_title.should == offline_estimate_print_title
        #  end
        #
        #  it 'view_project_estimate_page_check'do
        #     view_title = @pm_profiles['project_information']['start_project_estimate_title']
        #     actual_title = @project_estimate_page.view_project_estimate_page_check
        #    actual_title.should == view_title
        #  end
        #
        #  it 'view_estimate_state_page_check'do
        #    view_estimate_state_title = @pm_profiles['project_information']['view_estimate_state_title']
        #    actual_title = @project_estimate_page.view_estimate_state_page_check
        #    actual_title.should == view_estimate_state_title
        #  end
        #
        #  it 'view_estimate_comment_page_check'do
        #    view_estimate_comment_title = @pm_profiles['project_information']['view_estimate_comment_title']
        #    actual_title = @project_estimate_page.view_estimate_comment_page_check
        #    actual_title.should == view_estimate_comment_title
        #
        #  end
        #
        #end
        #describe 'project estimate alter and 'do
        #   before :all do
        #     expert_name = @pm_profiles['project_information']['expert_name']
        #     @project_estimate_page.add_project_estimate_to_save(expert_name)
        #   end
        #
        #   after :all do
        #        @project_estimate_page. delete_project_estimate_by_row 1
        #   end
        #
        #  it 'alter_project_estimate_page_check'do
        #    alter_title = @pm_profiles['project_information']['start_project_estimate_title']
        #    actual_title = @project_estimate_page.add_project_estimate_to_save
        #    actual_title.should == alter_title
        #  end
        #end
        #
        # describe 'project estimate alter and 'do
        #   before :all do
        #     expert_name = @pm_profiles['project_information']['expert_name']
        #     @project_estimate_page.add_project_estimate_to_start expert_name
        #   end
        #
        #   after :all do
        #        @project_estimate_page. delete_project_estimate_by_row 1
        #   end
         end
      end
    end #ProjectInformation
  end # Pm
end # WebTest