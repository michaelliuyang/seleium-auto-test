require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'

module WebDriver
  module Pm
    module Page
      module ProjectPlan
        class OutsourcePlanPage < Common::BasePage
           include Support::MenuAction
           include Support::SwitchAction
           include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_plan = @pm_profiles['project_plan']['project_plan']
            outsource_plan = @pm_profiles['project_plan']['outsource_plan']
            menu_click_for_hide project_plan,outsource_plan
          end



           def add_outsource_plan_page_check?
            add_outsource_plan_button.click
            handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles,handle)
             return_text = top_title
            close_button.click
             switch_window handle
             return_text
           end

           def modify_outsource_plan_page_check?
             set_outsource_plan_list_table
             row = 1
             modify_img =modify_img row
             modify_img.click
             handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles,handle)
             return_text = top_title
            close_button.click
             switch_window handle
             return_text
           end

           def deleted_outsource_plan_page_check?
             set_outsource_plan_list_table
             row = 1
             del_img =del_img row
             del_img.click
             handle = @driver.window_handle
             all_handles= @driver.window_handles
             switch_alert_window(all_handles,handle)
             return_text = top_title
             close_button.click
             switch_window handle
             return_text
           end

          private

          def add_outsource_plan_button
            add_outsource_plan = @pm_profiles['project_plan']['add_outsource_plan']
            @driver[:link=>add_outsource_plan]
          end

          def close_button
            @driver[:xpath=>"//input[@type='button']"]
          end

          def set_outsource_plan_list_table
            @table = table @driver[:xpath=>"//table[@cellspacing='1']"]
          end

          def modify_img row
            @table[row][6].find_elements(:tag_name=>'img')[0]
          end

          def del_img row
            @table[row][6].find_elements(:tag_name=>'img')[1]
          end


        end#OutsourcePlanPage
      end#PojectPlan
    end #page
  end  #Pm

end #webdriver

