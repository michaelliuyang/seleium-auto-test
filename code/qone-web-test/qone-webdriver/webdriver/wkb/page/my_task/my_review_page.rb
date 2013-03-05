class MyReviewPage
  # To change this template use File | Settings | File Templates.
end

require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Wkb
    module Page
      module MyTask
        class MyReviewPage < Common::BasePage
          include Support::MenuAction
          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            my_task = @wkb_profiles['my_task']['my_task']
            my_review = @wkb_profiles['my_task']['my_review']
            menu_click work_bench
            menu_click_for_hide my_task,my_review
          end
        end # MyReviewPage
      end # MyTask
    end # Page
  end # Wkb
end # WebDriver