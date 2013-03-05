module WebDriver
  module Support
    module DriverExtensionAction
      
      def mouse_right_click(element)
        @driver.action.context_click(element).perform
      end
      
      def mouse_double_click(element)
        @driver.action.double_click(element).perform
      end
      
      def mouse_click(element)
        @driver.action.click(element).perform
      end
      
      def send_key_and_press_enter(element,content)
        element.send_keys content,Selenium::WebDriver::Keys[:return]
      end
      
    end # DriverExtensionAction
  end # Support
end # WebDriver