require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyMeeting
      describe 'meeting summary list page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @meeting_summary_list_page = @page_container.meeting_summary_list_page
          @meeting_summary_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'meeting summary list menu click success?'do
          meeting_summary_list = @wkb_profiles['my_meeting']['meeting_summary_list']
          actual_top_title = @meeting_summary_list_page.top_title
          actual_top_title.should == meeting_summary_list
        end

      end
    end #MyMeeting
  end # Wkb
end  # WebTest