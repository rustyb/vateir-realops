AdminDataConfig.set = {
  :view_security_check => lambda {|controller| controller.send('logged_in?') } 
}