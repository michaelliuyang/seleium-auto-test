require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyMeeting
      describe 'my meeting page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @data_wkb = Helper::ReadProfiles.data :wkb
          @my_meeting_page = @page_container.my_meeting_page
          @my_meeting_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success?' do
          #given
          expect_page_title = @wkb_profiles['my_meeting']['my_meeting_page_title']
          #when
          actual_page_title = @my_meeting_page.page_title
          #then
          actual_page_title.should == expect_page_title
        end
        
#add and delete can't use .add because select time ;delete because alert
        it 'add button click success ?' do
          #given
          expect_summary_title = @wkb_profiles['my_meeting']['meeting_summary_top_title']         
          #when
          actual_summary_title = @my_meeting_page.add_meeting_summary_title
          #then
          actual_summary_title.should == expect_summary_title
        end
        
        it 'modify  click success ?' do
          #given
          name_modify = @data_wkb['my_meeting']['name_for_modify_meeting']
          @my_meeting_page.modify_meeting name_modify
          #when
          actual = @my_meeting_page.find_meeting_name? name_modify 
          #then 
          actual.should == true
        end
        
        it 'delete click success ?' do
          @my_meeting_page.delete_meeting
        end
        
        it 'view click success ?' do
          #given
          expect_title = @wkb_profiles['my_meeting']['meeting_summary_top_title']
          #when
          actual_title = @my_meeting_page.view_meeting
          #then
          actual_title.should == expect_title
        end
        
        it 'email click success' do
          #given
          tab_text = @wkb_profiles['my_meeting']['tab_text_email']
          #when
          actual_text = @my_meeting_page.email_meeting
          #then
          actual_text.should == tab_text
        end
        
        it 'draft meeting link click success ?' do
          #given
          expect_top_title = @wkb_profiles['my_meeting']['draft_top_title']
          #when
          title = @my_meeting_page.draft_meeting_summary_title
          #then
          title.should == expect_top_title
        end
        
        it 'unread meeting link click success ?' do
          #given
          expect_top_title = @wkb_profiles['my_meeting']['unread_top_title']
          #when
          title = @my_meeting_page.unread_meeting_summary_title
          #then
          title.should == expect_top_title
        end
        
        it 'all meeting link click success ?' do
          #given
          expect_top_title = @wkb_profiles['my_meeting']['meeting_summary_list']
          #when
          title = @my_meeting_page.all_meeting_summary_title
          #then
          title.should == expect_top_title
        end
        
      end
    end #MyMeeting
  end # Wkb
end # WebTest