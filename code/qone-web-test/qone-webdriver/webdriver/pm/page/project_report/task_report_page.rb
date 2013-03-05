require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'


module WebDriver
  module Pm
    module Page
      module ProjectReport
        class TaskReportPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::DriverExtensionAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_report = @pm_profiles['project_report']['project_report']
            task_report = @pm_profiles['project_report']['task_report']
            show_menu_by_js "pm_pr"
            menu_click task_report
            #menu_click_for_hide(project_report,task_report)
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end
          
          def examination_and_approval_task_report(task_report_for_approval,examination_conclution)
            data_list = qone_data_list(task_report_table,"style*='display:none'",:all)
            data_list.operate(task_report_for_approval,1,:b_evaluate,12)
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,first_handle)
            sleep 3
            approveal_page_title = top_title
            examination_select = qone_select(@driver,select_list)
            examination_select.select_by_text examination_conclution
            close_button.click
            switch_window first_handle
            approveal_page_title
          end
          
          def look_task_report(task_report_for_look)
            data_list = qone_data_list(task_report_table,"style*='display:none'",:all)
            data_list.operate(task_report_for_look,1,:view,12)
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,first_handle)
            look_page_title = top_title
            sleep 3
            close_button.click
            switch_window first_handle
            look_page_title
          end
          
          def look_task_report_detail(task_report_for_look)
            str = "table[id='dataListTable_taskDataList'] tr td[title='#{task_report_for_look}'] div div a"
            data_list = qone_data_list(task_report_table,"style*='display:none'",:all)
            data_list.operate(task_report_for_look,1,str,1)
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,first_handle)
            detail_page_title = top_title
            close_value_button.click
            switch_window first_handle
            detail_page_title
          end
    
          private
          
          def task_report_table
            @driver.find_element(:id =>'dataListTable_taskDataList')
          end

          def close_button
            @driver.find_element(:id =>'ext-gen109')
          end

          def close_value_button
            close_name = @pm_profiles['project_report']['close']
            @driver.find_element(:css =>"input[value = '#{close_name}']")
          end

          def submit_button
            @driver.find_element(:id =>'ext-gen89')
          end

          def select_list
            @driver.find_element(:id =>'detailconclusion')
          end
          

        end #TaskReportPage
      end #ProjectReport
    end # Page
  end # Pm
end  # WebDriver
