require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class ChecklistManagePage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            checklist_manage = @prom_profiles['process_assets']['checklist_manage']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click checklist_manage
          end

          def right_frame_title
            switch_to_iframe
            switch_to_right_frame
            right_frame_title = top_title
            switch_out_frame
            right_frame_title
          end

          def add_evaluation_method name, content_text
            switch_to_iframe
            switch_to_right_frame
            check_item_maintain_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            input_evaluation_method name, content_text
            switch_window current_handle
            switch_out_frame
          end
          
          def modify_evaluation_method evaluation_name
            switch_to_iframe
            switch_to_right_frame
            check_item_maintain_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            sleep 2
            modify_evaluation_name evaluation_name
            close_button.click
            switch_window current_handle
            switch_out_frame
          end
          
          def delete_evaluation_method
            switch_to_iframe
            switch_to_right_frame
            check_item_maintain_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            sleep 2
            click_delete_img
            alert_ok
            sleep 1
            close_button.click
            switch_window current_handle
            switch_out_frame
          end

          def find_evaluation_name_exist? evaluation_name
            switch_to_iframe
            switch_to_right_frame
            check_item_maintain_button.click
            evaluation_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, evaluation_handle)
            sleep 2
            flag = find_name_method evaluation_name
            sleep 5
            close_button.click
            switch_window evaluation_handle
            switch_out_frame
            flag
          end

          private
          
          def modify_evaluation_name name
            click_modify_img
            modify_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, modify_handle)
            evaluation_name_input name
            submit_button.click
            switch_window modify_handle
          end
          
          def click_modify_img
            evaluation_name = @data_prom['evaluation_method']['name_for_add']
            data_list = qone_data_list(evaluation_table)
            data_list.operate(evaluation_name,0,:edit2,4)
          end

          def click_delete_img 
            evaluation_name = @data_prom['evaluation_method']['name_for_modify']
            data_list = qone_data_list(evaluation_table)
            data_list.operate(evaluation_name,0,:delete,4)
          end
          
          def find_name_method evaluation_name
            evaluation = table evaluation_table
            col = 0
            find_keyword_in_table evaluation,evaluation_name,col
          end

          def find_keyword_in_table table,name,col
            num = table.row_count
            result_flag = 0
            (1..num-1).each do |y|
              if table[y][col].text == name
              result_flag = 1
              end
            end
            result_flag
          end

          def input_evaluation_method name, content_text
            add_evaluation_method_button.click
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            submit_context_method name, content_text
            switch_window handle
            close_button.click
          end

          def submit_context_method name, content_text
            evaluation_name_input name
            delete_button.click
            content_input content_text
            submit_button.click
          end

          def switch_to_iframe
            switch_to_frame iframe
          end

          def switch_to_right_frame
            switch_to_frame right_frame
          end
          
          
          def content_input text
            content_define_input_box.clear
            content_define_input_box.send_keys text
          end

          def iframe
            @driver[:css => "div[id='content'] iframe"]
          end

          def right_frame
            @driver[:name=> 'right']
          end

          def add_evaluation_method_button
            @driver[:id=> 'addfit']
          end

          def evaluation_name_input name
            @driver[:id=> 'name'].clear
            @driver[:id=> 'name'].send_keys name
          end

          def content_define_input_box
            @driver[:css => "tbody[id='enumTbody'] tr td input[name='enmuDes']"]
          end

          def submit_button
            button = @prom_profiles['process_assets']['submit_button']
            @driver[:css => "div[id='addContent'] form div input[value='#{button}']"]
          end

          def check_item_maintain_button
            @driver[:css=> '#maintainItemType']
          end

          def top_title
            @driver[:css=> 'h2'].text
          end
                   
          def evaluation_table
            @driver[:id => 'listTable']
          end

          def delete_button
            @driver[:css => "tbody[id='enumTbody'] tr td img"]
          end

          def close_button
            @driver[:css => "div[id='content'] div input[type='button']"]
          end

        end #ChecklistManagePage
      end #ProcessAssets
    end #Page
  end #Prom
end #WebDriver
