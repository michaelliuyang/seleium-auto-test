require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'bug track page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @bug_track_page = @page_container.bug_track_page
          @bug_track_page.to_this_page
        end

        after :all do
         @page_container.close
        end

        it 'bug track menu click success?' do
          bug_track = @wkb_profiles['my_task']['bug_track']
          actual_top_title = @bug_track_page.top_title
          actual_top_title.should == bug_track
        end

      end
    end  #MyTask
  end  #Wkb
end #WebDriver