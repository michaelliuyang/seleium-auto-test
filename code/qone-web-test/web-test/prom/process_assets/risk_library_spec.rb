require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe 'risk library' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @risk_library_page = @page_container.risk_library_page
          @risk_library_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          risk_list_top_title = @prom_profiles['process_assets']['risk_list_organization_level']
          #when
          actual_top_title = @risk_library_page.top_title
          #then
          actual_top_title.should == risk_list_top_title
        end

        it 'add risk success ?' do
        #given
          content = @data_prom['organization_risk']['content']
          influence = @data_prom['organization_risk']['influence']
          mitigation = @data_prom['organization_risk']['mitigation']
          emergency = @data_prom['organization_risk']['emergency']
          risk_describe = @data_prom['organization_risk']['risk_describe']
          @risk_library_page.add_risk(content,influence,mitigation,emergency)
          #when
          sleep 5
          flag = @risk_library_page.find_risk_describe_exist? risk_describe
          #then
          flag.should == true
        end

        it 'modify risk success ?' do
        #given
          description = @data_prom['organization_risk']['risk_describe_for_modify']
          reasons = @data_prom['organization_risk']['reasons']
          @risk_library_page.modify_risk(description,reasons)
          #when
          flag = @risk_library_page.find_risk_describe_exist? description
          #then
          flag.should == true
        end

        it 'describe link click success ?' do
        #given
          top_title = @prom_profiles['process_assets']['risk_describe_link_title']
          #when
          actual_top_title = @risk_library_page.into_describe_link
          #then
          actual_top_title.should == top_title
        end

        it 'delete rist success ?' do
        #given
          description = @data_prom['organization_risk']['risk_describe_for_modify']
          @risk_library_page.delete_risk
          #when
          flag = @risk_library_page.find_risk_describe_exist? description
          #then
          flag.should == false
        end

      end #describe
    end #ProcessAssets
  end #Prom
end # WebTest