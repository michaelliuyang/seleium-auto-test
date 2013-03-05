require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class WorkingEnvironmentPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            work_environment = @prom_profiles['process_assets']['organization_standard_working_environment']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click work_environment
          end

          def unstandard_working_environment_title
            unstandard_enviroment_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            title = top_title
            close_button.click
            switch_window current_handle
            title
          end

          def add_species_classification(classifications,types)
            maintain_classification_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            sleep 2
            add_type_classification(classifications,types)
            close_button.click
            switch_window current_handle
          end

          def modify_species_classification types
            maintain_classification_button.click
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            sleep 2
            modify_type types
            close_button.click
            switch_window modify_handle
          end

          def delete_species_classification
            maintain_classification_button.click
            delete_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, delete_handle)
            click_delete_type_img
            alert_ok
            switch_window delete_handle
          end

          def input_environment names
            click_handle_img
            type_page names
          end

          def find_type_exist? types
            table_environment = table environment_table
            col = 0
            find_type_in_table table_environment, types, col
          end

          def find_name_exist? names
            table_environment = table environment_table
            col = 2
            find_type_in_table table_environment, names, col
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          private

          def type_page names
            type_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, type_handle)
            add_classification_entries names
            switch_window type_handle
          end

          def add_classification_entries names
            add_classification_entries_button.click
            name.send_keys names
            submit_enviroment_button.click
          end

          def find_type_in_table table,key,col
            num = table.row_count
            result_flag = 0
            (1..num-1).each do |y|
              if table[y][col].text == key
              result_flag = 1
              end
            end
            result_flag
          end

          def click_handle_img
            type = @data_prom['work_environment']['type_for_add']
            data_list = qone_data_list(environment_table)
            data_list.operate(type,0,:edit,12)
          end

          def modify_type types
            click_modify_type_img
            modify_type_content types
          end

          def click_modify_type_img
            type = @data_prom['work_environment']['type_for_add']
            data_list = qone_data_list(environment_table)
            data_list.operate(type,0,:edit,2)
          end

          def click_delete_type_img
            type = @data_prom['work_environment']['type_for_modify']
            data_list = qone_data_list(environment_table)
            data_list.operate(type,0,:delete,2)
          end

          def add_type_classification(classifications,types)
            add_species_classification_button.click
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            sleep 2
            add_classification_button.click
            sleep 2
            classification.send_keys classifications
            sleep 1
            type.send_keys types
            sleep 2
            submit_button.click
            switch_window handle
          end

          def modify_type_content types
            modify_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, modify_handle)
            type.clear
            type.send_keys types
            sleep 2
            submit_button.click
            switch_window modify_handle
          end

          def environment_table
            @driver[:css => 'table']
          end

          def maintain_classification_button
            @driver.find_element(:id => 'content').find_elements(:tag_name => 'a')[1]
          end

          def add_species_classification_button
            @driver[:css => 'div div span a']
          end

          def add_classification_button
            @driver[:css => 'div form div span a']
          end

          def classification
            @driver[:css => '#weKindName']
          end

          def type
            @driver[:css => '#majorKindName']
          end

          def unstandard_enviroment_button
            @driver.find_element(:id => 'content').find_elements(:tag_name => 'a')[0]
          end

          def name
            @driver[:css => '#name']
          end

          def submit_enviroment_button
            @driver[:css => "div input[type='submit']"]
          end

          def add_classification_entries_button
            @driver[:css => "div[id='content'] div span a"]
          end

          def submit_button
            @driver[:css => "div form input[type='submit']"]
          end

          def close_button
            @driver[:name => 'close']
          end

        end #WorkingEnvironmentPage
      end #WorkingEnvironment
    end # Page
  end #Prom
end # WebDriver