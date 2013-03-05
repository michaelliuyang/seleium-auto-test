require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProductReview
          class ReviewReportPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            product_review = @pm_profiles['product_review']['product_review']
            review_report = @pm_profiles['product_review']['review_report']
            #menu_click_for_hide product_review,review_report
            show_menu_by_js "pm_judge"
            menu_click review_report
          end
          def top_title
            @driver[:css=>'#content h2'].text
          end

            end #ReviewReportPage
      end #ProductReview
    end #  Page
  end # Pm
end  # WebDriver