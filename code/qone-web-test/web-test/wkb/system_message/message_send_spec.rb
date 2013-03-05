require_relative '../../load_helper'

module WebTest
  module Wkb
    module SystemMessage
      describe 'message send page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @message_send_page = @page_container.message_send_page
          @message_send_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'message send menu click success?' do
          message_send = @wkb_profiles['system_message']['message_send']

          actual_top_title = @message_send_page.top_title
          actual_top_title.should == message_send
        end
      end
    end #SystemMessage
  end #Wkb
end # WebTest