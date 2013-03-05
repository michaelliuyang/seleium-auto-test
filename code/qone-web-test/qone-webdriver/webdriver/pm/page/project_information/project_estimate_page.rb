require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
module WebDriver
  module Pm
    module Page
      module ProjectInformation
        class ProjectEstimatePage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_information = @pm_profiles['project_information']['project_information']
            project_estimate = @pm_profiles['project_information']['project_estimate']
            menu_click_for_hide project_information, project_estimate
          end

          def project_estimate_list_tab_check
            project_estimate_list.click
            project_estimate_list_table = table estimate_table
            project_estimate_list_table[0][3].find_element(:tag_name => 'span').text.rstrip
          end

          def estimate_tracking_tab_check
            estimate_tracking.click
            estimate_tracking_table = table estimate_table
            estimate_tracking_table[0][2].find_element(:tag_name => 'span').text.rstrip
          end

          def project_estimate_list_print_page_check
            project_estimate_list.click
            print_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = print_title.text
            @driver.close
            switch_window first_handle
            title
          end

          def start_project_estimate_page_check
            project_estimate_list.click
            start_project_estimate_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def estimate_expert_tree_page_check
            project_estimate_list.click
            start_project_estimate_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            estimate_expert_tree_button.click
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            title = person_list_title.text
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def choose_project_module_page_check
            project_estimate_list.click
            start_project_estimate_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            choose_project_module_button.click
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def input_offline_estimate_page_check
            project_estimate_list.click
            input_offline_estimate_button.click
            sleep 2
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            #close_button.click
            @driver.close
            switch_window first_handle
            title
          end

          def view_offline_estimate_page_check
            project_estimate_list.click
            offline_estimate_view_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            #close_button.click
            @driver.close
            switch_window first_handle
            title
          end

          def apply_to_project_page_check
             project_estimate_list.click
            offline_estimate_apply_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def alter_offline_estimate_page_check
             project_estimate_list.click
            offline_estimate_alter_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def offline_estimate_print_page_check
             project_estimate_list.click
            offline_estimate_view_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
           second_handle = switch_alert_window handles, first_handle
            print_button.click
             handles = @driver.window_handles
             switch_three_window handles,first_handle,second_handle
            title = print_title.text
             @driver.close
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def view_project_estimate_page_check
              project_estimate_list.click
            start_project_estimate_view_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
           switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def view_estimate_state_page_check
             project_estimate_list.click
            start_project_estimate_view_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
           second_handle = switch_alert_window handles, first_handle
             #view = @pm_profiles['project_information']['view_button']
            #@driver[:css => "img[title = #{view}]"].click
             @driver[:class => 'datalist-menu'].click
            handles = @driver.window_handles
            switch_three_window handles,first_handle,second_handle
            title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
          end

          def view_estimate_comment_page_check
              project_estimate_list.click
            start_project_estimate_view_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
           second_handle = switch_alert_window handles, first_handle
             comment = @pm_profiles['project_information']['comment_button']
            @driver[:css => "a[title = #{comment}]"].click
            handles = @driver.window_handles
            switch_three_window handles,first_handle,second_handle
            title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
          end


          def add_project_estimate_to_save(name)
              project_estimate_list.click
            start_project_estimate_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles,first_handle
             input_degree_of_difficulty 1
             choose_standard_efficiency_by_index 0
            choose_standard_personal_cost_by_index 0
            estimate_expert_tree_button.click
            handles =@driver.window_handles
            switch_three_window handles,first_handle,second_handle
            choose_expert name
            submit_button.click
            switch_window second_handle
            sleep 2
            choose_project_module_button.click
            handles =@driver.window_handles
            switch_three_window handles,first_handle,second_handle
            @driver[:id => 'NFS_tree_node_1_cb'].click
            submit_button.click
             switch_window second_handle
              table1 = table code_estimate_date_table
              table1[1][0].find_element(:name => 'codeTaskNo').send_keys 22
            save_draft_button.click
            switch_window first_handle
          end

           def add_project_estimate_to_start(name)
              project_estimate_list.click
            start_project_estimate_button.click
             first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles,first_handle
             input_degree_of_difficulty 1
             choose_standard_efficiency_by_index 0
            choose_standard_personal_cost_by_index 0
            estimate_expert_tree_button.click
            handles =@driver.window_handles
            switch_three_window handles,first_handle,second_handle
            choose_expert name
            submit_button.click
            switch_window second_handle
            sleep 2
            choose_project_module_button.click
            handles =@driver.window_handles
            switch_three_window handles,first_handle,second_handle
            @driver[:id => 'NFS_tree_node_1_cb'].click
            submit_button.click
             switch_window second_handle
              table1 = table code_estimate_date_table
              table1[1][0].find_element(:name => 'codeTaskNo').send_keys 22
            start_estimate_button.click
            switch_window first_handle
          end

          def alter_project_estimate_page_check
            project_estimate_list.click
              alter_button_by_row(1).click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
             title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def delete_project_estimate_by_row(row)
              project_estimate_list.click
             delete_button_by_row(row).click
          end

          private

          def alter_button_by_row(row)
              alter = @pm_profiles['project_information']['alter']
            table1 = table estimate_table
            table1[row][10].find_element(:css => "a [title = #{alter}]")
          end
          def delete_button_by_row(row)
               table1 = table estimate_table
              delete = @pm_profiles['project_information']['delete']
            table1[row][10].find_element(:css => "img[title = #{delete}]")
          end

          def code_estimate_date_table
            @driver[:id => 'dataListTable_codeDataList']
          end

          def input_degree_of_difficulty(number)
            @driver[:id => 'difficulty'].clear
            @driver[:id => 'difficulty'].send_keys number
          end

          def choose_standard_efficiency_by_index( index)
           efficiency = @driver[:id => 'efficiency_input']
             select = qone_select @driver,efficiency
            select.select_by_index index
          end

          def choose_standard_personal_cost_by_index(index)
            cost = @driver[:id => 'cost_input']
            select = qone_select @driver, cost
            select.select_by_index index
          end


          def choose_expert(name)
            tree = qone_user_tree @driver
            tree.select_node_by_name name
          end

          def start_project_estimate_view_button
              force_finish = @pm_profiles['project_information']['force_finish']
            row = find_record_by_row force_finish
            table1 = table estimate_table
            table1[row][10].find_elements(:tag_name => 'a')[0]
          end

          def offline_estimate_view_button
              offline_estimate = @pm_profiles['project_information']['offline_estimate']
            row = find_record_by_row offline_estimate
            table1 = table estimate_table
            table1[row][10].find_elements(:tag_name => 'a')[0]
          end

          def offline_estimate_apply_button
            application_to_project = @pm_profiles['project_information']['application_to_project']
             offline_estimate = @pm_profiles['project_information']['offline_estimate']
            row = find_record_by_row offline_estimate
            table1 = table estimate_table
            table1[row][10].find_element(:css => "a [title = #{application_to_project}]")
          end

          def offline_estimate_alter_button
             alter = @pm_profiles['project_information']['alter']
             offline_estimate = @pm_profiles['project_information']['offline_estimate']
            row = find_record_by_row offline_estimate
            table1 = table estimate_table
            table1[row][10].find_element(:css => "a [title = #{alter}]")
          end

          def find_record_by_row(state)
                  row = 0
            table1 = table estimate_table
            (1..table1.row_count-2).each do |r|
              if table1[r][9].text == state
                 row = r
                break
              end
            end
            row
          end

          def choose_project_module_button
            choose_project_module = @pm_profiles['project_information']['choose_project_module']
            @driver[:link =>choose_project_module]
          end

          def person_list_title
            @driver[:class => 'cardmenu']
          end

          def estimate_expert_tree_button
            table1 = table base_information_table
            table1[2][1].find_element(:tag_name => 'img')
          end

          def base_information_table
            @driver.find_element(:id => 'estimationProjectForm').find_elements(:tag_name => 'table')[0]
          end

          def print_title
            @driver.find_element(:class => 's1')
          end

          def project_estimate_list
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[0]
          end

          def estimate_tracking
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[1]
          end

          def estimate_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def start_project_estimate_button
            start_project_estimate = @pm_profiles['project_information']['start_project_estimate']
            @driver.find_element(:link => start_project_estimate)
          end

          def input_offline_estimate_button
            input_offline_estimate = @pm_profiles['project_information']['input_offline_estimate']
            @driver.find_element(:link => input_offline_estimate)
          end

          def close_button
            close = @pm_profiles['project_information']['close']
            @driver[:css => "input[value =#{close}]"]
          end

          def print_button
            print = @pm_profiles['project_information']['print']
            @driver[:css => "input[value =#{print}]"]
          end

          def submit_button
            submit = @pm_profiles['project_information']['submit']
            @driver[:css => "input[value = #{submit}]"]
          end

          def start_estimate_button
            @driver[:id => 'saveProj']
          end

          def save_draft_button
            @driver[:id => 'saveSketch']
          end

          def save_estimate_button
            @driver[:id => 'saveProj']
          end

          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
                @driver.switch_to.window(handle)
              end
            end
          end

          def switch_new_window(handles, *handle)
            current = 0
            case handle.length
              when 1
                handles.each do |h|
                  unless h == handle[0] &&h == handle[1]
                    @driver.switch_to.window(h)
                    current = h
                  end
                end
              when 2
                handles.each do |h|
                  unless h == handle[0] &&h == handle[1]&&h == handle[2]
                    @driver.switch_to.window(h)
                    current = h
                  end
                end
              when 3
                handles.each do |h|
                  unless h == handle[0] &&h == handle[1]&&h == handle[2]&&h == handle[3]
                    @driver.switch_to.window(h)
                    current = h
                  end
                end
              when 4
                handles.each do |h|
                  unless h == handle[0] &&h == handle[1]&&h == handle[2]&&h == handle[3]&& h == handle[4]
                    @driver.switch_to.window(h)
                    current = h
                  end
                end
            end
            current
          end


        end #ProjectEstimatePage
      end #ProjectInformation
    end #Page
  end # Pm
end #WebDriver