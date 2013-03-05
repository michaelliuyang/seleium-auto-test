require 'webdriver/common/base_page'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'

module WebDriver
  module Prom
    module Page
      module ProcessDefinition
        class ProcessRevisedPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            process_revised = @prom_profiles['process_definition']['process_revised_information']
            menu_click process_manage
            sleep 2
            show_menu_by_js 'spa_osp'
            sleep 2
            menu_click process_revised
          end

          def top_title
            @driver[:css=> 'h2'].text.rstrip
          end

          def add_revised_information content
            add_button.click
            add_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, add_handle)
            sleep 2
            extent_img.click
            sleep 2
            select_box.click
            sleep 2
            revised_content.send_keys content
            sleep 2
            submit_button.click
            switch_window add_handle
          end
          
          def modify_revised_information content
            modify_img_click
            sleep 2
            add_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, add_handle)
            sleep 2
            revised_content.clear
            revised_content.send_keys content
            sleep 2
            submit_button.click
            switch_window add_handle
          end
          
          def delete_revised_information
            delete_img_click
            sleep 2
            alert_ok
          end

          def find_revised_content? revised_content
            data_list = qone_data_list(process_revised_table)
            data_list.data_exist?(revised_content,2)
          end

          private

          def add_button
            @driver[:css => 'span.button a']
          end
          
          def modify_img_click
            id = @data_prom['process_revised']['revised_id']
            data_list = qone_data_list(process_revised_table)
            data_list.operate(id,0,:edit,7)
          end
          
          def delete_img_click
            id = @data_prom['process_revised']['revised_id']
            data_list = qone_data_list(process_revised_table)
            data_list.operate(id,0,:delete,7)
          end

          def select_box
            @driver[:css => '#ctree4']
          end

          def extent_img
            @driver[:css => '#jtree6']
          end

          def revised_content
            @driver[:name => 'modifyContent']
          end

          def submit_button
            @driver[:name => 'B1']
          end

          def process_revised_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

        end # ProcessRevisedPage
      end # ProcessDefinition
    end #  Page
  end # Prom
end #WebDriver