require_relative '../../load_helper'
module WebTest
  module Cm
    module BaselineBrowse

        describe 'baseline browse page' do
        before :all do
          @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
          @cm_data = Helper::ReadProfiles.data :cm
          @pcm_login_name = @cm_data['login']['pcm_login_name']
          @login_password = @cm_data['login']['login_password']
          @driver = Support::Login.login(:name => @pcm_login_name, :pwd => @login_password)
          @page_container = WebDriver.create_page_container :cm, @driver
          @baseline_browse_page = @page_container.baseline_browse_page
          @baseline_browse_page.to_this_page
        end

        after :all do
          @page_container.close
        end
        it 'baseline browse menu click success?' do
          #given
          baseline_browse_view=@cm_profiles['baseline_browse']['baseline_browse_view']
          #when
          actual = @baseline_browse_page.top_title
          #then
          actual.should == baseline_browse_view
        end
            
        it 'table view change view view click success?' do
          #given
          table_view=@cm_profiles['baseline_browse']['table_view']
          #when
          @baseline_browse_page.click_change_view table_view
        end
        
        it 'click  baseline name super link  success?' do
          #given
          baseline_identification=@cm_data['baseline_browse']['baseline_item_identification']
          exception_title = @cm_profiles['baseline_browse']['baseline_basic_information']
          #when
          actual_title = @baseline_browse_page.baseline_name baseline_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  the baseline is established for button success?' do
          #given
          baseline_identification=@cm_data['baseline_browse']['baseline_item_identification']
          exception_title = @cm_profiles['baseline_browse']['the_baseline_is_established_for']
          #when
          actual_title = @baseline_browse_page.the_baseline_is_established_for baseline_identification
          #then
          actual_title.should == exception_title
        end
        
         it 'click baseline basic information button success?' do
          #given
          baseline_identification=@cm_data['baseline_browse']['baseline_item_identification']
          exception_title = @cm_profiles['baseline_browse']['baseline_database_application']
          #when
          actual_title = @baseline_browse_page.baseline_database_application baseline_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'tree view change table view click success?' do
          #given
          tree_view=@cm_profiles['baseline_browse']['tree_view']
          #when
          @baseline_browse_page.click_change_view tree_view
        end

        end
     end # BaselineBrowse
  end # Cm
end #WebTest
