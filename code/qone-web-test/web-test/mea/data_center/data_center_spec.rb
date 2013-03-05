require_relative '../../load_helper'

module WebTest
  module Mea
    module DataCenter

      describe 'data center page ' do

        before :all do
         driver = Support::Login.login
          @page_container = WebDriver.create_page_container :mea, driver
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @data_center_page = @page_container.data_center_page
          @data_center_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          data_center_top_title = @mea_profiles['data_center']['data_center_top_title']
          #when
          actual_top_title = @data_center_page.top_title
          #then
          actual_top_title.should == data_center_top_title
        end
        
        it 'new build view button click success?' do
          #given
          
          #when
          @data_center_page.new_view
          #then
          
        end

      end #describe
      
    end#DataCenter
  end#Mea
end#WebTest