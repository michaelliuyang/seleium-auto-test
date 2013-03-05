#encoding: utf-8
require "selenium-webdriver"
dr = Selenium::WebDriver.for :ie
dr.get 'http://localhost:8080'
dr.manage.timeouts.implicit_wait= 5
dr.find_element(:name => "userLoginId").send_keys "chpm"
dr.find_element(:name => "currentPassword").send_keys "intec"
dr.find_element(:class =>"loginBtn").submit                 #登陆
dr.get "http://localhost:8080/pm/showWorkCalendar.do"

e1 = dr.find_element(:xpath=>"//input[@type='text']")      #找到日历页面的年/月输入框
e1.clear
e1.send_keys "2012-1"
e1.submit


dr.find_element(:class=>'workDayTable').find_elements(:tag_name=>'th').each do |x|
  puts  x.text             #打印出日历页面的表头内容
end
dr.find_element(:class=>'workDayTable').find_elements(:tag_name=>'td')[3].find_elements(:tag_name=>'a')[0].click



#dr.find_element(:id=>'yellowButton').click
#dr.get "http://localhost:8080/pm/MaintainWorkLogAction.do?method=fillWorkLogSetup&date=2012-2-1"  # 真接链接到填写日志页面

