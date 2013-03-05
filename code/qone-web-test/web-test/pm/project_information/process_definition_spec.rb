require_relative '../../load_helper'

module WebTest
  module Pm
    module ProjectInformation
      describe 'process definition page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm, driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @process_definition_page = @page_container.process_definition_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @process_definition_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link test' do

          it 'process definition menu click success?' do
            process_definition_title = @pm_profiles['project_information']['process_definition_title']
            actual_top_title = @process_definition_page.top_title
            actual_top_title.should == process_definition_title
          end

          it 'task split way tab be success? 'do
             task_split_way_tab_sign = @pm_profiles['project_information']['task_split_way_tab_sign']
            actual_sign = @process_definition_page.task_split_way_tab_check
            actual_sign.should == task_split_way_tab_sign
          end

          it 'import standard process page link'do
            import_standard_process_title = @pm_profiles['project_information']['import_standard_process_title']
            actual_title = @process_definition_page.import_standard_process_page_check
            actual_title.should == import_standard_process_title
          end

          it 'project template to import way page link'do
            select_import_way_title = @pm_profiles['project_information']['select_import_way_title']
            actual_title = @process_definition_page.project_template_import_way_page_check
            actual_title.should == select_import_way_title
          end

          it'project template to import from project template page link 'do
            import_from_project_template_title = @pm_profiles['project_information']['import_from_project_template_title']
             actual_title = @process_definition_page.project_template_import_from_project_template_page_check
            actual_title.should == import_from_project_template_title
          end

          it 'import from project to project import  page link'do
            project_import_title = @pm_profiles['project_information']['project_import_title']
             actual_title =  @process_definition_page.import_from_project_to_project_import_page_check
            actual_title.should == project_import_title
          end

          it'requirement to select import way page link'do
            select_import_way_title = @pm_profiles['project_information']['select_import_way_title']
            actual_title = @process_definition_page.requirement_to_select_import_way_page_check
            actual_title.should == select_import_way_title
          end

          it 'requirement to base line page link 'do
            select_title = @pm_profiles['project_information']['select_title']
            actual_title = @process_definition_page.requirement_to_base_line_page_check
            actual_title.should == select_title
          end

          it 'requirement to produce check page link'do
               select_title = @pm_profiles['project_information']['select_title']
            actual_title = @process_definition_page.requirement_to_produce_page_check
            actual_title.should == select_title
          end

          it 'view task information page link' do
            view_task_information_title = @pm_profiles['project_information']['view_task_information_title']
            actual_title = @process_definition_page.view_task_information_page_check
            actual_title.should == view_task_information_title
          end

          it 'view cut list page link' do
            view_cut_list_title = @pm_profiles['project_information']['view_cut_list_title']
            actual_title = @process_definition_page.view_cut_list_page_check
            actual_title.should == view_cut_list_title
          end

          it 'view cut reason page link' do
            view_cut_reason_title = @pm_profiles['project_information']['view_cut_reason_title']
            actual_title = @process_definition_page.view_cut_reason_page_check
            actual_title.should == view_cut_reason_title
          end

          it 'reference history project tab'do
             reference_history_project_tab_sign = @pm_profiles['project_information']['reference_history_project_tab_sign']
           actual_sign = @process_definition_page.reference_history_project_tab_check
           actual_sign.should == reference_history_project_tab_sign
          end

          it'gantt map page link'do
            gantt_map_title =@pm_profiles['project_information']['gantt_map_title']
           actual_title = @process_definition_page.gantt_map_page_check
            actual_title.should == gantt_map_title
          end

          it'receiving report page link'do
            receiving_report_title =@pm_profiles['project_information']['receiving_report_title']
             actual_title = @process_definition_page.receiving_report_page_check
            actual_title.should == receiving_report_title
          end

          it 'receiving_report_print_page_check'do
            receiving_report_print_title = @pm_profiles['project_information']['receiving_report_print_title']
            actual_title = @process_definition_page.receiving_report_print_page_check
            actual_title.should == receiving_report_print_title
          end
        end
      end
    end #ProjectInformation
  end # Pm
end # WebTest