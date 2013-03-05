require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
module WebDriver
  module Wkb
    module Page
      module SystemMessage
        class SystemNoticePage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            system_message = @wkb_profiles['system_message']['system_message']
            system_notice = @wkb_profiles['system_message']['message_notice']
            menu_click work_bench
            menu_click_for_hide system_message, system_notice
          end

          def view_notice_page_check
            table_a[1][0].find_element(:tag_name => 'a').click
            title = top_title
            return_button.click
            title
          end

          def new_notice_button
            new_notice = @wkb_profiles['system_message']['new_notice']
            @driver[:link => new_notice]
          end

          def notice_title_input_box
            @driver[:name => 'title']
          end

          def notice_content_input_box
            @driver[:name => 'content']
          end

          def submit_button
            @driver[:xpath => "//input[@type='submit']"]
          end

          def reset_button
            @driver[:xpath => "//input[@type='reset']"]
          end

          def return_button
            returns = @wkb_profiles['system_message']['return']
            @driver[:css => "input[value = #{returns}]"]
          end

          def notice_list_title_at_row row
            notice_title = table_a[row][0].find_elements(:tag_name => 'a')[0]
            notice_title.text
          end

          def click_alter_page(row)
            notice_list_row = table_a[row][4]
            notice_list_row.find_elements(:tag_name => 'img')[0].click

          end

          def alter_notice_at_row(row, title, content)
            click_alter_page row
            notice_title_input_box.clear
            notice_title_input_box.send_keys title
            notice_content_input_box.clear
            notice_content_input_box.send_keys content
            submit_button.click
          end

          def delete_notice_at_row(row)
            table_a[row][4].find_elements(:tag_name => 'img')[1].click
            alert_ok
          end

          def total_row_number
            record_number = record_count.text
            record_number.to_i
          end

          def record_count
            @driver.find_element(:id => 'publishBoardPage_recordCount')
          end

          def table_a
            element = @driver.find_element(:tag_name => 'table')
            table= table element
          end

        end #SystemNoticePage
      end #SystemMessage

    end #Page
  end #Wkb
end # WebDriver