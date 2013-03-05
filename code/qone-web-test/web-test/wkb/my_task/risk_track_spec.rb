require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'risk track page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @risk_track_page = @page_container.risk_track_page
          @risk_track_page.to_this_page
        end

        after :all do
         @page_container.close
        end

        it 'risk track menu click success?' do
          risk_track = @wkb_profiles['my_task']['risk_track']
          actual_top_title = @risk_track_page.top_title
          actual_top_title.should == risk_track
        end
      end

    end  #MyTask
  end  #Wkb
end #WebDriver