require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
module WebDriver
  module Pm
    module Page
      module RiskProblem
        class RiskCountPage < Common::BasePage
          include Support::MenuAction
          include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            risk_problem = @pm_profiles['risk_problem']['risk_problem']
            risk_count = @pm_profiles['risk_problem']['risk_and_count']
            menu_click_for_hide risk_problem,risk_count
          end

          def risk_attribute_tab_check
             risk_attribute.click
             submit_date
          end

          def risk_trend_tab_check
            risk_trend.click
            periods_of_time
          end

          private
          def risk_attribute
            risk_attribute_count = @pm_profiles['risk_problem']['risk_attribute_count']
            @driver.find_element(:link => risk_attribute_count)
          end

          def risk_trend
            risk_trend_count = @pm_profiles['risk_problem']['risk_trend_count']
            @driver.find_element(:link => risk_trend_count)
          end

          def submit_date
             risk_attribute_table = table risk_table
             risk_attribute_table[2][0].text
          end

          def periods_of_time
             risk_trend_table = table risk_table
            risk_trend_table[2][0].text
          end

          def risk_table
            @driver[:id => 'queryForm']
          end


        end #RiskCountPage
      end # RiskProblem
    end #Page
  end # Pm
end #WebDriver