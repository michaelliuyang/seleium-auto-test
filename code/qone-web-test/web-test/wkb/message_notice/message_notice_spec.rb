require_relative '../../load_helper'

module WebTest
  module Wkb
    module MessageNotice
      describe 'message notice test' do
        
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @data_wkb = Helper::ReadProfiles.data :wkb
          @message_notice_page = @page_container.message_notice_page
          @message_notice_page.to_this_page
        end
        
        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          expect_page_title = @wkb_profiles['message_notice']['message_notice_page_title']
          #when
          actual_page_title = @message_notice_page.page_title
          #then
          actual_page_title.should == expect_page_title
        end

        it 'add success ?' do
          #given
          title = @data_wkb['message_notice']['title_for_add']
          name = @data_wkb['message_notice']['name_for_add']
          content = @data_wkb['message_notice']['content_for_add']
          @message_notice_page.add_message_notice(title,name,content)
          #when
          flag = @message_notice_page.find_title_exist? title
          #then    
          flag.should == true   
        end
        
        it 'modify success ?' do
          #given
          title = @data_wkb['message_notice']['title_for_modify']
          @message_notice_page.modify_message_notice title
          #when
          flag = @message_notice_page.find_title_exist? title
          #then    
          flag.should == true   
        end
#Delete not realize        
        it 'delete success ?' do
          #given
          title = @data_wkb['message_notice']['title_for_delete']
          @message_notice_page.delete_message_notice
          #when
          flag = @message_notice_page.find_title_exist? title
          #then    
          flag.should == false
        end
        
        it 'view success ?' do
          #given
          top_title = @wkb_profiles['message_notice']['view_top_title']
          #when
          actual_title = @message_notice_page.view_message_notice_top_title
          #then
          actual_title.should == top_title
        end

      end
    end #MessageNotice
  end # Wkb
end # WebTest