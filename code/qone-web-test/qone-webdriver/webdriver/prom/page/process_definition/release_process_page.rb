require 'webdriver/common/base_page'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/table_action'

module WebDriver
  module Prom
    module Page
      module ProcessDefinition
        class ReleaseProcessPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::TableAction

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            release_process = @prom_profiles['process_definition']['release_process']
            menu_click process_manage
            show_menu_by_js 'spa_osp'
            menu_click release_process
          end


          def add_release content
            new_release_button.click
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            sleep 2
            extent_img.click
            sleep 2
            select_box.click
            sleep 2
            publish_content.send_keys content
            sleep 2
            select_approval_form
            sleep 2
            submit_button.click
            switch_window handle
          end
          
          def delete_release
            delete_img_click
            sleep 2
            alert_ok
          end     
          
          def find_release_content? content
            release_list_table = table release_table
            col = 2
            find_keyword_in_table release_list_table,content,col
          end    
          
          def top_title
            @driver[:css=> 'h2'].text.rstrip
          end

          private
          
          def delete_img_click
            id = @data_prom['process_release']['release_id']
            data_list = qone_data_list(release_table)
            data_list.operate(id,0,:delete,6)
          end
          
          def select_approval_form
            form_name = @data_prom['process_release']['form_name']
            select_project = qone_select(@driver, process_list)
            select_project.select_by_text form_name
          end
          
          def release_table
            @driver[:css => "table[cellspacing='1']"]
          end
          
          def extent_img
            @driver[:css => '#jprocessTree7']
          end
          
          def select_box
            @driver[:css => '#cprocessTree4']
          end
          
          def publish_content
            @driver[:name => 'publishContent']
          end
          
          def process_list
            @driver[:css => '#cusProcessId_input']
          end

          def new_release_button
            @driver[:css => 'span.button a']
          end
          
          def submit_button
            @driver[:css => '#submitBtn']
          end

        end
      end
    end
  end
end