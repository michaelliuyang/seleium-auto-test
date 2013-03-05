require_relative '../../load_helper'

module WebTest
  module Wkb
    module SystemMessage
      describe 'system notice page' do
        before :all do
          driver = Support::Login.login(:name=>'sa', :pwd=>'intec')
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @system_notice_page = @page_container.system_notice_page
          @system_notice_page.to_this_page
        end
        after :all do
          @page_container.close
        end


        it 'add notice be success?' do
          notice_title = @wkb_profiles['system_message']['notice_title']
          notice_content = @wkb_profiles['system_message']['notice_content']
          @system_notice_page.new_notice_button.click
          @system_notice_page.notice_title_input_box.send_keys notice_title
          @system_notice_page.notice_content_input_box.send_keys notice_content
          @system_notice_page.submit_button.click
          actual = @system_notice_page.notice_list_title_at_row 1
          actual.should == notice_title
        end

        it 'update notice be success?' do
          alter_notice_title = @wkb_profiles['system_message']['alter_notice_title']
          alter_notice_content = @wkb_profiles['system_message']['alter_notice_content']
          row = 1
          @system_notice_page.alter_notice_at_row(row, alter_notice_title, alter_notice_content)
          actual = @system_notice_page.notice_list_title_at_row row
          actual.should == alter_notice_title
        end
        it 'delete notice be success?' do
          @system_notice_page.refresh
          total_row_number = @system_notice_page.total_row_number
          expect = total_row_number - 1
          @system_notice_page.delete_notice_at_row 1
           @system_notice_page.refresh
          actual_number = @system_notice_page.total_row_number
          actual_number.should == expect
        end

        describe'menu and link page check testing'do
         it 'system notice menu click success?' do
          notice_list = @wkb_profiles['system_message']['notice_list']
          actual_top_title = @system_notice_page.top_title
          actual_top_title.should == notice_list
         end
          it' view notice page 'do
            view_notice_title = @wkb_profiles['system_message']['view_notice_title']
            actual_title = @system_notice_page.view_notice_page_check
            actual_title.should == view_notice_title
          end
        end
      end
    end #SystemMessage
  end # Wkb
end # WebTest