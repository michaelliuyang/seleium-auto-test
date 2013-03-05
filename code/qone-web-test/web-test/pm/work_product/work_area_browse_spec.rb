require_relative '../../load_helper'
module WebTest
   module Pm
     module WorkProduct
        
        describe 'work area browse page' do
          
        before :all do
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @pm_data = Helper::ReadProfiles.data :pm
          @pm_login_name = @pm_profiles['pm_login_name']
          @pm_password = @pm_profiles['password']
          @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
          @page_container = WebDriver.create_page_container :pm, @driver
          @project_list_page = @page_container.project_list_page
          @project_list_page.to_this_page
          project_name = @pm_data['project_list']['project_name']
          @project_list_page.enter_project project_name
          @work_area_browse_page = @page_container.work_area_browse_page
          @work_area_browse_page.to_this_page
        end
        
        after :all do
          @page_container.close
        end
        
        it 'menu page test' do
          #given
          please_select_view_work_area = @pm_profiles['work_product']['please_select_view_work_area']
          #when
          actual_top_title = @work_area_browse_page.top_title
          #then
          actual_top_title.should == please_select_view_work_area
        end
        
        it 'set user login success?' do
          #given
          set_repository_login = @pm_profiles['work_product']['set_repository_login']
          #when
          actual_top_title = @work_area_browse_page.set_user_login
          #then
          actual_top_title.should == set_repository_login
        end
        
        it 'enter work area browse success?' do
          #given
          repository_file_list = @pm_profiles['work_product']['repository_file_list']
          work_area_select = @pm_data['work_product']['work_area_browse_for_select']
          username = @pm_data['work_product']['username_for_add']
          password = @pm_data['work_product']['password_for_add']
          #when
          actual_top_title = @work_area_browse_page.enter_work_area(work_area_select,username,password)
          #then
          actual_top_title.should == repository_file_list
        end

        end  # describe
     end   #  WorkProduct
   end   # Pm
end # WebTest