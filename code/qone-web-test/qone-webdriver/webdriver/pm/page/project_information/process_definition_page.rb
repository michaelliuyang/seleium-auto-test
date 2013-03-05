require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
module WebDriver
  module Pm
    module Page
      module ProjectInformation
        class ProcessDefinitionPage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_information = @pm_profiles['project_information']['project_information']
            process_definition = @pm_profiles['project_information']['process_definition']
            menu_click_for_hide(project_information, process_definition)
          end

          def task_split_way_tab_check
            task_split_way.click
            table1 = table task_split_way_table
            table1[1][0].text
          end

          def import_standard_process_page_check
            task_split_way.click
            standard_process_radio.click
            submit_button.click
            title = top_title
            return_button.click
            title
          end

          def project_template_import_way_page_check
            task_split_way.click
            import_project_template_radio.click
            submit_button.click
            title1 = top_title
            return_button.click
            title1
          end

          def project_template_import_from_project_template_page_check
            task_split_way.click
            import_project_template_radio.click
            submit_button.click
            submit_button.click
            title = top_title
            return_button.click
            return_button.click
            title
          end

          def import_from_project_to_project_import_page_check
            task_split_way.click
            import_project_radio.click
            submit_button.click
            title = top_title
            return_button.click
            title
          end

          def requirement_to_select_import_way_page_check
            task_split_way.click
            import_requirement_radio.click
            submit_button.click
            title = top_title
            return_button.click
            title
          end

          def requirement_to_base_line_page_check
            task_split_way.click
            import_requirement_radio.click
            submit_button.click
            import_from_base_line_radio.click
            select = qone_select @driver, import_from_base_line_select
            select.select_by_index 1
            submit_button.click
            title = top_title
            return_button.click
            return_button.click
            title
          end

          def requirement_to_produce_page_check
            task_split_way.click
            import_requirement_radio.click
            submit_button.click
            import_from_produce_radio.click
            select = qone_select @driver, import_from_produce_select
            select.select_by_index 1
            submit_button.click
            title = top_title
            return_button.click
            return_button.click
            title
          end

          def view_task_information_page_check
            view_task_information_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def view_cut_list_page_check
            view_cut_reason_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def view_cut_reason_page_check
            view_cut_reason_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            table1 = table cut_reason_list_table
            table1[1][3].find_element(:tag_name => 'a').click
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def reference_history_project_tab_check
            reference_history_project.click
            @driver.find_element(:name => 'HistoryProjInfoActionForm').find_elements(:tag_name => 'span')[0].text
          end

          def gantt_map_page_check
            reference_history_project.click
            gantt_map_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = @driver.title
            close_button.click
            switch_window first_handle
            title
          end


          def receiving_report_page_check
            reference_history_project.click
            receiving_report_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title =top_title
            close_button.click
            switch_window first_handle
            title
          end

          def receiving_report_print_page_check
            reference_history_project.click
            receiving_report_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            print_button.click
            handles = @driver.window_handles
            sleep 3
            switch_three_window handles, first_handle, second_handle

            title = print_title.text
            @driver.close
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          private

          def print_title
            #@driver.find_element(:class => 's1').find_element(:tag_name => 'td')
            @driver.find_element(:class => 's1')
          end

          def print_button
            print_button = @pm_profiles['risk_problem']['print_button']
            @driver.find_element(:css => "input[value = #{print_button}]")
          end

          def gantt_map_button
            @driver.find_element(:name => 'HistoryProjInfoActionForm').find_elements(:tag_name => 'span')[2].find_elements(:tag_name => 'a')[0]
          end

          def receiving_report_button
            @driver.find_element(:name => 'HistoryProjInfoActionForm').find_elements(:tag_name => 'span')[2].find_elements(:tag_name => 'a')[1]
          end

          def cut_reason_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end


          def import_from_base_line_radio
            @driver[:id => 'fromBaseline']
          end

          def import_from_produce_radio
            @driver[:id => 'fromProduct']
          end

          def import_from_base_line_select
            @driver[:id => 'baselineId_input']
          end

          def import_from_produce_select
            @driver[:id => 'productId_input']
          end

          def view_task_information_button
            table1 = table task_split_way_table
            table1[0][0].find_elements(:tag_name => 'a')[0]
          end

          def view_cut_reason_button
            table1 = table task_split_way_table
            table1[0][0].find_elements(:tag_name => 'a')[1]
          end

          def standard_process_radio
            table1 = table task_split_way_table
            table1[1][0].find_element(:tag_name => 'input')
          end

          def import_project_template_radio
            table1 = table task_split_way_table
            table1[2][0].find_element(:tag_name => 'input')
          end

          def import_project_radio
            table1 = table task_split_way_table
            table1[3][0].find_element(:tag_name => 'input')
          end

          def import_requirement_radio
            table1 = table task_split_way_table
            table1[4][0].find_element(:tag_name => 'input')
          end

          def submit_button
            submit = @pm_profiles['project_information']['submit']
            @driver[:css => "input[value = #{submit}]"]
          end

          def return_button
            return1 = @pm_profiles['project_information']['return']
            @driver[:css => "input[value = #{return1}]"]
          end

          def close_button
            close = @pm_profiles['project_information']['close']
            @driver[:css => "input[value =#{close}]"]
          end


          def task_split_way_table
            @driver[:class => 'outSideTable']
          end

          def task_split_way
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[0]
          end

          def reference_history_project
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[1]
          end

          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
                @driver.switch_to.window(handle)
              end
            end
          end
        end #ProcessDefinitionPage
      end #ProjectInformation
    end #Page
  end # Pm
end #WebDriver