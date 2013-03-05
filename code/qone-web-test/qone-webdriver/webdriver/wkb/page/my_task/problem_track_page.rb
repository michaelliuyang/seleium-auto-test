require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Wkb
    module Page
      module MyTask
        class ProblemTrackPage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction
          include Support::DriverExtensionAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            my_task = @wkb_profiles['my_task']['my_task']
            problem_track = @wkb_profiles['my_task']['problem_track']
            menu_click work_bench
            menu_click_for_hide my_task,problem_track
          end

          def alter_problem(alter_description)
            alter_button = table_a[1][18].find_elements(:tag_name => 'img')[0].click
            handles = @driver.window_handles
            current_handle = @driver.window_handle
            switch_alert_window(handles,current_handle)
            alter_page_description.clear
            alter_page_description.send_keys alter_description
            submit_button.click
            switch_window current_handle
          end

          def delete_problem
            delete_button = table_a[1][18].find_elements(:tag_name => 'img')[2].click
            alert_ok
          end

          def view_problem_title   #cha diyige
            table_problem_id(1).click
            handles = @driver.window_handles
            current_handle = @driver.window_handle
            switch_alert_window(handles,current_handle)
            view_problem_title = @driver[:tag_name => 'h2'].text
            close_button.click
            switch_window current_handle
            view_problem_title
          end

          def open_search_condition
            search_condition = @driver.find_element(:id => 'img_1')
            class_name = search_condition.attribute('class')
            if class_name == 'searchfold'
              search_condition.click
            end
          end

          def open_advanced_condition
            advanced_condition = @driver.find_element(:id => 'img_2')
            class_name = advanced_condition.attribute('class')
            if class_name == 'searchfold'
              advanced_condition.click
            end
          end

           def search_condition_group(id,submiter)
            open_search_condition
            open_advanced_condition
            cancel_default_condition
            search_condition_by_id(id)
            search_condition_by_submiter(submiter)
            click_search_button.click
          end

          def search_condition_by_id(id)
            id_condition_text.click
            id_condition_text.clear
            id_condition_text.send_keys id
          end

          def search_condition_by_submiter(submiter)
            submiter_condition_text.click
            submiter_condition_text.clear
            submiter_condition_text.send_keys submiter
          end

          def cancel_default_condition
            dealer_check_box.click
            problem_status_check_box.click
          end

          def match_id_condition(id)
            rows = total_row_number
             a = true
            (1...rows-1).each do |row|
              unless  table_problem_id(row).text== id
                a = nil
                end
            end
            a
          end

          def match_submiter_condition(submiter)
            rows = total_row_number
            a = true
            (1...rows-1).each do |row|
              unless table_problem_submiter(row).text == submiter
                a = nil
                end
            end
            a
          end

          def total_row_number
            record_number = record_count.text
            record_number.to_i
          end
          def record_count
           @driver.find_element(:id => 'NFSDataList_recordCount')
          end


          def table_problem_description
            table_a[1][1].find_element(:tag_name => 'div')
          end

          def table_a
            table_element = @driver.find_element(:id => 'dataListTable_NFSDataList')
            table = table table_element
          end

         def id_condition_text
            @driver.find_element(:id => 'problemId_id')
          end

         def submiter_condition_text
            @driver.find_element(:id => 'problemSubmmiter_id')
          end

          def click_search_button
            @driver.find_element(:class => 'ie6-button')
          end

          def dealer_check_box
            @driver.find_element(:id => 'dealerCheckbox')
          end

          def problem_status_check_box
            @driver.find_element(:id => 'statusCheckbox')
          end

          def click_id_condition
            @driver.find_element(:id => 'idCheckbox')
          end

          def click_submiter_condition
            @driver.find_element(:id => 'submmiterCheckbox')
          end

          def table_problem_submiter(row)
            table_a[row][5].find_element(:tag_name => 'div')
          end

          def table_problem_id(row)
            table_a[row][0].find_element(:tag_name => 'a')
          end

          def alter_page_description
            @driver.find_element(:name =>'description')
          end

          def submit_button
            @driver.find_element(:name => 'submit')
          end

          def close_button
            @driver.find_element(:name => 'return')
          end
        end # ProblemTrackPage
      end # MyTask
    end # Page
  end # Wkb
end # WebDriver