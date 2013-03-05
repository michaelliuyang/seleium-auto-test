require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'selenium-webdriver'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProjectReport
        class ProcessAssessReportPage < Common::BasePage
           include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::DriverExtensionAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_report = @pm_profiles['project_report']['project_report']
            process_assess_report = @pm_profiles['project_report']['process_assess_report']
            show_menu_by_js "pm_pr"
            menu_click process_assess_report
            #menu_click_for_hide project_report,process_assess_report
          end

           def top_title
            @driver[:css=>'#content h2'].text
          end

          def fill_out_the_assessment_records(assess_of_subject,assess_of_group_members,start_date,end_date)
            assessment_record_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            fill_in_assess_records(assess_of_subject,assess_of_group_members,start_date,end_date)
            sleep 2
            submit_button.click
            switch_window first_handle
          end

          def modify_assessment_records(assess_of_subject,assess_of_subject_for_modify,assess_of_group_members,start_date,end_date)
            data_list.operate(assess_of_subject,1,:edit,6)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            fill_in_assess_records(assess_of_subject_for_modify,assess_of_group_members,start_date,end_date)
            sleep 2
            submit_button.click
            switch_window first_handle
          end
          
          def look_assessment_records(assess_of_subject_for_modify)
            data_list.operate(assess_of_subject_for_modify,1,:view,6)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle 
            sleep 2
            close_button.click
            switch_window first_handle
          end
          def look_assess_report_detail(assess_of_subject_for_modify)
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{assess_of_subject_for_modify}'] div div a"
            data_list.operate(assess_of_subject_for_modify,1,str,1)
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,first_handle)
            detail_page_title = top_title
            sleep 3
            close_button.click
            switch_window first_handle
            detail_page_title
          end
          
          def delete_assessment_records(assess_of_subject_for_modify)
            data_list.operate(assess_of_subject_for_modify,1,:delete,6)
            sleep 5
            alert_ok
          end
         
          def find_records_by_name(assess_of_subject)
              data_list.data_exist? assess_of_subject,1
          end
          
          private
          def data_list
              records_name = @driver.find_element(:id=>'dataListTable_NFSDataList')
              qone_data_list(records_name)
          end
          def assessment_record_button 
            record_name = @pm_profiles['project_report']['fill_out_the_assessment_records']
            @driver.find_element(:link=>record_name)
          end
          def submit_button
            submit_name = @pm_profiles['project_report']['submit']
            @driver.find_element(:css =>"input[value='#{submit_name}']")
          end
          def close_button
            close_name = @pm_profiles['project_report']['close']
            @driver.find_element(:css =>"input[value='#{close_name}']")
          end
          def fill_in_assess_records(assess_of_subject,assess_of_group_members,start_date,end_date)
            fill_assess_of_subject.clear
            fill_assess_of_subject.send_keys(assess_of_subject)
            fill_assess_of_group_members.clear
            fill_assess_of_group_members.send_keys(assess_of_group_members)
            fill_start_date.input_date " "
            fill_start_date.input_date start_date
            fill_end_date.input_date " "
            fill_end_date.input_date end_date
          end
          def fill_assess_of_subject
            @driver.find_element(:name=>'reportTitle')
          end
          def fill_assess_of_group_members
            @driver.find_element(:name =>'evaluateTeam')
          end
          def fill_start_date
            qone_date(@driver,"id = 'startDate_id'")
          end
          def fill_end_date
            qone_date(@driver,"id ='endDate_id'")
          end
        end #ProcessAssessReportPage
      end #ProjectReport
    end #  Page
  end # Pm
end  # WebDriver