require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/table_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class SurvivalCyclePage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::TableAction

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            survival_cycle = @prom_profiles['process_assets']['survival_cycle_model']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click survival_cycle
          end

          def new_survival_cycle_model names
            new_survival_cycle_button.click
            new_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, new_handle)
            name.send_keys names
            submit_button.click
            switch_window new_handle
          end
          
          def modify_survival_cycle_model names
            modify_img_click
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            name.clear
            name.send_keys names
            submit_button.click
            switch_window modify_handle
          end
          
          def delete_survival_cycle_model
            delete_img_click
            alert_ok
          end
          
          def view_survival_cycle_model_title
            view_img_click
            view_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, view_handle)
            title = top_title
            close_button.click
            switch_window view_handle
            title
          end
          
          def related_project_template
            related_img_click
            related_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, related_handle)
            check_box.click
            related_button.click
            alert_ok
            close_related_page_button.click
            switch_window related_handle
          end
          
          def find_name_exist? names
            data_list = qone_data_list(survival_table)
            data_list.data_exist?(names,0)
          end
          
          def judge_use_times names
            table_survival = table survival_table
            names_col = 0
            row = find_target_row table_survival,names,names_col
            if row
              contrast_use_times(table_survival,row)
            else
              raise "can not find target row"
            end
          end

          def top_title
            @driver[:css=> 'h2'].text
          end
          
          private
          
          def contrast_use_times(table_survival,row)
            table_survival = table survival_table
            result_flag = 0
            if table_survival[row][6].text != '0'
              result_flag = 1
            end
            result_flag
          end
          
          def modify_img_click
            names = @data_prom['survival_cycle']['name_for_add']
            data_list = qone_data_list(survival_table)
            data_list.operate(names,0,:edit,7)
          end
          
          def delete_img_click
            names = @data_prom['survival_cycle']['name_for_delete']
            data_list = qone_data_list(survival_table)
            data_list.operate(names,0,:delete,7)
          end
          
          def view_img_click
            names = @data_prom['survival_cycle']['name_for_view']
            data_list = qone_data_list(survival_table)
            data_list.operate(names,0,:view,7)
          end
          
          def related_img_click
            names = @data_prom['survival_cycle']['name_for_related']
            data_list = qone_data_list(survival_table)
            data_list.operate(names,0,:lc_ass_template,7)
          end
          
          def survival_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def new_survival_cycle_button
            @driver[:css=> '#yellowButton']
          end
          
          def name
            @driver[:name => 'name']
          end
          
          def check_box
            @driver[:name => 'checkedTemplate']
          end
          
          def related_button
            @driver[:css => "div[id='content'] div[align='center']"].find_elements(:tag_name => 'input')[0]
          end
          
          def close_related_page_button
            @driver[:css => "div[id='content'] div[align='center']"].find_elements(:tag_name => 'input')[1]
          end

          def submit_button
            @driver[:css => "div form div input[type='submit']"]
          end
          
          def close_button
            @driver[:css => "div form div input[type='button']"]
          end

        end #SurvivalCyclePage
      end #ProcessAssets
    end #Page
  end #Prom
end #WebDriver