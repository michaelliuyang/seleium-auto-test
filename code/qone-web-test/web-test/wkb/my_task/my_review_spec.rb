require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'my review page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @my_review_page = @page_container.my_review_page
          @my_review_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'my review menu click success?'do
          my_review = @wkb_profiles['my_task']['my_review']
          actual_top_title = @my_review_page.top_title
          actual_top_title.should == my_review
        end
      end
    end # MyTask
  end # Wkb
end # WebTest