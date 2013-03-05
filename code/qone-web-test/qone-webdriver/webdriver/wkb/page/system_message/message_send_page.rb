require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Wkb
    module Page
      module SystemMessage
        class MessageSendPage < Common::BasePage
          include Support::MenuAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            system_message = @wkb_profiles['system_message']['system_message']
            message_send = @wkb_profiles['system_message']['message_send']
            menu_click work_bench
            menu_click_for_hide system_message, message_send
          end

        end #MessageSendPage
      end #SystemMessage
    end #  Page
  end # Wkb
end #WebDriver