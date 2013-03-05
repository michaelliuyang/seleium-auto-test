require 'webdriver/common/base_page'

module WebDriver
    module Pm
      module Page
         module ProjectOutsourceManage
           class ProjectOutsourceManagePage < Common::BasePage
              def top_title
                   @driver[:css => '#content h2'].text
              end

              def to_this_page
                  @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                  project_outsource_manage = @pm_profiles['project_outsource_manage']['project_outsource_manage']
                  @driver[:link=>project_outsource_manage].click
              end

           end

         end
      end
    end
end




