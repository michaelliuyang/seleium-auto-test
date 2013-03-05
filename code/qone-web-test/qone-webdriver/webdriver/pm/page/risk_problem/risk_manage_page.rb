require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'
module WebDriver
  module Pm
    module Page
      module RiskProblem
        class RiskManagePage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            risk_problem = @pm_profiles['risk_problem']['risk_problem']
            risk_manage = @pm_profiles['risk_problem']['risk_manage']
            menu_click_for_hide risk_problem, risk_manage
          end

          def add_risk_page_check
            add_risk_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            add_risk_title = top_title
            close_button.click
            switch_window current_handle
            add_risk_title
          end

          def import_organization_risk_page_check
            import_organization_risk.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            organization_risk_title = top_title
            close_button.click
            switch_window current_handle
            organization_risk_title
          end

          def add_risk_to_import_organization_risk_page_check
            add_risk_button.click
            first_handle = @driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window(handles, first_handle)
            import_organization_risk.click
            handles = @driver.window_handles
            switch_three_window(handles, first_handle, second_handle)
            organization_level_risk_title = top_title
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
            organization_level_risk_title
          end

          def alter_risk_page_check
            alter = @pm_profiles['risk_problem']['alter']
            risk_list = table risk_table
            if risk_list.row_count > 2
              risk_list[1][17].find_element(:css => "a[title = '"+"#{alter}"+"']").click
              current_handle = @driver.window_handle
              handles = @driver.window_handles
              switch_alert_window(handles, current_handle)
              alter_risk_title = top_title
              close_alter_risk_button.click
              switch_window current_handle
              alter_risk_title
            end
          end

          def view_risk_page_check
            risk_list = table risk_table
            if risk_list.row_count > 2
              risk_list[1][1].find_element(:class => 'riskIdHref').click
              current_handle = @driver.window_handle
              handles = @driver.window_handles
              switch_alert_window(handles, current_handle)
              view_risk_title = top_title
              close_button.click
              switch_window current_handle
              view_risk_title
            end
          end

          def view_switch_problem_page_check
            risk_list = table risk_table
            if risk_list.row_count > 2
              risk_list[1][14].find_element(:tag_name => 'a').click
              current_handle = @driver.window_handle
              handles = @driver.window_handles
              switch_alert_window(handles, current_handle)
              view_problem_title1 = view_problem_title
              close_button.click
              switch_window current_handle
              view_problem_title1
            end
          end

          def view_problem_print_page_check
            risk_list = table risk_table
            if risk_list.row_count > 2
              risk_list[1][14].find_element(:tag_name => 'a').click
              first_handle = @driver.window_handle
              handles = @driver.window_handles
              second_handle = switch_alert_window(handles, first_handle)
              problem_print_button.click
              sleep 15
              handles = @driver.window_handles
              switch_three_window(handles, first_handle, second_handle)
              print_page_title = @driver[:class => 's1'].text
              puts print_page_title
              @driver.close
              switch_window second_handle
              close_button.click
              switch_window first_handle
              print_page_title
            end
          end

          def risk_list_print_page_check
            risk_list_print_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            title = risk_list_print_title
            @driver.close
            switch_window current_handle
            title
          end

          private

          def risk_list_print_title
            @driver[:class => 's1'].text
          end

          def risk_list_print_button
            print_button = @pm_profiles['risk_problem']['print_button']
            @driver[:xpath => "//input[@value = '#{print_button}']"]
          end

          def problem_print_button
            print_button = @pm_profiles['risk_problem']['print_button']
            @driver[:xpath => "//input[@value = '#{print_button}']"]
          end

          def view_problem_title
            @driver[:css => 'div.div-outerLayer h2'].text
          end

          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
                @driver.switch_to.window(handle)
              end
            end
          end

          def add_risk_button
            add_risk = @pm_profiles['risk_problem']['add_risk']
            @driver[:link =>add_risk]
          end

          def close_button
            close = @pm_profiles['risk_problem']['close_button']
            @driver[:css => "input[value = '"+"#{close}"+"']"]
          end

          def close_alter_risk_button
            @driver[:class=>'bottomButtons'].find_elements(:tag_name=>'input')[1]
          end

          def import_organization_risk
            import_organization_level_risk = @pm_profiles['risk_problem']['import_organization_level_risk']
            @driver[:link => import_organization_level_risk]
          end

          def risk_table
            @driver[:id => 'dataListTable_NFSDataList']
          end


        end #RiskManagePage
      end # RiskProblem
    end #Page
  end # Pm
end #WebDriver