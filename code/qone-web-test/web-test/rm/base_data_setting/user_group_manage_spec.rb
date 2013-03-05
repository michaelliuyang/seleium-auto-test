require_relative '../../load_helper'

module WebTest
  module Rm
    module BaseDataSetting
      describe 'user group manage page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @data_profiles = Helper::ReadProfiles.data :rm
          @login_name =@data_profiles['login']['login_name']
          @login_passwd =@data_profiles['login']['login_passwd']
          @driver = Support::Login.login(:name => @login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @user_group_manage_page = @page_container.user_group_manage_page
          @user_group_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'accessed?'do
          expect = @page_profiles['base_data_setting']['user_group_manage']
          actual = @user_group_manage_page.top_title
          actual.should == expect
        end
        
        it 'add user group successed?'do
          #given
          user_group_name = @data_profiles['user_group']['name_for_add']
          @user_group_manage_page.add_user_group user_group_name
          expect = 1
          #when
          actual = @user_group_manage_page.user_group_name_exist? user_group_name
          #then
          actual.should == expect
        end
        
        it 'look user group successed?'do
        #given
        user_group_name = @data_profiles['user_group']['name_for_add']
        @user_group_manage_page.look_user_group user_group_name
        expect = @page_profiles['base_data_setting']['user_group_detail']
        #when
        actual = @user_group_manage_page.look_user_group user_group_name
        #then
        actual.should == expect
        end  
      end #describe
   end#BaselineMange
  end #Rm
end #Webtest