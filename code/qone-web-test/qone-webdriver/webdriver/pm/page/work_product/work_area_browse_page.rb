require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module WorkProduct
        class WorkAreaBrowsePage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            work_area_browse = @pm_profiles['work_product']['work_area_browse']
            show_menu_by_js "pm_workproduct"
            menu_click work_area_browse
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end
          def enter_work_area(work_area_select,usernam,password)
            select_work_area.select_by_text work_area_select
            enter_work_area_button.click
            fill_in_text(username,password)
            top_title
          end
          def set_user_login
            set_user_login_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            page_title = top_title
            close_button.click
            switch_window first_handle
            page_title
          end
          private 
          def data_list
             table_name = @driver.find_element(:id=>'content').find_element(:css =>'table')
             qone_data_list(table_name)
          end
          def submit_button
            submit_name = @pm_profiles['work_product']['submit']
            @driver.find_element(:css=>"input[value='#{submit_name}']")
          end
          def close_button
            close_name =  @pm_profiles['work_product']['close']
            @driver.find_element(:css=>"input[value='#{close_name}']")
          end
          def select_work_area
            select_element = @driver.find_element(:id=>'id_input')
            qone_select(@driver,select_element)
          end
          def enter_work_area_button
            enter_name =  @pm_profiles['work_product']['enter_work_area']
            @driver.find_element(:css=>"input[value = '#{enter_name}']")
          end
          def set_user_login_button
            login_name =  @pm_profiles['work_product']['set_user_login']
            @driver.find_element(:link =>login_name)
          end
          def fill_in_username
            @driver.find_element(:name =>'username')
          end
          def fill_in_password
            @driver.find_element(:name =>'password')
          end
          def fill_in_text(username,password)
            fill_in_username.send_keys(username) 
            fill_in_password.send_keys(password)
            submit_button.click
          end
        end #WorkAreaBrowsePage
      end #WorkProduct
    end #  Page
  end # Pm
end  # WebDriver