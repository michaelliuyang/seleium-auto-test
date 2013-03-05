#encoding: utf-8
require "selenium-webdriver"
dr = Selenium::WebDriver.for :ff
dr.get 'http://localhost:8080'
dr.find_element(:name => "userLoginId").send_keys "chpm"
dr.find_element(:name => "currentPassword").send_keys "intec"
dr.find_element(:class =>"loginBtn").submit
#dr.get "http://localhost:8080/pm/pm/smsSend.jsp"
dr.get "http://localhost:8080/pm/sm/orgmgr/orgDepIndex.jsp"

dr.get 'http://localhost:8080/pm/sm/projmgr/projMgr_frame_myLink.jsp?type=department'

dr.get "http://localhost:8080/pm/createProjAction.do?opFlag=pass&parent=department1&parentName=lch%E9%83%A8%E9%97%A8&projName="

dr.find_element(:name=>'projectNo').send_keys "001"
puts dr.find_element(:name=>'projNoMsg').text
dr.find_element(:name=>'projectName').send_keys "pro1"

dr.find_element(:xpath=>"//img[@style='cursor:pointer']").click            #进入选择项目经理的人员树
ch = dr.window_handle
hh =dr.window_handles
hh.each do |h|
  unless h==ch
    dr.switch_to.window(h)
  end
end
dr.find_element(:xpath=>"//a[@href='javascript: aTree.o(23);']").click
dr.find_element(:xpath=>"//a[@href='javascript: aTree.o(24);']").click
dr.find_element(:id=>'caTree26').click
dr.find_element(:xpath=> "//input[@onclick='commitSelect()']").click                #选中一个项目经理后确认


=begin
dr.find_element(:id=>'selectTree').find_elements(:tag_name=>'input').each do  |y|
  y.send_keys "chpm"
end
=end

