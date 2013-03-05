require_relative '../../load_helper'
module WebTest
  module Cm
    module ConfigAudit

        describe 'config audit page' do
        before :all do
          @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
          @cm_data = Helper::ReadProfiles.data :cm
          @pcm_login_name = @cm_data['login']['pcm_login_name']
          @login_password = @cm_data['login']['login_password']
          @driver = Support::Login.login(:name => @pcm_login_name, :pwd => @login_password)
          @page_container = WebDriver.create_page_container :cm, @driver
          @config_audit_page = @page_container.config_audit_page
          @config_audit_page.to_this_page
        end

        after :all do
          @page_container.close
        end
        it 'config audit menu click success?' do
          #given
          config_audit_report = @cm_profiles['config_audit']['config_audit_report']
          #when
          actual = @config_audit_page.top_title
          #then
          actual.should == config_audit_report
        end
        
        it 'pending click success?'do
          #given
          expect_pending= @cm_profiles['config_audit']['pending']
          #when
          actual = @config_audit_page.pending_page
          #then
          actual.should == expect_pending
        end
        
        it 'approved click success?'do
          #given
          expect_approved = @cm_profiles['config_audit']['approved']
          #when
          actual = @config_audit_page.approved_page
          #then
          actual.should == expect_approved
        end
        
        it 'new audit report click success?' do
          #given
          expect_config_audit_report = @cm_profiles['config_audit']['config_audit_report']
          audit_products = @cm_data['config_audit']['audit_products']
          audit_conclusion = @cm_data['config_audit']['audit_conclusion']
          #when
          actual = @config_audit_page.new_audit_report_page_import_check_list_click(audit_products,audit_conclusion)
          #then
          actual.should == expect_config_audit_report
        end
        
        it 'look audit report click success?' do
          #given
          expect_config_audit_report = @cm_profiles['config_audit']['config_audit_report']
          serial_number = @cm_data['config_audit']['serial_number']
          #when
          actual = @config_audit_page.look_config_audit_report(serial_number)
          #then
          actual.should == expect_config_audit_report
        end
        
       end
     end # ConfigAudit
  end # Cm
end #WebTest
