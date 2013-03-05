require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
module WebDriver
  module Pm
    module Page
      module ProjectInformation
        class BaseInformationPage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_information = @pm_profiles['project_information']['project_information']
            base_information = @pm_profiles['project_information']['base_information']
            menu_click_for_hide(project_information, base_information)
          end

          def base_information_tab_check
            base_information.click
            table1 =table base_information_table1
            table1[0][0].text
          end

          def project_staff_tab_check
            project_staff.click
            project_staff_tab_sign.text
          end

          def work_condition_tab_check
            work_condition.click
            work_condition_table1 = table work_condition_table
            work_condition_table1[0][0].text
          end

          def interested_party_tab_check
            interested_party.click
            interested_party_query_condition.text
          end

          def person_change_page_check
            project_staff.click
            person_chang_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def change_person_tree_page_check
            project_staff.click
            person_chang_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            change_person_tree_button.click
            handles =@driver.window_handles
            switch_three_window handles, first_handle, second_handle
            title = person_tree_title.text
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def project_person_tree_page_check
            project_staff.click
            project_person_tree_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = person_tree_title.text
            close_button.click
            switch_window first_handle
            title
          end

          def project_qa_tree_page_check
            project_staff.click
            project_qa_tree_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = person_tree_title.text
            close_button.click
            switch_window first_handle
            title
          end

          def project_ma_tree_page_check
            project_staff.click
            project_ma_tree_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = person_tree_title.text
            close_button.click
            switch_window first_handle
            title
          end

          def project_role_page_check
            project_staff.click
            project_role_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            table2 = table change_role_table
            title =table2[1][0].text
            close_button.click
            switch_window first_handle
            title
          end

          def person_change_history_page_check
            project_staff.click
            person_change_history_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def person_change_history_view_page_check
            project_staff.click
            person_change_history_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            person_change_history_list_view_button.click
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            title
          end

          def project_work_environment_page_check
            work_condition.click
            project_work_environment_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def standard_work_environment_page_check
            work_condition.click
            standard_work_environment_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def new_add_page_check
            interested_party.click
            new_add_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def import_organization_page_check
            interested_party.click
            import_organization_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = person_tree_title.text
            close_button.click
            switch_window first_handle
            title
          end

          def interested_party_view_page_check
            interested_party.click
            interested_party_view_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          def interested_party_alter_page_check
            interested_party.click
            interested_party_alter_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            title = top_title
            close_button.click
            switch_window first_handle
            title
          end

          private
          def interested_party_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def interested_party_view_button
            list_table = table interested_party_list_table
            list_table[1][12].find_elements(:tag_name => 'a')[0]
          end

          def interested_party_alter_button
            list_table = table interested_party_list_table
            list_table[1][12].find_elements(:tag_name => 'a')[1]
          end


          def new_add_button
            new_add = @pm_profiles['project_information']['new_add']
            @driver[:link => new_add]
          end

          def import_organization_button
            import_organization = @pm_profiles['project_information']['import_organization']
            @driver[:link => import_organization]
          end

          def project_work_environment_button
            @driver.find_element(:id => 'content').find_elements(:tag_name => 'span')[2]
          end

          def standard_work_environment_button
            @driver.find_element(:id => 'content').find_elements(:tag_name => 'span')[1]
          end

          def person_change_history_list_view_button
            table1 = table person_change_history_list_table
            table1[1][6].find_element(:tag_name => 'a')
          end

          def person_change_history_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def change_role_table
            @driver.find_element(:class => 'complexTableIsiderole')
          end

          def project_person_tree_button
            @driver[:id => 'projMembers_cimg']
          end

          def project_qa_tree_button
            @driver[:css => 'input#projQAs_view + img']
          end

          def project_ma_tree_button
            @driver[:css => 'input#projMAs_view + img']
          end

          def person_change_history_button
            table1 = table project_person_table1
            table1[0][1].find_element(:tag_name => 'a')
          end

          def project_role_button
            table1 = table project_person_table1
            table1[3][1].find_element(:tag_name => 'img')
          end

          def project_person_table1
            @driver.find_elements(:class => 'thisTable')[0]
          end


          def change_person_tree_button
            @driver[:tag_name => 'img']
          end

          def person_tree_title
            @driver.find_element(:class => 'dh_menu')
          end

          def close_button
            close = @pm_profiles['project_information']['close']
            @driver[:css => "input[value = #{close}]"]
          end

          def person_chang_button
            @driver.find_element(:id => 'content').find_elements(:tag_name => 'div')[1].find_element(:tag_name => 'span')
          end

          def interested_party_query_condition
            @driver[:class => 'queryCondation']
          end

          def work_condition_table
            @driver.find_element(:id => 'content').find_element(:tag_name => 'table')
          end

          def project_staff_tab_sign
            @driver[:css => '#content h3']
          end

          def base_information_table1
            @driver.find_elements(:class => 'thisTable')[0]
          end

          def base_information
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[0]
          end

          def project_staff
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[1]
          end

          def work_condition
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[2]
          end

          def interested_party
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[3]
          end

          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
                @driver.switch_to.window(handle)
              end
            end
          end
        end #BaseInformationPage
      end #ProjectInformation
    end #Page
  end # Pm
end #WebDriver