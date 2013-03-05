require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action.rb'
require 'selenium-webdriver'

module WebDriver
  module Pm
    module Page
      module ProjectPlan
        class DataManagePlanPage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::DriverExtensionAction
          include Support::SwitchAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_plan = @pm_profiles['project_plan']['project_plan']
            data_manage_plan = @pm_profiles['project_plan']['data_manage_plan']
            menu_click_for_hide project_plan,data_manage_plan
          end

          def top_title
             @driver[:css=>'#content h2'].text
          end

          def config_manage_plan_page_test
            flag = false
            #@driver[:id=>'content'].find_elements(:tag_name=>'a')[0].click
            config_manage_plan_click.click
            config_manage_plan = @pm_profiles['project_plan']['config_manage_plan']
            if top_title==config_manage_plan
              flag = true
            end
            return flag
          end

          def add_sub_category_link_page
            set_data_table
            category_root_node.click
            mouse_right_click category_root_node
            add_new_category.click

          end
          #
          def add_new_data_link_page
            set_data_table
            mouse_right_click category_root_node
            add_new_data.click
            handle = @driver.window_handle
            all_handle = @driver.window_handles
            switch_alert_window(all_handle,handle)
            sleep 3
            reslut = top_title
            add_new_data_close_button.click
            switch_window handle
            reslut
          end

          def import_data_link_page
            set_data_table
            mouse_right_click category_root_node
            import_data.click
            handle = @driver.window_handle
            all_handle = @driver.window_handles
            switch_alert_window(all_handle,handle)
            sleep 3
            reslut = top_title
            add_new_data_close_button.click
            switch_window handle
            reslut
          end

          private
          #
          def config_manage_plan_click
            @driver[:id=>'content'].find_elements(:tag_name=>'a')[0]
          end
          #
          def set_data_table
            @table  = table @driver[:id=>'dataListTable_NFSDataList']
          end
          #
          def category_root_node
            @table[1][0].find_elements(:tag_name=>'span')[0]
          end
          #
          def add_new_category
            @driver[:id=>'jqContextMenu'].find_element(:id=>'newCategory')
          end
          #
          def add_new_data
            @driver[:id=>'jqContextMenu'].find_element(:id=>'newData')
          end

          def add_new_data_close_button
            @driver[:xpath=>"//div[@align='center']"].find_elements(:tag_name=>'input')[1]
          end
          #
          def import_data
            @driver[:id=>'jqContextMenu'].find_element(:id=>'importData')
          end


        end #DataManagePlanPage
      end #PojectPlan
    end #page
  end #Pm
end #webdriver