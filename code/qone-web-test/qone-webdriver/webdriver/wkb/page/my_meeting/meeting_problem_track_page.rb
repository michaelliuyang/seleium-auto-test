require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Wkb
    module Page
      module MyMeeting
        class MeetingProblemTrackPage < Common::BasePage
          include Support::MenuAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            my_meeting = @wkb_profiles['my_meeting']['my_meeting']
            meeting_problem_track = @wkb_profiles['my_meeting']['meeting_problem_track']
            menu_click work_bench
            menu_click_for_hide my_meeting,meeting_problem_track
          end

        end # MeetingProblemTrackPage
      end#MyMeeting
    end#  Page
  end # Wkb
end #WebDriver