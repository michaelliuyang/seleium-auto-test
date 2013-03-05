require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
module WebDriver
  module Pm
    module Page
      module RiskProblem
        class ProblemManagePage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            risk_problem = @pm_profiles['risk_problem']['risk_problem']
            problem_manage = @pm_profiles['risk_problem']['problem_manage']
            menu_click_for_hide risk_problem, problem_manage
          end

          def add_problem_page_check
            add_problem_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            title = problem_top_title
            close_button.click
            switch_window current_handle
            title
          end

          def add_problem_to_task_page_check
            add_problem_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            sign_assign_task.click
            select_task.click
            handles = @driver.window_handles
            switch_three_window handles,first_handle,second_handle
            title = problem_top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def import_problem_page_check
            import_problem_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            import_problem = table import_export_problem_table
            sign = import_problem[0][0].text
            close1.click
            switch_window current_handle
            sign
          end

          def export_problem_page_check
            export_problem_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            export_problem = table import_export_problem_table
            sign = export_problem[2][0].text
            close1.click
            switch_window current_handle
            sign
          end

          def view_problem_page_check
            problem_list = table problem_list_table
            problem_list[1][2].find_element(:tag_name => 'a').click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            title = problem_top_title
            close1.click
            switch_window current_handle
            title
          end

          def view_problem_print_page_check
            problem_list = table problem_list_table
            problem_list[1][2].find_element(:tag_name => 'a').click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            print_button.click
            sleep 5
            handles =@driver.window_handles
            switch_three_window handles, first_handle, second_handle
            print_page_title1 =print_page_title.text
            @driver.close
            switch_window second_handle
            close_button.click
            switch_window first_handle
            print_page_title1
          end

          def problem_list_print_page_check
            print_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            print_page_title1 =print_page_title.text
            @driver.close
            switch_window current_handle
            print_page_title1
          end

          def alter_problem_page_check
            alter_button = @pm_profiles['risk_problem']['alter']
            problem_list = table problem_list_table
            problem_list[1][18].find_element(:css => "img[title =#{alter_button}]").click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            title = problem_top_title
            close_button.click
            switch_window current_handle
            title
          end

          def turn_task_page_check
            check_task_list
            problem_list = table problem_list_table
            rows = problem_list.row_count
            (1..rows-2).each do |row|
              task_information = problem_list[row][16].find_element(:tag_name => 'a')
              if task_information.attribute('href') != 'taskView.do?taskId=null'
                problem_list[row][16].find_element(:tag_name => 'a').click
                break
              end
            end
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, current_handle
            title = top_title
            close1.click
            switch_window current_handle
            title
          end

          def change_identify_problem_tab_page_check
             identify_problem_tab.click
            top_title
          end

          private

          def sign_assign_task
            @driver[:name => 'assignTask']
          end

          def select_task
            @driver[:name => 'selectparent']
          end

          def identify_problem_tab
            identify_problem = @pm_profiles['risk_problem']['identify_problem']
            @driver.find_element(:class => 'dh_menu').find_element(:link => identify_problem )
          end

          def check_task_list
            problem_list = table problem_list_table
            d = problem_list[0][2].find_element(:id => 'columnSpan')
            @driver.mouse.move_to d
            problem_list[0][2].find_element(:class => 'column-util').click
            column_menu = @driver.find_element(:id => 'utilMenu_dataListTable_NFSDataList').find_elements(:tag_name =>'li')[3]
            @driver.mouse.move_to column_menu
            @driver.find_element(:class => 'columnMenu').find_elements(:tag_name => 'li')[16].find_element(:tag_name => 'a').click
          end

          def print_page_title
            @driver[:class => 's1']
          end

          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
                @driver.switch_to.window(handle)
              end
            end
          end

          def print_button
            print = @pm_profiles['risk_problem']['print_button']
            @driver.find_element(:css => "input[value = #{print}]")
          end

          def problem_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def add_problem_button
            add_problem = @pm_profiles['risk_problem']['add_problem']
            @driver[:link => add_problem]
          end

          def problem_top_title
            @driver[:css => '#addContent h2'].text
          end

          def import_problem_button
            import_problem = @pm_profiles['risk_problem']['import_problem']
            @driver[:link => import_problem]
          end

          def import_export_problem_table
            @driver[:class => 'addTable']
          end

          def export_problem_button
            export_problem = @pm_profiles['risk_problem']['export_problem']
            @driver[:link => export_problem]
          end

          def close_button
            @driver[:name => 'return']
          end

          def close1
            close = @pm_profiles['risk_problem']['close_button']
            @driver[:css => "input[value = '"+"#{close}"+"']"]
          end

        end #ProblemManagePage
      end # RiskProblem
    end #Page
  end # Pm
end #WebDriver