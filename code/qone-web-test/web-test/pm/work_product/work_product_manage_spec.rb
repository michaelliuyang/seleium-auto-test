require_relative '../../load_helper'
module WebTest
   module Pm
     module WorkProduct
          
        describe 'work product manage page' do
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
          @work_product_manage_page = @page_container.work_product_manage_page
          @work_product_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          work_product_list = @pm_profiles['work_product']['work_product_list']
          #when
          actual_top_title = @work_product_manage_page.top_title
          #then
          actual_top_title.should == work_product_list
        end
        
        it 'root node add folder success?' do
          #given
          #work_product_list = @pm_profiles['work_product']['work_product_list']
          #when
          @work_product_manage_page.add_floder_test
          #then
          #actual_top_title.should == work_product_list
        end
       

        end  # descri
     end   #  WorkProduct
   end   # Pm
end # WebTest