require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProductReview
          class ReviewPlanPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            product_review = @pm_profiles['product_review']['product_review']
            review_plan = @pm_profiles['product_review']['review_plan']
            #menu_click_for_hide product_review,review_plan
            show_menu_by_js "pm_judge"
            menu_click review_plan
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end
          def click_review_report(click_report_name)
            super_link(click_report_name)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            conclution_list_super_link.click
            sleep 3
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            page_title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            page_title
          end
          def modify_report_basic_information(click_report_name)
            super_link(click_report_name)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            modify_report_basic_information_button.click
            sleep 3
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            page_title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            page_title
          end
          def check_the_checklist(click_report_name)
            super_link(click_report_name)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            check_the_checklist_button.click
            sleep 3
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            page_title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            page_title
          end
          def defect_list(click_report_name)
            super_link(click_report_name)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            defect_list_button.click
            sleep 3
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            page_title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            page_title
          end
          def send_mail_notification(click_report_name)
            super_link(click_report_name)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            send_mail_notification_button.click
            sleep 3
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            page_title = send_mail_top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            page_title
          end

          def modify_review_plan(review_report_name)
            plan_table = table review_plan_table
            row_count = find_target_row(plan_table,review_report_name,4)
            modify_button(plan_table,row).click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            sleep 3
            page_title = top_title
            close_button.click
            switch_window first_handle
            page_title
          end
          
          private
          def review_plan_table
             @driver.find_element(:css =>"div[id='content'] table")
          end
          def super_link(type_name)
            @driver.find_element(:link =>type_name).click       
          end
          def conclution_list_super_link
            link_name = @pm_profiles['product_review']['individual_appraisal_conclusion_list']
            @driver.find_element(:link => link_name)
          end
          def modify_report_basic_information_button
            button_name = @pm_profiles['product_review']['modify_report_basic_information']
            @driver.find_element(:link => button_name)
          end 
          def check_the_checklist_button
             button_name = @pm_profiles['product_review']['check_the_checklist']
             @driver.find_element(:link => button_name)
          end
          def defect_list_button
             button_name = @pm_profiles['product_review']['defect_list']
             @driver.find_element(:link => button_name)
          end
          def send_mail_notification_button
             button_name = @pm_profiles['product_review']['send_mail_notification']
             @driver.find_element(:link => button_name)
          end
          def send_mail_top_title
             @driver[:css=>'#addContent h2'].text
          end
          def submit_button
            submit_name = @pm_profiles['product_review']['submit']
            @driver.find_element(:css =>"input[value='#{submit_name}']")
          end
          def close_button
            close_name = @pm_profiles['product_review']['close']
            @driver.find_element(:css =>"input[value='#{close_name}']")
          end
          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
              @driver.switch_to.window(handle)
              end
            end
          end
          def find_target_row table,style_name,col
            num = table.row_count
            row = 0
            (1..num-2).each do |r|
              if table[r][col].text == style_name
              row =r
              end
            end
            row
          end
          def modify_button table,row
            modify_name = @pm_profiles['project_estimate']['modify']
            table[row].find_element(:css =>"tb[title = '#{modify_name}'] a img")
          end
         end # ReviewPlanPage
      end # ProductReview
    end # Page
  end # Pm
end  # WebDriver