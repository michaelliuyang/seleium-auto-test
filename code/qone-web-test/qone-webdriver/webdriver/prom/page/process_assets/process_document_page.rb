require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class ProcessDocumentPage < Common::BasePage
          
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            process_document = @prom_profiles['process_assets']['process_document']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click process_document
          end

          def upload_documents_top_title
            upload_documents_button.click
            upload_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, upload_handle)
            upload_documents_top_title = top_title
            close_button.click
            switch_window upload_handle
            upload_documents_top_title
          end
          
          def modify_document number
            click_modify_img
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            document_number.clear
            document_number.send_keys number
            submit_button.click
            sleep 2
            close_button.click
            switch_window modify_handle
          end
          
          def delete_document
            click_delete_img
            alert_ok
          end
          
          def find_document_number_exist? number
            data_list = qone_data_list(document_list_table)
            data_list.data_exist?(number,0)
          end

          def top_title
            @driver[:css=> 'h2'].text.rstrip
          end

          private
          
          def click_modify_img
            document_num = @data_prom['process_document']['num_for_add']
            data_list = qone_data_list(document_list_table)
            data_list.operate(document_num,0,:edit,12)
          end
          
          def click_delete_img
            document_num = @data_prom['process_document']['num_for_modify']
            data_list = qone_data_list(document_list_table)
            data_list.operate(document_num,0,:delete,12)
          end
          
          def document_number
            @driver[:name => 'documentNo']
          end

          def upload_documents_button
            @driver[:css => "div[id='content'] span.button a"]
          end
          
          def document_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end
          
          def submit_button
            @driver[:css => "form div input[type='submit']"]
          end

          def close_button
            button = @prom_profiles['process_assets']['close_button']
            @driver[:css => "form div input[value='#{button}']"]
          end

        end
      end
    end
  end
end