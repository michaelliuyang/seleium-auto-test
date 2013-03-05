require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Pm
    module Page
      module ProductReview
        class ReviewDefectQueryPage < Common::BasePage
          include Support::MenuAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            product_review = @pm_profiles['product_review']['product_review']
            review_defect_query = @pm_profiles['product_review']['review_defect_query']
            show_menu_by_js "pm_judge"
            menu_click review_defect_query
            #menu_click_for_hide product_review,review_defect_query
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end
        end #ReviewDefectQueryPage
      end #ProductReview
    end #  Page
  end # Pm
end  # WebDriver