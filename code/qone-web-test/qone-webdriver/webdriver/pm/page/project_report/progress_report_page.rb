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
          class ProgressReportPage < Common::BasePage
               include Support::MenuAction
               include Support::SwitchAction
               include Support::Component
               include Support::DriverExtensionAction

               def to_this_page
                 @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                 project_report = @pm_profiles['project_report']['project_report']
                 progress_report = @pm_profiles['project_report']['progress_report']
                 show_menu_by_js "pm_pr"
                 menu_click progress_report
                 #menu_click_for_hide project_report,progress_report
                 sleep 2
               end
               def top_title
                 @driver[:css=>'#content h2'].text
               end
               def propare_progress_report(create_progress_report_type,report_name_for_add,current_for_add,review_situation_for_add,resoureces_for_add,training_for_add,major_problem_for_add,work_summary_for_add,next_stage_for_add)
                   select_progress_report_type.select_by_text create_progress_report_type
                   first_handle = @driver.window_handle
                   handles = @driver.window_handles
                   switch_alert_window(handles,first_handle)
                   fill_in_progress_report(report_name_for_add,current_for_add,review_situation_for_add,resoureces_for_add,training_for_add,major_problem_for_add,work_summary_for_add,next_stage_for_add)
                   sleep 3
                   page_title = top_title
                   formal_submit.click
                   switch_window first_handle
                   page_title
               end
               def report_information_by_name report_name_for_find
                   report_name_click_super_link report_name_for_find
                   first_handle = @driver.window_handle
                   handles = @driver.window_handles
                   switch_alert_window(handles,first_handle)
                   page_title = top_title
                   value_close_button.click
                   switch_window first_handle
                   page_title
               end
               def add_reply_by_report_name(report_name_for_find,reply_for_add)
                   data_list = qone_data_list(report_table) 
                   data_list.operate('1',0,:b_evaluate,6)
                   first_handle = @driver.window_handle
                   handles = @driver.window_handles
                   switch_alert_window(handles,first_handle)
                   page_title = top_title
                   add_reply.send_keys(reply_for_add)
                   sleep 3
                   preservation_button.click
                   switch_window first_handle  
                   page_title  
               end
               
               
               private
               def report_table
                 @driver.find_element(:id => 'dataListTable_NFSDataList')   
               end
               
               def select_progress_report_type
                 report_element = @driver.find_element(:id => 'typeId_input')
                 qone_select(@driver,report_element)
               end
               def fill_in_progress_report(report_name_for_add,current_for_add,review_situation_for_add,resoureces_for_add,training_for_add,major_problem_for_add,work_summary_for_add,next_stage_for_add)
                   report_name.send_keys(report_name_for_add)
                   current_phase_of_project.send_keys(current_for_add)
                   review_condition_track.send_keys(review_situation_for_add)
                   resource_tracking.send_keys(resoureces_for_add)
                   training_track.send_keys(training_for_add)
                   major_problem_analysis.send_keys(major_problem_for_add)
                   work_summary.send_keys(work_summary_for_add)
                   next_job_arrangement.send_keys(next_stage_for_add)  
               end
               def report_name_click_super_link report_name_for_find
                 @driver.find_element(:link => report_name_for_find).click
               end
               def report_name
                 @driver.find_element(:name =>'reportName')
               end
               def current_phase_of_project
                 @driver.find_element(:name =>'currentPhase')
               end
               def review_condition_track
                 @driver.find_element(:id =>'review')
               end
               def resource_tracking
                 @driver.find_element(:name => 'otherResource')
               end
               def training_track
                 @driver.find_element(:id =>'training')
               end
               def major_problem_analysis
                 @driver.find_element(:id =>'importantProblemInfo')
               end
               def work_summary
                 @driver.find_element(:id =>'summarize')
               end
               def next_job_arrangement
                 @driver.find_element(:id => 'nextArrangement')
               end
               def formal_submit
                 @driver.find_element(:id=> 'formallySubmit')
               end
               def close_button
                 @driver.find_element(:id => 'closeBtn')
               end
               def value_close_button
                 close_name= @pm_profiles['project_report']['close']
                 @driver.find_element(:css =>"input[value = '#{close_name}']")
               end
               def add_reply
                 @driver.find_element(:id =>'adComment')
               end
               def preservation_button
                 @driver.find_element(:id =>'submitBtn')
               end


            end #ProgressReportPage
      end #ProjectReport
    end #  Page
  end # Pm
end  # WebDriver
