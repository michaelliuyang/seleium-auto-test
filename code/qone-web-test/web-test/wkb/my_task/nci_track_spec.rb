require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'nci track page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @nci_track_page = @page_container.nci_track_page
          @nci_track_page.to_this_page
        end

        after :all do
         @page_container.close
        end

        it 'nci track menu click success?' do
          nci_track = @wkb_profiles['my_task']['nci_track']
          actual_top_title = @nci_track_page.top_title
          actual_top_title.should == nci_track
        end
      end

    end  #MyTask
  end  #Wkb
end #WebDriver