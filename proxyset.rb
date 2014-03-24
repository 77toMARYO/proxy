##
##LANにプロキシサーバを使用するかどうかを設定
##

require 'Win32/Registry'
require 'win32ole'

wsh = WIN32OLE.new('WScript.Shell')
reg = Win32::Registry::HKEY_CURRENT_USER.open('Software\Microsoft\Windows\CurrentVersion\Internet Settings', Win32::Registry::KEY_ALL_ACCESS)
value = reg['ProxyEnable']

if value == 1
  reg['ProxyEnable'] = 0
  wsh.Popup('proxy off')
end
if value == 0
  reg['ProxyEnable'] = 1
  wsh.Popup('proxy on')
end
