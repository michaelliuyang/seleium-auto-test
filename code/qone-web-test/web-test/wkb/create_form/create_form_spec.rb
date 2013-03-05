require_relative '../../load_helper'

module WebTest
  module Wkb
    module CreateForm
      describe 'create form page test' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @data_wkb = Helper::ReadProfiles.data :wkb
          @create_form_page = @page_container.create_form_page
          @create_form_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success?' do
          #given
          expect_page_title = @wkb_profiles['create_form']['create_form_page_title']
          #when
          actual_page_title = @create_form_page.page_title
          #then
          actual_page_title.should == expect_page_title
        end

        it 'launch form success ?' do
          #given
          form_name = @data_wkb['create_form']['name_for_form']
          form_title = @data_wkb['create_form']['title_for_form']
          form_project = @data_wkb['create_form']['project_name']
          expect_notice_text = @wkb_profiles['create_form']['notice_text']
          #when
          actual_notice_text = @create_form_page.launch_form(form_name,form_title,form_project)         
          #then
          actual_notice_text.should == expect_notice_text
        end
        
        it 'template name link click success' do
          #given
          top_title = @wkb_profiles['create_form']['top_title']
          #when
          actual_top_title = @create_form_page.examine_and_approve_page
          #then
          actual_top_title.should == top_title
        end

      end
    end #CreateForm
  end # Wkb
end # WebTest