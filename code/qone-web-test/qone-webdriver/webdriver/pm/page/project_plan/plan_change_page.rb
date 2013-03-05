require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'

module WebDriver
  module Pm
    module Page
      module ProjectPlan
        class PlanChangePage < Common::BasePage
           include Support::MenuAction
           include Support::Component
           include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_plan = @pm_profiles['project_plan']['project_plan']
            plan_change = @pm_profiles['project_plan']['plan_change']
            menu_click_for_hide project_plan,plan_change

          end

           def change_information_link_page_test row
             change_information_link_click row
             handle = @driver.window_handle
             all_handles= @driver.window_handles
             switch_alert_window(all_handles,handle)
             title_text = top_title
             close_button.click
             switch_window handle
             title_text
           end

           def change_gannt_link_page_test row
             flag = false
             element = changed_gannt_link row
             element.click
             handle = @driver.window_handle
             all_handles = @driver.window_handles
             switch_alert_window(all_handles,handle)
            unless changed_gannt_page_close_button == nil
               flag = true
            end
           changed_gannt_page_close_button.click
           switch_window handle
             flag
           end

           def spi_cpi_link_page_test row
             flag = false
             element = spi_cpi_link row
             element.click
             handle = @driver.window_handle
             all_handles = @driver.window_handles
             switch_alert_window(all_handles,handle)
             unless spi_cpi_page_close_button == nil
               flag = true
             end
             spi_cpi_page_close_button.click
             switch_window handle
               flag
           end

           def related_plan_download_link_page_test row
             flag = false
             element = related_plan_download_link row
             element.click
             sleep 3
             unless alert== nil
               flag = true
             end
             alert_cancel
             flag
           end

           def modify_plan_change_page_test row
             element = modify_img row
             element.click
             handle = @driver.window_handle
             all_handle = @driver.window_handles
             switch_alert_window(all_handle,handle)
             return_text =  top_title
            modify_or_approval_page_close.click
             switch_window handle
             return_text
           end

            def approval_plan_change_page_test row
             element = approval_img row
             element.click
             handle = @driver.window_handle
             all_handle = @driver.window_handles
             switch_alert_window(all_handle,handle)
             return_text =  top_title
             modify_or_approval_page_close.click
             switch_window handle
             return_text
           end

           private

           def changed_gannt_page_close_button
             @driver[:xpath=>"//div[@align='center']"].find_elements(:tag_name=>'input')[0]
           end

           def spi_cpi_page_close_button
            element = @driver[:id=>'content'].find_element(:name=>'button')
           end

           def change_information_link_click row
             element  = change_information_link row
             element.click
           end

           def close_button
             @driver[:name=>'return']
           end

          def set_plan_change_table
           @table = table @driver[:xpath=>"//table[@cellspacing='1']"]
          end

          def change_information_link row
            set_plan_change_table
            @table[row][2].find_elements(:tag_name=>'a')[0]
          end

          def changed_gannt_link row
            set_plan_change_table
            @table[row][5].find_elements(:tag_name=>'a')[0]
          end

          def spi_cpi_link  row
            set_plan_change_table
            @table[row][6].find_elements(:tag_name=>'a')[0]
          end

          def related_plan_download_link row
            set_plan_change_table
            @table[row][9].find_elements(:tag_name=>'a')[0]
          end

          def modify_img row
            set_plan_change_table
            @table[row][10].find_elements(:tag_name=>'img')[0]
          end

          def modify_or_approval_page_close
            close = @pm_profiles['project_plan']['close']
            @driver[:xpath=>"//input[@value='#{close}']"]
          end

          def approval_img row
            set_plan_change_table
            @table[row][11].find_elements(:tag_name=>'img')[0]
          end




        end#PlanChangePage
      end#PojectPlan
    end #page
  end  #Pm

end #webdriver