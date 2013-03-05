#encoding: utf-8
require "selenium-webdriver"
dr = Selenium::WebDriver.for :ie
dr.get 'http://localhost:8080'
dr.find_element(:name => "userLoginId").send_keys "chpm"
dr.find_element(:name => "currentPassword").send_keys "intec"
dr.find_element(:class =>"loginBtn").submit
dr.get 'http://localhost:8080/pm/sm/orgmgr/orgDepIndex.jsp'
frame_main = dr.find_element(:name=>'iframeContent')    #找到此页面的主的框架
dr.switch_to.frame(frame_main)
frame_left = dr.find_element(:name =>'department_left_treeview')      #再找到左边的树框架
dr.switch_to.frame frame_left
dr.find_element(:id =>'department1').find_element(:link=>'lch部门').click   #点击部门‘LCH部门’
dr.find_element(:id =>'department1').find_element(:class=>'webfx-tree-expand-icon').click    #点第一个部门前的小加号
dr.find_element(:name=>'position1').click
js= <<JS
   p =document.getElementById('positionMenu');
   p.style.visibility = 'visible';
JS
dr.execute_script js                                   #通过JS能把职位的右键框显示出来
=begin
dr.find_element(:id=>'modifyPosition').click        #点击修改职位
dr.switch_to.default_content
frame_main = dr.find_element(:name=>'iframeContent')    #找到此页面的主的框架
dr.switch_to.frame(frame_main)
frame_right = dr.find_element(:name =>'department_right_main')      #再找到右边的框架 准备修改职位
dr.switch_to.frame frame_right
dr.find_element(:name=>'name').send_keys 'lch职位'
dr.find_element(:name=>'positionForm').find_elements(:tag_name=>'div').each do |x|
  if x.attribute('align') == 'center'
    x.find_elements(:tag_name=>'input').each do |y|
      if y.attribute('value') == '提交'
        y.click
      end
    end
  end
end
=end
dr.find_element(:id=>'addUser').click       #点击添加人员
sleep 3

dr.quit
