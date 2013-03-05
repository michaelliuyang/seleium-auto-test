require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'my audit page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @my_audit_page = @page_container.my_audit_page
          @my_audit_page.to_this_page
        end

        after :all do
         @page_container.close
        end

        it 'my audit menu click success?' do
          @my_audit_page.to_this_page
          my_audit = @wkb_profiles['my_task']['my_audit']
          actual_top_title = @my_audit_page.top_title
          actual_top_title.should == my_audit
        end
      end

    end  #MyTask
  end  #Wkb
end #WebDriver