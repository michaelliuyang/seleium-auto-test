require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'
module WebDriver
  module Prom
    module Page
      module TempletSettings
        class RepositoryTemplatePage < Common::BasePage
         
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            repository_structure = @prom_profiles['templet_Settings']['repository_structure_template']
            menu_click process_manage
            show_menu_by_js("spa_report")
            menu_click repository_structure
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def new_repository_structure name
            new_repository_structure_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            template_name.send_keys name
            scope_of_application_controll.click
            submit_button.click
            switch_window current_handle
          end
          
          def modify_repository_structure name
            modify_img_click
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            template_name.clear
            template_name.send_keys name
            submit_button.click
            alert_ok
            switch_window modify_handle
          end
          
          def view_repository_structure_title
            view_img_click
            view_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, view_handle)
            view_top_title = top_title
            sleep 2
            close_button.click
            switch_window view_handle
            view_top_title
          end
          
          def delete_repository_structure
            delete_img_click
            alert_ok
          end
          
          def find_template_name_exist? name
            data_list = qone_data_list(template_list_table)
            data_list.data_exist?(name,1)
          end

          private
          
          def delete_img_click
            name = @data_prom['repository_template']['name_for_delete']
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,:delete,5)
          end
          
          def view_img_click
            name = @data_prom['repository_template']['name_for_modify']
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,:view,5)
          end
          
          def modify_img_click
            name = @data_prom['repository_template']['name_for_add']
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,:edit,5)
          end
          
          def scope_of_application_controll
            @driver[:name => 'applyRange']
          end
          
          def template_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end
          
          def template_name
            @driver[:css => '#tempName']
          end

          def new_repository_structure_button
            @driver[:class => 'whitelink']
          end
          
          def submit_button
            @driver[:name => 'bt1']
          end

          def close_button
            @driver[:css => "form[id='appform'] div input[type='button']"]
          end


        end #RepositoryTemplatePage
      end #TempletSettings
    end # Page
  end #Prom
end # WebDriver