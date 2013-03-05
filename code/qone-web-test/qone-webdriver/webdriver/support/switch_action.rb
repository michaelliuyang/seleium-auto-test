module WebDriver
  module Support
    module SwitchAction
      
      def switch_to_frame frame
        @driver.switch_to.frame frame
      end
      
      def switch_out_frame
        @driver.switch_to.default_content
      end
      
      def switch_window handle
        @driver.switch_to.window handle
      end
      
      def switch_alert_window(handles,current_handle,&blk)
        current = 0
        handles.each do |handle|
          unless handle == current_handle
            @driver.switch_to.window(handle)
            yield if block_given?
            current = handle
          end
        end
        current
      end
      
      def alert_text
        alert.text
      end
      
      def alert_ok
        alert.accept
      end
      
      def alert_cancel
        alert.dismiss
      end
      
      def alert
        @driver.switch_to.alert
      end
      
      def checked_element_by_id(id)
        js = "el = document.getElementById('"+"#{id}"+"');
        el.checked = 'checked';"
        @driver.execute_script js
      end

      def checked_element_by_name(name)
         js = "el = document.getElementById('"+"#{name}"+"');
        el.checked = 'checked';"
        @driver.execute_script js
      end
      
    end # SwitchAction
  end # Support
end # WebDriver