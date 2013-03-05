require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'


module WebDriver
  module Sm
    module Page
      module SystemSettings
        class NewsSettingPage  < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @page_profiles=Helper::ReadProfiles.apps_res_zh :sm
            system_manage =  @page_profiles['system_manage']
            system_settings =  @page_profiles['system_settings']['system_settings']
            news_setting = @page_profiles['system_settings']['news_setting']
            menu_click system_manage
            menu_click_for_hide(system_settings,news_setting)
          end

          def top_title
            @driver[:css=>'h2'].text
          end

          def message_tab_page?
             message_tab.click
             obtain_message_tab_page_flag_text[0..2]
          end

          def mail_tab_page?
            flag = false
            mail_set_tab.click
            element = send_test_email_button
            unless element == nil
              flag = true
            end
            flag
          end

          def template_tab_page?
            flag = false
            template_set_tab.click
            element = obtain_template_tab_page_flag_text
            element.rstrip
          end

          def send_test_email_button?
            mail_set_tab.click
            send_test_email_button.click
            handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles,handle)
            sleep 30
            return_flag = obtain_button_in_send_test_mail_page
            switch_window handle
            return_flag
          end

          def edit_template_link?
            template_set_tab.click
            create_project_template_link.click
            handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles,handle)
            title = edit_template_page_title_text
            edit_template_page_close_button.click
            switch_window handle
            title
          end


          private

          def obtain_template_tab_page_flag_text
            table_in_template_set_page
            @table_template[1][0].text
          end

          def obtain_button_in_send_test_mail_page
            flag = false
            switch_to_frame frame_in_send_test_mail_page
            table_in_send_test_email_page
            element = @table[1][0].find_element(:id=>'importSub')
            element.click
            unless element == nil
              flag = true
            end
            flag
          end

          def obtain_message_tab_page_flag_text
             table_in_message_set_tab
             @table_message[0][0].text
          end

          def mail_set_tab
            @driver[:id=>'mailDiv']
          end

          def template_set_tab
            @driver[:id=>'templateDiv']
          end

          def message_tab
            @driver[:id=>'smsDiv']
          end

          def table_in_template_set_page
            @table_template = table(@driver[:xpath=>"//table[@cellspacing='1']"])
          end

          def table_in_send_test_email_page
            @table =table(@driver[:xpath=>"//table[@cellspacing='0']"])
          end

          def table_in_message_set_tab
            @table_message = table(@driver[:id=>'smsConfigTable'].find_elements(:tag_name=>'table')[0])
          end

          def  frame_in_send_test_mail_page
            @driver[:xpath=>"//iframe[@src='/pm/CheckEmailConfigAction.do']"]
          end

          def send_test_email_button
            @driver[:id=>'yellowButton']
          end

          def create_project_template_link
            table_in_template_set_page
            @table_template[1][1].find_elements(:tag_name=>'a')[0]
          end

          def edit_template_page_title_text
            @driver[:css=>'h2'].text
          end

          def edit_template_page_close_button
            close = @page_profiles['system_settings']['close_button']
            @driver[:xpath=>"//input[@value='#{close}']"]
          end



        end # NewsSettingPage

      end # SystemSettings
    end # Page
  end # Sm
end # WebDriver

