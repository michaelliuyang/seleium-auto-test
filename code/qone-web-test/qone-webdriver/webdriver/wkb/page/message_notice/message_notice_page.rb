require 'selenium-webdriver'
require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'

module WebDriver
  module Wkb
    module Page
      module MessageNotice
        class MessageNoticePage < Common::BasePage
          
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction
          
          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            @data_wkb = Helper::ReadProfiles.data :wkb
            work_bench = @wkb_profiles['work_bench']
            message_notice = @wkb_profiles['message_notice']['message_notice_name']
            menu_click work_bench
            menu_click message_notice
          end

          def add_message_notice(title,name,content)
            add_button.click
            current_handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            notice_title.send_keys title
            receive_person.send_keys name
            input_notice_content content
            sleep 3
            publish_button.click
            switch_window current_handle
          end
          
          def modify_message_notice title
            click_modify_img
            current_handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            notice_title.clear
            notice_title.send_keys title
            sleep 3
            publish_button.click
            switch_window current_handle
          end
          
          def delete_message_notice
            click_delete_img
            sleep 7
            # alert_ok
            sleep 5
          end
          
          def view_message_notice_top_title
            click_view_img
            current_handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            title = top_title
            close_button.click
            switch_window current_handle
            title
          end

          def find_title_exist? title
            data_list = qone_data_list(message_table)
            data_list.data_exist?(title,0)
          end

          def page_title
            @driver.title
          end

          private
          
          def click_view_img
            title = @data_wkb['message_notice']['title_for_add']
            data_list = qone_data_list(message_table)
            data_list.operate(title,0,:view,5)
          end
          
          def click_delete_img
            title_delete = @data_wkb['message_notice']['title_for_delete']
            data_list = qone_data_list(message_table)
            data_list.operate(title_delete,0,:delete,5)
          end
          
          def click_modify_img
            title = @data_wkb['message_notice']['title']
            data_list = qone_data_list(message_table)
            data_list.operate(title,0,:edit,5)
          end

          def top_title
            @driver[:css => '#content h2'].text
          end

          def add_button
            @driver[:css => "span[class='button'] a"]
          end

          def notice_title
            @driver[:name => 'title']
          end

          def iframe
            @driver[:class => 'ke-edit-iframe']
          end

          def input_notice_content content
            switch_to_frame iframe
            @driver[:class => 'ke-content'].send_keys content
            switch_out_frame
          end

          def receive_person
            @driver[:css =>'#recipientView']
          end

          def publish_button
            @driver[:name => 'publish']
          end

          def message_table
            @driver[:css => '#dataListTable_NFSDataList']
          end
          
          def close_button
            @driver[:name => 'close']
          end

        end #MessageNoticePage
      end #MessageNotice
    end #Page
  end #Wkb
end # WebDriver