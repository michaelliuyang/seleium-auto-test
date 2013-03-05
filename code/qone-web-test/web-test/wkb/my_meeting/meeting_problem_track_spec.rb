require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyMeeting
      describe 'meeting problem track page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @meeting_problem_track_page = @page_container.meeting_problem_track_page
          @meeting_problem_track_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'meeting problem track menu click success?'do
          meeting_problem_track = @wkb_profiles['my_meeting']['meeting_problem_track']
          actual_top_title = @meeting_problem_track_page.top_title
          actual_top_title.should == meeting_problem_track
        end


      end
    end #MyMeeting
  end # Wkb
end  # WebTest