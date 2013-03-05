require_relative '../../load_helper'
module WebTest
  module Cm
    module ConfigLibraryRelation
        describe 'config item browse page' do
        before :all do
          @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
          @cm_data = Helper::ReadProfiles.data :cm
          @scm_login_name = @cm_data['login']['scm_login_name']
          @login_password = @cm_data['login']['login_password']
          @driver = Support::Login.login(:name => @scm_login_name, :pwd => @login_password)
          @page_container = WebDriver.create_page_container :cm, @driver
          @config_library_relation_page = @page_container.config_library_relation_page
          @config_library_relation_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'config item browse menu click success?' do
          #given
          config_library_relation_list = @cm_profiles['config_library_relation']['config_library_relation_list']
          #when
          actual = @config_library_relation_page.top_title
          #then
          actual.should == config_library_relation_list
        end

        # it 'modify control library config information function worked?'do
          # #given
          # control_library_name = @cm_profiles['config_library_relation']['control_library']
          # expect_title = @cm_profiles['config_library_relation']['config_library_information']
          # #when
          # actual = @config_library_relation_page.modify_config_library_relation control_library_name
          # #then
          # actual.should == expect_title
        # end

        it 'create control library create user relation function worked?' do
          #given
          control_library_name = @cm_profiles['config_library_relation']['control_library']
          expect_title = @cm_profiles['config_library_relation']['create_user_relation']
          cm_username = @cm_data['config_library_relation']['cm_username']
          cm_password = @cm_data['config_library_relation']['cm_password']
          #when
          actual = @config_library_relation_page.create_user_relation(control_library_name,cm_username,cm_password)
          #then
          actual.should == expect_title
        end
     
        it 'look control library user config state function worked?'do
          #given
          control_library_name = @cm_profiles['config_library_relation']['control_library']
          expect_title = @cm_profiles['config_library_relation']['user_config_state']
          #when
          actual = @config_library_relation_page.look_user_config_state(control_library_name)
          #then
          actual.should == expect_title
        end

        # it 'modify product library config information function worked?' do
          # #given
          # product_library_name = @cm_profiles['config_library_relation']['product_library']
          # expect_title = @cm_profiles['config_library_relation']['config_library_information']
          # #when
          # actual = @config_library_relation_page.modify_config_library_relation product_library_name
          # #then
          # actual.should == expect_title
        # end
        it 'create product library create user relation function worked?' do
          #given
          product_library_name = @cm_profiles['config_library_relation']['product_library']
          expect_title = @cm_profiles['config_library_relation']['create_user_relation']
          cm_username = @cm_data['config_library_relation']['cm_username']
          cm_password = @cm_data['config_library_relation']['cm_password']
          #when
          actual = @config_library_relation_page.create_user_relation(product_library_name,cm_username,cm_password)
          #then
          actual.should == expect_title
        end
        it 'look product library user config state function worked?'do
          #given
          product_library_name = @cm_profiles['config_library_relation']['product_library']
          expect_title = @cm_profiles['config_library_relation']['user_config_state']
          #when
          actual = @config_library_relation_page.look_user_config_state(product_library_name)
          #then
          actual.should == expect_title
        end
          end
     end # ConfigLibraryRelation
  end # Cm
end #WebTest
