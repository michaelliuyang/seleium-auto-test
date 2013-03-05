module WebDriver
  module Support
    module MenuAction
      
      def menu_click(menu)
        if menu.is_a? Selenium::WebDriver::Element
          #@driver.mouse.move_to menu
          menu.click
        elsif menu.is_a? String
          #@driver.mouse.move_to @driver[:link => menu]
          @driver[:link => menu].click
        else
          raise "menu arg is error"
        end
      end
      
      def menu_click_for_hide(parent_menu,menu)
        if parent_menu.is_a? Selenium::WebDriver::Element
          @driver.mouse.move_to parent_menu 
        elsif parent_menu.is_a? String
          @driver.mouse.move_to @driver[:link => parent_menu]
        else
          raise "parent_menu arg is error"
        end
         menu_click menu
      end
      
      def show_menu_by_js(menu_id)
        sleep 1
        js = "el = document.getElementById('"+"#{menu_id}"+"');
        el.style.display = 'block';
        el.style.visibility = 'visible';"
        @driver.execute_script js
      end
      
      def exit
        @driver[:css=>"div#topBar a[href='/pm/logonAction.do?opFlag=logoff']"].click
      end
      
    end # MenuSupport
  end # Support
end # WebDriver