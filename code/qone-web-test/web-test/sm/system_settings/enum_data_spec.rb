require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemSettings
      
      describe 'enum data page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :sm,driver
          @page_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @data_profiles = Helper::ReadProfiles.data :sm
          @enum_data_page = @page_container.enum_data_page
          @enum_data_page.to_this_page
        end
      
        after :all do
          @page_container.close
        end
        
        it 'enum data menu click success?' do
          enum_data_menu_name = @page_profiles['system_settings']['enum_data']
          actual_top_title = @enum_data_page.top_title
          actual_top_title.should == enum_data_menu_name
        end

        describe 'doc_type page test success?' do

          before :each do
            @doc_type = @page_profiles['system_settings']['doc_type']
            @enum_data_page.select_enum_data @doc_type
          end

          it 'page correct test' do
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == @doc_type
          end

          it 'add enum data' do
            name = @data_profiles['doc_type']['name']
            description = @data_profiles['doc_type']['description']
            expect_text = @page_profiles['system_settings']['notice_success']
            actual = @enum_data_page.add_enum_data(name,description)
            actual.should == expect_text
          end

          it 'del enum data ' do








          end

        end  #describe doc_type

        describe 'project_character_type test success? ' do

          it 'page correct test' do
            project_character_type = @page_profiles['system_settings']['project_character_type']
            @enum_data_page.select_enum_data project_character_type
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == project_character_type
          end

        end  #describe project_character_type

        describe 'Bug enum type page test success?' do

          before :each do
            bug_enum_type = @page_profiles['system_settings']['bug_enum_type']
            @enum_data_page.select_enum_data bug_enum_type
          end

          it 'page correct test' do
            expect_text = @page_profiles['system_settings']['bug_class']
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == expect_text
          end

          it 'bug resolve method tab click ' do
            expect_text = @page_profiles['system_settings']['bug_resolve_method']
            @enum_data_page.bug_resolve_method_tab_click
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == expect_text
          end

          it 'bug priority tab click' do
            expect_text = @page_profiles['system_settings']['bug_priority']
            @enum_data_page.bug_priority_tab_click
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == expect_text
          end

          it 'bug class tab click' do
            expect_text = @page_profiles['system_settings']['bug_class']
            @enum_data_page.bug_class_tab_click
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == expect_text
          end

           it 'bug severity tab click' do
            expect_text = @page_profiles['system_settings']['bug_severity']
            @enum_data_page.bug_severity_tab_click
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == expect_text
           end

        end  #describe bug_enum_data_type

        describe 'variable cost type page test success?' do
          before :each do
            @variable_cost_type = @page_profiles['system_settings']['variable_cost_type']
            @enum_data_page.select_enum_data @variable_cost_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @variable_cost_type
          end

        end #describe variable cost type

        describe 'department report page test success?' do
          before :each do
            @department_report_type = @page_profiles['system_settings']['department_report_type']
            @enum_data_page.select_enum_data @department_report_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @department_report_type
          end

        end #describe department report page

        describe 'conference_summary_type page test success?' do

          before :each do
            @conference_summary_type = @page_profiles['system_settings']['conference_summary_type']
            @enum_data_page.select_enum_data @conference_summary_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @conference_summary_type
          end

        end #describe conference_summary_type

        describe ' nci_severity_type page test success?' do

          before :each do
            @nci_severity = @page_profiles['system_settings']['nci_severity']
            @enum_data_page.select_enum_data @nci_severity
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @nci_severity
          end

        end #describe nci_severity

        describe 'no_plan_task_type page test success?' do

          before :each do
            @no_plan_task_type = @page_profiles['system_settings']['no_plan_task_type']
            @enum_data_page.select_enum_data @no_plan_task_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @no_plan_task_type
          end

        end #describe no_plan_task_type

        describe 'process_type page test success?' do

          before :each do
            @process_type = @page_profiles['system_settings']['process_type']
            @enum_data_page.select_enum_data @process_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @process_type
          end

        end #describe process_type

          describe 'project_report_type page test success?' do

          before :each do
            @project_report_type = @page_profiles['system_settings']['project_report_type']
            @enum_data_page.select_enum_data @project_report_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @project_report_type
          end

          end #describe project_report_type

        describe 'work_product_bug_type page test success?' do

          before :each do
            @work_product_bug_type = @page_profiles['system_settings']['work_product_bug_type']
            @enum_data_page.select_enum_data @work_product_bug_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @work_product_bug_type
          end

        end #describe project_report_type

        describe 'task_type page test success?' do

          before :each do
            @task_type = @page_profiles['system_settings']['task_type']
            @enum_data_page.select_enum_data @task_type
          end

          it 'page correct test' do
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == @task_type
          end

        end #describe project_report_type

        describe 'baseline_type page test success?' do

          before :each do
            baseline_type = @page_profiles['system_settings']['baseline_type']
            @enum_data_page.select_enum_data baseline_type
          end

          it 'page correct test' do
            expect_text = @page_profiles['system_settings']['baseline_type_name']
            actual_page_text = @enum_data_page.return_name_field_text_in_datalist
            actual_page_text.should == expect_text
          end

        end #describe baseline_type

        describe 'data manage plan page test success?' do

          before :each do
            data_manage_plan_enum_type = @page_profiles['system_settings']['data_manage_plan_enum_type']
            @enum_data_page.select_enum_data data_manage_plan_enum_type
          end

          it 'page correct test' do
            expect_text = @page_profiles['system_settings']['control_level']
            actual = @enum_data_page.control_level_tab_text
            actual.should == expect_text
          end

          it 'control level tab click'do
            expect_text = @page_profiles['system_settings']['control_level']
            @enum_data_page.control_level_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
          end

          it 'format tab click' do
             expect_text = @page_profiles['system_settings']['format']
             @enum_data_page.format_tab_click
             actual_page_text = @enum_data_page.return_name_field_text_in_datalist
             actual_page_text.should == expect_text
          end

          it 'confidential tab click' do
             expect_text = @page_profiles['system_settings']['confidential']
             @enum_data_page.confidential_tab_click
             actual_page_text = @enum_data_page.return_name_field_text_in_datalist
             actual_page_text.should == expect_text
          end

           it 'state tab click' do
             expect_text = @page_profiles['system_settings']['state']
             @enum_data_page.state_tab_click
             actual_page_text = @enum_data_page.return_name_field_text_in_datalist
             actual_page_text.should == expect_text
          end

        end  #describe data manage plan page

        describe 'problem enum data test success?' do

          before :each do
            problem_enum_data = @page_profiles['system_settings']['problem_enum_data']
            @enum_data_page.select_enum_data problem_enum_data
          end

          it 'page correct test' do
            expect_text = @page_profiles['system_settings']['problem_type']
             actual =@enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
          end

           it 'problem tab click' do
            expect_text = @page_profiles['system_settings']['problem_type']
             @enum_data_page.problem_type_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
          end

          it 'problem_severity tab click' do
            expect_text = @page_profiles['system_settings']['problem_severity']
            @enum_data_page.problem_severity_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
          end

        end   # describe problem enum data

         describe 'risk enum data test success?' do

         before :each do
            risk_enum_data = @page_profiles['system_settings']['risk_enum_data_type']
            @enum_data_page.select_enum_data risk_enum_data
         end

         it 'page correct test' do
            expect_text = @page_profiles['system_settings']['risk_type']
             actual =@enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

         it 'risk type tab ' do
            expect_text = @page_profiles['system_settings']['risk_type']
             @enum_data_page.risk_type_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

           it 'risk_probability tab  click' do
            expect_text = @page_profiles['system_settings']['risk_probability']
             @enum_data_page.risk_probability_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

         it 'risk_influence tab click' do
            expect_text = @page_profiles['system_settings']['risk_influence']
            @enum_data_page.risk_influence_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

           it 'risk_domain_value tab click' do
            expect_text = @page_profiles['system_settings']['risk_domain_value']
            @enum_data_page.risk_domain_value_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
           end

            it 'risk_level tab click' do
            expect_text = @page_profiles['system_settings']['risk_level']
            @enum_data_page.risk_level_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

         end  # describe risk enum data

         describe 'stakeholders_plan_enum_data test success?' do

         before :each do
            stakeholders_plan_enum_data = @page_profiles['system_settings']['stakeholders_plan_enum_data']
            @enum_data_page.select_enum_data stakeholders_plan_enum_data
         end

         it 'page correct test' do
            expect_text = @page_profiles['system_settings']['stakeholders_type']
             actual =@enum_data_page.stakeholders_type_tab_text
            actual.should == expect_text
         end

           it 'stakeholders_activity_type tab  click' do
            expect_text = @page_profiles['system_settings']['stakeholders_activity_type']
             @enum_data_page.stakeholders_activity_type_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

         it 'to_project_attitude tab click' do
            expect_text = @page_profiles['system_settings']['to_project_attitude']
            @enum_data_page.to_project_attitude_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

           it 'participation_way tab click' do
            expect_text = @page_profiles['system_settings']['participation_way']
            @enum_data_page.participation_way_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
           end

            it 'stakeholders_type tab click' do
            expect_text = @page_profiles['system_settings']['stakeholders_type']
            @enum_data_page.stakeholders_type_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

         end  # describe stakeholders_plan_enum_data


           describe 'scale_unit_enum_data  test success?' do

         before :each do
            scale_unit_enum_data = @page_profiles['system_settings']['scale_unit_enum_data']
            @enum_data_page.select_enum_data scale_unit_enum_data
         end

         it 'page correct test' do
            expect_text = @page_profiles['system_settings']['software_scale_unit']
             actual =@enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

           it 'software_scale_unit tab  click' do
            expect_text = @page_profiles['system_settings']['software_scale_unit']
             @enum_data_page.software_scale_unit_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end


            it 'work_product_scale_unit tab click' do
            expect_text = @page_profiles['system_settings']['work_product_type']
            @enum_data_page.work_product_scale_unit_tab_click
            actual = @enum_data_page.return_name_field_text_in_datalist
            actual.should == expect_text
         end

         end  # describe risk enum data



      end  #describe enum data
    end # SystemSettings
  end # Sm
end # WebTest