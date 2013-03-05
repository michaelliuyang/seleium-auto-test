require_relative '../../load_helper'

module WebTest
  module Sm
    module StaffManage
      describe 'position manage page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @data_profiles = Helper::ReadProfiles.data :sm
          @sm_login_name =@data_profiles['login']['login_name']
          @sm_password =@data_profiles['login']['login_passwd']
          @driver = Support::Login.login(:name => @sm_login_name, :pwd => @sm_password)
          @page_container = WebDriver.create_page_container :sm, @driver
          @position_manage_page = @page_container.position_manage_page
          @position_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'position manage page accessed?'do
        #given
          expect = @page_profiles['staff_manage']['position_manage_top_title']
          #when
          actual = @position_manage_page.top_title
          #then
          actual.should == expect
        end

        it 'add position manage page accessed?'do
        #given
          expect = @page_profiles['staff_manage']['add_position_top_title']
          #when
          actual = @position_manage_page.add_position_page_check
          #then
          actual.should == expect
        end

        it 'add position function worked?'do
        #given
          position_name = @data_profiles['position']['name_for_add']
          sleep 3
          @position_manage_page.add_position position_name
          expect = true
          #when
          actual = @position_manage_page.position_name_exist? position_name
          sleep 2
          #then
          actual.should == expect
        end

        it 'look position function worked?'do
        #given
          position_name = @data_profiles['position']['name_for_add']
          expect = @page_profiles['staff_manage']['look_position']
          #when
          actual = @position_manage_page.look_position position_name
          #then
          actual.should == expect
        end

        it 'modify position function worked?'do
        #given
          position_name = @data_profiles['position']['name_for_add']
          new_position_name = @data_profiles['position']['name_for_modify']
          @position_manage_page.modify_position position_name,new_position_name
          sleep 3
          expect = true
          #when
          actual = @position_manage_page.position_name_exist? new_position_name
          #then
          actual.should == expect
        end

        it 'delete position function worked?'do
        #given
          new_position_name = @page_profiles['staff_manage']['new_position_name']
          @position_manage_page.del_position new_position_name
          expect = false
          #when
          actual = @position_manage_page.position_name_exist? new_position_name
          sleep 3
          #then
          actual.should == expect
        end

      end #describe
    end #StaffManage
  end #Sm
end #Webtest