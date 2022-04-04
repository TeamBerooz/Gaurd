
package.path = package.path ..';.luarocks/share/lua/5.2/?.lua' .. ';./bot/?.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'
-----


Config = dofile('./Alpha/Config.lua')
socket = require('socket')
URL = require('socket.url')
https = require('ssl.https')
http = require('socket.http')
jdate = dofile ('./jdate.lua')
http.TIMEOUT = 10
curl = require('cURL')
curl_context = curl.easy{verbose = false}
clr = require 'term.colors'
serpent = (loadfile './Alpha/serpent.lua')()
json = (loadfile './Alpha/JSON.lua')()
JSON = (loadfile './Alpha/dkjson.lua')()
utf8 = loadfile('./Alpha/utf8.lua')()
db = require('redis')
base = db.connect('127.0.0.1',6379)
base:select(Config.RedisIndex)
offset = 0
minute = 60
hour = 3600
day = 86400
week = 604800
MsgTime = os.time() - 60
Plan1 = 2592000
Plan2 = 5184000
Sudoid = Config.Sudoid
SUDO = Config.SUDO_ID
Paybot = Config.Paybot
TD_ID = Config.TD_ID
BotCliId = Config.BotCliId
BotJoiner = Config.BotJoiner
UserSudo = '@'..Config.Sudo1
PvUserSudo = '@'..Config.PvSudo1
Sudo1 = Config.Sudo1
PvSudo1 = Config.PvSudo1
NameBot = Config.NameBot
Channel = Config.Channel
LinkSuppoRt = Config.LinkSuppoRt
botusername = Config.UserJoiner
Token = Config.JoinToken
local Bot_Api = 'https://api.telegram.org/bot' .. Token
BOTHOCK = 'https://api.telegram.org/bot'..Token
pardd1 = Config.pardd1
pardd2 = Config.pardd2
pardd3 = Config.pardd3
pardd4 = Config.pardd4
pardd5 = Config.pardd5
pardd6 = Config.pardd6
IDSup = Config.IDSup

Color = {}
Color.Red = "\027[31m"
Color.Green = "\027[32m"
Color.Yellow = "\027[33m"
Color.Blue = "\027[34m"
Color.Reset = "\027[39m"

Color.pRed = "\027[91m"
Color.pGreen = "\027[92m"
Color.pYellow = "\027[93m"
Color.pBlue = "\027[96m"
Color.pReset = "\027[97m"
---------Card Info---------
cardnumber = Config.cardnumber
namecard = Config.namecard
Dargah = Config.Dargah
Dargahname = Config.Dargahname
MrTmAlpha = '• 〔👤 کاربر عزیز جهت تنظیمات بخش دلخواه خود را انتخاب کنید.〕\n'

function replace(value, del, find)
del = del:gsub(
"[%(%)%.%+%-%*%?%[%]%^%$%%]",
"%%%1"
)
find = find:gsub(
"[%%]",
"%%%%"
)
return string.gsub(
value,
del,
find
)
end
function check_html(text)
txt = text
if txt:match("<") or txt:match(">") then
txt = txt:gsub(">","")
txt = txt:gsub("<","")
else
txt = text
end
return txt
end
----------Function Sudo----------
function is_Sudo(msg)
local var = false
for v,user in pairs(SUDO) do
if user == msg.from.id then
var = true
end
end
if base:sismember(TD_ID..'SUDO',msg.from.id) then
var = true
end
if Sudo == tonumber(msg.from.id) then
var = true
end
return var
end
function is_sudo1(user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
if base:sismember(TD_ID..'SUDO',user_id) then
var = true
end
if Sudo == tonumber(user_id) then
var = true
end
return var
end
--------**FullSudo**--------
function is_FullSudo(msg)
local var = false
for v,user in pairs(Config.Full_Sudo) do
if user == msg.from.id then
var = true
end
end
return var
end
--------**FullSudo2**--------
function is_FullSudo2(UseR)
local var = false
for v,user in pairs(Config.Full_Sudo) do
if tonumber(user) == tonumber(UseR) then
var = true
end
end
return var
end
--------**GlobalyBan**--------
function is_GlobalyBan(user_id)
local var = false
local hash = TD_ID..'GlobalyBanned:'
local gbanned = base:sismember(hash,user_id)
if gbanned then
var = true
end
return var
end
--Function Owner2--

function SudUser(chat_id,user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if  Sudo then
var=  true
end
return var
end


function is_Owner(chat_id,user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
local hash = base:sismember(TD_ID..'OwnerList:'..chat_id,user_id)
if hash or Sudo then
var=  true
end
return var
end
function is_Nazem(chat_id,user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
local hash = base:sismember(TD_ID..'NazemList:'..chat_id,user_id)
if hash or Sudo then
var=  true
end
return var
end
--------**Mod**--------
function is_Mod(chat_id,user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
local owner = base:sismember(TD_ID..'OwnerList:'..chat_id,user_id)
local nazem = base:sismember(TD_ID..'NazemList:'..chat_id,user_id)
local hash = base:sismember(TD_ID..'ModList:'..chat_id,user_id)
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if hash or owner or Sudo or nazem then
var=  true
end
return var
end
function is_ModTest(chat_id,user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
local owner = base:sismember(TD_ID..'OwnerList:'..chat_id,user_id)
local nazem = base:sismember(TD_ID..'NazemList:'..chat_id,user_id)
local hash = base:sismember(TD_ID..'ModList:'..chat_id,user_id)
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if hash or owner or Sudo or nazem then
var=  true
end
return var
end

--------------------
---------------------




function is_ModClean(msg)
local hash = base:sismember(TD_ID..'ModCleanList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
function is_ModPin(msg)
local hash = base:sismember(TD_ID..'ModPinList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
function is_ModBan(msg)
local hash = base:sismember(TD_ID..'ModBanList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
function is_ModMute(msg)
local hash = base:sismember(TD_ID..'ModMuteList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
function is_ModWarn(msg)
local hash = base:sismember(TD_ID..'ModWarnList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
--------------------
function is_ModVipCmd(msg)
local hash = base:sismember(TD_ID..'ModVipList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
------------------
function is_ModLock(msg)
local hash = base:sismember(TD_ID..'ModLockList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
function is_ModPanelCmd(msg)
local hash = base:sismember(TD_ID..'ModpanelList:'..msg.chat.id,msg.from.id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
-----------------

function is_ModPanelCmd(chat_id,user_id)
local var = false
for v,user in pairs(SUDO) do
if user == user_id then
var = true
end
end
local nazem = base:sismember(TD_ID..'NazemList:'..chat_id,user_id)
local owner = base:sismember(TD_ID..'OwnerList:'..chat_id,user_id)
local hash = base:sismember(TD_ID..'ModpanelList:'..chat_id,user_id)
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if hash or owner or Sudo or nazem  then
var=  true
end
return var
end

--------**Vip**--------
function is_Vip(chat_id,user_id)
local hash = base:sismember(TD_ID..'Vip:'..chat_id,user_id)
if hash or is_Mod(chat_id,user_id) then return true
else
return false
end
end
--------**Vips**--------
function is_Vips(msg,user_id)
local hash = base:sismember(TD_ID..'Vips:'..user_id)
if hash or is_FullSudo(msg) then return true
else
return false
end
end
--------**BanUser**--------
function is_Banned(chat_id,user_id)
local hash =
base:sismember(TD_ID..'BanUser:'..chat_id,user_id)
if hash then
return true
else
return false
end
end
--------**VipUser**--------
function VipUser(chat_id,user_id)
local Mod = base:sismember(TD_ID..'ModList:'..chat_id,user_id)
local Owner = base:sismember(TD_ID..'OwnerList:'..chat_id,user_id)
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if Mod or Owner or Sudo then
return true
else
return false
end
end


local getTime = function(seconds)
local final = ""
local hours = math.floor(seconds / 3600)
seconds = seconds - hours * 60 * 60
local min = math.floor(seconds / 60)
seconds = seconds - min * 60
local S = hours .. ":" .. min .. ":" .. seconds
return S
end
local getTimeUptime = function(seconds, lang)
local days = math.floor(seconds / 86400)
seconds = seconds - days * 86400
local hours = math.floor(seconds / 3600)
seconds = seconds - hours * 60 * 60
local min = math.floor(seconds / 60)
seconds = seconds - min * 60
if days == 0 then
days = nil
else
end
if hours == 0 then
hours = nil
else
end
if min == 0 then
min = nil
else
end
if seconds == 0 then
seconds = nil
else
end
local text = ""
if lang == "Fa" then
if days then
if hours or min or seconds then
text = text .. days .. " روز و "
else
text = text .. days .. " روز"
end
end
if hours then
if min or seconds then
text = text .. hours .. " ساعت و "
else
text = text .. hours .. " ساعت"
end
end
if min then
if seconds then
text = text .. min .. "  دقیقه و  "
else
text = text .. min .. "  دقیقه "
end
end
if seconds then
text = text .. seconds .. "  ثانیه "
end
else
if days then
if hours or min or seconds then
text = text .. days .. " روز و "
else
text = text .. days .. " روز"
end
end
if hours then
if min or seconds then
text = text .. hours .. " ساعت و "
else
text = text .. hours .. " ساعت"
end
end
if min then
if seconds then
text = text .. min .. "  دقیقه و  "
else
text = text .. min .. "  دقیقه "
end
end
if seconds then
text = text .. seconds .. "  ثانیه "
end
end
return text
end


-------------
local getTime2 = function(seconds)
local final = ""
local hours = math.floor(seconds / 3600)
seconds = seconds - hours * 60 * 60
local min = math.floor(seconds / 60)
seconds = seconds - min * 60
local S = hours .. ":" .. min .. ":" .. seconds
return S
end
local getTimeUptime2 = function(seconds, lang)
local days = math.floor(seconds / 86400)
seconds = seconds - days * 86400
local hours = math.floor(seconds / 3600)
seconds = seconds - hours * 60 * 60
local min = math.floor(seconds / 60)
seconds = seconds - min * 60
if days == 0 then
days = nil
else
end
if hours == 0 then
hours = nil
else
end
if min == 0 then
min = nil
else
end
if seconds == 0 then
seconds = nil
else
end
local text = ""
if lang == "Fa" then
if days then
if hours or min or seconds then
text = text .. days .. ""
else
text = text .. days .. ""
end
end
if hours then
if min or seconds then
text = text .. hours .. ""
else
text = text .. hours .. ""
end
end
if min then
if seconds then
text = text .. min .. " "
else
text = text .. min .. ""
end
end
if seconds then
text = text .. seconds .. ""
end
else
if days then
if hours or min or seconds then
text = text .. days .. ""
else
text = text .. days .. ""
end
end
if hours then
if min or seconds then
text = text .. hours .. ""
else
text = text .. hours .. ""
end
end
if min then
if seconds then
text = text .. min .. ""
else
text = text .. min .. ""
end
end
if seconds then
text = text .. seconds .. ""
end
end
return text
end
----------------


function GetUptimeServer(uptime, lang)
local uptime = io.popen("uptime -p"):read("*all")
days = uptime:match("up %d+ days")
hours = uptime:match(", %d+ hours")
minutes = uptime:match(", %d+ minutes")
if hours then
hours = hours
else
hours = ""
end
if days then
days = days
else
days = ""
end
if minutes then
minutes = minutes
else
minutes = ""
end
days = days:gsub("up", "")
local a_ = string.match(days, "%d+")
local b_ = string.match(hours, "%d+")
local c_ = string.match(minutes, "%d+")
if a_ then
a = a_ * 86400
else
a = 0
end
if b_ then
b = b_ * 3600
else
b = 0
end
if c_ then
c = c_ * 60
else
c = 0
end
x = b + a + c
local resultUp = getTimeUptime(x, lang)
return resultUp
end
----------------


function GetUptimeServer(uptime, lang)
local uptime = io.popen("uptime -p"):read("*all")
days = uptime:match("up %d+ days")
hours = uptime:match(", %d+ hours")
minutes = uptime:match(", %d+ minutes")
if hours then
hours = hours
else
hours = ""
end
if days then
days = days
else
days = ""
end
if minutes then
minutes = minutes
else
minutes = ""
end
days = days:gsub("up", "")
local a_ = string.match(days, "%d+")
local b_ = string.match(hours, "%d+")
local c_ = string.match(minutes, "%d+")
if a_ then
a = a_ * 86400
else
a = 0
end
if b_ then
b = b_ * 3600
else
b = 0
end
if c_ then
c = c_ * 60
else
c = 0
end
x = b + a + c
local resultUp = getTimeUptime(x, lang)
return resultUp
end



--------**filter**--------
function is_filter(msg,value)
local list = base:smembers(TD_ID..'Filters:'..msg.chat.id)
var = false
for i=1, #list do
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'FilterSen') then
mrr619 = value:match(list[i])
else
mrr619 = value:match(' '..list[i]..' ') or value:match('^'..list[i]..' ') or value:match(' '..list[i]..'$') or value:match('^'..list[i]..'$')
end
if mrr619 then
var = true
end
end
return var
end
--------**MuteUser**--------
function is_MuteUser(chat_id,user_id)
local hash =  base:sismember(TD_ID..'MuteUser:'..chat_id,user_id)
if hash then
return true
else
return false
end
end
function Alpha(num)
list={'⁰','¹','²','³','⁴','⁵','⁶','⁷','⁸','⁹'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end

function Alphas(num)
list={'0️⃣','1️⃣','2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end

function Alphafa(num)
list={'۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end
function Alphaee(num)
list={'０','１','２','３','４','５','６','７','８','９'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end
local txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local raminsal = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''

---------**Sleep & Split**--------
local function sleep(n)
os.execute('sleep '..n)
end
function string:split(sep)
local sep, fields = sep or ':', {}
local pattern = string.format('([^%s]+)', sep)
self:gsub(pattern, function(c) fields[#fields+1] = c end)
return fields
end
BASSE = "https://api.telegram.org/bot"..Config.JoinToken.."/"

function vardump(value)
print(serpent.block(value, {comment=false}))
local Text = ""
.."\n"..serpent.block(value,{comment=false})
.."\n"
end
function sendChatAction(chat_id,action)
local url = BASSE .. '/sendChatAction?chat_id=' .. chat_id .. '&action=' .. action
return sendRequest(url)
end


function getRes(Url)
Url = BASSE..Url
Req = https.request(Url)
Res = JSON.decode(Req)
vardump(Res)
return Res
end

--Bot Info
BotName = getRes('getMe').result.first_name or false
BotUsername = getRes('getMe').result.username or false
BotId = getRes('getMe').result.id or false

function dl_cb(arg, data)
vardump(arg)
end
--getUpdates Function
local function getUpdates(Offset)
local response = {}
local success,code,headers,status  = https.request{
url = BASSE..'/getUpdates?timeout=20&limit=1&offset='..(Offset or ''),
method = 'POST',
sink = ltn12.sink.table(response),}
local body = table.concat(response or {'no response'})
if (success == 1) then
return JSON.decode(body)
else
return nil,'Request Error'
end
end
function getParseMode(ParseMode)
if ParseMode:lower() == 'html' then
P = 'HTML'
elseif ParseMode:lower() == 'md' or ParseMode:lower() == 'markdown' then
P = 'Markdown'
else
P = ''
end
return P
end
function firstUpdate()
local Url = 'getUpdates?offset=-1'
return getRes(Url)
end
local BASSE = 'https://api.telegram.org/bot' ..Config.JoinToken
curl_context = curl.easy{verbose = false}
local function performRequest(url)
local data = {}
local c = curl_context:setopt_url(url)
:setopt_writefunction(table.insert, data)
:perform()
return table.concat(data), c:getinfo_response_code()
end
local function sendRequest(url)
local dat = performRequest(url)
local tab = JSON.decode(dat)
return tab
end
-------**ec_name**--------

function jdatee(msg,unix)
local day, month, year = string.match(''..os.date("%d")..'-'..os.date("%m")..'-'..os.date("%Y")..'', '(%d%d)-(%d%d)-(%d%d%d%d)')
local span = base:get(TD_ID.."ExpireDataNum:"..chat_id)
local unix = os.time({day = day + span, month = month, year = year})
local year,mont,day = 1349,1,1
local config = {
mont = {'فروردین','اردیبهشت','خرداد','تیر','مرداد','شهریور','مهر','آبان','آذر','دی','بهمن','اسفند'},
days = {[0] = 'شنبه','یکشنبه','دوشنبه','سه شنبه','چهارشنبه','پنجشنبه','جمعه'},
seasons = {'بهار','تابستان','پاییز','زمستان'},
}
unix = unix - 6825600 + 12600
local days = math.floor(unix/86400)
unix = unix % 86400
local hours = math.floor(unix/3600)
unix = unix % 3600
local mins = math.floor(unix/60)
secs = math.floor(unix % 60)
local day_name = config.days[days%7]

function in_table(table,input)
for k,v in pairs(table) do
if v == input then
return true
end
end
return false
end
while 0 > days do
days = days + 365
year = year - 1
if in_table({1,5,9,13,17,22,26,30},(year%33)) then
days = days + 1
end
end

while 365 < days do
days = days - 365
if in_table({1,5,9,13,17,22,26,30},(year%33)) then
days = days - 1
end
year = year + 1
end

if not in_table({1,5,9,13,17,22,26,30},(year%33)) and days == 365 then
year = year + 1
days = 0
end

for k, v in pairs({ 31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30}) do
if days >= v then
days = days - v
mont = mont + 1
else
day = day + days
days = 0
end
end

if (mont < 7) then
hours = hours + 1
end
if hours > 23 then
hours = 0
day = day + 1
end

if day > 31 then
if month == 6 then
hours = 23
day = 31
else
day = 1
mont = mont + 1
end
end

if msg then
value = string.gsub(msg,'%%','#')
value = string.gsub(value,'#Y',year)
value = string.gsub(value,'#M',mont)
value = string.gsub(value,'#D',day)
value = string.gsub(value,'#h',hours)
value = string.gsub(value,'#m',mins)
value = string.gsub(value,'#s',secs)
value = string.gsub(value,'#X',config.mont[mont])
value = string.gsub(value,'#x',day_name)

else
end
return value
end

function ec_name(name)
Black = name
if Black then
if Black:match('_') then
Black = Black:gsub('_','')
end
if Black:match('*') then
Black = Black:gsub('*','')
end
if Black:match('`') then
Black = Black:gsub('`','')
end
return Black
end
end
function string:escape_html()
self = self:gsub('&', '&amp;')
self = self:gsub('"', '&quot;')
self = self:gsub('<', '&lt;'):gsub('>', '&gt;')
return self
end
function string:escape_hard(ft)
if ft == 'bold' then
return self:gsub('%*', '')
elseif ft == 'italic' then
return self:gsub('_', '')
elseif ft == 'fixed' then
return self:gsub('`', '')
elseif ft == 'link' then
return self:gsub(']', '')
else
return self:gsub('%_', '\\_'):gsub('%*', '\\*'):gsub('%[', ''):gsub('%]', ''):gsub('%`', '\\`')
end
end
function string:escape(only_markup)
if not only_markup then
self = self:gsub('([@#/.])(%w)', '%1\xE2\x81\xA0%2')
end
return self:gsub('[*_`[]', '\\%0')
end
function escape_markdown(str)
return tostring(str):gsub('%_', '\\_'):gsub('%[', '\\['):gsub('%*', '\\*'):gsub('%`', '\\`')
end
function utf8_len(str)
local chars = 0
for i = 1, str:len() do
local byte = str:byte(i)
if byte < 128 or byte >= 192 then
chars = chars + 1
end
end
return chars
end
function getMe()
local url = BASSE .. '/getMe'
return sendRequest(url)
end
function getUpdates(offset)
local url = BASSE .. '/getUpdates?timeout=20'
if offset then
url = url .. '&offset=' .. offset
end
return sendRequest(url)
end


function send_key(chat_id, text, keyboard, inline, resize, mark)
local response = {}
response.keyboard = keyboard
response.inline_keyboard = inline
response.resize_keyboard = resize
response.one_time_keyboard = false
response.selective = false
local responseString = JSON.encode(response)
if mark then
sended = send_api.."/sendMessage?chat_id="..chat_id.."&text="..url.escape(text).."&disable_web_page_preview=true&reply_markup="..url.escape(responseString)
else
sended = send_api.."/sendMessage?chat_id="..chat_id.."&text="..url.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..url.escape(responseString)
end
return send_req(sended)
end

function sendText(chat_id, text, reply_to_message_id, ParseMode, ReplyMarkup, DisableWebPagePreview)
if not chat_id or not text then
print(Color.Red.."    *ERROR => chat_id or text Didn't Set For Method [sendMessage]."..Color.Reset)
return false
end
local Url = "sendMessage?chat_id="..chat_id.."&text="..URL.escape(text)
if reply_to_message_id then
Url = Url.."&reply_to_message_id="..reply_to_message_id
end
if ParseMode then
Url = Url.."&parse_mode="..getParseMode(ParseMode)
end
if ReplyMarkup then
Url = Url.."&reply_markup="..URL.escape(json:encode(ReplyMarkup))
end
if DisableWebPagePreview then
Url = Url.."&disable_web_page_preview=true"
end
return getRes(Url)
end





function sendVideonote(chat_id, file_id, reply_to_message_id, caption, markdown)
  url = BASSE .. "/sendVideoNote?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&video_note=" .. file_id
  if caption then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end

function sendGif(chat_id, file_id, reply_to_message_id, caption, markdown)
  url = BASSE .. "/sendAnimation?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&animation=" .. file_id
  if caption then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end


function sendVideo(chat_id, file_id, reply_to_message_id, caption, markdown)
  url = BASSE .. "/sendVideo?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&video=" .. file_id
  if caption then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end

function sendVoice(chat_id, file_id, reply_to_message_id, caption, markdown)
  url = BASSE .. "/sendVoice?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&voice=" .. file_id
  if caption then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end

function sendPhoto(chat_id, file_id, reply_to_message_id, caption, markdown)
  url = BASSE .. "/sendPhoto?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&photo=" .. file_id
  if caption_entities then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end



function sendDocument(chat_id, file_id, reply_to_message_id, caption, markdown)
  url = BASSE .. "/sendDocument?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&document=" .. file_id
  if caption then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end


function unbanChatMember(chat_id,user_id)
local url = BASSE .. '/unbanChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id
return sendRequest(url)
end
function kickChatMember(chat_id,user_id)
local url = BASSE .. '/kickChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id
return sendRequest(url)
end
function banUser(chat_id,user_id)
local res = kickChatMember(chat_id,user_id)
if res then
return res
end
end
function KickUser(chat_id,user_id)
local res = kickChatMember(chat_id,user_id)
if res then
unbanChatMember(chat_id,user_id)
unbanChatMember(chat_id,user_id)
unbanChatMember(chat_id,user_id)
return res
end
end





function MuteMedia(chat_id,user_id)
local Rep = BASSE.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=false&can_send_media_messages=false'
return https.request(Rep)
end
function UnRes(chat_id,user_id)
local Rep = BASSE.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=true&can_send_media_messages=true'
return https.request(Rep)
end
function kickChatMemberTime(chat_id,user_id,time)
local Rep = BASSE.. '/kickChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&until_date='..time
return https.request(Rep)
end

function MuteUser(chat_id,user_id,time)
local Rep = BASSE.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=false&until_date='..time
return https.request(Rep)
end
function unbanUser(chat_id,user_id)
local res = unbanChatMember(chat_id,user_id)
return true
end

function resolve_username(chat_id,username)
local url = BASSE .. '/searchPublicChat?chat_id='..chat_id.. '&user_id=' ..username
return sendRequest(url)
end

function getMessage(chat_id)
local url = BASSE .. '/getMessage?chat_id=' .. chat_id
return sendRequest(url)
end
function MuteMediaTime(chat_id,user_id,time)
local url = BOTHOCK.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=false&can_send_media_messages=false&until_date='..time
return sendRequest(url)
end


function MuteMedia(chat_id,user_id)
local Rep = BOTHOCK.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=false&can_send_media_messages=false'
return sendRequest(Rep)
end

function promotemember(chat_id,user_id,canchangeinfo,canpostmessages,caneditmessages,candeletemessages,caninviteusers,canrestrictmembers,canpinmessages,canpromotemembers)
local url = BOTHOCK..'/promoteChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_change_info='..canchangeinfo..'&can_post_messages='..canpostmessages..'&can_edit_messages='..caneditmessages..'&can_delete_messages='..candeletemessages..'&can_invite_users='..caninviteusers..'&can_restrict_members='..canrestrictmembers..'&can_pin_messages='..canpinmessages..'&can_promote_members='..canpromotemembers
return sendRequest(url)
end

function getChat(chat_id)
local url = BASSE .. '/getChat?chat_id=' .. chat_id
return sendRequest(url)
end
function getChatAdministrators(chat_id)
local url = BASSE .. '/getChatAdministrators?chat_id=' .. chat_id
return sendRequest(url)
end




function forward(chat_id, from_chat_id, message_id)
local url = BOTHOCK..'/forwardMessage?chat_id='..chat_id ..'&from_chat_id='..from_chat_id ..'&message_id='..message_id
return sendRequest(url)
end


function getChatMembersCount(chat_id)
local url = BASSE .. '/getChatMembersCount?chat_id=' .. chat_id
return sendRequest(url)
end
function getChatMember(chat_id,user_id)
local url = BASSE .. '/getChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id
return sendRequest(url)
end
function leave(chat_id)
local url = BASSE .. '/leaveChat?chat_id=' .. chat_id
local res = sendRequest(url)
if res then
end
sendRequest(url)
end







function Alert(callback_query_id,text, show_alert)
local url = BASSE .. '/answerCallbackQuery?callback_query_id=' .. callback_query_id .. '&text=' .. URL.escape(text)
if show_alert then
url = url..'&show_alert=true'
end
return sendRequest(url)
end
function sendKeyboard(chat_id,text,keyboard, markdown,reply_id)
local url = BASSE .. '/sendmessage?chat_id=' .. chat_id
if markdown then
url = url .. '&parse_mode=Markdown'
end
if reply_id then
url = url .. '&reply_to_message_id='..reply_id
end
url = url..'&text='..URL.escape(text)
url = url..'&disable_web_page_preview=true'
url = url..'&reply_markup='..URL.escape(JSON.encode(keyboard))
return sendRequest(url)
end

function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text=' ..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return sendRequest(url)
end



function sendMessage(chat_id, text, use_markdown, reply_to_message_id, send_sound)
local url = BASSE .. '/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text)
url = url .. '&disable_web_page_preview=true'
if reply_to_message_id then
url = url .. '&reply_to_message_id=' .. reply_to_message_id
end
if use_markdown then
url = url .. '&parse_mode=Markdown'
end
if not send_sound then
url = url..'&disable_notification=false'--messages are silent by default
end
local res = sendRequest(url)
return res
end
function sendReply(msg,text,markd,send_sound)
return sendMessage(msg.chat.id,text, markd,msg.message_id,send_sound)
end

function editMessage(message_id, text, keyboard,markdown)
local url = BASSE .. '/editMessageText?&inline_message_id='..message_id..'&text=' .. URL.escape(text)
url = url .. '&parse_mode=Markdown'
if keyboard then
url = url..'&reply_markup='..URL.escape(JSON.encode(keyboard))
end
return sendRequest(url)
end

function editMessageText(chat_id,message_id,text,keyboard,markdown,preview)
local url = BASSE
if chat_id then
url = url .. '/editMessageText?chat_id=' .. chat_id .. '&message_id='..message_id..'&text=' .. URL.escape(text)
else
url = url .. '/editMessageText?inline_message_id='..message_id..'&text=' .. URL.escape(text)
end
if markdown then
url = url .. '&parse_mode=Markdown'
else
url = url .. '&parse_mode=HTML'
end
if not preview then
url = url .. '&disable_web_page_preview=true'
end
if keyboard then
url = url..'&reply_markup='..URL.escape(JSON.encode(keyboard))
end
return sendRequest(url)
end
function Edit(msg,text,keyboard,markd)
if msg.message.chat.type ~= "private" and not base:sismember(TD_ID..'Gp2:'..msg.message.chat.id,'PanelPv') then
if not base:sismember(TD_ID..'Gp2:'..msg.message.chat.id,'diamondlang') then
--text = text..'\n👤 فقط (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')) اجازہ کار با پنل را دارد ㋡'
else
--text = text..'\n─┅┈┅┅┈┅┈╯◐ ◑╰┈┅┈┅┅┈┅─\nOnly (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')) has access to the panel !'
end
else
text = text
end
return editMessageText(msg.message.chat.id,msg.message.message_id,text,keyboard,markd,preview)
end
function EdiT(msg,text,keyboard,markd)
return editMessageText(msg.message.chat.id,msg.message.message_id,text,keyboard,markd,preview)
end
function editMarkup(chat_id,message_id, reply_markup)
local url = BASSE .. '/editMessageReplyMarkup?chat_id=' .. chat_id ..
'&message_id='..message_id..
'&reply_markup='..URL.escape(JSON.encode(reply_markup))
return sendRequest(url)
end
function sendChatAction(chat_id,action)
local url = BASSE .. '/sendChatAction?chat_id=' .. chat_id .. '&action=' .. action
return sendRequest(url)
end
function getFile(file_id)
local url = BASSE .. '/getFile?file_id='..file_id
return sendRequest(url)
end
function getAdminlist(chat_id)
status = getChatAdministrators(chat_id)
for k,v in ipairs(status.result) do
if v.status == 'creator' then
if v.user.id then
creator = v.user.username or v.user.first_name
else
creator = 'not'
end
end
end
return creator
end
function Request(url)
local dat, res = https.request(url)
local tab = JSON.decode(dat)
if res ~= 200 then
return false
end
if not tab.ok then
return false
end
return tab
end
stopPoll = function(chat_id,message_id,reply_markup)
request_url = BASSE..'/stopPoll?chat_id='..chat_id..'&message_id='..message_id
if reply_markup then    request_url=request_url..'&reply_markup='..URL.escape(JSON.encode(reply_markup))
end
return sendRequest(request_url)
end
sendPoll = function(chat_id,question,options,disable_notification,reply_to_message_id,reply_markup)
request_url = BASSE..'/sendPoll?chat_id='..chat_id..'&question='..question..'&options='..options..'&disable_notification='..disable_notification..'&reply_to_message_id='..reply_to_message_id
if reply_markup then
request_url=request_url..'&reply_markup='..URL.escape(JSON.encode(keyboard))
end
return sendRequest(request_url)
end
function restrict(chat_id,user,cansendmessages,cansendmediamessages,cansendothermessages,canaddwebpagepreviews,untildate)
local url = BOTHOCK..'/restrictChatMember?chat_id='..chat_id..'&user_id='..user..'&can_send_messages='..cansendmessages..'&can_send_media_messages='..cansendmediamessages..'&can_send_other_messages='..cansendothermessages..'&can_add_web_page_previews='..canaddwebpagepreviews..'&until_date='..untildate
return Request(url)
end
function PinMessage(chat_id, msg_id)
local url = BOTHOCK..'/pinChatMessage?chat_id='..chat_id..'&message_id='..msg_id
return sendRequest(url)
end


function send_keyb(chat_id,msg_id, text, keyboard, resize, mark)
local response = {}
response.keyboard = keyboard
response.resize_keyboard = resize
response.one_time_keyboard = false
response.selective = false
local responseString = JSON.encode(response)
if mark then
url = send_api.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&disable_web_page_preview=true&reply_markup="..URL.escape(responseString).."&reply_to_message_id="..(msg_id or 0)
else
url = send_api.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(responseString).."&reply_to_message_id="..(msg_id or 0)
end
return sendRequest(url)
end


function SendMedia(chat_id,media,msg_id,keyboard)
local url= BASSE..'/sendMediaGroup?chat_id='..chat_id..'&media='..media..'&reply_to_message_id='..msg_id..'&reply_markup='..URL.escape(json:encode(keyboard))
return sendRequest(url)
end
function GetUserProFilePhoto(user, offset,limit)
local url = BASSE..'/getUserProfilePhotos?user_id='..user..'&offset='..offset..'&limit='..limit
return sendRequest(url)
end
function Setcust(chat_id,user,title)
local url = Bot_Api..'/setChatAdministratorCustomTitle?chat_id='..chat_id..'&user_id='..user..'&custom_title='..title
return https.request(url)
end
function GetInvate(chat_id)
local url = BASSE..'/exportChatInviteLink?chat_id='..chat_id
return sendRequest(url)
end
function VoiceChatParticipantsInvited(user)
local url = BASSE..'/VoiceChatParticipantsInvited?user_id='..user
return sendRequest(url)
end


function setChatPermissions(chat_id, test)
url = BASSE .. "/setChatPermissions?chat_id=" .. chat_id .. "&permissions=" .. json:encode(test)
return sendRequest(url)
end


function sendPhotokey(chat_id, file_id, reply_to_message_id, caption,reply_markup ,markdown)
  url = BASSE .. "/sendPhoto?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&photo=" .. file_id
  if caption then
    url = url .. "&caption=" .. URL.escape(caption)
  end
  if reply_markup then
  url = url.."&reply_markup="..URL.escape(json:encode(reply_markup))
  end
  if markdown == "md" or markdown == "markdown" then
    url = url .. "&parse_mode=Markdown"
  elseif markdown == "html" then
    url = url .. "&parse_mode=HTML"
  end
  return json:decode(https.request(url))
end



function sendPhoto2(chat_id, photo, caption)
local send = BOTHOCK..'/SendPhoto'
local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "photo=@'..photo..'" -F "caption='..caption..'"'
return io.popen(curl_command):read('*all')
end
function membersCount(chat_id)
local url = BOTHOCK..'/getChatMembersCount?chat_id='.. chat_id
return sendRequest(url)
end
function downloadFile(file_id, download_path)
if not file_id then return nil, 'file_id not specified' end
if not download_path then return nil, 'download_path not specified' end
local response = {}
local file_info = getFile(file_id)
local download_file_path = download_path or 'downloads/'.. file_info.result.file_path
local download_file = io.open(download_file_path, 'w')
if not download_file then return nil, 'download_file could not be created'
else
local success, code, headers, status = https.request{
url = 'https://api.telegram.org/file/bot'..Token..'/'.. file_info.result.file_path,
sink = ltn12.sink.file(download_file),
}
local r = {
success = true,
download_path = download_file_path,
file = file_info.result
}
return r
end
end

exportChatInviteLink = function(chat_id)
url = BASSE..'/exportChatInviteLink?chat_id='..chat_id
return sendRequest(url)
end
function check_markdown(text)
str = text
if str ~= nil then
if str:match('_') then
output = str:gsub('_',[[\_]])
elseif str:match('*') then
output = str:gsub('*','\\*')
elseif str:match('`') then
output = str:gsub('`','\\`')
else
output = str
end
return output
end
end
function is_req(msg)
local var = false
if is_Sudo(msg) then
var = true
end
if msg.message.text and msg.message.text:match('اجازه کار با پنل را دارد !$') then
if msg.message.entities then
for i,entity in pairs(msg.message.entities) do
if entity.type == 'text_mention' then
if entity.user.id == msg.from.id then
var = true
end
end
end
end
else
var = true
end
if base:sismember(TD_ID..'Gp2:'..msg.message.chat.id,'PanelPv') then
var = true
end
return var
end
function string:starts(text)
return text == string.sub(self,1,string.len(text))
end

function download(FileUrl,FilePath,FileName)
print(clr.yellow.."	File Url to Download => "..FileUrl..clr.reset)
local respbody = {}
local options = {
url = FileUrl,
sink = ltn12.sink.table(respbody),
redirect = true
}
-- nil, code, headers, status
local response = nil
if FileUrl:starts('https') then
options.redirect = false
response = {https.request(options)}
else
response = {http.request(options)}
end
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then return nil end
FilePathToSave = FilePath.."/"..FileName
print(clr.green.." Success!,File Saved to => "..FilePathToSave..clr.reset)
file = io.open(FilePathToSave,"w+")
file:write(table.concat(respbody))
file:close()
return FilePathToSave
end
local function curlRequest(curl_command)
io.popen(curl_command)
end

function download(FileUrl,FilePath,FileName)
 print(clr.yellow.." File Url to Download => "..FileUrl..clr.reset)
 local respbody = {}
 local options = {
  url = FileUrl,
  sink = ltn12.sink.table(respbody),
  redirect = true
}
 -- nil, code, headers, status
 local response = nil
 if FileUrl:starts('https') then
  options.redirect = false
  response = {https.request(options)}
 else
  response = {http.request(options)}
 end
 local code = response[2]
 local headers = response[3]
 local status = response[4]
 if code ~= 200 then return nil end
 FilePathToSave = FilePath.."/"..FileName
 print(clr.green.." Success!,File Saved to => "..FilePathToSave..clr.reset)
 file = io.open(FilePathToSave,"w+")
 file:write(table.concat(respbody))
 file:close()
 return FilePathToSave
end
local function curlRequest(curl_command)
io.popen(curl_command)
end

function sendSticker(chat_id,sticker, reply_to_message_id)
local url = BASSE .. '/sendSticker'
local curl_command = 'curl "' .. url .. '" -F "chat_id=' .. chat_id .. '" -F "sticker=@' .. sticker .. '"'
if reply_to_message_id then
curl_command = curl_command .. ' -F "reply_to_message_id=' .. reply_to_message_id .. '"'
end
return curlRequest(curl_command)
end







function DownloadFile(url, fileName)
local respbody = {}
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true }
local response = nil
response = {http.request(options)}
local responsive = response[2]
if responsive ~= 200 then return nil end
local filePath = "./Alpha/data/"..fileName
file = io.open(filePath, "w+")
file:write(table.concat(respbody))
file:close()
return filePath
end
function DownloadFile(url, file_name)
print("url to download: "..url)
local respbody = {}
local options = {
url = url,
sink = ltn12.sink.table(respbody),
redirect = true
}
local response = nil
if url:match('^https') then
options.redirect = false
response = {https.request(options)}
else
response = {http.request(options)}
end
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then return nil end
file_name = file_name or get_http_file_name(url, headers)
local file_path = "./"..file_name
print("Saved to: "..file_path)
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path
end

function sendAudio(chat_id,Audio, reply,Cap,Title,Performer,Markup)
if not chat_id or not Audio then
print(clr.red.." *ERROR => chat_id or Audio [sendAudio]"..clr.reset)
return false
end
local Url = BASSE.."/sendAudio?"
curl_context:setopt_url(Url)
local form = curl.form()
form:add_content("chat_id",chat_id)
form:add_file("audio",Audio)
if reply then
form:add_content("reply_to_message_id", reply)
end
if Cap then
form:add_content("caption",Cap)
end
if Title then
form:add_content("title",Title)
end
if Performer then
form:add_content("performer",Performer)
end
if Markup then
form:add_content("reply_markup", json:encode(Markup))
end
data = {}
local c = curl_context:setopt_writefunction(table.insert,data)
:setopt_httppost(form)
:perform()
return table.concat(data), c:getinfo_response_code()
end
function sendDocument(chat_id,Documnet, reply,Cap,markdown)
if not chat_id or not Documnet then
print(clr.red.." *ERROR => chat_id or Documnet [sendDocument]"..clr.reset)
return false
end
local Url = BASSE.."/sendDocument"
curl_context:setopt_url(Url)
local form = curl.form()
form:add_content("chat_id",chat_id)
form:add_file("document",Documnet)
if reply then
form:add_content("reply_to_message_id",reply)
end
if Cap then
form:add_content("caption",Cap)
end
if markdown then
Url = Url .. '&parse_mode=Markdown'
end
data = {}
local c = curl_context:setopt_writefunction(table.insert,data)
:setopt_httppost(form)
:perform()
return table.concat(data), c:getinfo_response_code()
end



function sendPhoto3(chat_id, file_id, reply_to_message_id, caption)
local Rep = BASSE.. '/sendPhoto?chat_id=' .. chat_id .. '&photo=' .. file_id
if reply_to_message_id then
Rep = Rep..'&reply_to_message_id='..reply_to_message_id
end
if caption then
Rep = Rep..'&caption='..URL.escape(caption)
end
return https.request(Rep)
end
function string:input()
if not self:find(' ') then
return false
end
return self:sub(self:find(' ')+1)
end

function changeChatDescription(chat_id, des)
local url = BOTHOCK..'/setChatDescription?chat_id='..chat_id..'&description='..des
return sendRequest(url)
end
function sendText(chat_id,Text, ReplyToMessageId,ParseMode,ReplyMarkup, DisableWebPagePreview)
if not chat_id or not Text then
print(clr.red..' *ERROR => chat_id or Text [sendmessage].'..clr.blue)
return false
end
local Url = '/sendMessage?chat_id='..chat_id..'&text='..URL.escape(Text)
if ReplyToMessageId then
Url = Url..'&reply_to_message_id='..ReplyToMessageId
end
if ParseMode then
Url = Url..'&parse_mode='..getParseMode(ParseMode)
end
if ReplyMarkup then
Url = Url..'&reply_markup='..URL.escape(json:encode(ReplyMarkup))
end
if DisableWebPagePreview then
Url = Url..'&disable_web_page_preview=true'
end
return getRes(Url)
end
function getchat_id(chat_id)
if not chat_id then
print(clr.red..'chat_id is not [getchat_id]'..clr.reset)
return false
end
Url = 'getchat_id?chat_id='..chat_id
local Res = getRes(Url)
if not Res.ok or not Res.result or not Res.result.title then
return {title = '----',type = '----'}
end
return {title = Res.result.title, type = Res.result.title}
end
function deleteMessages(chat_id,msgid)
if not chat_id or not msgid then
print(clr.red..' ERROR => chat_id or msgid [DelMsg].'..clr.red)
return false
end
local Url = '/deleteMessage?chat_id='..chat_id..'&message_id='..msgid
return getRes(Url)
end

function deleteMessagesAlert(chat_id,msgid,text, show_alert)
if not chat_id or not msgid then
print(clr.red..' ERROR => chat_id or msgid [DelMsg].'..clr.red)
return false
end
local Url = '/deleteMessage?chat_id='..chat_id..'&message_id='..msgid .. '&text=' .. URL.escape(text)
if show_alert then
Url = Url..'&show_alert=true'
end
return getRes(Url)
end


function is_JoinChannel(msg)
if base:get(TD_ID..'joinchnl') then
Url = 'getChatMember?chat_id=@'..Channel..'&user_id='..msg.from.id
rs = getRes(Url)
if not rs.ok then
return true
else
if rs.result then
if rs.result.status then
if rs.result.status:lower() ~= 'left' and rs.result.status:lower() ~= 'kicked' then
return true
end
if not is_sudo1(msg.from.id) then
local username = '<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..' </a>'
Ramin = ' ◂ کاربر  '..username..' برای ارسال دستورات ربات خواهشمند است به کانال ما عضو شوید. '
local keyboard = {}
keyboard.inline_keyboard = {{
{text='◈ عضویت در کانال ◈',url='https://t.me/'..Channel..''},},}
sendText(msg.chat.id,Ramin,msg.message_id, 'html',keyboard)
end
end
end
end
return false
end
end

function is_JoinChannelpanel(msg)
if base:get(TD_ID..'joinchnl') then
Url = 'getChatMember?chat_id=@'..Channel..'&user_id='..msg.from.id
rs = getRes(Url)
if not rs.ok then
return true
else
if rs.result then
if rs.result.status then
if rs.result.status:lower() ~= 'left' and rs.result.status:lower() ~= 'kicked' then
return true
end
if not is_sudo1(msg.from.id) then
Ramin = '<'..msg.from.first_name:escape_hard()..'>  \n✭ شما در کانال ربات عضو نیستید ⁉️\n ❌ برای استفاده از پنل مدیریتی باید عضو کانال شوید!\nکانال :https://t.me/'..Channel..'〕 '
Alert(msg.id,Ramin,true)
end
end
end
end
return false
end
end


---------FUNCTION menu----------
function menu(chat_id,page)
if page == 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'تنظیمات ▸ ',callback_data = 'Ramin:Ramin:'..chat_id},
{text = '◂ مدیریت',callback_data = 'Ramin:groupinfo:'..chat_id},
},{
{text ='آمار گروه ▸',callback_data = 'Ramin:statsmem:'..chat_id},
{text ='◂ پشتیبانی',callback_data = 'Ramin:suppuortbot:'..chat_id},
},{
{text= ' لغو عملیات ⊴',callback_data = 'Ramin:Exhlp:'..chat_id},},}
return keyboard

elseif page == 15 then  
local keyboard = {}   
keyboard.inline_keyboard = {{ 
{text = '😐😐',callback_data = 'Ramin:attacknew:'..chat_id},
},{
{text = '😁😁',callback_data = 'Ramin:attacknew:'..chat_id},
},{
{text = '🤪🤪',callback_data = 'Ramin:attacknew:'..chat_id},
},{ 
{text= '➲ بستن عملیات ضد کلیکر',callback_data = 'bd:Exhlp:'..chat_id},},} 
return keyboard  



elseif page == 35 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'اعلام حضور ادمین ها ▸',callback_data = 'Ramin:tagadmin:'..chat_id},
},{
{text = 'اعلام حضور کاربرها ▸',callback_data = 'Ramin:taguser:'..chat_id},
},{
{text= ' لغو عملیات ⊴',callback_data = 'Ramin:Exhlp:'..chat_id},},}
return keyboard 


elseif page == 85 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بخش اول ▸',callback_data = 'Ramin:sudoown:'..chat_id},
},{
{text = 'بخش دوم ▸',callback_data = 'Ramin:sudotwo:'..chat_id},
},{
{text= ' لغو عملیات ⊴',callback_data = 'Ramin:Exhlp:'..chat_id},},}
return keyboard

elseif page == 65 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاکسازی کلی پیام ها ▸',callback_data = 'Ramin:cleanallmsg:'..chat_id},
},{
{text = 'پاکسازی تبچی ▸',callback_data = 'Ramin:cleanalltab:'..chat_id},
},{
{text = 'حذف دلیتی ها ▸',callback_data = 'Ramin:cleandeleted:'..chat_id},
{text = '◂ حذف بلک لیست',callback_data = 'Ramin:cleanblacklist:'..chat_id},
},{
{text = 'حذف ربات ▸',callback_data = 'Ramin:cleanbots:'..chat_id},
{text = '◂ حذف محدود ها',callback_data = 'Ramin:cleanrestricts:'..chat_id},
},{
{text = 'دیگر پاکسازی ها ▸',callback_data = 'Ramin:cleanallother:'..chat_id},
},{
{text= ' لغو عملیات ⊴',callback_data = 'Ramin:Exhlp:'..chat_id},},}
return keyboard





elseif page == 39 then
if base:sismember(TD_ID..'Gp2:'..chat_id,'autoclener')  then
autocl = '✓فعال'
else
autocl = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'cleanpm:on')  then
cleanpm = '✓فعال'
else
cleanpm = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'cgmautoon')  then
autoc2 = '✓فعال'
else
autoc2 = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'cgmautoalarm')  then
cgmautoalarm = '✓فعال'
else
cgmautoalarm = '✘غیرفعال'
end
c1 = base:get(TD_ID.."DelaUtO"..chat_id)
if c1 then
stats3 = ''..c1..''
else
stats3 = 'تنظیم نشده(کلیک کن!)'
end
ST = tonumber(base:get(TD_ID..'CL:Time:'..chat_id))
if ST then
alarm = ''..ST..''
else
alarm = '- -'
end
ST = tonumber(base:get(TD_ID..'CL:clean:'..chat_id))
if ST then
clean = ''..ST..' پیام'
else
clean = 'تعداد پیام تنظیم نشده'
end

local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ پاکسازی ساعت ثابتی ： '..autocl..'',callback_data = 'Ramin:SetCleanHallat:'..chat_id},
},{{text = '◂ ساعت پاکسازی : '..stats3..'',callback_data = 'Ramin:SetStartCl:'..chat_id},
},{{text = '◂ پاکسازی ساعتی ：'..autoc2..'',callback_data = 'Ramin:SetCleanHour:'..chat_id},
},{{text = '◂ اعلام ساعت باقی پاکسازی : '..cgmautoalarm..' ',callback_data = 'Ramin:SetCleanAlarm:'..chat_id},
},{{text=' هرساعت '..alarm..' یکبار ',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMECl2down:'..chat_id},
{text='«',callback_data='Ramin:TIMECldown:'..chat_id},
{text='»',callback_data='Ramin:TIMEClup:'..chat_id},
{text='»»',callback_data='Ramin:TIMECl2up:'..chat_id},
},{
{text = '◂ پاکسازی کلی پیام ها',callback_data = 'Ramin:cleanallmsg:'..chat_id},
},{
{text = '◂ پاکسازی تبچی',callback_data = 'Ramin:cleanalltab:'..chat_id},
},{
{text = '◂ حذف دلیتی ها',callback_data = 'Ramin:cleandeleted:'..chat_id},
{text = '◂ حذف بلک لیست',callback_data = 'Ramin:cleanblacklist:'..chat_id},
},{
{text = '◂ حذف ربات',callback_data = 'Ramin:cleanbots:'..chat_id},
{text = '◂ حذف محدود ها',callback_data = 'Ramin:cleanrestricts:'..chat_id},
},{

{text = ' بازگشت ⊴',callback_data = 'Ramin:Hallat:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش عملیات پاکسازی ها 』'
Edit(msg,txt,keyboard,true)




elseif page == 38 then
EdiT(msg,'',keyboard,true)
sleep(1)
txt2='◈ ربات درحال انجام پردازش پیام های گروه...! \n\n⚠️بعد از اتمام پردازش عملیات پاکسازی پیام ها شروع خواهد شد!\n\n■■□□□□□□□□□□□□ ❶⓿% '
EdiT(msg,txt2,keyboard,true)
sleep(1)
txt3='◈ ربات درحال انجام پردازش پیام های گروه...! \n\n⚠️بعد از اتمام پردازش عملیات پاکسازی پیام ها شروع خواهد شد!\n\n■■■■□□□□□□□□□□ ❸⓿%'
EdiT(msg,txt3,keyboard,true)
sleep(1)
txt4='◈ ربات درحال انجام پردازش پیام های گروه...! \n\n⚠️بعد از اتمام پردازش عملیات پاکسازی پیام ها شروع خواهد شد!\n\n■■■■■■■□□□□□□□ ❺⓿%'
EdiT(msg,txt4,keyboard,true)
sleep(1)
txt5='◈ ربات درحال انجام پردازش پیام های گروه...! \n\n⚠️بعد از اتمام پردازش عملیات پاکسازی پیام ها شروع خواهد شد!\n\n■■■■■■■■■■□□□□ ❻⓿%'
EdiT(msg,txt5,keyboard,true)
sleep(1)
txt6='◈ ربات درحال انجام پردازش پیام های گروه...! \n\n⚠️بعد از اتمام پردازش عملیات پاکسازی پیام ها شروع خواهد شد!\n\n■■■■■■■■■■■■■□ ➑❺%'
EdiT(msg,txt6,keyboard,true)
sleep(1)
txt7='◈ ربات درحال انجام پردازش پیام های گروه...! \n\n⚠️بعد از اتمام پردازش عملیات پاکسازی پیام ها شروع خواهد شد!\n\n■■■■■■■■■■■■■■ ❾❾%'
EdiT(msg,txt7,keyboard,true)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' بازگشت ⊴',callback_data = 'Ramin:cleanpanel:'..chat_id},},}
txt = '◆ پاکسازی پیام ها در حال انجام...!'
base:set(TD_ID.."CleanMsg"..chat_id,true)
Edit(msg,txt,keyboard,true)

elseif page == 40 then
EdiT(msg,'',keyboard,true)
sleep(1)
txt2='◈ ربات درحال انجام عملیات پاکسازی تبچی ها...! \n\n■■□□□□□□□□□□□□ ❶⓿% '
EdiT(msg,txt2,keyboard,true)
sleep(1)
txt3='◈ ربات درحال انجام عملیات پاکسازی تبچی ها...! \n\n■■■■□□□□□□□□□□ ❸⓿%'
EdiT(msg,txt3,keyboard,true)
sleep(1)
txt4='◈ ربات درحال انجام عملیات پاکسازی تبچی ها...! \n\n■■■■■■■□□□□□□□ ❺⓿%'
EdiT(msg,txt4,keyboard,true)
sleep(1)
txt5='◈ ربات درحال انجام عملیات پاکسازی تبچی ها...! \n\n■■■■■■■■■■□□□□ ❻⓿%'
EdiT(msg,txt5,keyboard,true)
sleep(1)
txt6='◈ ربات درحال انجام عملیات پاکسازی تبچی ها...! \n\n■■■■■■■■■■■■■□ ➑❺%'
EdiT(msg,txt6,keyboard,true)
sleep(1)
txt7='◈ ربات درحال انجام عملیات پاکسازی تبچی ها...! \n\n■■■■■■■■■■■■■■ ❾❾%'
EdiT(msg,txt7,keyboard,true)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' بازگشت ⊴',callback_data = 'Ramin:cleanpanel:'..chat_id},},}
txt = '◆ پاکسازی ربات های تبچی با موفقیت انجام شد!'
Edit(msg,txt,keyboard,true)


elseif page == 80 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ مالک ربات',url = "https://telegram.me/"..Config.Sudo1..""},
},{
{text = '◂ گروه پشتیبانی',url = LinkSuppoRt},
},{
{text = '◂ چنل ربات',url = "https://telegram.me/"..Channel},
},{
{text = '◂ چنل دستورات',url = "https://telegram.me/"..ChannelCmd},
},{
{text = '◂ پیامرسان ربات',url = "https://telegram.me/"..PvSudo1},
},{
{text = ' بازگشت ⊴',callback_data = 'Ramin:menu:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش پشتیبانی ربات 』'
Edit(msg,txt,keyboard,true)
 


elseif page == 42 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' بازگشت ⊴',callback_data = 'Ramin:cleanpanel:'..chat_id},},}
txt = '◆ پاکسازی کاربران دلیت شده در گروه انجام شد!'
base:set(TD_ID.."cleandeleted"..chat_id,true)
Edit(msg,txt,keyboard,true)
 
elseif page == 43 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' بازگشت ⊴',callback_data = 'Ramin:cleanpanel:'..chat_id},},}
txt = '◆ پاکسازی کاربران مسدود شده در گروه انجام شد!'
base:set(TD_ID.."cleanblacklist"..chat_id,true)
Edit(msg,txt,keyboard,true)

elseif page == 44 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' بازگشت ⊴',callback_data = 'Ramin:cleanpanel:'..chat_id},},}
txt = '◆ تمامی ربات هایی که درگروه ادمین نبودند حذف شدند!'
base:set(TD_ID.."cleanbots"..chat_id,true)
Edit(msg,txt,keyboard,true)

elseif page == 45 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' بازگشت ⊴',callback_data = 'Ramin:cleanpanel:'..chat_id},},}
txt = '◆ پاکسازی کاربران محدود شده در گروه انجام شد!'
base:set(TD_ID.."CleanRestriced"..chat_id,true)
Edit(msg,txt,keyboard,true)

----------------------------------
elseif page == 66 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '♻️ پاکسازی دوباره ',callback_data = 'Ramin:cleanallmsg:'..chat_id},
},{
{text= '► انصراف',callback_data = 'Ramin:Exhlp:'..chat_id},},}
return keyboard

elseif page == 11 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'تنظیمات ▸ ',callback_data = 'Ramin:Ramin:'..chat_id},
{text = '◂ مدیریت',callback_data = 'Ramin:groupinfo:'..chat_id},
},{
{text ='آمار گروه ▸',callback_data = 'Ramin:statsmem:'..chat_id},
{text ='◂ پشتیبانی',callback_data = 'Ramin:suppurt:'..chat_id},
},{
{text= ' لغو عملیات ⊴',callback_data = 'Ramin:Exhlp:'..chat_id},},}
return keyboard
elseif page == 64 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'تنظیمات ▸ ',callback_data = 'Ramin:Ramin:'..chat_id},
{text = '◂ مدیریت',callback_data = 'Ramin:groupinfo:'..chat_id},
},{
{text ='آمار گروه ▸',callback_data = 'Ramin:statsmem:'..chat_id},
{text ='◂ پشتیبانی',callback_data = 'Ramin:suppurt:'..chat_id},
},{
{text = '➲ بازگشت به منو استارت',callback_data = 'Ramin:Backst:'..msg.from.id}
}}
return keyboard


elseif page == 32 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ⚡️ ورود به پنل مدیریتی ⚡️ ',callback_data = 'Ramin:menu:'..chat_id}}}
txt = '◀️ ربات در گروه به صورت کامل نصب و راه اندازی شد جهت تنظیمات ربات  دکمه {⚡️ ورود به پنل مدیریتی ⚡️} را لمس کنید. '
Edit(msg,txt,keyboard,true)

elseif page == 53 then
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '◈ ویرایش ارتقا سودو ',callback_data = 'Ramin:editsudo:'..chat_id},
},{{text = '◈ ویرایش ارتقا مالک ',callback_data = 'Ramin:editowner:'..chat_id},
},{{text = '◈ ویرایش ارتقا مدیر ',callback_data = 'Ramin:editpromote:'..chat_id},
},{{text = '◈ ویرایش ارتقا مجاز ',callback_data = 'Ramin:editvip:'..chat_id},
},{{text = '◈ ویرایش ارتقا مسدود ',callback_data = 'Ramin:editban:'..chat_id},
},{{text = ' ◈ ویرایش ارتقا سکوت ',callback_data = 'Ramin:editmute:'..chat_id},
},{{text = ' ◈ ویرایش ارتقا اخطار  ',callback_data = 'Ramin:editwarn:'..chat_id},
},{{text = ' ◈ ویرایش ارتقا اخراج  ',callback_data = 'Ramin:editkick:'..chat_id},
},{
{text = '◂ بازگشت',callback_data = 'Ramin:back:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '✪ به تنظیمات ویرایش قفل ها و دستورات ارتقا خوش آمدید! \n▁▁▁▂[ارتقا پاسخ دستورات](tg://user?id='..msg.from.id..')▂▁▁▁ '
Edit(msg,txt,keyboard,true)
elseif page == 54 then
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '◈ ویرایش حذف سودو ',callback_data = 'Ramin:editsudorem:'..chat_id},
},{{text = '◈ ویرایش حذف مالک ',callback_data = 'Ramin:editownerrem:'..chat_id},
},{{text = '◈ ویرایش حذف مدیر ',callback_data = 'Ramin:editpromoterem:'..chat_id},
},{{text = '◈ ویرایش حذف مجاز ',callback_data = 'Ramin:editviprem:'..chat_id},
},{{text = '◈ ویرایش حذف مسدود ',callback_data = 'Ramin:editbanrem:'..chat_id},
},{{text = ' ◈ ویرایش حذف سکوت ',callback_data = 'Ramin:editmuterem:'..chat_id},
},{{text = ' ◈ ویرایش حذف اخطار  ',callback_data = 'Ramin:editwarnrem:'..chat_id},
},{{text = ' ◈ ویرایش حذف اخراج  ',callback_data = 'Ramin:editkickrem:'..chat_id},
},{ 
{text = '◂ بازگشت',callback_data = 'Ramin:back:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '✪ به تنظیمات ویرایش قفل ها و دستورات ارتقا خوش آمدید! \n▁▁▁▂[حذف پاسخ دستورات](tg://user?id='..msg.from.id..')▂▁▁▁ '
Edit(msg,txt,keyboard,true)
elseif page == 99 then
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = ' ◂ قفل تک حالته ',callback_data = 'Ramin:locktxt1:'..chat_id},
},{{text = '  ◂ قفل چند حالته ',callback_data = 'Ramin:easy:'..chat_id},
},{{text = '◂ حالت های گروه',callback_data = 'Ramin:Hallat:'..chat_id},
},{
{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش تنظیمات 』'
Edit(msg,txt,keyboard,true)
elseif page == 36 then
local keyboard = {} 
keyboard.inline_keyboard = {{
},{{text = 'ضد اسپم ▸',callback_data = 'Ramin:moreSettings:'..chat_id},
{text = '◂ ضد تبچی',callback_data = 'Ramin:AntiTabchipnl:'..chat_id}, 
},{{text = '◂ دسترسی دستورات',callback_data = 'Ramin:adminsetcmd:'..chat_id},
},{{text = 'تنظیم اجباری ▸',callback_data = 'Ramin:Forcejoin:'..chat_id},
{text ='◂ تعیین ادمین ',callback_data = 'Ramin:adminauto:'..chat_id}
},{
{text = 'قفل خودکار ▸ ',callback_data = 'Ramin:lockauto:'..chat_id},
{text = '◂ خوش آمدگویی',callback_data = 'Ramin:Wlc:'..chat_id},
},{
{text = 'جوین اجباری تایمر ▸  ',callback_data = 'Ramin:joinejbari:'..chat_id}
},{
{text = ' بخش فیلترینگ ▸ ',callback_data = 'Ramin:filterpanel:'..chat_id},
{text ='◂ بخش پاکسازی  ',callback_data = 'Ramin:cleanpanel:'..chat_id}
},{
{text = 'مجوزهای چت ▸',callback_data = 'Ramin:ChatPermissions:'..chat_id},
{text = '◂ لیمیت پیام ',callback_data = 'Ramin:LimitMsg:'..chat_id},
},{ 
{text = 'ضد پورن ▸  ',callback_data = 'Ramin:PanelPorn:'..chat_id}
--},{{text = '► بخش بعدی',callback_data = 'Ramin:Hallat1:'..chat_id}
},{{text = '◂ بازگشت',callback_data = 'Ramin:Ramin:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil' 
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش اول تنظیمات پیشرفته 』'
Edit(msg,txt,keyboard,true) 
-- elseif page == 37 then
-- local keyboard = {}
-- keyboard.inline_keyboard = {{
-- {text = 'قفل خودکار 🚗 ',callback_data = 'Ramin:lockauto:'..chat_id},
-- {text = '🌹 خوش آمدگویی',callback_data = 'Ramin:Wlc:'..chat_id},
-- },{{text = '🚀 جوین اجباری تایمر  ',callback_data = 'Ramin:joinejbari:'..chat_id}
-- },{{text = '🚷 بخش فیلترینگ ',callback_data = 'Ramin:filterpanel:'..chat_id},
-- {text ='بخش پاکسازی 🗑 ',callback_data = 'Ramin:cleanpanel:'..chat_id}
-- },{{text = 'مجوزهای چت 🔰',callback_data = 'Ramin:ChatPermissions:'..chat_id},
-- },{{text = 'بخش قبلی ◄',callback_data = 'Ramin:Hallat:'..chat_id}
-- },{{text = '◂ بازگشت',callback_data = 'Ramin:Ramin:'..chat_id}}}
-- gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
-- dofile('./Alpha/time.lua')
-- txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش دوم تنظیمات پیشرفته 』'
-- Edit(msg,txt,keyboard,true)
elseif page == 87 then
if base:sismember(TD_ID..'Gp2:'..chat_id,'autoon')  then
auto = '✓فعال'
else
auto = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'autoonpin')  then
autopin = '✓فعال'
else
autopin = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'Tele_Mute')  then
hallat = '📵 سکوت '
else
hallat = '❌ حذف پیام'
end
local start = base:get(TD_ID.."atolct1"..chat_id)
local stop = base:get(TD_ID.."atolct2"..chat_id)
if start and stop then
if base:get(TD_ID.."bot:muteall:Run" .. chat_id) then
AutolockFa = "درحال کار...!"
else
AutolockFa = "در انتظار...!"
end
else
AutolockFa = "تنظیم نشده"
end
t1 = base:get(TD_ID.."atolct1"..chat_id)
t2 = base:get(TD_ID.."atolct2"..chat_id)
if t1 and t2 then
stats1 = ''..t1..'الی'..t2..''
else
stats1 = 'تنظیم نشده'
end
p1 =  base:get(TD_ID.."Autopin1"..chat_id)
p2 =  base:get(TD_ID.."Autopin2"..chat_id)
if p1 and p2 then
stats2 = ''..p1..'الی'..p2..''
else
stats2 = 'تنظیم نشده'
end
dofile('./Alpha/time.lua')
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قفل خودکار : '..auto..' ',callback_data = 'Ramin:alphaautogp:'..chat_id},
},{{text = 'حالت قفل خودکار : '..hallat..' ',callback_data = 'Ramin:SetHallat:'..chat_id},
},{{text = '👉 تنظیم ساعت قفل خودکار(کلیک کن!) ',callback_data = 'Ramin:SetStartAuto:'..chat_id},
},{{text = 'قفل سنجاق : '..autopin..' ',callback_data = 'Ramin:alphaautopin:'..chat_id},
},{{text = 'تنظیم متن سنجاق',callback_data = 'Ramin:SetMsgPin:'..chat_id},
},{{text = '👉 تنظیم ساعت سنجاق(کلیک کن!) ',callback_data = 'Ramin:SetStartPin:'..chat_id},
},{{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش قفل خودکار 』\n\n◈ حالت قفل خودکار : '..hallat..'\n◈ ساعت قفل خودکار : ['..stats1..']\n◈ وضعیت قفل خودکار : '..AutolockFa..' \n\n◈ ساعت سنجاق خودکار : ['..stats2..']\n◈ ساعت سرور : *'..Alphaee(hor)..'*:*'..Alphaee(dag)..'*:*'..Alphaee(sec)..'*  '
Edit(msg,txt,keyboard,true)

elseif page == 21 then
if base:sismember(TD_ID..'Gp2:'..chat_id,'Adminpm:on')  then
Adminpm = '✓فعال'
else
Adminpm = '✘غیرفعال'
end
ST = tonumber(base:get(TD_ID..'CL:Adminpm:'..chat_id))
if ST then
pm = ''..ST..' پیام'
else
pm = 'تعداد پیام تنظیم نشده'
end
if base:get(TD_ID.."Adminsendpm"..chat_id) == "OwnerGp" then
setpm = "👮🏻‍♂️ مالک گروه"
elseif base:get(TD_ID.."Adminsendpm"..chat_id) == "OwnerAllGp" then 
setpm = "👨‍👩‍👦‍👦 کل مدیران"
elseif base:get(TD_ID.."Adminsendpm"..chat_id) == "AdminGp" then
setpm = "🕵🏻‍♀️ ادمین ها"
elseif not base:get(TD_ID.."Adminsendpm"..chat_id) then
setpm = "👮🏻‍♂️ مالک گروه"
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'تعیین خودکار ادمین : '..Adminpm..'',callback_data = 'Ramin:Adminpm:'..chat_id},
},{
{text='📊 تعداد آمار پیام :  '..pm..' ',callback_data='Ramin:Adminpmnum:'..chat_id},
},{
{text='««',callback_data='Ramin:Adminpm2down:'..chat_id},
{text='«',callback_data='Ramin:Adminpmdown:'..chat_id},
{text='»',callback_data='Ramin:Adminpmup:'..chat_id},
{text='»»',callback_data='Ramin:Adminpm2up:'..chat_id},
},{
{text = 'پیشنهاد به  : '..setpm..'',callback_data = 'Ramin:Adminsendpm:'..chat_id},
},{
{text = '◂ بازگشت',callback_data = 'Ramin:Hallat:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش ادمین خودکار 』'
Edit(msg,txt,keyboard,true)

elseif page == 61 then
STNum = tonumber(base:get(TD_ID..'ST:Number:'..chat_id)) or 10
local anmisticker =  base:zrevrange(TD_ID..'bot:Unsupported:'..chat_id..':', 0, 2, 'withscores')
local VideoNote =  base:zrevrange(TD_ID..'bot:VideoNote:'..chat_id..':', 0, 2, 'withscores')
local Sticker =  base:zrevrange(TD_ID..'bot:Sticker:'..chat_id..':', 0, 2, 'withscores')
local Audio =  base:zrevrange(TD_ID..'bot:Audio:'..chat_id..':', 0, 2, 'withscores')
local Voice =  base:zrevrange(TD_ID..'bot:Voice:'..chat_id..':', 0, 2, 'withscores')
local Photo =  base:zrevrange(TD_ID..'bot:Photo:'..chat_id..':', 0, 2, 'withscores')
local stats = base:zrevrange(TD_ID..'bot:msgusr2:'..chat_id..':', 0, STNum, 'withscores')
local addstats = base:zrevrange(TD_ID..'bot:addusr2:'..chat_id..':', 0, 2, 'withscores')
local Gif =  base:zrevrange(TD_ID..'bot:Gif:'..chat_id..':', 0, 2, 'withscores')
local Msg = base:get(TD_ID..'Total:messages:'..chat_id..'') or 0
local link = base:get(TD_ID..'Total:JoinedByLink:'..chat_id..'') or 0
local ttladd = base:get(TD_ID..'Total:AddUser:'..chat_id) or 0
dofile('./Alpha/time.lua')
stattextss = '✭ آمار فعالیت گروه تا این لحظه ✭ \n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n◂ فعالترین کاربران امروز : \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
for k, v in pairs(stats) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
elseif k == 2 then
rankstat = "➋نفر دوم"
elseif k == 3 then
rankstat = "➌نفر سوم"
elseif k == 4 then
rankstat = "➍نفر چهارم"
elseif k == 5 then
rankstat = "➎نفر پنچم"
elseif k == 6 then
rankstat = "➏نفر ششم"
elseif k == 7 then
rankstat = "➐نفر هفتم"
elseif k == 8 then
rankstat = "➑نفر هشتم"
elseif k == 9 then
rankstat = "➒نفر نهم"
elseif k == 10 then
rankstat = "➓نفر دهم"
elseif k == 11 then
rankstat = "➊➊نفر یازدهم"
elseif k == 12 then
rankstat = "➋➊نفر دوازدهم"
elseif k == 13 then
rankstat = "➌➊نفر سیزدهم"
elseif k == 14 then
rankstat = "➍➊نفر چهاردهم"
elseif k == 15 then
rankstat = "➎➊نفر پانزدهم"
elseif k == 16 then
rankstat = "➏➊نفر شانزدهم"
elseif k == 17 then
rankstat = "➐➊نفر هفدهم"
elseif k == 18 then
rankstat = "➑➊نفر هیچدهم"
elseif k == 19 then
rankstat = "➒➊نفر نوزدهم"
else
rankstat = "⓿➋نفر بیستم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با *" .. v[2] .. "* پیام \n"
end
for k, v in pairs(Gif) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🔮 نفرات برتر گیف  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Voice) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🔊 نفرات برتر ویس  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Photo) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n📸 نفرات برتر عکس  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Audio) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🎧 نفرات برتر آهنگ  :\n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Sticker) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🖼 نفرات برتر استیکر  :\n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(VideoNote) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🤳 نفرات برتر فیلم سلفی  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(anmisticker) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🤳 نفرات برتر استیکر متحرک  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end

for k, v in pairs(addstats) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🏵 بهترین اضافه کننده ها : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " اد \n"
end
stattextss = stattextss .. "\n◂ کل پیام های گروه : *" ..Msg.. "* پیام"
stattextss = stattextss .. "\n◂ اعضای عضو شده با لینک : *" ..link.. "* نفر"
stattextss = stattextss .. "\n◂ کل اعضای دعوتی : *" ..ttladd.. "* نفر"
if #stats == 0 then
t = '`سیستم آمار در این گروه در دسترس نیست ◂`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ بازگشت ',callback_data = 'Ramin:menu:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
ST = tonumber(base:get(TD_ID..'ST:Time:'..chat_id)) or 7
STNum = tonumber(base:get(TD_ID..'ST:Number:'..chat_id)) or 10
local keyboard = {}
keyboard.inline_keyboard = {{
{text='♻️ زمان ریست شدن آمار  '..Alphafa(ST)..' روز ',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEStats2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEStatsdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEStatsup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEStats2up:'..chat_id},
},{
{text='🥳 تعداد نفرات آمار'..Alphafa(STNum)..' کاربر ',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEStatsnum2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEStatsnumdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEStatsnumup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEStatsnum2up:'..chat_id},
},{
{text = '📈 آمار دستورات',callback_data = 'Ramin:actevemodcmd:'..chat_id},
{text = 'آمار ادمین ها 📉',callback_data = 'Ramin:actevemodlist:'..chat_id},
},{
{text = '📝 آمار پیام ها',callback_data = 'Ramin:actevemem:'..chat_id},
},{
{text = ' ریست کلی آمار ❌',callback_data = 'Ramin:cleanactevemem:'..chat_id}
},{
{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش آمار 』'
Edit(msg,stattextss,keyboard,true)
end

elseif page == 23 then
if base:sismember(TD_ID..'Gp2:'..chat_id,'limitpm:on') then
limitpm = '✓فعال'
else
limitpm = '✘غیرفعال'
end
ST = tonumber(base:get(TD_ID..'Li:Time:'..chat_id))
if ST then
limnum = ''..Alphafa(ST)..' ساعت'
else
limnum = 'تنظیم نشده'
end
ST = tonumber(base:get(TD_ID..'Li:clean:'..chat_id))
if ST then
Liclean = ''..Alphafa(ST)..' پیام'
else
Liclean = 'تعداد پیام تنظیم نشده'
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ لیمیت پیام : '..limitpm..' ',callback_data = 'Ramin:SetLimit:'..chat_id},
},{
{text='⏰ زمان محدود کاربر : '..limnum..' ',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMELim2down:'..chat_id},
{text='«',callback_data='Ramin:TIMELimdown:'..chat_id},
{text='»',callback_data='Ramin:TIMELimup:'..chat_id},
{text='»»',callback_data='Ramin:TIMELim2up:'..chat_id},
},{
{text='◂ تعداد لیمیت پیام هرکاربر : '..Liclean..'',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
},{
{text='««',callback_data='Ramin:Liclean2down:'..chat_id},
{text='«',callback_data='Ramin:Licleandown:'..chat_id},
{text='»',callback_data='Ramin:Licleanup:'..chat_id},
{text='»»',callback_data='Ramin:Liclean2up:'..chat_id},
},{
{text = 'بازگشت ◂',callback_data = 'Ramin:Hallat:'..chat_id},},}
Edit(msg,'◆ بخش مورد نظر را انتخاب کنید : \n『 بخش لیمیت پیام 』',keyboard,true)

elseif page == 7 then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModClList') then
cmdclaen = '✅'
else
cmdclaen = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModPnList') then
cmdpin =  '✅'
else
cmdpin = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModBnList') then
cmdban = '✅'
else
cmdban = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModMutList') then
cmdmute = '✅'
else
cmdmute = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModWarList') then
cmdwarn = '✅'
else
cmdwarn = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLokList') then
cmdlock = '✅'
else
cmdlock = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModAlList') then
cmdall = '✅'
else
cmdall = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModpnelList') then
cmdpanel = '✅'
else
cmdpanel = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModVpList') then
cmdvip = '✅'
else
cmdvip ='✘'
end


if base:get(TD_ID.."sg:permissions"..chat_id) == "lock" then
per = '✅'
else
per = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLockOptionNazar') then
OptionNazar = '✅'
else
OptionNazar ='✘'
end

if base:sismember(TD_ID..'Gp:'..chat_id,'ModLockOptionLink') then
OptionLink = '✅'
else
OptionLink = '✘'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLockOptionBot') then
OptionBot = '✅'
else
OptionBot ='✘'
end

local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' پاکسازی : '..cmdclaen..'',callback_data = 'Ramin:ModClList:'..chat_id},
},{
{text = ' مسدود کردن : '..cmdban..'',callback_data = 'Ramin:ModBnList:'..chat_id},
{text = ' سکوت کردن  : '..cmdmute..'',callback_data = 'Ramin:ModMutList:'..chat_id},
},{
{text = ' اخطاردادن : '..cmdwarn..'',callback_data = 'Ramin:ModWarList:'..chat_id},
{text = ' مجاز کردن : '..cmdvip..'', callback_data = 'Ramin:ModVpList:'..chat_id},
},{
{text = 'قفل یا بازکردن : '..cmdlock..'', callback_data = 'Ramin:ModLokList:'..chat_id},
},{
{text = 'سنجاق کردن : '..cmdpin..' ',callback_data = 'Ramin:ModPnList:'..chat_id},
{text = 'پنل مدیریتی  : '..cmdpanel..'',callback_data = 'Ramin:ModpnelList:'..chat_id},
},{
{text = 'قفل اتک : '..per..'',callback_data = 'Ramin:lockpermissions:'..chat_id},
{text = 'نظرسنجی  : '..OptionNazar..'',callback_data = 'Ramin:ModLockOptionNazar:'..chat_id},
},{
{text = 'تبلیغات : '..OptionLink..'',callback_data = 'Ramin:ModLockOptionLink:'..chat_id},
{text = ' ادکردن ربات : '..OptionBot..' ',callback_data = 'Ramin:ModLockOptionBot:'..chat_id},
},{
{text = 'دسترسی کل  : '..cmdall..' ',callback_data = 'Ramin:ModAlList:'..chat_id},
},{
{text = 'بازگشت ◂ ',callback_data = 'Ramin:Hallat:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش دستورات 』'
Edit(msg,txt,keyboard,true)

--GETNEWSETTING

elseif page == 69 then

local stats = base:zrevrange(TD_ID..'bot:msgusr2:'..chat_id..':', 0, 50, 'withscores')
stattextss = '◈ کاربر تگ شده اعلام حضور کنند : \n\n'
for k, v in pairs(stats) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
user_info = " ["..namee.."](tg://user?id="..v[1]..") ♯ "
stattextss = stattextss  .. user_info .. ""
end 
sendText(chat_id,stattextss,msg.message_id, 'md')

elseif page == 63 then 
list =  base:smembers(TD_ID..'ModList:'..chat_id)
t = '◈ مدیران گروه اعلام حضور کنند :\n\n'
for k,v in pairs(list) do
username = base:get(TD_ID..'FirstName:'..v)
if username then
t = t..'['..username..'](tg://user?id='..v..') ♯ '
else
t = t..'-['..v..'](tg://user?id='..v..') | '
end 
end
sendText(chat_id,t,msg.message_id, 'md')

elseif page == 3 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ راهنما کاربری  ',callback_data = 'Ramin:modh:'..chat_id} ,
{text = '◈ مدیریت گروه ',callback_data = 'Ramin:seth:'..chat_id},
},{
{text = '◈ دستورات قفل ها ',callback_data = 'Ramin:lockh:'..chat_id}
},{ 
{text = '◈ دستورات پاکسازی',callback_data = 'Ramin:cleanh:'..chat_id} ,
{text = '◈ دستورات سرگرمی',callback_data = 'Ramin:funh:'..chat_id}
},{
{text = '◈ دستورات عضویت اجباری',callback_data = 'Ramin:forch:'..chat_id},
},{
{text = '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}}}
--},{{text = '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}}}
return keyboard
end
end
----------------------------------------
local function GetCmdAdmins(msg,chat_id,Msg,Alpha)
if base:sismember(TD_ID..'Gp2:'..chat_id,'PanelPv') then
txtmmd= ''
else
txtmmd = '\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
local status = getChatAdministrators(chat_id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.first_name
else
owner_id = BotJoiner
owner_name = 'دیلیت اکانت شده'
end
end
end
local keyboard = {}
keyboard.inline_keyboard = {}
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id or 219201071
admin_names = v.user.first_name or 'Not Found !'
if k == 0 then
txt = 'Error not Found !'
else
txt = '✭ لیست ادمین های گروہ :\nجهت تغییر دسترسی ادمین ها بر روی ادمین مورد نظر کلیک کنید !'
if txt then
temp = {{{text = ''..k..'-'..admin_names:escape_hard()..'',callback_data = 'Ramin:getcmdadmin'..admin_ids..':'..chat_id}}}
end
if(k<6)then
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else
temp = {{{text= '➧ بعدی',callback_data = 'AdmincmddPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
break;
end
end
end
end
end
temp = {{{text= 'خروج ☒',callback_data = 'Ramin:Exit:'..chat_id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
if Alpha == 'send' then
sendText(msg.chat.id,txt,Msg,'md',keyboard)
else
Edit(msg,txt,keyboard,true)
end
end




------------------------------------------
local function GetPanelStats(msg,chat_id,user)
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.user.id and tonumber(v.user.id) == tonumber(user) then
admin_ids = v.user.id or 219201071
admin_names = v.user.first_name or 'Not Found !'
if base:sismember(TD_ID..'ModCleanList:'..chat_id,user) then
cmdclaen = '✓'
else
cmdclaen = '✘'
end
if base:sismember(TD_ID..'ModPinList:'..chat_id,user) then
cmdpin = '✓'
else
cmdpin = '✘'
end
if base:sismember(TD_ID..'ModBanList:'..chat_id,user) then
cmdban = '✓'
else
cmdban = '✘'
end
if base:sismember(TD_ID..'ModMuteList:'..chat_id,user) then
cmdmute = '✓'
else
cmdmute = '✘'
end
if base:sismember(TD_ID..'ModWarnList:'..chat_id,user) then
cmdwarn = '✓'
else
cmdwarn = '✘'
end
if base:sismember(TD_ID..'ModLockList:'..chat_id,user)  then
cmdlock = '✓'
else
cmdlock = '✘'
end
if base:sismember(TD_ID..'ModAllList:'..chat_id,user)  then
cmdall = '✓'
else
cmdall = '✘'
end
if base:sismember(TD_ID..'ModpanelList:'..chat_id,user)  then
cmdpanel = '✓'
else
cmdpanel = '✘'
end
if base:sismember(TD_ID..'ModVipList:'..chat_id,user)  then
cmdvip = '✓'
else
cmdvip = '✘'
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاکسازی : '..cmdclaen..'',callback_data = 'Ramin:cmdclaen:'..chat_id..':'..user..':'..admin_names},
},{
{text = '🚫 مسدود کردن : '..cmdban..'',callback_data = 'Ramin:cmdban:'..chat_id..':'..user..':'..admin_names},
{text = '📵 سکوت کردن : '..cmdmute..'',callback_data = 'Ramin:cmdmute:'..chat_id..':'..user..':'..admin_names},
},{
{text = '⚠️ اخطاردادن : '..cmdwarn..'',callback_data = 'Ramin:cmdwarn:'..chat_id..':'..user..':'..admin_names},
{text = '⭕️ مجاز کردن : '..cmdvip..'', callback_data = 'Ramin:cmdvip:'..chat_id..':'..user..':'..admin_names},
},{
{text = '🔘 قفل یا بازکردن : '..cmdlock..'', callback_data = 'Ramin:cmdlock:'..chat_id..':'..user..':'..admin_names},
},{
{text = '📌 سنجاق کردن : '..cmdpin..' ',callback_data = 'Ramin:cmdpin:'..chat_id..':'..user..':'..admin_names},
{text = '🎛 پنل مدیریتی : '..cmdpanel..'',callback_data = 'Ramin:cmdpanel:'..chat_id..':'..user..':'..admin_names},
},{
{text = '✳️ دسترسی کل : '..cmdall..' ',callback_data = 'Ramin:cmdall:'..chat_id..':'..user..':'..admin_names},
},{
{text = '◄ لیست کلی ادمین ها',callback_data = 'Ramin:getadmincml:'..chat_id}
},{
{text = 'خروج ☒',callback_data = 'Ramin:Exitsr:'..chat_id},},}
dofile('./Alpha/time.lua')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
txt='به کنترل پنل دستورات مدیران گروه خوش آمدید.\nنام ادمین : ['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'
Edit(msg,txt,keyboard,true)
end
end
end
-----------------------------------------


local function GetCmdAdminStats(msg,chat_id,user)
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.user.id and tonumber(v.user.id) == tonumber(user) then
admin_ids = v.user.id or 219201071
admin_names = v.user.first_name or 'Not Found !'
if base:sismember(TD_ID..'ModCleanList:'..chat_id,user) then
cmdclaen = '✓'
else
cmdclaen = '✘'
end
if base:sismember(TD_ID..'ModPinList:'..chat_id,user) then
cmdpin = '✓'
else
cmdpin = '✘'
end
if base:sismember(TD_ID..'ModBanList:'..chat_id,user) then
cmdban = '✓'
else
cmdban = '✘'
end
if base:sismember(TD_ID..'ModMuteList:'..chat_id,user) then
cmdmute = '✓'
else
cmdmute = '✘'
end
if base:sismember(TD_ID..'ModWarnList:'..chat_id,user) then
cmdwarn = '✓'
else
cmdwarn = '✘'
end
if base:sismember(TD_ID..'ModLockList:'..chat_id,user)  then
cmdlock = '✓'
else
cmdlock = '✘'
end
if base:sismember(TD_ID..'ModAllList:'..chat_id,user)  then
cmdall = '✓'
else
cmdall = '✘'
end
if base:sismember(TD_ID..'ModpanelList:'..chat_id,user)  then
cmdpanel = '✓'
else
cmdpanel = '✘'
end
if base:sismember(TD_ID..'ModVipList:'..chat_id,user)  then
cmdvip = '✓'
else
cmdvip = '✘'
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاکسازی : '..cmdclaen..'',callback_data = 'Ramin:cmdclaen:'..chat_id..':'..user..':'..admin_names},
},{
{text = '🚫 مسدود کردن : '..cmdban..'',callback_data = 'Ramin:cmdban:'..chat_id..':'..user..':'..admin_names},
{text = '📵 سکوت کردن : '..cmdmute..'',callback_data = 'Ramin:cmdmute:'..chat_id..':'..user..':'..admin_names},
},{
{text = '⚠️ اخطاردادن : '..cmdwarn..'',callback_data = 'Ramin:cmdwarn:'..chat_id..':'..user..':'..admin_names},
{text = '⭕️ مجاز کردن : '..cmdvip..'', callback_data = 'Ramin:cmdvip:'..chat_id..':'..user..':'..admin_names},
},{
{text = '🔘 قفل یا بازکردن : '..cmdlock..'', callback_data = 'Ramin:cmdlock:'..chat_id..':'..user..':'..admin_names},
},{
{text = '📌 سنجاق کردن : '..cmdpin..' ',callback_data = 'Ramin:cmdpin:'..chat_id..':'..user..':'..admin_names},
{text = '🎛 پنل مدیریتی : '..cmdpanel..'',callback_data = 'Ramin:cmdpanel:'..chat_id..':'..user..':'..admin_names},
},{
{text = '✳️ دسترسی کل : '..cmdall..' ',callback_data = 'Ramin:cmdall:'..chat_id..':'..user..':'..admin_names},
},{
{text = '◄ لیست کلی ادمین ها',callback_data = 'Ramin:getadmincml:'..chat_id}
},{
{text = 'خروج ☒',callback_data = 'Ramin:Exitsr:'..chat_id},},}
dofile('./Alpha/time.lua')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
txt='به کنترل پنل دستورات مدیران گروه خوش آمدید.\nنام ادمین : ['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'
Edit(msg,txt,keyboard,true)
end
end
end
-------------------GetOwner----------------

-----------------------------------


---------FUNCTION SETTS---------
function SETT(msg,chat_id,page)
dofile('./Alpha/settings.lua')
settings(msg,chat_id)
if page == 4 then
if base:get(TD_ID.."bot:duplipost:mute" .. chat_id) then
duplipost = '✓فعال'
else
duplipost = '✘غیرفعال' 
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ وضعیت اسپم ： '..settings_spam..'',callback_data = 'Ramin:lockspam:'..chat_id},
},{{text='◂ حساسیت اسپم ： '..Alphafa(CH_MAX)..' عدد',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:CHMAX2down:'..chat_id},
{text='«',callback_data='Ramin:CHMAXdown:'..chat_id},
{text='»',callback_data='Ramin:CHMAXup:'..chat_id},
{text='»»',callback_data='Ramin:CHMAX2up:'..chat_id},
},{{text = '◂ وضعیت فلود  ： '..settings_flood..'',callback_data = 'Ramin:lockflood:'..chat_id},
},{{text='◂ زمان فلود ： '..Alphafa(TIME_CHECK)..' ثانیه',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEMAX2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEMAXdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEMAXup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEMAX2up:'..chat_id},
},{{text='◂ حساسیت فلود ： '..Alphafa(MSG_MAX)..' پیام',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:MSGMAX2down:'..chat_id},
{text='«',callback_data='Ramin:MSGMAXdown:'..chat_id},
{text='»',callback_data='Ramin:MSGMAXup:'..chat_id},
{text='»»',callback_data='Ramin:MSGMAX2up:'..chat_id},
},{
{text = '◂ قفل پیام تکراری  ： '..duplipost..'',callback_data = 'Ramin:duplipost:'..chat_id},
},{
{text = ' ► بعدی  ',callback_data = 'Ramin:moreSettings2:'..chat_id}
},{{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش ضد اسپم 』'
Edit(msg,txt,keyboard,true)

elseif page == 55 then
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..chat_id) or 3600)
local timemutemsgban = tonumber(base:get(TD_ID..'bantime:'..chat_id) or 86400)
local Time = getTimeUptime(timemutemsg)
local Timeban = getTimeUptime(timemutemsgban)
if base:get(TD_ID.."warn_stats"..chat_id) == "kick" then
setwarn = "🚫مسدود"
elseif base:get(TD_ID.."warn_stats"..chat_id) == "silent" then
setwarn = "📵سکوت"
elseif base:get(TD_ID.."warn_stats"..chat_id) == "silenttime" then
setwarn = "⏰سکوت زمانی"
elseif not base:get(TD_ID.."warn_stats"..chat_id) then
setwarn = "🚫مسدود"
end

if base:get(TD_ID.."ban_stats"..chat_id) == "ban" then
setban = "🚫مسدود دائمی"
elseif base:get(TD_ID.."ban_stats"..chat_id) == "bantime" then
setban = "⏰مسدود زمانی"
elseif base:get(TD_ID.."ban_stats"..chat_id) == "ban" then
setban = "🚫مسدود دائمی"
elseif not base:get(TD_ID.."ban_stats"..chat_id) then
setban = "⏰مسدود زمانی"
end

if base:get(TD_ID.."mute_stats"..chat_id) == "mute" then
setmute = "📵سکوت دائمی"
elseif base:get(TD_ID.."mute_stats"..chat_id) == "mutetime" then
setmute = "⏰سکوت زمانی"
elseif base:get(TD_ID.."mute_stats"..chat_id) == "mute" then
setmute = "📵سکوت دائمی"
elseif not base:get(TD_ID.."mute_stats"..chat_id) then
setmute = "⏰سکوت زمانی"
end

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text='◂ حالت اخطار کاربران ： '..setwarn..'',callback_data='Ramin:Sethalatwarn:'..chat_id},
},{{text='◂ تعداد اخطار ： '..Alphafa(warn)..' عدد',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:warnMAX2down:'..chat_id},
{text='«',callback_data='Ramin:warnMAXdown:'..chat_id},
{text='»',callback_data='Ramin:warnMAXup:'..chat_id},
{text='»»',callback_data='Ramin:warnMAX2up:'..chat_id},
},{{text='◂ حالت دستور سکوت ： '..setmute..'',callback_data='Ramin:Sethalatmute:'..chat_id},
},{{text='⏱ زمان سکوت کاربران ： '..Time..'',callback_data='Ramin:ERROR:'..chat_id},
},{{text='«« ',callback_data='Ramin:TIMEMUTE2DOWN:'..chat_id},
{text='« ',callback_data='Ramin:TIMEMUTEDOWN:'..chat_id},
{text='»',callback_data='Ramin:TIMEMUTEUP:'..chat_id},
{text='»»',callback_data='Ramin:TIMEMUTE2UP:'..chat_id},
},{{text='◂ حالت دستور مسدود ： '..setban..'',callback_data='Ramin:Sethalatban:'..chat_id},
},{{text='⏱ زمان مسدود کاربران ： '..Timeban..'',callback_data='Ramin:ERROR:'..chat_id},
},{{text='«« ',callback_data='Ramin:TIMEBAN2DOWN:'..chat_id},
{text='« ',callback_data='Ramin:TIMEBANDOWN:'..chat_id},
{text='»',callback_data='Ramin:TIMEBANUP:'..chat_id},
{text='»»',callback_data='Ramin:TIMEBAN2UP:'..chat_id},
},{{text = '◂ دستورات ربات ： '..cmd..'', callback_data = 'Ramin:lockcmds:'..chat_id},
},{{text = '◂ دسترسی پنل ： '..pvpnl..'', callback_data = 'Ramin:privpanel:'..chat_id}
},{{text = '◂ قفل عضوگیری ： '..joins..'',callback_data = 'Ramin:lockjoin:'..chat_id},
},{{text = '◂ پیام واکنش ها ： '..lockpm..'', callback_data = 'Ramin:msgcheckpm:'..chat_id},
},{{text = ' قبلی ◄  ',callback_data = 'Ramin:moreSettings:'..chat_id},
},{{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش ضد اسپم 』'
Edit(msg,txt,keyboard,true)


elseif page == 34 then
if base:sismember(TD_ID..'Gp:'..chat_id,'Lock:Porn') then
porn = '✓فعال'
else
porn = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'Pornmutehallat') then
Pornmutehallat = ' ❌ اخراج'
else
Pornmutehallat = ' 📵 سکوت رسانه'
end
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '◂ قفل پورن ： '..porn..'', callback_data = 'Ramin:lockporn:'..chat_id},
},{{text = '◂ حالت قفل پورن ： '..Pornmutehallat..'', callback_data = 'Ramin:Pornmutehallat:'..chat_id},
},{{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش ضد پورن 』'
Edit(msg,txt,keyboard,true)



elseif page == 33 then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmute') then
forcejoinmute = '✓فعال'
else
forcejoinmute = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutejoin') then
forcejoinmutejoin = '⚡️به محض ورود'
else
forcejoinmutejoin = '📩ارسال پیام'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat') then
forcejoinmutehallat = '📵 سکوت'
else
forcejoinmutehallat = ' ⏰ سکوت زمانی'
end
ST = tonumber(base:get(TD_ID..'Li:TimeFoc:'..chat_id) )
if ST then
TimeFoc = ''..Alphafa(ST)..' دقیقه'
else
TimeFoc = 'تنظیم نشده'
end
ST = tonumber(base:get(TD_ID..'Li:TimeFocm:'..chat_id) )
if ST then
TimeFocm = ''..Alphafa(ST)..' دقیقه'
else
TimeFocm = 'تنظیم نشده'
end
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '◂ جوین اجباری احراز ： '..forcejoinmute..'',callback_data = 'Ramin:forcejoinmute:'..chat_id}
},{{text = '◂ وضعیت اجباری  ： '..forcejoinmutejoin..'',callback_data = 'Ramin:forcejoinmutetext:'..chat_id}
},{{text = '◂ حالت عضو نشدن  ： '..forcejoinmutehallat..'',callback_data = 'Ramin:forcejoinmutehallat:'..chat_id}
},{
{text='⏰ زمان مهلت کاربر : '..TimeFoc..' ',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEFoc2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEFocdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEFocup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEFoc2up:'..chat_id},
},{
{text='⏱ زمان سکوت کاربر : '..TimeFocm..' ',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEFoc2mdown:'..chat_id},
{text='«',callback_data='Ramin:TIMEFocmdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEFocmup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEFocm2up:'..chat_id},
},{
},{{text='◂ تعداد مجاز پیام ： '..Alphafa(JoinWarn)..' پیام',callback_data='Ramin:ERROR:'..chat_id}
},{
{text='««',callback_data='Ramin:ForcWarnMAX2down:'..chat_id},
{text='«',callback_data='Ramin:ForcWarnMAXdown:'..chat_id},
{text='»',callback_data='Ramin:ForcWarnMAXup:'..chat_id},
{text='»»',callback_data='Ramin:ForcWarnMAX2up:'..chat_id},
},{
{text='⏳ زمان پاکسازی پیام عضویت ： '..Alphafa(TIME_JoinMSG)..' ثانیه',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEForc2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEForcdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEForcup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEForc2up:'..chat_id},
},{
{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش جوین اجباری تایمر 』'
Edit(msg,txt,keyboard,true)

elseif page == 6 then
if base:sismember(TD_ID..'Gp:'..chat_id,'Join:Filter') then
forcejoinfilter = '✓فعال'
else
forcejoinfilter = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Join:Emoji') then
forcejoinemoji = '✓فعال'
else
forcejoinemoji = '✘غیرفعال'
end

if base:sismember(TD_ID..'Gp2:'..chat_id,'NewUser') then
hallaadd = 'همه کاربرها'
else
hallaadd = 'کاربر جدید'
end
ch = (base:get(TD_ID..'setch:'..chat_id) or Config.Channel)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ جوین اجباری کل پیام ： '..forcejoin..'', callback_data = chat_id..':locks2:forcejoin:6'}
},{{text = '◂ جوین اجباری ایموجی ： '..forcejoinemoji..'',callback_data = 'Ramin:forcejoinemoji:'..chat_id}
},{{text = '◂ جوین اجباری رسانه ： '..forcejoinduc..'',callback_data = 'Ramin:forcejoinduc:'..chat_id}
},{{text = '◂ جوین اجباری کلمه ： '..forcejoinfilter..'',callback_data = 'Ramin:forcejoinfilter:'..chat_id}
},{{text='◂ تعداد مجاز پیام ： '..Alphafa(JoinWarn)..' پیام',callback_data='Ramin:ERROR:'..chat_id}
},{
{text='««',callback_data='Ramin:JoinWarnMAX2down:'..chat_id},
{text='«',callback_data='Ramin:JoinWarnMAXdown:'..chat_id},
{text='»',callback_data='Ramin:JoinWarnMAXup:'..chat_id},
{text='»»',callback_data='Ramin:JoinWarnMAX2up:'..chat_id},
},{
{text='⏰ زمان پاکسازی پیام عضویت ： '..Alphafa(TIME_JoinMSG)..' ثانیه',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEJOIN2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEJOINdown:'..chat_id},
{text='»',callback_data='Ramin:TIMEJOINup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEJOIN2up:'..chat_id},
},{
{text = 'افرودن کلمه ✚',callback_data = 'Ramin:addfilterjoin:'..chat_id},
{text = 'حذف کلمه ▬',callback_data = 'Ramin:remfilterjoin:'..chat_id}
},{
{text = '◂ مشاهده لیست اجباری کلمه',callback_data = 'Ramin:filteraddlist:'..chat_id}
},{
{text = '◂ قفل اداجباری ： '..forceadd..'', callback_data = chat_id..':locks2:forceadd:6'}
},{
},{{text='◂ تعداد اداجباری ： '..Alphafa(Add_MAX)..' عضو',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:AddMAX2down:'..chat_id},
{text='«',callback_data='Ramin:AddMAXdown:'..chat_id},
{text='»',callback_data='Ramin:AddMAXup:'..chat_id},
{text='»»',callback_data='Ramin:AddMAX2up:'..chat_id},
},{
{text = '◂ حالت اداجباری ： '..hallaadd..' ',callback_data = 'Ramin:alluser+:'..chat_id}},{
},{
{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش عضویت اجباری 』'
Edit(msg,txt,keyboard,true)



elseif page == 7 then
if base:sismember(TD_ID..'Gp2:'..chat_id,'Welcomeon') then
w = '✓فعال'
else
w = '✘غیرفعال'
end
if not base:get(TD_ID.."Welcome:Document" .. chat_id) and not base:get(TD_ID.."Welcome:Photo" .. chat_id) and not base:get(TD_ID.."Welcome:Gif" .. chat_id) and not base:get(TD_ID.."Welcome:voice" .. chat_id) and not base:get(TD_ID.."Welcome:video" .. chat_id) then
typewelcome = '📃به صورت متنی'
elseif base:get(TD_ID.."Welcome:Document" .. chat_id) then
typewelcome = '🗂به صورت فایل'
elseif base:get(TD_ID.."Welcome:voice" .. chat_id) then
typewelcome = '🎤به صورت ویس'
elseif base:get(TD_ID.."Welcome:video" .. chat_id) then
typewelcome = '🎞به صورت ویدئو'
elseif base:get(TD_ID.."Welcome:Gif" .. chat_id) then
typewelcome = '📺به صورت گیف'
elseif base:get(TD_ID.."Welcome:Photo" .. chat_id) then
typewelcome = '🖼به صورت عکس'
elseif base:get(TD_ID.."Welcome:videonote" .. chat_id) then
typewelcome = '📸به صورت فیلم سلفی'
end

if base:sismember(TD_ID..'Gp2:'..chat_id,'cleanwelcome') then
cleanwelcome = '✓فعال'
else
cleanwelcome = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'Welcomeongif') then
we = '✓فعال'
else
we = '✘غیرفعال'
end
timecgms = base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20
wel = base:get(TD_ID..'Text:Welcome:'..chat_id) or '*متن پیشفرض : 👤کاربر به گروه خوش آمدی*\n برای تنظیم متن خوش آمدگویی دلخواه از دکمه تنظیم خوش آمدگویی استفاده کنید!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ خوش آمد گویی ： '..w..' ',callback_data = 'Ramin:Welcomeon:'..chat_id},
},{
{text = '◂ نوع خوش آمد گویی ： '..typewelcome..' ',callback_data = 'Ramin:ERROR:'..chat_id},
},{
{text = '◂ تنظیم خوش آمدگویی ⤴️ ',callback_data = 'Ramin:SetWelcomeText:'..chat_id}
},{
{text = '✖️ حذف متن خوشامدگوی',callback_data = 'Ramin:Delwelcome:'..chat_id}
},{
{text = '◂ پاکسازی خودکار پیام خوش آمدگویی ： '..cleanwelcome..' ',callback_data = 'Ramin:cleanwelcome:'..chat_id},
},{
{text='⏰ زمان پاکسازی : | '..tostring(timecgms)..' | ثانیه',callback_data='Ramin:ERROR:'..chat_id}},{
{text='««',callback_data ='Ramin:cleanwelcometimeMAX2down:'..chat_id},
{text='«',callback_data ='Ramin:cleanwelcometimeMAXdown:'..chat_id},
{text='»',callback_data='Ramin:cleanwelcometimeMAXup:'..chat_id},
{text='»»',callback_data='Ramin:cleanwelcometimeMAX2up:'..chat_id},
},{
{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id},},}
Edit(msg,wel,keyboard,true)


elseif page == 8 then

local membersgroup = ( membersCount(chat_id).result or "--")
local DescriptionGroup=getChat(chat_id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..chat_id) or not getChat(chat_id).result.invite_link then
GetInvate(chat_id)
local getChat = getChat(chat_id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..chat_id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..chat_id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
local status = getChatAdministrators(chat_id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
--[[local  url , res = https.request('https://api.codebazan.ir/telegram/?type=gp&link='..link)
if res ~= 200 then
end
local jdat = json:decode(url)
onlines_count = jdat.result.onlines_count--]]
local IDS = "\n◈ مالک گروه : ["..owner_name.."](tg://user?id="..owner_id..") \n◈ تعداد ممبر : "..membersgroup.." کاربر\n"
local ex = base:ttl(TD_ID.."ExpireData:"..chat_id)
if ex == 0 or ex == -2 then
Time_S = "[ بدون اعتبار ]"
elseif ex == -1 then
Time_S = '◈شارژ گروه مادالعمر می باشد !'
else
local Time_ = getTimeUptime(ex)
local txt = '◈ تاریخ اتمام شارژ :\n'..jdatee(' `#Y/#M/#D | #x`')..''
Time_S = "◈ اعتبار ربات در این گروہ : \n◈ [ " .. Time_ .. " ] \n"..txt..""
end

local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'مالکین ▸',callback_data = 'Ramin:ownerlist:'..chat_id},
{text = '◂ ادمین ربات',callback_data = 'Ramin:modlist:'..chat_id},
},{
{text = ' ادمین گروه ▸',callback_data = 'Ramin:getadminpnl:'..chat_id},
{text = '◂ کاربران مجاز ',callback_data = 'Ramin:viplist:'..chat_id},
},{
{text = ' مدیران افتخاری ▸',callback_data = 'Ramin:modlisttest:'..chat_id},
},{
{text = 'لیست اخطار ▸',callback_data = 'Ramin:warnlist:'..chat_id},
{text = '◂ لیست سکوت',callback_data = 'Ramin:silentlist:'..chat_id}
},{
{text = 'لیست مسدود ▸',callback_data = 'Ramin:banlist:'..chat_id},
{text = '◂ محدود قفلی',callback_data = 'Ramin:MahdodLock:'..chat_id},
},{
{text = 'لیست سکوت رسانه ▸',callback_data = 'Ramin:silentlistmedia:'..chat_id},
},{ 
{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش اطلاعات گروه 』\n'..jdate('\n◈ امروز #x\n◈  تاریخ: #Y/#M/#D\n◈ ساعت: #h:#m:#s')..'\n\n'..Time_S..'\n'..IDS
Edit(msg,txt,keyboard,true)



elseif page == 90 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ قفل لینک ：'..Linkdel..'',callback_data = chat_id..':del:Link:90'},
},{{text = '◂ قفل ویرایش ：'..Editdel..'',callback_data = chat_id..':del:Edit:90'},
},{{text = '◂ قفل پیام ：'..Textdel..'',callback_data = chat_id..':del:Text:90'},
},{{text = '◂ قفل هشتگ ：'..Tagdel..'',callback_data = chat_id..':del:Tag:90'},
},{{text = '◂ قفل یوزرنیم ：'..Userdel..'',callback_data = chat_id..':del:Username:90'},
},{{text = '◂ قفل بیوگرافی ： '..Biolinkdel..'',callback_data = chat_id..':del:Biolink:90'},
},{{text = '◂ قفل فوروارد ：'..Fwddel..'',callback_data = chat_id..':del:Forward:90'},
},{
--{text = ' قبلی ◄  ',callback_data = 'Ramin:moreSettings:'..chat_id},
{text = ' ► بعدی  ',callback_data = 'Ramin:locktxt2:'..chat_id}
},{
{text = ' ◂ بازگشت به تنظیمات',callback_data = 'Ramin:Ramin:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه اول 』'
Edit(msg,txt,keyboard,true)

elseif page == 91 then

local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ قفل لوکیشن ： '..Locdel..'',callback_data = chat_id..':del:Location:91'},
},{{text = '◂ قفل اینلاین ：'..Inlinedel..'',callback_data = chat_id..':del:Inline:91'},

--},{{text = '◂ قفل پورن ：'..Porndel..'',callback_data = chat_id..':del:Porn:91'},
},{{text = '◂ قفل ربات ：'..Botdel..'',callback_data = chat_id..':del:Bots:91'},
},{{text = '◂ قفل جوینر ： '..Botban..'',callback_data = chat_id..':ban:Bots:91'}
},{{text = '◂ قفل هایپر ： '..Hyperdel..'',callback_data = chat_id..':del:Hyper:91'},
},{{text = '◂ قفل منشن ： '..Mentiondel..'',callback_data = chat_id..':del:Mention:91'},
},{{text = '◂ قفل شماره ： '..Number..'',callback_data = chat_id..':del:Number:91'},
},{{text= '  قبلی ◄  ',callback_data = 'Ramin:locktxt1:'..chat_id},
{text = ' ► بعدی  ',callback_data = 'Ramin:lockmedia4:'..chat_id}
},{ {text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id},},}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه دوم 』'
Edit(msg,txt,keyboard,true)


elseif page == 98 then
if base:get(TD_ID.."sg:pin"..chat_id) == "lock" then
pin = '✓فعال'
else
pin = '✘غیرفعال' 
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ سرویس تلگرام ： '..tg..'',callback_data = 'Ramin:locktgservice:'..chat_id},
},{{text = '◂ قفل انگلیسی ： '..Endel..'',callback_data = chat_id..':del:English:98'},
},{{text = '◂ قفل فارسی ： '..Fadel..' ',callback_data = chat_id..':del:Persian:98'},
},{{text = '◂ قفل سنجاق ： '..pin..'', callback_data = 'Ramin:lockpin:'..chat_id},
},{{text = '◂ قفل مخاطب ： '..Condel..'',callback_data = chat_id..':del:Contact:98'},
},{{text = '◂ پست کانال ： '..Channelpostdel..'',callback_data = chat_id..':del:Channelpost:98'},
},{{text = '◂ قفل بازی ： '..Gamedel..'',callback_data = chat_id..':del:Game:98'},
},{{text= 'قبلی ◄  ',callback_data = 'Ramin:locktxt2:'..chat_id},
{text = ' ► بعدی  ',callback_data = 'Ramin:lockmedia1:'..chat_id}
},{
{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه سوم 』'
Edit(msg,txt,keyboard,true)


elseif page == 93 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ◂ قفل استیکر ： '..Stdel..'',callback_data = chat_id..':del:Sticker:93'},
},{{text = ' ◂ قفل ویس ： '..Voicedel..'',callback_data = chat_id..':del:Voice:93'},
},{{text = ' ◂ قفل موزیک ： '..Musicdel..'',callback_data = chat_id..':del:Audio:93'},
},{{text = ' ◂ قفل گیف ： '..Gifdel..'',callback_data = chat_id..':del:Gif:93'},
},{{text = ' ◂ قفل فیلم ： '..Videodel..'',callback_data = chat_id..':del:Video:93'},
},{{text = ' ◂ قفل استیکر متحرک ： '..Stsdel..'',callback_data = chat_id..':del:Stickers:93'},
},{{text = ' ◂ قفل سلفی ： '..V_notdel..'',callback_data = chat_id..':del:Videomsg:93'},
},{{text= '  قبلی ◄  ',callback_data = 'Ramin:locktxt2:'..chat_id},
{text = ' ► بعدی  ',callback_data = 'Ramin:lockmedia2:'..chat_id}
},{{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه چهارم 』'
Edit(msg,txt,keyboard,true)
elseif page == 94 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ◂ قفل عکس ： '..Photodel..'',callback_data = chat_id..':del:Photo:94'},
},{{text = ' ◂ قفل کپشن ： '..Capdel..'',callback_data = chat_id..':del:Caption:94'},
},{{text = ' ◂ قفل ویروس ： '..Malwaredel..'',callback_data = chat_id..':del:Malware:94'},
},{{text = ' ◂ قفل ایموجی متحرک ： '..tas..'',callback_data = chat_id..':del:Dice:94'},
},{{text = ' ◂ قفل نظرسنجی ： '..poll..'',callback_data = 'Ramin:locktas:'..chat_id}
},{{text = ' ◂ قفل فونت ： '..Fontdel..'',callback_data = chat_id..':del:Font:94'},
},{{text = ' ◂ قفل پاسخ ： '..reply..'',callback_data = chat_id..':del:Reply:94'},
},{{text= '  قبلی ◄ ',callback_data = 'Ramin:lockmedia4:'..chat_id},
},{{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه پنجم 』'
Edit(msg,txt,keyboard,true)

elseif page == 9 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ◂ حالت لینک ： '..settings_link..'',callback_data = 'Ramin:locklink:'..chat_id},
},{{text = ' ◂ حالت ویرایش ： '..settings_edit..'',callback_data = 'Ramin:lockedit:'..chat_id},
},{{text = ' ◂ حالت چت ： '..settings_txt..'',callback_data = 'Ramin:locktxt:'..chat_id},
},{{text = ' ◂ حالت تگ ： '..settings_tag..'',callback_data = 'Ramin:locktag:'..chat_id},
},{{text = ' ◂ حالت فوروارد ： '..settings_fwd..'',callback_data = 'Ramin:lockfwd:'..chat_id},
},{{text = '  ► بعدی  ',callback_data = 'Ramin:easy5:'..chat_id}
},{ {text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Ramin:'..chat_id},},}
Edit(msg,'◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه اول 』',keyboard,true)

elseif page == 16 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ◂ حالت یوزرنیم ： '..settings_user..'',callback_data = 'Ramin:lockuser:'..chat_id},
},{{text = ' ◂ حالت اینلاین ： '..settings_inline..'',callback_data = 'Ramin:lockinline:'..chat_id},
},{{text = ' ◂ حالت لوکیشن ： '..settings_loc..'',callback_data = 'Ramin:lockloc:'..chat_id},
},{{text = ' ◂ حالت بیوگرافی ： '..settings_biolink..'',callback_data = 'Ramin:lockbiolink:'..chat_id},
},{{text = ' ◂ حالت ربات ： '..settings_bot..'',callback_data = 'Ramin:lockbot:'..chat_id},
},{{text= '  قبلی ◄ ',callback_data = 'Ramin:easy:'..chat_id},
{text = ' ► بعدی ',callback_data = 'Ramin:easy1:'..chat_id}},{
{text = '◂ بازگشت',callback_data = 'Ramin:Ramin:'..chat_id},},}
Edit(msg,'◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه دوم 』',keyboard,true)

elseif page == 10 then
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = ' ◂ حالت کپشن ： '..settings_caption..'',callback_data = 'Ramin:lockcaption:'..chat_id},
},{{text = ' ◂ حالت فورواردکاربر ：'..settings_post..'',callback_data = 'Ramin:lockpost:'..chat_id},
},{{text = ' ◂ حالت هایپر ： '..settings_hyper..'',callback_data = 'Ramin:lockhyper:'..chat_id},
},{{text = ' ◂ حالت منشن ： '..settings_mention..' ',callback_data = 'Ramin:lockmention:'..chat_id},
},{{text = '◂ حالت مخاطب ： '..settings_contact..'',callback_data = 'Ramin:lockcontact:'..chat_id},
},{{text= ' قبلی ◄ ',callback_data = 'Ramin:easy5:'..chat_id},
{text = '► بعدی',callback_data = 'Ramin:easy2:'..chat_id}},{
{text = '◂ بازگشت',callback_data = 'Ramin:Ramin:'..chat_id},},}
Edit(msg,'◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه سوم 』',keyboard,true)

elseif page == 11 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ◂ حالت عکس ： '..settings_photo..' ',callback_data = 'Ramin:lockphoto:'..chat_id},
},{{text = ' ◂ حالت استیکر ： '..settings_sticker..'',callback_data = 'Ramin:locksticker:'..chat_id},
},{{text = ' ◂ حالت صدا ： '..settings_voice..'',callback_data = 'Ramin:lockvoice:'..chat_id},
},{{text = ' ◂ حالت آهنگ ： '..settings_music..'',callback_data = 'Ramin:lockmusic:'..chat_id},
},{{text = ' ◂ حالت سلفی ： '..settings_self..'',callback_data = 'Ramin:lockself:'..chat_id},
},{{text= ' قبلی ◄',callback_data = 'Ramin:easy1:'..chat_id},
{text = '► بعدی ',callback_data = 'Ramin:easy3:'..chat_id}},{
{text = '◂ بازگشت',callback_data = 'Ramin:Ramin:'..chat_id},},}
Edit(msg,'◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه چهارم 』',keyboard,true)
elseif page == 12 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '  ◂ حالت گیف ： '..settings_gif..'',callback_data = 'Ramin:lockgif:'..chat_id},
},{{text = '  ◂ حالت ویدئو ： '..settings_film..'',callback_data = 'Ramin:lockfilm:'..chat_id},
},{{text = ' ◂ حالت فایل ：'..settings_file..'',callback_data = 'Ramin:lockfile:'..chat_id},
},{{text = ' ◂ حالت ویروس ：'..settings_malware..'',callback_data = 'Ramin:lockmalware:'..chat_id},
},{{text = ' ◂ حالت بازی ：'..settings_game..'',callback_data = 'Ramin:lockgame:'..chat_id},
},{{text = ' ◂ حالت استیکر متحرک ：'..settings_stickers..'',callback_data = 'Ramin:lockstickers:'..chat_id},
},{{text= 'قبلی ◄',callback_data = 'Ramin:easy2:'..chat_id}
},{{text = '◂ بازگشت',callback_data = 'Ramin:Ramin:'..chat_id},},}
Edit(msg,'◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه پنچم 』',keyboard,true)
end
end



function AntiTabchiPnl(msg,chat_id)
if chat_id then
if base:sismember(TD_ID..'Gp2:'..chat_id,'BioAntiTabchi') then
Bio = '✓فعال'
else
Bio = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'NameAntiTabchi') then
Name = '✓فعال'
else
Name = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'AntiTabchi') then
mmd = '✓فعال'
else
mmd = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
reza = '📵 سکوت'
else
reza = '🚫 مسدود'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'FirstTabchiMute') then
mute = '✓فعال'
else
mute = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'ScanAntiTabchi') then
tab = '✓فعال'
else
tab = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'ScanAntiBTabchi') then
tab1 = '✓فعال'
else
tab1 = '✘غیرفعال'
end

if base:sismember(TD_ID..'Gp2:'..chat_id,'tabchires') then
tabchires = '✓فعال'
else
tabchires = '✘غیرفعال'
end
if base:get(TD_ID.."sg:locktabalpha"..chat_id) == "lock" then
dozdanti = '✓فعال'
else
dozdanti = '✘غیرفعال'
end
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..chat_id))
if ST then
tabchimediatime = ''..Alphafa(ST)..' دقیقه'
else
tabchimediatime = 'تنظیم نشده'
end
local timecgmbaghi = base:ttl(TD_ID..'scantabauto:'..chat_id)
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "زمان تا انجام:[ " .. Time_ .. " ]"

local keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' ◂ گزارش تبچی : '..dozdanti,callback_data = 'Ramin:locktabalpha:'..chat_id},
},{{text = '◂ بررسی نام : '..Name,callback_data = 'Ramin:nameanti:'..chat_id},
},{{text = '✚ اضافه نام',callback_data = 'Ramin:addfiltername:'..chat_id},
{text = '▬ حذف نام',callback_data = 'Ramin:remfiltername:'..chat_id}
},{{text = '◂ بررسی بیوگرافی : '..Bio,callback_data = 'Ramin:bioanti:'..chat_id}
},{{text = '✚ اضافه بیو',callback_data = 'Ramin:addfilterbio:'..chat_id},
{text = '▬ حذف بیو',callback_data = 'Ramin:remfilterbio:'..chat_id}
},{{text = '◂ بررسی به محض ورود : '..tabchires,callback_data = 'Ramin:tabchires:'..chat_id},
},{{text = '◂ بررسی به محض پیام : '..tab,callback_data = 'Ramin:ScanAntiTabchi:'..chat_id},
},{{text = '◂ حالت تبچی : '..reza,callback_data = 'Ramin:modeehrazm:'..chat_id},
},{{text = '► بعدی ',callback_data = 'Ramin:AntiTabchipn2:'..chat_id},
},{{text = ' بازگشت ⊴',callback_data = 'Ramin:Hallat:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش ضد تبچی 』'
Edit(msg,txt,keyboard,true)
end
end



function AntiTabchi2(msg,chat_id)
if chat_id then
if base:sismember(TD_ID..'Gp2:'..chat_id,'tabchiresmedia') then
tabchiresmedia = '✓فعال'
else
tabchiresmedia = '✘غیرفعال'
end
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..chat_id))
if ST then
tabchimediatime = ''..Alphafa(ST)..' دقیقه'
else
tabchimediatime = 'تنظیم نشده'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'AntiTabchi') then
mmd = '✓فعال'
else
mmd = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'scantabautoon') then
scantab1 = '✓فعال'
else
scantab1 = '✘غیرفعال'
end
ST = tonumber(base:get(TD_ID..'CL:TimeScan:'..chat_id))
if ST then
alarmscan = ''..Alphafa(ST)..' ساعت'
else
alarmscan = 'تنظیم نشده'
end
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '◂ محدودیت تبچی رسانه : '..tabchiresmedia,callback_data = 'Ramin:tabchiresmedia:'..chat_id},
},{{text='◂ زمان محدودیت تبچی رسانه : '..tabchimediatime..'',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEtabchire2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEtabchiredown:'..chat_id},
{text='»',callback_data='Ramin:TIMEtabchireup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEtabchire2up:'..chat_id},
},{{text = '◂ قفل احزارهویت :'..mmd,callback_data = 'Ramin:ehrazhovit:'..chat_id}
},{{text = ' ◂ اسکن وضعیت تبچی : '..scantab1..'',callback_data = 'Ramin:Scantabautoon:'..chat_id},
},{{text='⏰ زمان اسکن تبچی : '..alarmscan..'',callback_data='Ramin:TimeErorCl:'..chat_id},
},{
{text='««',callback_data='Ramin:TIMEscan2down:'..chat_id},
{text='«',callback_data='Ramin:TIMEscandown:'..chat_id},
{text='»',callback_data='Ramin:TIMEscanup:'..chat_id},
{text='»»',callback_data='Ramin:TIMEscan2up:'..chat_id},
},{{text = 'قبلی ◄ ',callback_data = 'Ramin:AntiTabchipnl:'..chat_id},
{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش ضد تبچی 』'
Edit(msg,txt,keyboard,true)
end
end

function ChatPermissions(msg, chat_id)
can_add_web_page_previews = getChat(chat_id).result and getChat(chat_id).result.permissions.can_add_web_page_previews and "✅روشن" or "❌خاموش"
can_change_info = getChat(chat_id).result and getChat(chat_id).result and getChat(chat_id).result.permissions.can_change_info and "✅روشن" or "❌خاموش"
can_invite_users = getChat(chat_id).result and getChat(chat_id).result.permissions.can_invite_users and "✅روشن" or "❌خاموش"
can_pin_messages = getChat(chat_id).result and getChat(chat_id).result.permissions.can_pin_messages and "✅روشن" or "❌خاموش"
can_send_media_messages = getChat(chat_id).result and getChat(chat_id).result.permissions.can_send_media_messages and "✅روشن" or "❌خاموش"
can_send_messages = getChat(chat_id).result and getChat(chat_id).result.permissions.can_send_messages and "✅روشن" or "❌خاموش"
can_send_other_messages = getChat(chat_id).result and getChat(chat_id).result.permissions.can_send_other_messages and "✅روشن" or "❌خاموش"
can_send_polls = getChat(chat_id).result and getChat(chat_id).result.permissions.can_send_polls and "✅روشن" or "❌خاموش"
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = "ارسال پیام : " .. can_send_messages .. "",callback_data = "Ramin:AccessSendMessage:" ..chat_id}
},{
{text = "ارسال رسانه : " .. can_send_media_messages .. "",callback_data = "Ramin:AccessMedia:" ..chat_id}
},{
{text = "ارسال استیکر و گیف : " .. can_send_other_messages .. "",callback_data = "Ramin:AccessOther:" ..chat_id}
},{
{text = " قرار دادن لینک : " .. can_add_web_page_previews .. "",callback_data = "Ramin:AccessWeb:" ..chat_id}
},{
{text = "ارسال نظرسنجی : " .. can_send_polls .. "",callback_data = "Ramin:AccessPolls:" ..chat_id}
},{
{text = "دعوت کاربر : " .. can_invite_users .. "",callback_data = "Ramin:AccessInviteUsers:" ..chat_id}
},{
{text = "سنجاق پیام : " .. can_pin_messages .. "",callback_data = "Ramin:AccessPinMessage:" ..chat_id}
},{
{text = "تغییر اطلاعات گروه : " .. can_change_info .. "",callback_data = "Ramin:AccessChangeInfo:" ..chat_id}
},{
{text = 'بازگشت به تنظیمات ◀',callback_data = 'Ramin:Hallat:'..chat_id}
}}
Edit(msg,'◆ جهت تنظیم این بخش دکمه ها را لمس کنید : \n『 بخش مجوزهای چت 』',keyboard,true)
end
 


---------------------------------------------


function remoteCmd(msg,chat_id,user_id,typem,name,mid)
if user_id and chat_id and name then
if base:sismember(TD_ID..'ModCleanList:'..chat_id,user_id) then
cmdclaen = '✓'
else
cmdclaen = '✘'
end
if base:sismember(TD_ID..'ModPinList:'..chat_id,user_id) then
cmdpin = '✓'
else
cmdpin = '✘'
end
if base:sismember(TD_ID..'ModBanList:'..chat_id,user_id) then
cmdban = '✓'
else
cmdban = '✘'
end
if base:sismember(TD_ID..'ModMuteList:'..chat_id,user_id) then
cmdmute = '✓'
else
cmdmute = '✘'
end
if base:sismember(TD_ID..'ModWarnList:'..chat_id,user_id) then
cmdwarn = '✓'
else
cmdwarn = '✘'
end
if base:sismember(TD_ID..'ModLockList:'..chat_id,user_id)  then
cmdlock = '✓'
else
cmdlock = '✘'
end
if base:sismember(TD_ID..'ModAllList:'..chat_id,user_id)  then
cmdall = '✓'
else
cmdall = '✘'
end
if base:sismember(TD_ID..'ModpanelList:'..chat_id,user_id)  then
cmdpanel = '✓'
else
cmdpanel = '✘'
end
if base:sismember(TD_ID..'ModVipList:'..chat_id,user_id)  then
cmdvip = '✓'
else
cmdvip = '✘'
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاکسازی : '..cmdclaen..'',callback_data = 'Ramin:cmdclaen:'..chat_id..':'..user_id..':'..name},
},{
{text = '🚫 مسدود کردن : '..cmdban..'',callback_data = 'Ramin:cmdban:'..chat_id..':'..user_id..':'..name},
{text = '📵 سکوت کردن : '..cmdmute..'',callback_data = 'Ramin:cmdmute:'..chat_id..':'..user_id..':'..name},
},{
{text = '⚠️ اخطاردادن : '..cmdwarn..'',callback_data = 'Ramin:cmdwarn:'..chat_id..':'..user_id..':'..name},
{text = '⭕️ مجاز کردن : '..cmdvip..'', callback_data = 'Ramin:cmdvip:'..chat_id..':'..user_id..':'..name},
},{
{text = '🔘 قفل یا بازکردن : '..cmdlock..'', callback_data = 'Ramin:cmdlock:'..chat_id..':'..user_id..':'..name},
},{
{text = '📌 سنجاق کردن : '..cmdpin..' ',callback_data = 'Ramin:cmdpin:'..chat_id..':'..user_id..':'..name},
{text = '🎛 پنل مدیریتی : '..cmdpanel..'',callback_data = 'Ramin:cmdpanel:'..chat_id..':'..user_id..':'..name},
},{
{text = '✳️ دسترسی کل : '..cmdall..' ',callback_data = 'Ramin:cmdall:'..chat_id..':'..user_id..':'..name},
},{
{text = '◄ لیست کلی ادمین ها',callback_data = 'Ramin:getadmincml:'..chat_id}
},{
{text = 'خروج ☒',callback_data = 'Ramin:Exitsr:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
if typem == 'send' then
txt= '✪ جهت تنظیمات کاربر ['..name..'](tg://user?id='..user_id..') گزینه مورد نظر را لمس کنید.\n'
sendText(chat_id,txt,mid,'md',keyboard)
else
dofile('./Alpha/time.lua')
EdiT(msg,'✪ جهت تنظیمات کاربر ['..name..'](tg://user?id='..user_id..') گزینه مورد نظر را لمس کنید.\n',keyboard,true)
end
end
end




function remote(msg,chat_id,user_id,typem,name,mid)
if user_id and chat_id and name then
if base:sismember(TD_ID..'SUDO',user_id) then
sudo = '✓'
else
sudo = '✘'
end
if base:sismember(TD_ID..'OwnerList:'..chat_id,user_id) then
owner = '✓'
else
owner = '✘'
end
if base:sismember(TD_ID..'NazemList:'..chat_id,user_id) then
nazem = '✓'
else
nazem = '✘'
end
if base:sismember(TD_ID..'ModList:'..chat_id,user_id) then
mod = '✓'
else
mod = '✘'
end
if base:sismember(TD_ID..'ModList:'..chat_id,user_id) then
modanony = '✓'
else
modanony = '✘'
end
if base:sismember(TD_ID..'ModListtest:'..chat_id,user_id) then
modtest ='✓'
else
modtest = '✘'
end
if base:sismember(TD_ID..'Vip:'..chat_id,user_id) then
vip = '✓'
else
vip = '✘'
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'limitpm'..user_id) and not is_Vip(chat_id,user_id) then
limit = '✓'
else
limit = '✘'
end
if base:sismember(TD_ID..'MuteListtest:'..chat_id,user_id) and not is_Vip(chat_id,user_id) then
mute = '✓'
else
mute = '✘'
end

local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سودو : '..sudo..'',callback_data = 'Ramin:addsudo:'..chat_id..':'..user_id..':'..name},
{text = ' ◈ مالک : '..owner..'',callback_data = 'Ramin:addowner:'..chat_id..':'..user_id..':'..name},
},{
{text = '◈ ادمین ناشناس : '..modanony..'',callback_data = 'Ramin:addmodanony:'..chat_id..':'..user_id..':'..name}
},{
{text ='◈ معاون : '..nazem..'',callback_data = 'Ramin:addnazem:'..chat_id..':'..user_id..':'..name},
{text ='◈ مدیر : '..mod..'',callback_data = 'Ramin:addmod:'..chat_id..':'..user_id..':'..name},
},{
{text = '◈ مجاز : '..vip..'',callback_data = 'Ramin:setvip:'..chat_id..':'..user_id..':'..name},
{text ='◈ محدود : '..limit..'', callback_data = 'Ramin:limitpmre:'..chat_id..':'..user_id..':'..name},
},{
{text = '◈ سکوت : '..mute..'',callback_data = 'Ramin:Mute:'..chat_id..':'..user_id..':'..name},
{text = '◈ مدیرافتخاری : '..modtest..'',callback_data = 'Ramin:addmodtest:'..chat_id..':'..user_id..':'..name}
},{
{text = 'بستن ➲',callback_data = 'Ramin:Exitsr:'..chat_id},},}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
if typem == 'send' then
txt= '✪ جهت تنظیمات کاربر ['..name..'](tg://user?id='..user_id..') گزینه مورد نظر را لمس کنید.\n'
sendText(chat_id,txt,mid,'md',keyboard)
else
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
EdiT(msg,'✪ جهت تنظیمات کاربر ['..name..'](tg://user?id='..user_id..') گزینه مورد نظر را لمس کنید.\n' ,keyboard,true)
end
end
end
function filters(msg,chat_id)
if base:sismember(TD_ID..'Gp2:'..chat_id,'FilterSen') then
reza = 'قوی'
else
reza = 'ضعیف'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:Filter') then
fal = '✓فعال'
else
fal = '✘غیرفعال'
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:FilterSticker') then
fals = '✓فعال'
else
fals = '✘غیرفعال'
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ فیلترپک استیکر : '..fals..'',callback_data = 'Ramin:filterstickerban:'..chat_id}
},{{text = '◂ فیلتر پک کلمات : '..fal..'',callback_data = 'Ramin:filterban:'..chat_id}
},{{text = '◂ مشاهده لیست فیلترها ',callback_data = 'Ramin:filterlist:'..chat_id}
},{{text = '◂ حساسیت فیلتر : '..reza..'',callback_data = 'Ramin:filter+:'..chat_id},
},{{text = 'اضافه کلمه ✚',callback_data = 'Ramin:addfilter:'..chat_id},
{text = 'حذف کلمه ▬',callback_data = 'Ramin:remfilter:'..chat_id}
},{{text = 'بازگشت ◂ ',callback_data = 'Ramin:Hallat:'..chat_id}}}
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 بخش فیلترینگ 』'
Edit(msg,txt,keyboard,true)
end

----
function pnlsudo(msg,chat_id,Msg,type)
dofile('./Alpha/settings.lua')
settings(msg,chat_id)
local tabchi =  base:get(TD_ID..'TabchiSudo:') or 0
if not base:get(TD_ID..'ExpireDatafree:') then
num = "31"
else
num = base:get(TD_ID..'ExpireDatafree:')
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = add..' نصب و لغونصب ',callback_data = 'Ramin:nasb:'..chat_id},
{text = chargegp..' شارژ کردن ',callback_data= 'Ramin:chngexpire:'..chat_id}
},{
{text = send..' ارسال پیام ',callback_data = 'Ramin:sendgp:'..chat_id},
{text = fwd..' فوروارد پیام ',callback_data= 'Ramin:fwdgp:'..chat_id}
},{
{text = gbans..' مسدودکلی ',callback_data = 'Ramin:cleangbans:'..chat_id},
{text = joinch..' جوین اجباری کانال ',callback_data = 'Ramin:joinch:'..chat_id}
},{
{text = kickall..' اخراج ممبر ',callback_data = 'Ramin:kickall:'..chat_id},
{text = freeinstall..' نصب رایگان ',callback_data = 'Ramin:freeinstall:'..chat_id},
},{{text='• اعتبار نصب رایگان ： '..Alphafa(num)..' روز',callback_data='Ramin:ERROR:'..chat_id},
},{
{text='««',callback_data='Ramin:freeinstall2down:'..chat_id},
{text='«',callback_data='Ramin:freeinstalldown:'..chat_id},
{text='»',callback_data='Ramin:freeinstallup:'..chat_id},
{text='»»',callback_data='Ramin:freeinstall2up:'..chat_id},
},{
{text = '⚡️کانال تیم',callback_data = 'Ramin:editchannel:'..chat_id},
{text = '⚡️متن استارت',callback_data = 'Ramin:editstart:'..chat_id}
},{
{text = '⚡️ویرایش ارتقا',callback_data = 'Ramin:editlo:'..chat_id},
{text = '⚡️ویرایش حذف',callback_data = 'Ramin:editlorem:'..chat_id},
},{
{text = '⚡️متن منشی',callback_data = 'Ramin:editmonshi:'..chat_id},
{text = '⚡️متن نصب ربات',callback_data = 'Ramin:editinstall:'..chat_id}
},{
{text = '⚡️تنظیم درگاه',callback_data = 'Ramin:editdargah:'..chat_id},
{text = '⚡️متن استارت',callback_data = 'Ramin:editsatrt:'..chat_id}
},{
{text = '🚪 لیست سودو',callback_data = 'Ramin:getsudopnl:'..chat_id},
},{
{text = 'خروج',callback_data = 'Ramin:Exit:'..chat_id}
}}
if type == 'send' then
sendText(chat_id,'⚡️ بـہ بخش دسترسی سودو های ربات خوش امدید.\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\nبا استفادہ از این بخش میتوانید سطح دسترسی سودو و عملیات ویرایش ربات را تنظیم  کنید.',Msg,'md',keyboard)
else
EdiT(msg,'⚡️ بـہ بخش دسترسی سودو های ربات خوش امدید.\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\nبا استفادہ از این بخش میتوانید سطح دسترسی سودو و عملیات ویرایش ربات را تنظیم  کنید.',keyboard,true)
end
end

local function GetBan(emsg,msg,Alpha)
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd= ''
else
txtmmd = '\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.first_name
else
owner_id = BotJoiner
owner_name = 'دیلیت اکانت شده'
end
end
end
local keyboard = {}
keyboard.inline_keyboard = {}
list =  base:smembers(TD_ID..'BanUser:'..msg.chat.id)
for k,v in pairs(list) do
if k == 0 then
txt = 'Error not Found !'
else
txt = '✭ لیست مسدود شده های گروه \n\n🚨 مالک عزیز شما می توانی برای رفع مسدود کردن کاربر روی ایدی کاربر دلخواه کلیک کنید.'
if txt then
UsEr = getChat(v)
if UsEr.ok == true then
if UsEr.result.username then
nme = UsEr.result.username
else
nme = UsEr.result.first_name
end
temp = {{{text='👤'..nme..'',url='https://t.me/'..nme..''},{text = '🆔:'..v,callback_data = 'Ramin:getban'..v..':'..msg.chat.id}}}

--temp = {{{text = ''..k..') '..nme..'➕'..v,callback_data = 'Ramin:getsudo'..v..':'..msg.chat.id}}}
end
end
if(k<10)then
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else
temp = {{{text= '➧ بعدی',callback_data = 'BanPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
break;
end
end
end
temp = {{{text= 'خروج ☒',callback_data = 'Ramin:Exit:'..msg.chat.id},{text = 'ورود بـہ منو',callback_data = 'Ramin:menu:'..msg.chat.id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
if Alpha == 'send' then
sendText(msg.chat.id,txt..txtmmd,msg.message_id,'md',keyboard)
else
Edit(emsg,txt,keyboard,true)
end
end

local function GetBanStats(msg,msgq,user)
base:smembers(TD_ID..'BanUser:'..chat_id)

for k,v in pairs(list) do
if v and tonumber(v) == tonumber(user) then
if base:sismember(TD_ID..'BanUser:'..chat_id,user) then
bancl = 'مسدود✗'
else
bancl = 'رفع مسدود✔️'
end

UsEr = getChat(v)
if UsEr.ok == true then
if UsEr.result.username then
nme = UsEr.result.username
else
nme = UsEr.result.first_name
end
local keyboard = {}
keyboard.inline_keyboard = {
{{text = bancl,callback_data = 'Ramin:banrem>'..user..':'..chat_id}
},{
{text = '◥ بازگشت',callback_data = 'Ramin:getsudopnl:'..chat_id}}}
txt = 'برای تغییر هر یک از دسترسی های ['..nme..'](tg://user?id='..v..') بر روی گزینـہ مورد نظر خود کلیک کنید !'
Edit(msg,txt,keyboard,true)
end
end
end
end
-----------
local function GetSudo(emsg,msg,Alpha)
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd= ''
else
txtmmd = '\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\nفقط (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')) اجازہ کار با پنل را دارد !'
end
local keyboard = {}
keyboard.inline_keyboard = {}
list =  base:smembers(TD_ID..'SUDO')
for k,v in pairs(list) do
if k == 0 then
txt = 'Error not Found !'
else
txt = '✭لیست سودو های ربات :\nجهت تغییر دسترسی سودو ها بر روی سودوی مورد نظر کلیک کنید !\nفول سودو : ['..UserSudo..'](tg://user?id='..Sudoid..')'
if txt then
UsEr = getChat(v)
if UsEr.ok == true then
if UsEr.result.username then
nme = UsEr.result.username
else
nme = UsEr.result.first_name
end
temp = {{{text = ''..k..') '..nme..'➕'..v,callback_data = 'Ramin:getsudo'..v..':'..msg.chat.id}}}
end
end
if(k<15)then
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else
temp = {{{text= '➧ بعدی',callback_data = 'SudoPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
break;
end
end
end
temp = {{{text= 'خروج ☒',callback_data = 'Ramin:Exit:'..msg.chat.id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
if Alpha == 'send' then
sendText(msg.chat.id,txt..txtmmd,msg.message_id,'md',keyboard)
else
Edit(emsg,txt,keyboard,true)
end
end
local function GetSudoStats(msg,msgq,user)
list = base:smembers(TD_ID..'SUDO')
for k,v in pairs(list) do
if v and tonumber(v) == tonumber(user) then
if ((base:sismember(TD_ID..'PnlSudo:','add') and base:sismember(TD_ID..'PnlSudo:','rem') and base:sismember(TD_ID..'PnlSudo:','لغو نصب') and base:sismember(TD_ID..'PnlSudo:','نصب')) or (base:sismember(TD_ID..'PnlSudo_2:',user..':rem') and base:sismember(TD_ID..'PnlSudo_2:',user..':add') and base:sismember(TD_ID..'PnlSudo_2:',user..':نصب') and base:sismember(TD_ID..'PnlSudo_2:',user..':لغو نصب'))) and not is_FullSudo2(user) then
add = '✗'
else
add = '✔️'
end
if ((base:sismember(TD_ID..'PnlSudo:','send groups') and base:sismember(TD_ID..'PnlSudo:','ارسال به گروها')) or (base:sismember(TD_ID..'PnlSudo_2:',user..':send groups') and base:sismember(TD_ID..'PnlSudo_2:',user..':ارسال به گروها'))) and not is_FullSudo2(user) then
sendgp = '✗'
else
sendgp = '✔️'
end
if ((base:sismember(TD_ID..'PnlSudo_2:',user..':fwd groups') and base:sismember(TD_ID..'PnlSudo_2:',user..':فوروارد به گروها')) or (base:sismember(TD_ID..'PnlSudo:','fwd groups') and base:sismember(TD_ID..'PnlSudo:','فوروارد به گروها'))) and not is_FullSudo2(user) then
fwdgp = '✗'
else
fwdgp = '✔️'
end
if ((base:sismember(TD_ID..'PnlSudo_2:',user..':chagre') and base:sismember(TD_ID..'PnlSudo_2:',user..':شارژ')) or (base:sismember(TD_ID..'PnlSudo:','chagre') and base:sismember(TD_ID..'PnlSudo:','شارژ'))) and not is_FullSudo2(user) then
chargegp = '✗'
else
chargegp = '✔️'
end
if ((base:sismember(TD_ID..'PnlSudo_2:',user..':clean gbans') and base:sismember(TD_ID..'PnlSudo_2:',user..':پاکسازی لیست گلوبال') and base:sismember(TD_ID..'PnlSudo_2:',user..':banall') and base:sismember(TD_ID..'PnlSudo_2:',user..':unbanall') and base:sismember(TD_ID..'PnlSudo_2:',user..':بن گلوبال') and base:sismember(TD_ID..'PnlSudo_2:',user..':ان بن گلوبال')) or (base:sismember(TD_ID..'PnlSudo:','clean gbans') and base:sismember(TD_ID..'PnlSudo:','پاکسازی لیست گلوبال') and base:sismember(TD_ID..'PnlSudo:','banall') and base:sismember(TD_ID..'PnlSudo:','unbanall') and base:sismember(TD_ID..'PnlSudo:','بن گلوبال') and base:sismember(TD_ID..'PnlSudo:','ان بن گلوبال'))) and not is_FullSudo2(user) then
gbans = '✗'
else
gbans = '✔️'
end
if ((base:sismember(TD_ID..'PnlSudo_2:',user..':joinchannel off') and base:sismember(TD_ID..'PnlSudo_2:',user..':جوین چنل خاموش') and base:sismember(TD_ID..'PnlSudo_2:',user..':joinchannel on') and base:sismember(TD_ID..'PnlSudo_2:',user..':جوین چنل روشن')) or (base:sismember(TD_ID..'PnlSudo:','joinchannel off') and base:sismember(TD_ID..'PnlSudo:','جوین چنل خاموش') and base:sismember(TD_ID..'PnlSudo:','joinchannel on') and base:sismember(TD_ID..'PnlSudo:','جوین چنل روشن'))) and not is_FullSudo2(user) then
joinch = '✗'
else
joinch = '✔️'
end
if ((base:sismember(TD_ID..'PnlSudo_2:',user..':kickall') and base:sismember(TD_ID..'PnlSudo_2:',user..':اخراج همه')) or (base:sismember(TD_ID..'PnlSudo:','kickall') and base:sismember(TD_ID..'PnlSudo:','اخراج همه'))) and not is_FullSudo2(user) then
kickall = '✗'
else
kickall = '✔️'
end
UsEr = getChat(v)
if UsEr.ok == true then
if UsEr.result.username then
nme = UsEr.result.username
else
nme = UsEr.result.first_name
end
local keyboard = {}
keyboard.inline_keyboard = {


{{text = add..' نصب و لغونصب  ',callback_data = 'Ramin:addremm>'..user..':'..chat_id},
{text = chargegp..' شارژ کردن ',callback_data = 'Ramin:chngexpiree>'..user..':'..chat_id}},

{{text = sendgp..' ارسال پیام ',callback_data = 'Ramin:sendgpp>'..user..':'..chat_id},
{text = fwdgp..' فوروارد پیام ',callback_data = 'Ramin:fwdgpp>'..user..':'..chat_id},

{text = gbans..' مسدودکلی ',callback_data = 'Ramin:cleangbanss>'..user..':'..chat_id}},
{{text = joinch..' جوین اجباری کانال ',callback_data = 'Ramin:joinchh>'..user..':'..chat_id}
},{
{text = kickall..' اخراج ممبر ',callback_data = 'Ramin:kickalll>'..user..':'..chat_id}},
{{text = '◥ بازگشت',callback_data = 'Ramin:getsudopnl:'..chat_id}}}
txt='برای تغییر هر یک از دسترسی های ['..nme..'](tg://user?id='..v..') بر روی گزینـہ مورد نظر خود کلیک کنید !'
Edit(msg,txt,keyboard,true)
end
end
end
end
--SETTINGCLI




function Nerkh(msg,type,Msg,page)
if page == 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = 'خرید ربات  💸',url='https://telegram.me/'..Sudo1},
},{
{text = 'راهنمای تست 📤',callback_data = 'Ramin:farg:'..msg.from.id},
--{text = ' نرخ ربات 🤖',callback_data = 'Ramin:nerkhbot:'..msg.from.id},
{text = ' واحد پشتیبانی ⚙️',callback_data = 'Ramin:aboutbot:'..msg.from.id},
},{
{text = ' کانال ربات 📣',url='https://telegram.me/'..Channel..''},
}} 
if type == 'send' then
ramin =[[ 

💠 رباتی هستم برای رسیدن به خواسته هایتان .

🛡ربات ضد لینک هوشمند ما به صورت ترکیبی  محافظ  و امنیت گروه شما در برابر تبلیغات  و اسپمر می باشد

✌️تفاوت من نسبت به بقیه ربات های ضد لینک :

☄️پرسرعت،دستورات و پنل مدیریتی آسان .
🔞  سیستم آنتی پورن AGP +18.
👾  سیستم AGT آنتی تبچی.
🔏  سیستم AGL چند حالته قفل ها.
📊آمارگیری ادمین ها و کاربران گروه.
🗑پاکسازی خودکار چند حالته.
⚡️ پرسرعت در گروه 200 هزار نفره.
💯بدون آفلاینی 99.9 درصد.

✅ محبوب ترین ربات ضد اسپمر در دل شما شک نکنید!
✅ حس تازگی را با ما مزه کنید و به این ارزش اعتماد کنید.
✅ کیفیت دستور کار ماست.


]]

txt = 'به ربات  '..NameBot..' خوش آمدید.\n'..ramin..'\n\n🆔 @'..check_html(Channel)..''
sendText(msg.from.id,txt,Msg,'html',keyboard)
base:sadd(TD_ID.."ChatPrivite",msg.from.id)
else
Edit(msg,txt,keyboard,true)
end

elseif page == 9 then
PG = 0
local keyboard = {}
keyboard.inline_keyboard = {}
name = ec_name(msg.from.first_name)
list = base:smembers(TD_ID..'gpuser:'..msg.from.id)
tlist = #base:smembers(TD_ID..'gpuser:'..msg.from.id)
if #list == 0 then
txt = 'کاربر عزیز متاسفانه شما از ربات ['..botusername..'](tg://user?id='..TD_ID..') هیچ ثبتی نداشته اید !'
else
txt = '• کاربر : ['..name:escape_hard()..'](tg://user?id='..msg.from.id..')\n شما  *['..tlist..']* گروه در سیستم نصب شده وخریداری شده دارید ヅ\n\n🏷 راهنما : برای تنظیم کردن ربات در تنظیمات شخصی با توجه به ثبت گروه های شما می توانید از دکمه [تنظیمات] استفاده کنید!\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do

if base:get(TD_ID..'StatsGpByName'..v) then
GroupsName = base:get(TD_ID..'StatsGpByName'..v)
else
GroupsName = v
end
links = base:get(TD_ID..'Link:'..v) or 'https://t.me/'..Paybot..''
txt = ''..txt..' ✓ گروہ شمارہ *['..k..']*\n['..GroupsName..']('..links..')|['..v..'] \n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
expire = base:ttl(TD_ID..'ExpireData:'..v)
if expire == -1 then
lang = base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
if lang then
EXPIRE = 'Unlimited'
else
EXPIRE = '🌀 شارژ مادالعمر'
end
else
d = math.floor(expire/day ) + 1
if lang then
EXPIRE = ''..d..' Day'
else
EXPIRE = '🗓 '..d..' روز'
end
end
if txt then
if base:get(TD_ID..'StatsGpByName'..v) then
GroupsName = base:get(TD_ID..'StatsGpByName'..v)
else
GroupsName = v
end
temp = {{{text = ''..Alphaee(k)..')'..GroupsName..'',url=links,callback_data = 'Ramin:NotAdmin:'..v}
},{
{text = ''..EXPIRE..'',callback_data = 'Black:'..v},{text = '⚙️ تنظیمات',callback_data = 'Ramin:gpmenustart:'..v}
,},}
end
if(k<8)then
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else

temp = {{{text= '➲ بعدی',callback_data = 'ChatsPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
break;
end
end
temp = {{{text= 'بستن ➲',callback_data = 'Ramin:ExhlStart:'..msg.from.id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
Edit(msg,txt,keyboard,true)

------------------
elseif page == 3 then
txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
Alert(msg.id,txt,true)



elseif page == 8 then
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = 'خرید ربات  💸',callback_data = 'Ramin:nerkhmem:'..msg.from.id},
},{
{text = 'راهنمای تست 📤',callback_data = 'Ramin:farg:'..msg.from.id},
--{text = ' نرخ ربات 🤖',callback_data = 'Ramin:nerkhbot:'..msg.from.id},
{text = ' واحد پشتیبانی ⚙️',callback_data = 'Ramin:aboutbot:'..msg.from.id},
},{
{text = ' کانال ربات 📣',url='https://telegram.me/'..Channel..''},
},{

--{text = '⚙️ مدیریت ربات ازداخل ربات(مخصوص مدیران)',callback_data = 'Ramin:nerkhmem:'..msg.from.id},
-- },{
-- {text = '🤖 درباره ربات',callback_data = 'Ramin:farg:'..msg.from.id},
-- {text = 'درگاه ربات 🏦',callback_data = 'Ramin:dargah:'..msg.from.id},
-- },{
-- {text = '🤖 نرخ ربات',callback_data = 'Ramin:nerkhbot:'..msg.from.id},
-- {text = '💫 امکانات ربات',callback_data = 'Ramin:aboutbot:'..msg.from.id},
-- },{
-- {text = '📛 جلوگیری از فیلتر شدن گروه',callback_data = 'Ramin:Filtering:'..msg.from.id},
-- },{
--{text = '📤 من ربات گارین می خواهم',callback_data = 'Ramin:darkhast:'..msg.from.id},
--},{
--{text= 'بستن ➲',callback_data = 'Ramin:ExhlStart:'..msg.from.id}
}}
dofile('./Alpha/time.lua')
ramin =[[


💠 رباتی هستم برای رسیدن به خواسته هایتان .

🛡ربات ضد لینک هوشمند ما به صورت ترکیبی  محافظ  و امنیت گروه شما در برابر تبلیغات  و اسپمر می باشد

✌️تفاوت من نسبت به بقیه ربات های ضد لینک :

☄️پرسرعت،دستورات و پنل مدیریتی آسان .
🔞  سیستم آنتی پورن AGP +18.
👾  سیستم AGT آنتی تبچی.
🔏  سیستم AGL چند حالته قفل ها.
📊آمارگیری ادمین ها و کاربران گروه.
🗑پاکسازی خودکار چند حالته.
⚡️ پرسرعت در گروه 200 هزار نفره.
💯بدون آفلاینی 99.9 درصد.

✅ محبوب ترین ربات ضد اسپمر در دل شما شک نکنید!
✅ حس تازگی را با ما مزه کنید و به این ارزش اعتماد کنید.
✅ کیفیت دستور کار ماست.




]]

txt = 'به ربات  ['..NameBot..'](tg://user?id='..BotJoiner..') خوش آمدید.\n'..ramin..'\n\n🆔 @'..check_html(Channel)..''
Edit(msg,txt,keyboard,true)

elseif page == 10 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:startback:'..msg.from.id}
}}
EdiT(msg,'',keyboard,true)
sleep(.5)
txt2='◈ تعرفه خرید ربات ضد اسپم پرقدرت \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n '
EdiT(msg,txt2,keyboard,true)
sleep(.5)
txt3='◈ تعرفه خرید ربات ضد اسپم پرقدرت \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n▕ ➋ماهه◄ 18هزارتومان\n'
EdiT(msg,txt3,keyboard,true)
sleep(.5)
txt4='◈ تعرفه خرید ربات ضد اسپم پرقدرت\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n▕  ➋ماهه◄ 18هزارتومان\n▕ ➌ماهه◄ 25هزارتومان\n'
EdiT(msg,txt4,keyboard,true)
sleep(.5)
txt5='◈ تعرفه خرید ربات ضد اسپم پرقدرت\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n▕ ➋ماهه◄ 18هزارتومان\n▕ ➌ماهه◄ 25هزارتومان\n▕ ➏ماهه◄ 45هزارتومان\n'
EdiT(msg,txt5,keyboard,true)
sleep(.5)
txt6='◈ تعرفه خرید ربات ضد اسپم پرقدرت\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n▕ ➋ماهه◄ 18هزارتومان\n▕ ➌ماهه◄ 25هزارتومان\n▕ ➏ماهه◄ 45هزارتومان\n▕ ➊ساله◄ 90 هزارتومان\n'
EdiT(msg,txt6,keyboard,true)
sleep(.5)
txt7='◈ تعرفه خرید ربات ضد اسپم پرقدرت\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n▕ ➋ماهه◄ 18هزارتومان\n▕ ➌ماهه◄ 25هزارتومان\n▕ ➏ماهه◄ 45هزارتومان\n▕ ➊ساله◄ 90 هزارتومان\n'
EdiT(msg,txt7,keyboard,true)

local keyboard = {}
keyboard.inline_keyboard = {{


{text = 'بازگشت ◂',callback_data = 'Ramin:Backst:'..msg.from.id}
}}
dofile('./Alpha/time.lua')
Ramin = 'شماره حساب واحد فروش\n\nشمارہ کارت :\n'..cardnumber..'\n\nبنام :\n'..namecard..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nبرای کارت به کارت یا از طریق نرم افزار یا سامانه خود بانک و یا اپلیکیشن همراه کارت قبول‌ میکنیم\nدرصورت استفاده از نرم افزار تاپ یا آپ ، تصویر کارت بانکی خود را با رعایت امنیت ( تاریخ و Cvv بپوشونید ) و نام و شماره کارت معلوم باشه و بفرستید.\n🧑🏻‍💻 ایدی زیر جهت ارسال :\n\n◈ ارتباط با اپراتور اول :\nᴥ @'..Config.Sudo1..'\n'
Edit(msg,'◈ تعرفه خرید ربات ضد اسپم پرقدرت\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⫸  تعرفه خرید ربات برای مالکین سوپرگروه ها:\n\n▕ ➊ماهه◄ 10هزارتومان\n▕ ➋ماهه◄ 18هزارتومان\n▕ ➌ماهه◄ 25هزارتومان\n▕ ➏ماهه◄ 45هزارتومان\n▕ ➊ساله◄ 90 هزارتومان\n\n'..Ramin..'',keyboard,true)


elseif page == 11 then
farge = [[

🔹 جهت شناخت شما از ربات می توانید به مدت 7 روز ، از تمامی امکانات و تنظیمات  ربات به صورت کاملاَ رایگان در گروه خود استفاده نمایید.

♻️شرط استفاده رایگان از ربات باید به قوانین زیر پایبند باشید:

✔️ اعضای گروه شما بالای 20 نفر باشد.

✔️ به هیچ عنوان داخل گروه از ربات ضد لینک رایگان استفاده نکنید در صورت مشاهده ربات از گروه شما خروج زده می شود.

✔️  گروه های فیشینگ و کلاهبرداری،جنبش اعتراضی،پورن،شرط بندی،ضد دین و پیامبران،فروش قاچاق،دزدی .... ممنوع می باشد.درصورت مشاهده مالک گروه وادمین های گروه به لیست سیاه ربات اضافه خواهد شد.

♨️ روش نصب و راه اندازی ربات در گروه شما :

#اول لمس دکمه اضافه کردن ربات به گروه.
#دوم ادمین کردن ربات و زدن تیک تمامی دسترسی ها بجز تیک ادمین مخفی.
#سوم ارسال دستور نصب رایگان داخل گروه

🟣 توجه داشته باشید که برای ارائه بهترین خدمات و کیفیت بالا ، این ربات شامل یک ربات مکمل کمکی Cli میباشد که باید همراه با این ربات داخل گروه ادمین و حضور داشته باشد ، عملیات ورود و ادمین شدن ربات مکمل ، به صورت خودکار انجام میشود. درصورت عضو نشدن ربات مکمل پاکسازی نگران نباشید کافیه مراجعه کنید به واحد پشتیبانی تا ربات پاکسازی (Cli) در گروه شما نصب و راه اندازی شود.
 
]]
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' اضافه کردن ربات به گروه ⏺ ',url='t.me/'..Paybot..'?startgroup=new'},
},{
{text = 'بازگشت ◂',callback_data = 'Ramin:Backst:'..msg.from.id}
}}
Edit(msg,farge,keyboard,true)

-- elseif page == 12 then
-- farge = [[

-- ◂ دوستان عزیز چند نکته اصلی در مورد گروه هایی که از طرف تلگرام فیلتر می شوند در ضمن دلیل عدم فیلتر شدن گروه تلگرامی هیچ ربطی به ربات ضد لینک یا ضد اسپم ندارد تا وقتی که یک گروه فیلتر می شود که  ربات های ضد اسپم گروه شما تبلیغات و پست های غیر اخلاقی ارسال کند.

-- ⚡️خواهشمند است پست ارسال شده را به دقت بخوانید:

-- ◆تلگرام موقعی که یک گروه را فیلتر می کند به چند تا نکته اصلی توجه می کند یک نام گروه دوم عکس  گروه سوم زیاد بودن تبلیغات غیراخلاقی چهارم ادمین های گروه پنچم بیوگرافی یا درباره گروه

-- ◇تلگرام به هیچ وجه پست های ارسالی گیف دار پورن دار را به ز بابت فیلتر شدن گروه چک نمی کند البته بنده چند تا گروه غیراخلاقی هستن هنوزم که هست فیلتر نشدن پس ربطی به این قضیه ندارد.

-- 3-خب سوال براتون پیش میاد چرا ادمین های گروه ؟!

-- ادمین های گروه دقیقا مثل مالک گروه می باشد و این امکان رو می دهد هر تغییری از بابت ظاهری گروه شما انجام دهد مثال عرض میکنم ادمین یک گروه می تواند فقط 12 تا ممبر فیک و جعلی در گروه شما اد کند و پست های غیراخلاقی سیاسی را ارسال کند و هر پست را به عنوان (report Massage)گزارش اسپم وبودن با غیراخلاقی به تلگرام معرفی و ارسال کند اگر احیانا ربات ضد لینک پرقدرت هم داشته باشید که قفل پورن الکی دارند به هیچ وجه جلوگیری نخواهد کرد.

-- ◆ربات های ضد لینک رایگان که فقط برای تبلیغ کردن ساخته شده اند به هیچ وجه از ربات های رایگان استفاده نکنید . به این دلیل به محض ادمین شدن در گروه تمام اختیارات گروه دردسترس ربات های رایگان قرار می گیرد و هر نوع تبلیغ دزدی ممبر تبلیغات برای خودش انجام میده .حتی امکان داره باعث فیلتر شدن گروه شما می شود.فقط یک پست های تبلیغی داخل گروه شما موجود باشد و تنها  12 کاربر بر روی پست ارسال شده حالت گزارش ریپورت پیام(report massage) معرفی  شود گروه در عرض چند ثانیه فیلتر خواهد شد.

-- ◇ربات های تبچی و تبلیغگر ،در هر گروهی تعداد ربات های تبچی و تبلیغگر افزایش یابد امکان فیلتر شدن گروه شما به حداکثر خود خواهد رسید سعی کنید رباتی داشته باشید که قابلیت شناسایی ربات های تبچی رو داشته باشد پیشنهاد ما اینه از ربات پرقدرت گاردین استفاده کنیدچون ربات گاردین هر کاربری که داخل گروه عضو می شود به ظاهر کلی ممبراز بابت تبچی بودن  را چک وبررسی می کند.

-- ◆ازخرید ممبرهای ارزان و جعلی که توسط ربات های تبچی واسه هر گروهی اد می زنند به هیچ وجه استفاده نکنید.
-- چون تمامی ممبر های اد شده فیک و ربات تبچی هستن.
-- پیشنهاد ما اینه از خرید ممبر اداجباری از طریق پنل ممبر زده می شوند استفاده کنید.

-- ﴾    ᴳᵁᴬᴿᴰᴵᴬᴺ ᴬᴺᵀᴵᶳᴾᴬᴹ ᵛ²   ﴿

-- ]]
-- local keyboard = {}
-- keyboard.inline_keyboard = {{
-- {text = 'بازگشت ◂',callback_data = 'Ramin:Backst:'..msg.from.id}
-- }}
-- Edit(msg,farge,keyboard,true)
elseif page == 13 then
farge = [[

🧑🏻‍🔧 کاربر عزیز اگر ریپورت هستید می توانید از ربات پیامرسان ما استفاده کنید.


]]
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'ربات پیامرسان 📩',callback_data = 'Ramin:Backst:'..msg.from.id},
},{
{text = 'مالک ربات 👨‍💻 ',callback_data = 'Ramin:Backst:'..msg.from.id},
},{
{text = 'بازگشت ◂',callback_data = 'Ramin:Backst:'..msg.from.id}
}}
Edit(msg,farge,keyboard,true)


elseif page == 7 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:startback:'..msg.from.id}
}}
EdiT(msg,'پردازش نمایش سیستم ربات ...!\n\nلطفا منتظر بمانید:\n»│*███*│*10%*',keyboard,true)
sleep(.5)
txt2='پردازش نمایش سیستم ربات ...!\n\n📡لطفا منتظر بمانید:\n»│*█████*│*25%*'
EdiT(msg,txt2,keyboard,true)
sleep(.5)
txt3='پردازش نمایش سیستم ربات ...!\n\n📡لطفا منتظر بمانید:\n»│*███████*│*44%*'
EdiT(msg,txt3,keyboard,true)
sleep(.5)
txt4='پردازش نمایش سیستم ربات ...!\n\n📡لطفا منتظر بمانید:\n»│*█████████*│*60%*'
EdiT(msg,txt4,keyboard,true)
sleep(.5)
txt5='پردازش نمایش سیستم ربات ...!\n\n📡لطفا منتظر بمانید:\n»│*███████████*│*89%*'
EdiT(msg,txt5,keyboard,true)
sleep(.5)
txt6='پردازش نمایش سیستم ربات ...!\n\n📡لطفا منتظر بمانید:\n»│*█████████████*│*93%*'
EdiT(msg,txt6,keyboard,true)
sleep(.5)
txt7='پردازش نمایش سیستم ربات ...!\n\n📡لطفا منتظر بمانید:\n»│*██████████████*│*100%*'
EdiT(msg,txt7,keyboard,true)
pingserver = io.popen("sh ./Alpha/pingserver.sh"):read("*a")
CPUPer = io.popen("sh ./Alpha/CPUPer.sh"):read("*a")
HardDisk = io.popen("sh ./Alpha/HardDisk.sh"):read("*a")
linux_version = io.popen("sh ./Alpha/linux_version.sh"):read("*a")
memUsedPrc = io.popen("sh ./Alpha/memUsedPrc.sh"):read("*a")
--uptime = io.popen("sh ./Alpha/uptime.sh"):read("*a")
dataread = io.popen("sh ./Alpha/dataread.sh"):read("*a")
datawritten = io.popen("sh ./Alpha/datawritten.sh"):read("*a")
rediscpu= io.popen("sh ./Alpha/rediscpu.sh"):read("*a")
redismem = io.popen("sh ./Alpha/redismem.sh"):read("*a")
sgps = base:scard(TD_ID..'SuperGp')
users = base:scard(TD_ID..'ChatPrivite') or 0
user = io.popen('whoami'):read('*a')

local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Backst:'..msg.from.id}
}}
dofile('./Alpha/time.lua')
Edit(msg,'✭ نمایش کلی مانیتورینگ سرور ربات !\n• تاریخ امروز : *'..Alphafa(limitmsg)..'*/*'..Alphafa(limitmsg1)..'*/*'..Alphafa(limitmsg2)..'*\n• ساعت : *'..Alphafa(hor)..'*:*'..Alphafa(dag)..'*:*'..Alphafa(sec)..'*\n\n» تعداد نصب شده در گروها : '..sgps..' گروه\n\n'..linux_version..'\n'..pingserver..'\n'..CPUPer..'\n'..HardDisk..'\n'..memUsedPrc..'\n'..rediscpu..'\n'..redismem..'\n'..dataread..'\n'..datawritten..'\n',keyboard,true)
---------------------
end
end



----------------------------------------------



function Runing(msg)
MsgTime = os.time() - 60
if msg.date < tonumber(MsgTime) then
print('> Message A Minute Age...')
return false
end




if msg.entities then
for i,entity in pairs(msg.entities) do
if entity.type == 'text_mention' then
msg.mention_id = entity.user.id
if entity.user.username then
end end end end

Black1 = msg.text
local Black = msg.text
local Diamondent = Black and msg.entities
if Black then
Black = Black:lower()
end
if msg.text and Black then
if Black:match('^[/#!]') then
Black = Black:gsub('^[/#!]','')
end
--Start Bot
function inPrivatePluginSudo(msg)
Black = msg.text
CmdLower = Black:lower()
if CmdLower:match("^مدیریت ربات$") or CmdLower:match("^/start$") and  is_FullSudo(msg) then
keyboard = {resize_keyboard = true}
keyboard.keyboard =
{
{
{text = "📊 آمار ربات"},{text = "🧾 فاکتور"},
},
{
{text = "💻 مانیتورینگ"},{text = "📛 لیست بن آل"},
},
{
{text = "بازگشت"},
},
}
A = sendText(msg.chat.id, '◈ لطفاً بخش مورد نظر خود را انتخاب کنید :', msg.message_id, false, keyboard)
return
end
end
if is_FullSudo(msg) then
if msg.chat.type == 'private' then
Black = msg.text
CmdLower = Black:lower()
if CmdLower:match("^مدیریت ربات$") or  CmdLower:match("^/start$") then
if Black then
inPrivatePluginSudo(msg)
end
end
if Black == 'بازگشت'   then
if Black then
inPrivatePlugin(msg)
end
end


if Black:match('^🧾 فاکتور$')  then
GPS = #base:smembers(TD_ID..'group:')
if tonumber(GPS) <= tonumber(50) then
pingserver = io.popen("sh ./Alpha/pingserver.sh"):read("*a")
CPUPer = io.popen("sh ./Alpha/CPUPer.sh"):read("*a")
HardDisk = io.popen("sh ./Alpha/HardDisk.sh"):read("*a")
memUsedPrc = io.popen("sh ./Alpha/memUsedPrc.sh"):read("*a")

local check_time = base:ttl(TD_ID.."SvExpire")
year = math.floor(check_time / 31536000)
byear = check_time % 31536000
month = math.floor(byear / 2592000)
bmonth = byear % 2592000
day = math.floor(bmonth / 86400)
bday = bmonth % 86400
hours = math.floor( bday / 3600)
bhours = bday % 3600
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if not base:get(TD_ID.."SvExpire") then
remained_expire = 'مهلت سرور ربات پایان یافته است'
elseif check_time == -1 then
remained_expire = 'سرور ربات به صورت نامحدود شارژ میباشد'
elseif tonumber(check_time) > 1 and check_time < 60 then
remained_expire = 'سرور ربات به مدت '..sec..' ثانیه شارژ میباشد'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = 'سرور ربات به مدت '..min..' دقیقه و '..sec..' ثانیه شارژ میباشد'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = 'سرور ربات به مدت '..hours..' ساعت و '..min..' دقیقه و '..sec..' ثانیه شارژ میباشد'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = 'سرور ربات به مدت '..day..' روز و '..hours..' ساعت و '..min..' دقیقه و '..sec..' ثانیه شارژ میباشد'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = 'سرور ربات به مدت '..month..' ماه '..day..' روز و '..hours..' ساعت و '..min..' دقیقه و '..sec..' ثانیه شارژ میباشد'
elseif tonumber(check_time) > 31536000 then
remained_expire = 'سرور ربات به مدت '..year..' سال '..month..' ماه '..day..' روز و '..hours..' ساعت و '..min..' دقیقه و '..sec..' ثانیه شارژ میباشد'
end


Tamdid = 80000
txt = [[

]]..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..[[


🔖 هزینه پیش فرض به صورت ماهانه با 100 گروه نصبی 80 هزار تومان است.

📌مالک عزیز @]]..Config.Sudo1..[[ شما درحال حاضر ]]..GPS..[[ گروه نصبی دارید. با توجه به فاکتور پیش فرض تعداد گروه شما به بالاتر از 100 تا گروه نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.

♨️ وضعیت سرور ربات به شرح ذیل است :

]]..pingserver..[[
]]..CPUPer..[[
]]..HardDisk..[[
]]..memUsedPrc..[[

]]..remained_expire..[[

]]
else
x = tonumber(GPS)
Babi = x * 2000
Tamdid = Babi + 80000
txt = [[

⋙ شما در حال حاضر ]]..GPS..[[ تا گروه دارید و مبلغ ]]..Babi..[[ تومان هزینه اضافه به فاکتور شما افزوده شد

کل هزینه قابل پرداخت شما مبلغ ]]..Tamdid..[[
تومان میشود.
]]
end
sendText(msg.chat.id,txt,msg.message_id, 'md')
end




if Black == '📊 آمار ربات'   then
if Black then
ID = base:scard('ID:')
sgpsfree = base:scard(TD_ID..'SuperGpFree')
sgps = base:scard(TD_ID..'SuperGp')
GPS = #base:smembers(TD_ID..'group:')
gp = base:scard(TD_ID..'Chat:Normal') or 0
users = base:scard(TD_ID..'ChatPrivite') or 0
tab = base:scard(TD_ID..'AGTMute:') or 0
user = io.popen('whoami'):read('*a')
totald = io.popen('du -h /var/lib/redis/dump.rdb'):read('*a')
txt = '» تعداد کل ایدی کاربران : '..Alphafa(tostring(ID))..'\n» تعدادکل سوپرگروه رایگان : '..Alphafa(tostring(sgpsfree))..'\n» تعدادکل سوپرگروها : '..Alphafa(tostring(GPS))..'\n» تعداد کاربران پیوی : '..Alphafa(tostring(users))..'\n» تعداد تبچی : '..Alphafa(tostring(tab))..''
sendText(msg.chat.id,txt,msg.message_id, 'md')
end
end


if Black == '💻 مانیتورینگ'   then
if Black then
pingserver = io.popen("sh ./Alpha/pingserver.sh"):read("*a")
CPUPer = io.popen("sh ./Alpha/CPUPer.sh"):read("*a")
HardDisk = io.popen("sh ./Alpha/HardDisk.sh"):read("*a")
linux_version = io.popen("sh ./Alpha/linux_version.sh"):read("*a")
memUsedPrc = io.popen("sh ./Alpha/memUsedPrc.sh"):read("*a")
uptime = io.popen("sh ./Alpha/uptime.sh"):read("*a")
dataread = io.popen("sh ./Alpha/dataread.sh"):read("*a")
datawritten = io.popen("sh ./Alpha/datawritten.sh"):read("*a")
rediscpu= io.popen("sh ./Alpha/rediscpu.sh"):read("*a")
redismem = io.popen("sh ./Alpha/redismem.sh"):read("*a")
sgps = base:scard(TD_ID..'SuperGp')
users = base:scard(TD_ID..'ChatPrivite') or 0
user = io.popen('whoami'):read('*a')
ID = base:scard('ID:')
sgpsfree = base:scard(TD_ID..'SuperGpFree')
sgps = base:scard(TD_ID..'SuperGp')
gp = base:scard(TD_ID..'Chat:Normal') or 0
users = base:scard(TD_ID..'ChatPrivite') or 0
tab = base:scard(TD_ID..'AGTMute:') or 0
user = io.popen('whoami'):read('*a')
totald = io.popen('du -h /var/lib/redis/dump.rdb'):read('*a')
dofile('./Alpha/time.lua')
sendText(msg.chat.id,'✭ نمایش کلی مانیتورینگ سرور ربات !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n» تعداد کل ایدی کاربران : '..Alphafa(tostring(ID))..'\n» تعدادکل سوپرگروه رایگان : '..Alphafa(tostring(sgpsfree))..'\n» تعدادکل سوپرگروها : '..Alphafa(tostring(sgps))..'\n» تعداد کاربران پیوی : '..Alphafa(tostring(users))..'\n» تعداد تبچی : '..Alphafa(tostring(tab))..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n♨️ وضعیت سرور ربات به شرح ذیل است :\n'..linux_version..'\n'..pingserver..'\n'..CPUPer..'\n'..HardDisk..'\n'..memUsedPrc..'\n'..rediscpu..'\n'..redismem..'\n'..uptime..'',msg.message_id, 'md')
end
end
if Black == '📛 لیست بن آل'   then
if Black then
local list = base:smembers(TD_ID..'GlobalyBanned:')
if #list == 0 then
sendText(msg.chat.id,'لیست مسدود سراسری ربات خالی می باشد!',msg.message_id, 'md')
else
local txt = 'لیست کاربران بن ال شده :\n\n'
for k,v in pairs(list) do
local usrname = base:get('usrname'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'UserName:'..v) or 'none'
username = '<a href="tg://user?id='..v..'">'..Name..'</a> - <b>'..v..'</b>'
end
txt = ''..txt..'<b>ᴥ '..k..'</b> - '..username..'\n'
end
sendText(msg.chat.id,txt,msg.message_id, 'html')
end
end
end
end
end

function inPrivatePlugin(msg)
Cmd = msg.text
CmdLower = msg.text:lower()
if CmdLower:match("^/start$") or CmdLower:match("^بازگشت$") and not is_FullSudo(msg)  then
keyboard = {resize_keyboard = true}
keyboard.keyboard =
{
{
{text = "📤 راه اندازی ربات اختصاصی"}
},
{
{text = '💫 امکانات ربات'} , {text = "💢 درباره ربات"}
},
{
{text = '👨‍💻 درخواست پشتیبانی'} ,{text = '📛 جلوگیری از فیلتر شدن گروه'}
},
}
A = sendText(msg.chat.id, '.', msg.message_id, false, keyboard)
return
end
end

if msg.chat.type == 'private' then
if Black == '📤 راه اندازی ربات اختصاصی' and  is_JoinChannel(msg)  then
txt = [[
◈ کاربر عزیز برای ارسال درخواست راه اندازی ربات اخصاصی از پروژه ضد اسپم لطفا نسبت به متن زیر اقدام و ارسال کنید در صورت اشتباه و ارسال پیام الکی از طرف مدیران بلاک خواهی شد.
⫸تعرفه خرید برای کسانی که می خواهند ربات اختصاصی داشته باشند:

▎ ➊ماهه◄ 100هزارتومان▎

💻سرور تمامی ربات ها از کشور هلند می باشدکه از تمامی سرور های دیگر امثال آلمان پینگ به تلگرام پایین تری داردو هرچقدر پینگ به تلگرام پایین تر سرعت پاکسازی وجوابدهی ربات بالاتر می رود.
❗️ تعداد حداکثر نصبی ربات اختصاصی 300 گروه می باشد با توجه به گران شدن سرور های مجازی هزینه 50عدد گروه بیشتر به صورت حساب ماهانه 25هزارتومان افزایش خواهد داشت مثال اگر ربات شما به تعداد بیشتر 300 رسیده باشد هزینه هر 50 عدد نصبی ربات شما به  30هزارتومان افزایش خواهید داشت.
اگر درخواست ربات اختصاصی داری داخل پیوی همین ربات ارسال کن تا مدیران ما در اسرع وقت پاسخگو خواهند بود.
▁▁▁▂▂▂▂▂▂▂▁▁▁

» نکته دیگر هم اینه شما می توانید به صورت مستقیم با واحد پشتیبانی در ارتباط باشید.
✮ اپراتور پشتیبانی :@]]..Config.Sudo1..[[

]]

sendText(msg.chat.id,txt, msg.message_id)
end
end




if msg.chat.type == 'private' then
if Black == '💫 امکانات ربات' and  is_JoinChannel(msg)  then
text = [[
◁ لیست امکانات ربات مدیریت گروه هوشمند # 🤖

╗ امکانات مدیریتی و تفریحی 👤
╣ دارای قفل های مدیریتی و رسانه چند حالته ⚙️
╣ قابلیت تغییر وضعیت فروارد 🔱
╣ قابلیت شناسایی تبچی ها ⚡️
╣ پشتیبانی از گروه 200k+🔋
╣ مدیر ربات کردن کاربر 👑
╣ قفل کلی گروه (زماندار، خودکار، دستی)🔒
╣ ترکیب ربات Cli و Api
╣ ضد تبلیغات  ضد فحش 🔐
╣ ادد اجباری گروه 👥
╣ اجبار عضویت در کانال گروه 🆔
╣ معافیت اجبار کاربر ✅
╣ قابلیت خوش آمدگویی ⚜️
╣ پاکسازی کلی پیام های گروه 🗑
╣ پاکسازی تبلیغات گروه ♻️
╣ قابلیت سنجاق مطلب 📌
╣ قابلیت  مسدود سازی کاربر 🚷
╣ قابلیت بیصدا نمودن کاربر 🔕
╣ قابلیت بیصدا نمودن زمان دار کاربر 🔇
╣ فیلتر کلمات بصورت لیستی 📛
╣ اخطار به کاربر ⚠️
╣ تنظیم وضعیت اخطار به کاربر 🚸
╣ قابلیت تنظیم فلود 💭
╣ قابلیت تنظیم اسپم 🗯
╣ قابلیت پاکسازی پیام های ربات
╣ ارتقا به کاربر ویژه 🗣
╣ قابلیت پاکسازی تمامی لیست ها 📭
╣ دریافت بخش مختلف ربات 🗂
╣ قابلیت دریافت لینک 🖇
╣ قابلیت ساخت لینک جدید گروه 📎
╣ قابلیت تنظیم قوانین گروه 📕
╣ دریافت آمار فعالیت گروه 📊
╣ دریافت شناسه به دو صورت ℹ️
╣ دریافت زمان و تاریخ ⏰
╣ قابلیت طراحی فونت 🀄️
╣ قابلیت خوشآمد گویی به وسیله مدیا 🔮
╣ قابلیت تبدیل عکس به استیکر و بالعکس 📮
╣ گزارش عملکرد قفل ها 📰
╣ پنل شیشه ای و مدرن 📍
╣ قابلیت وضعیت آنلاینی ربات 💡
╣ قابلیت دریافت اعتبار گروه 📜
╣ سیستم تشخیص ربات تبلیغاتی 🎭
╣ قابلیت فیلتر کلمات پیشرفته 🛡
╣ قابلیت محدود سازی خودکار کاربر 🔑
╣ قابلیت گزارش مشکل در ربات 🛠
╣ قابلیت پرداخت آنلاین شارژ ربات 💳
╣ قابلیت درخواست پشتیبانی 👨🏻‍💻
╝ بخشی از امکانات نام برده در لیست بالا دارای زیرشاخه های مختلفی می باشند 🚨
]]
sendText(msg.chat.id,""..text.."\n\n✮ اپراتور پشتیبانی : @"..Config.Sudo1.." ", msg.message_id)
end
end
if msg.chat.type == 'private' then
if Black == '💢 درباره ربات' and  is_JoinChannel(msg)  then
text = [[
تعدادی از کاربران همیشه به فکر این هستند، تا یک ربات با کیفیت و پرقدرت واسه سوپرگروه تلگرام از کجا پیدا کنم در این مطلب قصد داریم شما را با یکی از بهترین ربات ضد لینک تلگرام با سالها خدمات رسانی و کسب تجربه در زمینه برنامه نویسی، تولید کننده بهترین و با کیفیت ترین ربات مدیریت گروه آشنا کنیم، با ما همراه باشید.

اگر با گروه و ربات گروه آشنایی دارید، حتما مطلع هستید که سرعت و امکانات یک ربات برای برقراری امنیت بسیار از اهمیت بالایی برخوردار است. ما این موضوع را به خوبی درک کرده و برآن شدیم تا یک سرویس با کیفیت و قوی به شما مالکان عزیز ارائه کنیم.

بسیاری از ارائه دهندگان ربات ضد لینک وضد تبلیغات، سورس یا همان کدهای ربات را بر روی سرورهای ضعیف ران یا اجرا می کنند، که این موضوع باعث افت کیفیت عملکرد ربات میشود، خداروشکر با همت و تلاش تیم برنامه نویسی ما تمامی سورس ربات را بر روی یک سرور کاملا اختصاصی پیاده سازی کردیم تا ربات بهترین عملکرد ممکن را در برقراری امنیت در گروه یا سوپرگروه های شما داشته باشد.

🌟 با وجود رباتهای رایگان، چرا ربات اشتراکی بخریم؟
این سوال خیلی از مدیران گروههاست که چرا باید هزینه ای پرداخت کنیم، وقتی که سرویس دهندگانی هستند که ربات رایگان ارائه می کنند؟
پاسخ این سوال خیلی ساده است، تمام صاحبان ربات هایی که سرویس رایگان به کاربران خود ارائه می کنند، به منظور انجام تبلیغات در گروههای شماست. در ازای استفاده از ربات آنها، لینکهای تبلیغاتی را به گروه شما ارسال می کنند که این موضوع گاهاً موجب اذیت شدن ادمینها و اعضای گروه میشود.

ولی سوال دیگر این است؛
آیا تفاوت رباتهای پولی با رایگان فقط در تبلیغات است؟

باید خدمتتان عرض کنیم که پاسخ خیر است، بنا به چند دلیل :

اول اینکه رباتهای رایگان به دلیل حجم بالای استفاده کنندگان، افت سرعت پیدا میکنند و در مواقعی امکان از کار افتادن ربات تا ساعاتی وجود دارد.

دوم اینکه به دلیل رایگان بودن این رباتها تیم های برنامه نویسی دلسوزانه به کاربران خود سرویس دهی نمی کنند و اینجور ربات ها در صورت وجود مشکلی، پشتیبانی بسیار ضعیفی دارند.

دلیل سوم به خاطر امکانات یا قابلیت های پایین ربات میباشد، برنامه نویسان ربات های رایگان به خاطر اینکه از منابع سرور استفاده کمتری شود، امکانات ربات را محدود می کنند.

تفاوت های دیگری هم بین رباتهای رایگان و پولی وجود دارد، ولی همین سه مورد کفایت می کند، تا متوجه باشید که چرا هزینه ماهیانه ناچیزی پرداخت کنید، بهتر است تا از ربات رایگان که امنیت گروهتان را به خطر می اندازد، استفاده کنید.

به شما دوستان عزیز پیشنهاد می کنم که ربات های پرقدرت ما را حتما یه تست کنید، تیم ربات نویسی ما اولین نیست ولی با ارائه خدمات باکیفیت، سعی دارد بهترین باشد. برای استفاده از رباتهای پرقدرت ما ابتدا در کانال ما از طریق لینک زیر عضو شوید، بعد داخل کانال میتوانید با پشتیبانی ربات در ارتباط باشید و سوالات خود را مطرح کنید. آموزش ها و دستورات ربات هم داخل کانال وجود دارد.
]]
sendText(msg.chat.id, ""..text.."\n\n✮ اپراتور پشتیبانی : @"..Config.Sudo1.." ", msg.message_id)
end
end
if msg.chat.type == 'private' then
if Black == '👨‍💻 درخواست پشتیبانی' and  is_JoinChannel(msg)  then
text = [[

◈ قبل از ارسال پیام به واحد پشتیبانی حالت ضد فوروارد کردن پیام خودتان در تنظیمات تلگرام  خودتان را غیرفعال کنید تا مدیران بتوانند به راحتی با شما در ارتباط باشند!

» لطفا پیام خود را ارسال کنید !

بعد از ارسال پیام منتظر پاسخگویی باشید🥰

]]
sendText(msg.chat.id, ""..text.."\n\n✮ ارتباط مستقیم با مالک ربات : @"..Config.Sudo1.."", msg.message_id)
end
end

if msg.chat.type == 'private' then
if Black == '📛 جلوگیری از فیلتر شدن گروه' and  is_JoinChannel(msg)  then
farge = [[

◂ دوستان عزیز چند نکته اصلی در مورد گروه هایی که از طرف تلگرام فیلتر می شوند در ضمن دلیل عدم فیلتر شدن گروه تلگرامی هیچ ربطی به ربات ضد لینک یا ضد اسپم ندارد تا وقتی که یک گروه فیلتر می شود که  ربات های ضد اسپم گروه شما تبلیغات و پست های غیر اخلاقی ارسال کند.

⚡️خواهشمند است پست ارسال شده را به دقت بخوانید:

◆تلگرام موقعی که یک گروه را فیلتر می کند به چند تا نکته اصلی توجه می کند یک نام گروه دوم عکس  گروه سوم زیاد بودن تبلیغات غیراخلاقی چهارم ادمین های گروه پنچم بیوگرافی یا درباره گروه

◇تلگرام به هیچ وجه پست های ارسالی گیف دار پورن دار را به ز بابت فیلتر شدن گروه چک نمی کند البته بنده چند تا گروه غیراخلاقی هستن هنوزم که هست فیلتر نشدن پس ربطی به این قضیه ندارد.

3-خب سوال براتون پیش میاد چرا ادمین های گروه ؟!

ادمین های گروه دقیقا مثل مالک گروه می باشد و این امکان رو می دهد هر تغییری از بابت ظاهری گروه شما انجام دهد مثال عرض میکنم ادمین یک گروه می تواند فقط 12 تا ممبر فیک و جعلی در گروه شما اد کند و پست های غیراخلاقی سیاسی را ارسال کند و هر پست را به عنوان (report Massage)گزارش اسپم وبودن با غیراخلاقی به تلگرام معرفی و ارسال کند اگر احیانا ربات ضد لینک پرقدرت هم داشته باشید که قفل پورن الکی دارند به هیچ وجه جلوگیری نخواهد کرد.

◆ربات های ضد لینک رایگان که فقط برای تبلیغ کردن ساخته شده اند به هیچ وجه از ربات های رایگان استفاده نکنید . به این دلیل به محض ادمین شدن در گروه تمام اختیارات گروه دردسترس ربات های رایگان قرار می گیرد و هر نوع تبلیغ دزدی ممبر تبلیغات برای خودش انجام میده .حتی امکان داره باعث فیلتر شدن گروه شما می شود.فقط یک پست های تبلیغی داخل گروه شما موجود باشد و تنها  12 کاربر بر روی پست ارسال شده حالت گزارش ریپورت پیام(report massage) معرفی  شود گروه در عرض چند ثانیه فیلتر خواهد شد.

◇ربات های تبچی و تبلیغگر ،در هر گروهی تعداد ربات های تبچی و تبلیغگر افزایش یابد امکان فیلتر شدن گروه شما به حداکثر خود خواهد رسید سعی کنید رباتی داشته باشید که قابلیت شناسایی ربات های تبچی رو داشته باشد پیشنهاد ما اینه از ربات پرقدرت  استفاده کنیدچون ربات  هر کاربری که داخل گروه عضو می شود به ظاهر کلی ممبراز بابت تبچی بودن  را چک وبررسی می کند.

◆ازخرید ممبرهای ارزان و جعلی که توسط ربات های تبچی واسه هر گروهی اد می زنند به هیچ وجه استفاده نکنید.
چون تمامی ممبر های اد شده فیک و ربات تبچی هستن.
پیشنهاد ما اینه از خرید ممبر اداجباری از طریق پنل ممبر زده می شوند استفاده کنید.



]]
sendText(msg.chat.id, ""..farge.."\n\n✮ ارتباط مستقیم با مالک ربات : @"..Config.Sudo1.." ", msg.message_id)
end
end

if msg.chat.type == 'private' then
if Black == '📤 مدیریت ربات' and  is_JoinChannel(msg)  then
if Black then
inPrivatePluginSudo(msg)
end
end
end
if msg.chat.type == 'private' then

if (Black == 'sudopanel' or Black == 'پنل سودو' or Black == 'ویرایش ربات') and  is_FullSudo(msg) then
pnlsudo(msg,msg.chat.id,msg.message_id,'send')
end

if Black == '/start' or Black == 'start'  and  is_JoinChannel(msg)  and not is_FullSudo(msg) then
--if Black then
--inPrivatePlugin(msg)
--end
Nerkh(msg,'send',msg.message_id,1)
--sendText(935728510,'مالک محترم یک کاربر استارت ربات را ارسال کرد.\n ◆نام کاربر : ['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')\n ◆ایدی عددی کاربر :'..msg.from.id..' ',msg.message_id,"md")
end end


---check charge
if msg.chat.type == 'supergroup' then
if msg.new_chat_members and (msg.from.id == BotCliId or msg.from.id == BotJoiner) and is_Sudo(msg) and not base:get(TD_ID..'ExpireData:'..msg.chat.id) and not base:sismember(TD_ID..'Gp2:'..msg.chat.id,'added') then
base:set(TD_ID..'ExpireData:'..msg.chat.id,'Alpha')
end
local expirevip = base:ttl(TD_ID..'SvExpire') or 9999999
local cday = math.floor(expirevip/day) + 1
if 1 ==  cday and not base:sismember(TD_ID..'Gp2:','chex1')  then
base:sadd(TD_ID..'Gp2:','chex1')
base:sadd(TD_ID..'Gp2:','chex2')
base:sadd(TD_ID..'Gp2:','chex3')
GPS = #base:smembers(TD_ID..'group:')
if tonumber(GPS) <= tonumber(100) then
pingserver = io.popen("sh ./Alpha/pingserver.sh"):read("*a")
CPUPer = io.popen("sh ./Alpha/CPUPer.sh"):read("*a")
HardDisk = io.popen("sh ./Alpha/HardDisk.sh"):read("*a")
memUsedPrc = io.popen("sh ./Alpha/memUsedPrc.sh"):read("*a")

Tamdid = 80000
txt = [[

]]..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..[[


🔖 تمدید ربات اختصاصی شما فرا رسیده است

👈 از اعتبار ربات شما کمتر از 24 ساعت باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.

📌مالک عزیز @]]..Config.Sudo1..[[ شما درحال حاضر ]]..GPS..[[ گروه نصبی دارید. با توجه به فاکتور پیش فرض تعداد گروه شما به بالاتر از 100 تا گروه نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.

🏦 هزینه تمدید شما : ]]..Tamdid..[[ تومان

♨️ وضعیت سرور ربات به شرح ذیل است :

]]..pingserver..[[
]]..CPUPer..[[
]]..HardDisk..[[
]]..memUsedPrc..[[


]]
else
x = tonumber(GPS)
Babi = x * 2000
Tamdid = Babi + 80000
txt = [[

]]..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..[[

🔖 تمدید ربات اختصاصی شما فرا رسیده است

👈 از اعتبار ربات شما کمتر از 24 ساعت باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.

📌مالک عزیز @]]..Config.Sudo1..[[ شما درحال حاضر ]]..GPS..[[ تا گروه دارید و مبلغ ]]..Babi..[[ تومان هزینه اضافه به فاکتور شما افزوده شد!

کل هزینه قابل پرداخت شما مبلغ ]]..Tamdid..[[
تومان میشود.

♨️ وضعیت سرور ربات به شرح ذیل است :

]]..pingserver..[[
]]..CPUPer..[[
]]..HardDisk..[[
]]..memUsedPrc..[[

]]
end
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '🔻 یک روز دیگه تمدید می کنم',callback_data = 'Ramin:ForsatVip:'..msg.chat.id}
},{
{text = '🏦 تمدید ربات',url='https://telegram.me/'..Sudo1..''}
}}
local keyboard2 = {}
keyboard2.inline_keyboard = {{
{text = ' مالک ربات',url='https://telegram.me/'..Sudo1..''}
}}
sendText(935728510,txt,0,'md',keyboard2)
sendText(Full_Sudo,txtsudo,0,'md',keyboard)
end



local expiretime = base:ttl(TD_ID..'ExpireData:'..msg.chat.id) or 9999999
local cday = math.floor(expiretime/day) + 1
if 1 ==  cday and not base:sismember(TD_ID..'Gp2:'..msg.chat.id,'chex1')  then
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'chex1')
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'chex2')
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'chex3')
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
local url  = https.request(BASSE .. '/getChatMember?chat_id='..msg.chat.id..'&user_id='..BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' then
if exportChatInviteLink(msg.chat.id) then
link = exportChatInviteLink(msg.chat.id).result
base:set(TD_ID..'Link:'..msg.chat.id,link)
end
else
link = 'ربات بـہ قسمت باطل کردن لینک دسرسی ندارد'
end
local keyboard3 = {}
keyboard3.inline_keyboard = {{
},{{text = '• دعوت به گروه',callback_data = 'Ramin:AddMan:'..msg.chat.id},
{text = '• لغو نصب',callback_data = 'Ramin:left:'..msg.chat.id} ,
}}

tarikh = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
local IDS = "• نام گروہ: "..msg.chat.title.."\n• تعداد ممبر: "..membersgroup.."\n• توضیحات گروه :\n"..about.."\n\n• لینک گروہ:\n"..link..""

local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '🔻 یک روز دیگه تمدید می کنم',callback_data = 'Ramin:Forsat:'..msg.chat.id}
},{
{text = '🏦 تمدید ربات',url='https://telegram.me/'..Sudo1..''}
}}

local keyboard2 = {}
keyboard2.inline_keyboard = {{
{text = '🧾 نمایش فاکتور',url='https://telegram.me/'..Paybot..''}
},{
{text = '🔻 یک روز دیگه تمدید می کنم',callback_data = 'Ramin:Forsat:'..msg.chat.id}
}}
if owner_name then
username = '<a href="tg://user?id='..owner_id..'">'..check_html(owner_name)..'</a>'
else
username = '<a href="tg://user?id='..owner_id..'">'..owner_id..'</a>'
end

if tonumber(membersgroup) <= tonumber(1000) then
Tamdid = 8000
txt = ''..IDS..'\n\n⭕️ مدیر گرامی : '..check_html(owner_name)..'\n\n💸صورت حساب تمدید ربات شما به صورت زیر است لطفا چک بفرمایید\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000ممبر گروه 8 هزار تومان است.\n\n📌مالک عزیز '..check_html(owner_name)..' شما درحال حاضر '..membersgroup..' ممبر دارید. با توجه به فاکتور پیش فرض تعداد ممبر شما به بالاتر از 1000 تا ممبرگروه نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.\n\n💳 شما می توانید از طریق درگاه امن پی پینگ یا شماره حساب واحد فروش عملیات پرداختی را انجام دهید  :\n\n🚬 شماره کارت : \n'..cardnumber ..'\n 👤به نام : '..namecard ..'\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txtsudo = ''..IDS..'\n\n💸تمدید ربات این گروه فرا رسیده است.\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000ممبر گروه 8 هزار تومان است.\n\n📌گروه  '..check_html(msg.chat.title)..' درحال حاضر '..membersgroup..' ممبر دارد. با توجه به فاکتور پیش فرض تعداد ممبر این گروه به بالاتر از 1000 تا  نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
else
x = tonumber(membersgroup) / 1000
Babi = x * 100
Tamdid = Babi + 8000
txt = ''..IDS..'\n\n⭕️ مدیر گرامی :\n\n💸صورت حساب تمدید ربات شما به صورت زیر است لطفا چک بفرمایید\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000 ممبر گروه 8 هزار تومان است.\n\n📌گروه  '..check_html(msg.chat.title)..' درحال حاضر '..membersgroup..' ممبر گروه دارد. با توجه به فاکتور تنظیم شده از طرف تیم  تعداد ممبر بالاتر از 1000 تا می باشد  هزینه ی اضافه تنظیم شده برحسب تعداد ممبر گروه می باشد\n\n💵 مبلغ تمدید ماهانه ربات  شما '..Tamdid..'  تومان می باشد.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.\n\n 🚬 شماره کارت : \n'..cardnumber..'\n 👤به نام : '..namecard ..'\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txtsudo = ''..IDS..'\n\n💸تمدید ربات این گروه فرا رسیده است.\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000 ممبر گروه 8 هزار تومان است.\n\n📌مالک عزیز @'..Config.Sudo1..' درحال حاضر '..membersgroup..' ممبر گروه دارد. با توجه به فاکتور تنظیم شده از طرف تیم  تعداد ممبر بالاتر از 1000 تا می باشد  هزینه ی اضافه تنظیم شده برحسب تعداد ممبر گروه می باشد\n\n💵 مبلغ تمدید ماهانه ربات  شما '..Tamdid..'  تومان می باشد.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.\n\n💳 شما می توانید از طریق درگاه امن پی پینگ یا شماره حساب واحد فروش عملیات پرداختی را انجام دهید  :\n\n\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
end
sendText(msg.chat.id,'️⭕️ مدیر گرامی : '..username..'\n فاکتور تمدید ربات شما به پیوی ارسال شده است لطفا چک بفرمایید.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.',0,'html',keyboard2)
sendText(owner_id,txt,0,'md',keyboard)
sendText(Sudoid,txtsudo,0,'md',keyboard3)
end




if 2 == cday and not base:sismember(TD_ID..'Gp2:'..msg.chat.id,'chex2')  then
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'chex2')
base:srem(TD_ID..'Gp2:'..msg.chat.id,'chex3')
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
local url  = https.request(BASSE .. '/getChatMember?chat_id='..msg.chat.id..'&user_id='..BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' then
if exportChatInviteLink(msg.chat.id) then
link = exportChatInviteLink(msg.chat.id).result
base:set(TD_ID..'Link:'..msg.chat.id,link)
end
else
link = 'ربات بـہ قسمت باطل کردن لینک دسرسی ندارد'
end
local keyboard3 = {}
keyboard3.inline_keyboard = {{
},{{text = '• دعوت به گروه',callback_data = 'Ramin:AddMan:'..msg.chat.id},
{text = '• لغو نصب',callback_data = 'Ramin:left:'..msg.chat.id} ,
}}

tarikh = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
local IDS = "• نام گروہ: "..msg.chat.title.."\n• تعداد ممبر: "..membersgroup.."\n• توضیحات گروه :\n"..about.."\n\n• لینک گروہ:\n"..link..""

local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '🏦 تمدید ربات',url='https://telegram.me/'..Sudo1..''}
}}

local keyboard2 = {}
keyboard2.inline_keyboard = {{
{text = '🧾 نمایش فاکتور',url='https://telegram.me/'..Paybot..''}
}}
if owner_name then
username = '<a href="tg://user?id='..owner_id..'">'..check_html(owner_name)..'</a>'
else
username = '<a href="tg://user?id='..owner_id..'">'..owner_id..'</a>'
end

if tonumber(membersgroup) <= tonumber(1000) then
Tamdid = 8000
txt = ''..IDS..'\n\n⭕️ مدیر گرامی : '..check_html(owner_name)..'\n\n💸صورت حساب تمدید ربات شما به صورت زیر است لطفا چک بفرمایید\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000ممبر گروه 8 هزار تومان است.\n\n📌مالک عزیز '..check_html(owner_name)..' شما درحال حاضر '..membersgroup..' ممبر دارید. با توجه به فاکتور پیش فرض تعداد ممبر شما به بالاتر از 1000 تا ممبرگروه نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.\n\n👈 از اعتبار گروه شما کمتر از 2 روز باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.\n\n💳 شما می توانید از طریق درگاه امن پی پینگ یا شماره حساب واحد فروش عملیات پرداختی را انجام دهید  :\n\n🚬 شماره کارت : \n'..cardnumber ..'\n 👤به نام : '..namecard ..'\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txtsudo = ''..IDS..'\n\n💸تمدید ربات این گروه فرا رسیده است.\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000ممبر گروه 8 هزار تومان است.\n\n📌گروه  '..check_html(msg.chat.title)..' درحال حاضر '..membersgroup..' ممبر دارد. با توجه به فاکتور پیش فرض تعداد ممبر این گروه به بالاتر از 1000 تا  نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
else
x = tonumber(membersgroup) / 1000
Babi = x * 100
Tamdid = Babi + 8000
txt = ''..IDS..'\n\n⭕️ مدیر گرامی :\n\n💸صورت حساب تمدید ربات شما به صورت زیر است لطفا چک بفرمایید\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000 ممبر گروه 8 هزار تومان است.\n\n📌گروه  '..check_html(msg.chat.title)..' درحال حاضر '..membersgroup..' ممبر گروه دارد. با توجه به فاکتور تنظیم شده از طرف تیم  تعداد ممبر بالاتر از 1000 تا می باشد  هزینه ی اضافه تنظیم شده برحسب تعداد ممبر گروه می باشد\n\n💵 مبلغ تمدید ماهانه ربات  شما '..Tamdid..'  تومان می باشد.\n\n👈 از اعتبار گروه کمتر از 2 روز باقی مانده است.\n\n 🚬 شماره کارت : \n'..cardnumber..'\n 👤به نام : '..namecard ..'\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txtsudo = ''..IDS..'\n\n💸تمدید ربات این گروه فرا رسیده است.\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000 ممبر گروه 8 هزار تومان است.\n\n📌مالک عزیز @'..Config.Sudo1..' درحال حاضر '..membersgroup..' ممبر گروه دارد. با توجه به فاکتور تنظیم شده از طرف تیم  تعداد ممبر بالاتر از 1000 تا می باشد  هزینه ی اضافه تنظیم شده برحسب تعداد ممبر گروه می باشد.\n\n💵 مبلغ تمدید ماهانه ربات  شما '..Tamdid..'  تومان می باشد.\n\n👈 از اعتبار گروه کمتر از 2 روز باقی مانده است.\n\n💳 شما می توانید از طریق درگاه امن پی پینگ یا شماره حساب واحد فروش عملیات پرداختی را انجام دهید  :\n\n\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
end
sendText(msg.chat.id,'️⭕️ مدیر گرامی : '..username..'\n فاکتور تمدید ربات شما به پیوی ارسال شده است لطفا چک بفرمایید.\n\n👈 از اعتبار گروه شما کمتر از 2 روز باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.',0,'html',keyboard2)
sendText(owner_id,txt,0,'md',keyboard)
sendText(Sudoid,txtsudo,0,'md',keyboard3)

end

if 3 == cday and not base:sismember(TD_ID..'Gp2:'..msg.chat.id,'chex3')  then
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'chex3')
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
local url  = https.request(BASSE .. '/getChatMember?chat_id='..msg.chat.id..'&user_id='..BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' then
if exportChatInviteLink(msg.chat.id) then
link = exportChatInviteLink(msg.chat.id).result
base:set(TD_ID..'Link:'..msg.chat.id,link)
end
else
link = 'ربات بـہ قسمت باطل کردن لینک دسرسی ندارد'
end
local keyboard3 = {}
keyboard3.inline_keyboard = {{
},{{text = '• دعوت به گروه',callback_data = 'Ramin:AddMan:'..msg.chat.id},
{text = '• لغو نصب',callback_data = 'Ramin:left:'..msg.chat.id} ,
}}

tarikh = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
local IDS = "• نام گروہ: "..msg.chat.title.."\n• تعداد ممبر: "..membersgroup.."\n• توضیحات گروه :\n"..about.."\n\n• لینک گروہ:\n"..link..""

local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '🏦 تمدید ربات',url='https://telegram.me/'..Sudo1..''}
}}

local keyboard2 = {}
keyboard2.inline_keyboard = {{
{text = '🧾 نمایش فاکتور',url='https://telegram.me/'..Paybot..''}
}}
if owner_name then
username = '<a href="tg://user?id='..owner_id..'">'..check_html(owner_name)..'</a>'
else
username = '<a href="tg://user?id='..owner_id..'">'..owner_id..'</a>'
end

if tonumber(membersgroup) <= tonumber(1000) then
Tamdid = 8000
txt = ''..IDS..'\n\n⭕️ مدیر گرامی : '..check_html(owner_name)..'\n\n💸صورت حساب تمدید ربات شما به صورت زیر است لطفا چک بفرمایید\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000ممبر گروه 8 هزار تومان است.\n\n📌مالک عزیز '..check_html(owner_name)..' شما درحال حاضر '..membersgroup..' ممبر دارید. با توجه به فاکتور پیش فرض تعداد ممبر شما به بالاتر از 1000 تا ممبرگروه نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.\n\n👈 از اعتبار گروه شما کمتر از 3 روز باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.\n\n💳 شما می توانید از طریق درگاه امن پی پینگ یا شماره حساب واحد فروش عملیات پرداختی را انجام دهید  :\n\n🚬 شماره کارت : \n'..cardnumber ..'\n 👤به نام : '..namecard ..'\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txtsudo = ''..IDS..'\n\n💸تمدید ربات این گروه فرا رسیده است.\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000ممبر گروه 8 هزار تومان است.\n\n📌گروه  '..check_html(msg.chat.title)..' درحال حاضر '..membersgroup..' ممبر دارد. با توجه به فاکتور پیش فرض تعداد ممبر این گروه به بالاتر از 1000 تا  نرسیده و هیچ هزینه ی اضافه برای شما ثبت نشده است.\n\n👈 از اعتبار گروه شما کمتر از 24 ساعت باقی مانده است.\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
else
x = tonumber(membersgroup) / 1000
Babi = x * 100
Tamdid = Babi + 8000
txt = ''..IDS..'\n\n⭕️ مدیر گرامی :\n\n💸صورت حساب تمدید ربات شما به صورت زیر است لطفا چک بفرمایید\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000 ممبر گروه 8 هزار تومان است.\n\n📌گروه  '..check_html(msg.chat.title)..' درحال حاضر '..membersgroup..' ممبر گروه دارد. با توجه به فاکتور تنظیم شده از طرف تیم  تعداد ممبر بالاتر از 1000 تا می باشد  هزینه ی اضافه تنظیم شده برحسب تعداد ممبر گروه می باشد\n\n💵 مبلغ تمدید ماهانه ربات  شما '..Tamdid..'  تومان می باشد.\n\n👈 از اعتبار گروه کمتر از 3 روز باقی مانده است.\n\n 🚬 شماره کارت : \n'..cardnumber..'\n 👤به نام : '..namecard ..'\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txtsudo = ''..IDS..'\n\n💸تمدید ربات این گروه فرا رسیده است.\n\n🔖 هزینه پیش فرض به صورت ماهانه با  1000 ممبر گروه 8 هزار تومان است.\n\n📌مالک عزیز @'..Config.Sudo1..' درحال حاضر '..membersgroup..' ممبر گروه دارد. با توجه به فاکتور تنظیم شده از طرف تیم  تعداد ممبر بالاتر از 1000 تا می باشد  هزینه ی اضافه تنظیم شده برحسب تعداد ممبر گروه می باشد\n\n💵 مبلغ تمدید ماهانه ربات  شما '..Babi..'  تومان می باشد.\n\n👈 از اعتبار گروه کمتر از 3 روز باقی مانده است.\n\n💳 شما می توانید از طریق درگاه امن پی پینگ یا شماره حساب واحد فروش عملیات پرداختی را انجام دهید  :\n\n\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ فاکتور: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
end
sendText(msg.chat.id,'️⭕️ مدیر گرامی : '..username..'\n فاکتور تمدید ربات شما به پیوی ارسال شده است لطفا چک بفرمایید.\n\n👈 از اعتبار گروه شما کمتر از 3 روز باقی مانده است.با استفاده از گزینه های زیر لطفا هر چه سریع تر اقدام به تمدید نمایید.',0,'html',keyboard2)
sendText(owner_id,txt,0,'md',keyboard)
sendText(Sudoid,txtsudo,0,'md',keyboard3)
end



if not is_sudo1(msg.from.id) then
if not base:get(TD_ID..'ExpireData:'..msg.chat.id) and base:sismember(TD_ID..'Gp2:'..msg.chat.id,'added') then
base:srem(TD_ID..'Gp2:'..msg.chat.id,'added')
creator = getAdminlist(msg.chat.id) or ''
links = base:get(TD_ID..'Link:'..msg.chat.id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '• تمدید ربات ازدرگاه •',url = pardd1}
}}
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '• دعوت به گروه',callback_data = 'Ramin:AddMan:'..msg.chat.id},
{text = '• لغو نصب',callback_data = 'Ramin:left:'..msg.chat.id},
}}

sendText(Sudoid,'❌ اتمام اعتبار گروه: '..msg.chat.title..'\n• مالک گروہ: [@'..owner_name:escape_hard()..']\n• لینک گروہ : '..link..'\n⭕️ ربات از گروه '..msg.chat.title..'به علت تمدید نکردن در '..raminsal..' خارج واز لیست گروه ها حذف شد!',0,'md',keyboard)
sendText(msg.chat.id,'❌ اتمام اعتبار گروه: '..msg.chat.title..'\n• مالک گروہ: [@'..owner_name:escape_hard()..']\n• لینک گروہ : '..link..'\n⭕️ ربات از گروه '..msg.chat.title..'به علت تمدید نکردن در '..raminsal..' خارج واز لیست گروه ها حذف شد!',0,'md',keyboard)
sendText(owner_id,'❌ اتمام اعتبار گروه: '..msg.chat.title..'\n• مالک گروہ: [@'..owner_name:escape_hard()..']\n• لینک گروہ : '..link..'\n⭕️ ربات از گروه '..msg.chat.title..'به علت تمدید نکردن در '..raminsal..' خارج واز لیست گروه ها حذف شد!',0,'md',keyboard)
sendText(msg.chat.id,'😐بـہ امید دیدار','md')
leave(msg.chat.id)
end
end
end

if msg.chat.type == 'private' and #base:smembers(TD_ID..'gpuser:'..msg.from.id) == 1 or msg.chat.type == 'supergroup' and is_Mod(msg.chat.id,msg.from.id) then
local Ramin = msg.from.id
local gps = base:smembers(TD_ID..'gpuser:'..Ramin)
if msg.chat.type == 'supergroup' then
gpname = msg.chat.title
Ramincht = msg.chat.id
end
if msg.chat.type == "private" then
for k,v in pairs(gps) do
Ramincht = v
gpname = base:get(TD_ID..'StatsGpByName'..Ramincht) or 'Not Found'
end
end
if (Black == 'limitadmins' or Black == 'دسترسی ادمین ها') and is_Owner(msg.chat.id,msg.from.id) then
GetCmdAdmins(msg,Ramincht,msg.message_id,'send')
end
if (Black == 'admins' or Black == 'ادمین ها') and is_Owner(msg.chat.id,msg.from.id) then
GetAdmins(msg,Ramincht,msg.message_id,'send')
end


end
---IS_SUDO
if is_Sudo(msg) then






if Black == 'gpdisplaylist' or Black == 'نمایش لیست گروه ها' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:Exhlp:'..msg.chat.id
else
mssss = 'Ramin:Exhlp:'..msg.chat.id
end
list = base:smembers(TD_ID..'group:')
t = '☟ لیست وضعیت گروه های نصب شده تا الان(صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 5
for k,v in pairs(list) do
GroupsName = base:get(TD_ID..'StatsGpByName'..v) or 'حذف شده'
links = base:get(TD_ID..'Link:'..v)
if links then
link = links
else
link = LinkSuppoRt
end

expire = base:ttl(TD_ID..'ExpireData:'..v)
if expire == -1 then
lang = base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
if lang then
EXPIRE = 'Unlimited'
else
EXPIRE = '🌀 شارژ مادالعمر'
end
else
d = math.floor(expire/day ) + 1
if lang then
EXPIRE = ''..d..' Day'
else
EXPIRE = '🗓 '..d..' روز'
end
end
if (k > silntlstt - 5) and (k < silntlstt + 1) then

t = t..'🄾نام گروه :`'..GroupsName..'`\n🆔 *'..v..'*\n🅸:*'..EXPIRE..'* اعتبار\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
end
end
if #list == 0 then
t = '◂ هیچ گروهی درسیستم ربات ثبت نشده است!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂',callback_data = 'Ramin:Exhlp:'..msg.chat.id}}}
sendText(msg.chat.id,t,msg.message_id, 'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂ ', callback_data = mssss}}}
sendText(msg.chat.id,t,msg.message_id, 'md',keyboard)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:gplist2:'..msg.chat.id}}}
sendText(msg.chat.id,t,msg.message_id, 'md',keyboard)
end
end

if Black == 'panelgp' or Black == 'مدیریت گروه ها' then
PG = 0
local keyboard = {}
keyboard.inline_keyboard = {}
list = base:smembers(TD_ID..'group:')
if #list == 0 then
txt = 'لیست گروه هاے مدیریت ['..botusername..'](tg://user?id='..TD_ID..') خالی میباشد'
else
txt = '• به لیست کلی گزارشات نصبی وتنظیم ربات ['..botusername..'](tg://user?id='..TD_ID..')خوش امدید.\n• برای تنظیم پنل مدیریتی گروه دلخواه دکمه (تنظیم پنل) یا برای تنظیم لینک گروه (نمایش لینک) را کلیک کنید.\n• با برای تغییرات شارژ ربات دکمه(نمایش اعتبار گروه) را کلیک کنید\n'
for k,v in pairs(list) do
GroupsName = base:get(TD_ID..'StatsGpByName'..v)
links = base:get(TD_ID..'Link:'..v)
expire = base:ttl(TD_ID..'ExpireData:'..v)
if expire == -1 then
lang = base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
if lang then
EXPIRE = 'Unlimited'
else
EXPIRE = '🌀 شارژ مادالعمر'
end
else
d = math.floor(expire/day ) + 1
if lang then
EXPIRE = ''..d..' Day'
else
EXPIRE = '🗓 '..d..' روز'
end
end
if txt then
temp = {{{text = ''..Alphaee(k)..')'..GroupsName..'',url=links,callback_data = 'Ramin:NotAdmin:'..v}
},{
{text = ''..EXPIRE..'',callback_data = 'Black:'..v},{text = '⚙️ تنظیم پنل',callback_data = 'Ramin:gpmenu:'..v}
},{
{text = '• نمایش لینک •',callback_data = 'Ramin:SetGpLink:'..v}
,},}
end
if(k<4)then
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else

temp = {{{text= '➲ بعدی',callback_data = 'ChatsPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
break;
end
end
temp = {{{text= 'خروج ☒',callback_data = 'Ramin:Exit:-219201071'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
sendText(msg.chat.id,txt,msg.message_id, 'md',keyboard)
end

if Black == 'stats' or Black == 'آمار ربات' then
ID = base:scard('ID:')
sgpsfree = base:scard(TD_ID..'SuperGpFree')
sgps = base:scard(TD_ID..'SuperGp')
gp = base:scard(TD_ID..'Chat:Normal') or 0
users = base:scard(TD_ID..'ChatPrivite') or 0
tab = base:scard(TD_ID..'AGTMute:') or 0
user = io.popen('whoami'):read('*a')
totald = io.popen('du -h /var/lib/redis/dump.rdb'):read('*a')
txt = '» تعداد کل ایدی کاربران : '..Alphafa(tostring(ID))..'\n» تعدادکل سوپرگروه رایگان : '..Alphafa(tostring(sgpsfree))..'\n» تعدادکل سوپرگروها : '..Alphafa(tostring(sgps))..'\n» تعداد کاربران پیوی : '..Alphafa(tostring(users))..'\n» تعداد تبچی : '..Alphafa(tostring(tab))..''
sendText(msg.chat.id,txt,msg.message_id, 'md')
end
end
lang = base:sismember(TD_ID..'Gp2:'..msg.chat.id,'diamondlang')


if msg.chat.type == 'supergroup' and is_Mod(msg.chat.id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'added') then

if (Black == 'menu' or Black == 'فهرست' or Black == 'پنل')  and is_ModPanelCmd(msg.chat.id,msg.from.id) and is_JoinChannel(msg)  then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd = '• 〔[ヅ](tg://user?id='..msg.from.id..')بخش مورد نظر را انتخاب کنید〕'
else
txtmmd = '👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه اصلی 』'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,1))
end

if (Black == 'spamclicker'  or Black == 'عملیات ضد کلیکر تبچی')  and is_ModPanelCmd(msg.chat.id,msg.from.id) then 
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd = '• 〔[ヅ](tg://user?id='..msg.from.id..')بخش مورد نظر را انتخاب کنید〕'
else
txtmmd = '👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
txt = '• 〔🔺[کاربر](tg://user?id='..msg.from.id..') عزیز این دکمه ارسال شده جهت گول زدن ربات های کلیکر هست لطفا رو دکمه نمایش داده شده را لمس نکنید درصورت لمس کردن 3بار از گروه محدود خواهید شد!\n\n❗️ نکته مهم اینه که  ممکنه گروه شما به علت زیاد بودن ربات های تبچی از تعداد ممبرهای گروه کمتر خواهد شد!'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,15))
end





if (Black == 'tag' or Black == 'تگ' or Black == 'پنل تگ')  and is_ModPanelCmd(msg.chat.id,msg.from.id) and is_JoinChannel(msg)  then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd = '• 〔[ヅ](tg://user?id='..msg.from.id..')بخش مورد نظر را انتخاب کنید〕'
else
txtmmd = '👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 تگ کاربر ها(اعلام حضور) 』'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,35))
end

if (Black == 'panel clean'  or Black == 'پنل پاکسازی')  and is_ModPanelCmd(msg.chat.id,msg.from.id) and is_JoinChannel(msg)  then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd = '• 〔🔺[کاربر](tg://user?id='..msg.from.id..') عزیز جهت عملیات پاکسازی لطفا بخش مورد نظر را لمس کنید!\n\n'
else
txtmmd = '▁▁▁▂▂▂▂▂▂▂▁▁▁\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
txt = '• 〔🔺[کاربر](tg://user?id='..msg.from.id..') عزیز جهت عملیات پاکسازی لطفا بخش مورد نظر را لمس کنید!\n\n'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,65))
end

if Black and (Black:match('^◈ پاکسازی کلی پیام انجام شد.')) then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
local CleanText = base:get(TD_ID..'CleanText:'..msg.chat.id)
txtmmd = ''..CleanText..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◄ مدیر عزیز پاکسازی پیام گروه شما به تعداد بیشتر نیاز هست دکمه {`پاکسازی دوباره`}با برای اتمام عملیات پاکسازی دکمه {` انصراف` }را لمس کنید!'
else
txtmmd = '👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
local CleanText = base:get(TD_ID..'CleanText:'..msg.chat.id)
txt = ''..CleanText..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◄ مدیر عزیز پاکسازی پیام گروه شما به تعداد بیشتر نیاز هست دکمه {`پاکسازی دوباره`}یا برای اتمام عملیات پاکسازی دکمه {` انصراف` }را لمس کنید!'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,66))
end


if (Black == 'menupv' or Black == 'فهرست پیوی' or Black == 'پنل پیوی')  and is_ModPanelCmd(msg.chat.id,msg.from.id) and is_JoinChannel(msg)  then
txt = 'جهت تنظیمات ربات لطفا یکی از دکمه های زیر را لمس کنید.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• تنظیم پنل در پیوی •',url = "https://telegram.me/"..Paybot.."?start=menu:"..msg.chat.id}}}
sendText(msg.chat.id,'• مدیر عزیز ['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..') پنل مدیریتی به پیوی شما ارسال شد.',msg.message_id,'md',keyboard)
sendText(msg.from.id,txt,0, 'md',menu(msg.chat.id,1))
end

if (Black == 'help' or Black == 'راهنما')  and is_ModPanelCmd(msg.chat.id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd= ''
else
txtmmd = '▁▁▁▂▂▂▂▂▂▂▁▁▁\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
gp = base:get(TD_ID..'StatsGpByName'..msg.chat.id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه راهنما 』'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,3))
end
 
if is_Sudo(msg) then
if (Black == 'helpsudo' or Black == 'راهنما سودو')  then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'PanelPv') then
txtmmd= ''
else 
txtmmd = '▁▁▁▂▂▂▂▂▂▂▁▁▁\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
end
dofile('./Alpha/time.lua')
txt = '• 〔 به راهنمای سودو ربات ['..NameBot..'](tg://user?id='..BotJoiner..') خوش آمدید !〕'
sendText(msg.chat.id,txt,msg.message_id, 'md',menu(msg.chat.id,85))
end
end


if Black and (Black:match("^عکس اول (.*)$")) and msg.reply_to_message then
WelcomeText = Black:match("^عکس اول (.*)$")
if msg.reply_to_message.photo then
base:set("Welcome:Photo1", msg.reply_to_message.photo[1].file_id)
Stext = "• انجام شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
end
end

if Black and (Black:match("^عکس دوم (.*)$")) and msg.reply_to_message then
WelcomeText = Black:match("^عکس دوم (.*)$")
if msg.reply_to_message.photo then
base:set("Welcome:Photo2", msg.reply_to_message.photo[1].file_id)
Stext = "• انجام شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
end
end

if Black and (Black:match("^عکس سوم (.*)$")) and msg.reply_to_message then
WelcomeText = Black:match("^عکس سوم (.*)$")
if msg.reply_to_message.photo then
base:set("Welcome:Photo3", msg.reply_to_message.photo[1].file_id)
Stext = "• انجام شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
end
end
if Black and (Black:match("^عکس چهارم (.*)$")) and msg.reply_to_message then
WelcomeText = Black:match("^عکس چهارم (.*)$")
if msg.reply_to_message.photo then
base:set("Welcome:Photo4", msg.reply_to_message.photo[1].file_id)
Stext = "• انجام شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
end
end


if Black and (Black:match("^[Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee] (.*)$") or Black:match("^تنظیم خوش امدگویی (.*)$")) and msg.reply_to_message then
WelcomeText = Black:match("^[Ss][Ee][Tt][Ww][Ee][Ll][Cc][Oo][Mm][Ee] (.*)$") or Black:match("^تنظیم خوش امدگویی (.*)$")
base:set(TD_ID.."Text:Welcome:" .. msg.chat.id, "🌸" .. WelcomeText)
if msg.reply_to_message.audio then
base:del(TD_ID.."Welcome:Photo" .. msg.chat.id)
base:del(TD_ID.."Welcome:Gif" .. msg.chat.id)
base:del(TD_ID.."Welcome:voice" .. msg.chat.id)
base:del(TD_ID.."Welcome:video" .. msg.chat.id)
base:set(TD_ID.."Welcome:Document" .. msg.chat.id, msg.reply_to_message.audio.file_id)
Stext = "• متن خوشآمدگویی با آهنگ تنظیم شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
elseif msg.reply_to_message.voice then
base:del(TD_ID.."Welcome:Photo" .. msg.chat.id)
base:del(TD_ID.."Welcome:Gif" .. msg.chat.id)
base:del(TD_ID.."Welcome:Document" .. msg.chat.id)
base:set(TD_ID.."Welcome:voice" .. msg.chat.id, msg.reply_to_message.voice.file_id)
Stext = "• متن خوشآمدگویی با ویس تنظیم شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
elseif msg.reply_to_message.video then
base:del(TD_ID.."Welcome:Photo" .. msg.chat.id)
base:del(TD_ID.."Welcome:Document" .. msg.chat.id)
base:del(TD_ID.."Welcome:Gif" .. msg.chat.id)
base:del(TD_ID.."Welcome:voice" .. msg.chat.id)
base:set(TD_ID.."Welcome:video" .. msg.chat.id, msg.reply_to_message.video.file_id)
Stext = "• متن خوشآمدگویی با فیلم تنظیم شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')

elseif msg.reply_to_message.animation then
base:del(TD_ID.."Welcome:Photo" .. msg.chat.id)
base:del(TD_ID.."Welcome:Document" .. msg.chat.id)
base:del(TD_ID.."Welcome:voice" .. msg.chat.id)
base:del(TD_ID.."Welcome:video" .. msg.chat.id)
base:set(TD_ID.."Welcome:Gif" .. msg.chat.id, msg.reply_to_message.animation.file_id)
Stext = "• متن خوشآمدگویی با گیف تنظیم شد "
sendText(msg.chat.id,Stext,msg.message_id, 'html')
elseif msg.reply_to_message.photo then
base:del(TD_ID.."Welcome:Document" .. msg.chat.id)
base:del(TD_ID.."Welcome:voice" .. msg.chat.id)
base:del(TD_ID.."Welcome:Gif" .. msg.chat.id)
base:del(TD_ID.."Welcome:video" .. msg.chat.id)
base:set(TD_ID.."Welcome:Photo" .. msg.chat.id, msg.reply_to_message.photo[1].file_id)
Stext = "• متن خوشآمدگویی با عکس تنظیم شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
elseif msg.reply_to_message.video_note then
base:del(TD_ID.."Welcome:Document" .. msg.chat.id)
base:del(TD_ID.."Welcome:voice" .. msg.chat.id)
base:del(TD_ID.."Welcome:video" .. msg.chat.id)
base:del(TD_ID.."Welcome:Photo" .. msg.chat.id)
base:del(TD_ID.."Welcome:Gif" .. msg.chat.id)
base:set(TD_ID.."Welcome:videonote" .. msg.chat.id, msg.reply_to_message.video_note.file_id)
Stext = "• متن خوشآمدگویی با فیلم سلفی تنظیم شد !"
sendText(msg.chat.id,Stext,msg.message_id, 'html')
end
end




if Black == 'config' or Black == 'پیکربندی' and is_Owner(msg.chat.id,msg.from.id)  and is_JoinChannel(msg) then
local t = 'مالک گروہ :\n'
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
t = t..''..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..'\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
base:sadd(TD_ID..'OwnerList:'..msg.chat.id,owner_id)
base:sadd(TD_ID..'gpuser:'..owner_id,msg.chat.id)
end
end
end
t = t..'لیست مدیران گروہ :\n'
list = getChatAdministrators(msg.chat.id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id
admin_names = v.user.first_name
t = t..k..' - '..'['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'..'\n'
base:sadd(TD_ID..'ModList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModCleanList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModBanList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModMuteList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModWarnList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModLockList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModpanelList:'..msg.chat.id,admin_ids)
base:sadd(TD_ID..'ModVipList:'..msg.chat.id,admin_ids)
end
end
end
local ramin = base:smembers(TD_ID..'ModList:'..msg.chat.id)
for k,v in pairs(ramin) do
ram = k
end
sendReply(msg,' ◈ [مالک گروه](tg://user?id='..owner_id..')'..' به عنوان مالکیت گروه و به تعداد '..Alphaee(ram)..' ادمین گروه به عنوان مدیران گروه ارتقا یافتند.',true)
end

-------------------------Cmd Start------------------------------

if (Black == 'limitcommand' or Black == 'دسترسی' )  then
if msg.reply_to_message then
user = msg.reply_to_message.from.id
name = msg.reply_to_message.from.username or msg.reply_to_message.from.id
remoteCmd(msg,msg.chat.id,user,'send',name,msg.message_id)
end
end
if (msg.text and msg.text:match('^limitcommand (%d+)') or msg.text:match('^دسترسی (%d+)'))  then
local BDSource = msg.text:match('^limitcommand (%d+)') or msg.text:match('^دسترسی (%d+)')
if BDSource then
username = "["..base:get(TD_ID..'FirstName:'..BDSource).."](tg://user?id="..BDSource..")"
else
username = "["..base:get(TD_ID..'UserName:'..BDSource).."](tg://user?id="..BDSource..")"
end
remoteCmd(msg,msg.chat.id,BDSource,'send',BDSource,msg.message_id)
end

if msg.text and (msg.text:match('^limitcommand @(.*)') or msg.text:match('^دسترسی @(.*)'))   then
local username = msg.text:match('^limitcommand @(.*)') or msg.text:match('^دسترسی @(.*)')
print(username)
print(base:get(TD_ID.."CloudUsers:@"..username))
local userid = base:get(TD_ID.."CloudUsers:@"..username)
if userid then
txt = ''..userid..''
else
txt = ''..userid..''
end
remoteCmd(msg,msg.chat.id,txt,'send',txt,msg.message_id)
end

if (Black == 'adminanony'  or Black == 'ادمین ناشناس' )  and is_ModPanelCmd(msg.chat.id,msg.from.id) then
if msg.reply_to_message then
user = msg.reply_to_message.from.id
name = msg.reply_to_message.from.username or msg.reply_to_message.from.id
remote(msg,msg.chat.id,user,'send',name,msg.message_id)
end
end



if (Black == 'manager' or Black == 'ریموت' or Black == 'مدیریت' or Black == 'تنظیم کاربر') and is_JoinChannel(msg)  and is_ModPanelCmd(msg.chat.id,msg.from.id) then
if msg.reply_to_message then
user = msg.reply_to_message.from.id
name = msg.reply_to_message.from.username or msg.reply_to_message.from.id
remote(msg,msg.chat.id,user,'send',name,msg.message_id)
end
end
if (msg.text and msg.text:match('^manager (%d+)') or msg.text:match('^مدیریت (%d+)'))  then
local BDSource = msg.text:match('^manager (%d+)') or msg.text:match('^مدیریت (%d+)')
if BDSource then
username = "["..base:get(TD_ID..'FirstName:'..BDSource).."](tg://user?id="..BDSource..")"
else
username = "["..base:get(TD_ID..'UserName:'..BDSource).."](tg://user?id="..BDSource..")"
end
remote(msg,msg.chat.id,username,'send',username,msg.message_id)
end

if msg.text and (msg.text:match('^manager @(.*)') or msg.text:match('^مدیریت @(.*)'))   then
local username = msg.text:match('^manager @(.*)') or msg.text:match('^مدیریت @(.*)')
print(username)
print(base:get(TD_ID.."CloudUsers:@"..username))
local userid = base:get(TD_ID.."CloudUsers:@"..username)
if base:get(TD_ID.."CloudUsers:@"..username) then
txt = ''..base:get(TD_ID.."CloudUsers:@"..username)..''
else
txt = ''..base:get(TD_ID.."CloudUsers:@"..username)..''
end
remote(msg,msg.chat.id,txt,'send',txt,msg.message_id)
end








--------fun------------------------------
if Black == 'corana stats' or  Black == 'آمار کرونا' and is_JoinChannel(msg) then
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Iran')
if res ~= 200 then
end
local jdat1 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=United%20States')
if res ~= 200 then
end
local jdat2 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=India')
if res ~= 200 then
end
local jdat3 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Brazil')
if res ~= 200 then
end
local jdat4 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=France')
if res ~= 200 then
end
local jdat5 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Russia')
if res ~= 200 then
end
local jdat6 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Spain')
if res ~= 200 then
end
local jdat7 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=United%20Kingdom')
if res ~= 200 then
end
local jdat8 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Italy')
if res ~= 200 then
end
local jdat9 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Turkey')
if res ~= 200 then
end
local jdat10 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Afghanistan')
if res ~= 200 then
end
local jdat11 = json:decode(url)
local  url , res = https.request('https://api.codebazan.ir/corona/?type=country&country=Azerbaijan')
if res ~= 200 then
end
local jdat12 = json:decode(url)
cases1 = jdat1.result.cases
country1 = jdat1.result.country
deaths1 = jdat1.result.deaths
recovered1 = jdat1.result.recovered
cases2 = jdat2.result.cases
country2 = jdat2.result.country
deaths2 = jdat2.result.deaths
recovered2 = jdat2.result.recovered
cases3 = jdat3.result.cases
country3 = jdat3.result.country
deaths3 = jdat3.result.deaths
recovered3 = jdat3.result.recovered
cases4 = jdat4.result.cases
country4 = jdat4.result.country
deaths4 = jdat4.result.deaths
recovered4 = jdat4.result.recovered
cases5 = jdat5.result.cases
country5 = jdat5.result.country
deaths5 = jdat5.result.deaths
recovered5 = jdat5.result.recovered
cases6 = jdat6.result.cases
country6 = jdat6.result.country
deaths6 = jdat6.result.deaths
recovered6 = jdat6.result.recovered
cases7 = jdat7.result.cases
country7 = jdat7.result.country
deaths7 = jdat7.result.deaths
recovered7 = jdat7.result.recovered
cases8 = jdat8.result.cases
country8 = jdat8.result.country
deaths8 = jdat8.result.deaths
recovered8 = jdat8.result.recovered
cases9 = jdat9.result.cases
country9 = jdat9.result.country
deaths9 = jdat9.result.deaths
recovered9 = jdat9.result.recovered
cases10 = jdat10.result.cases
country10 = jdat10.result.country
deaths10 = jdat10.result.deaths
recovered10 = jdat10.result.recovered
cases11 = jdat11.result.cases
country11 = jdat11.result.country
deaths11 = jdat11.result.deaths
recovered11 = jdat11.result.recovered
cases12 = jdat12.result.cases
country12 = jdat12.result.country
deaths12 = jdat12.result.deaths
recovered12 = jdat12.result.recovered
sendText(msg.chat.id,'» کشور : '..country1..'\n 🕷آمار کل :'..cases1..' \n☠️ فوت شده : '..deaths1..'\n♻️ بهبود یافته : '..recovered1..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country2..'\n 🕷آمار کل :'..cases2..' \n☠️ فوت شده : '..deaths2..'\n♻️ بهبود یافته : '..recovered2..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country3..'\n 🕷آمار کل :'..cases3..' \n☠️ فوت شده : '..deaths3..'\n♻️ بهبود یافته : '..recovered3..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country4..'\n 🕷آمار کل :'..cases4..' \n☠️ فوت شده : '..deaths4..'\n♻️ بهبود یافته : '..recovered4..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country5..'\n 🕷آمار کل :'..cases5..' \n☠️ فوت شده : '..deaths5..'\n♻️ بهبود یافته : '..recovered5..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country6..'\n 🕷آمار کل :'..cases6..' \n☠️ فوت شده : '..deaths6..'\n♻️ بهبود یافته : '..recovered6..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country7..'\n 🕷آمار کل :'..cases7..' \n☠️ فوت شده : '..deaths7..'\n♻️ بهبود یافته : '..recovered7..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country8..'\n 🕷آمار کل :'..cases8..' \n☠️ فوت شده : '..deaths8..'\n♻️ بهبود یافته : '..recovered8..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country9..'\n 🕷آمار کل :'..cases9..' \n☠️ فوت شده : '..deaths9..'\n♻️ بهبود یافته : '..recovered9..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country4..'\n 🕷آمار کل :'..cases10..' \n☠️ فوت شده : '..deaths10..'\n♻️ بهبود یافته : '..recovered10..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country11..'\n 🕷آمار کل :'..cases11..' \n☠️ فوت شده : '..deaths11..'\n♻️ بهبود یافته : '..recovered11..'\n┈┅┅━━━━✦━━━┅┅┈\n» کشور : '..country12..'\n 🕷آمار کل :'..cases12..' \n☠️ فوت شده : '..deaths12..'\n♻️ بهبود یافته : '..recovered12..'\n┈┅┅━━━━✦━━━┅┅┈\n',msg.message_id,"md")
end

if Black == 'danestani' or  Black == 'دانستنی' and is_JoinChannel(msg) then
local  url , res = https.request('http://api.novateamco.ir/danestani/')
if res ~= 200 then
end
local jdat = json:decode(url)
result = jdat.result
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '🌏 دانستنی بعدی 🌏',callback_data = 'Ramin:danestani:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}
}
sendText(msg.chat.id,result,msg.message_id, 'md',keyboard)
end
if  Black == 'شعر حافظ' and is_JoinChannel(msg) then
local  url , res = https.request('http://api.novateamco.ir/falhafez/')
if res ~= 200 then
end
local jdat = json:decode(url)
result = jdat.result
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '🔮 شعر حافظ بعدی 🔮',callback_data = 'Ramin:hafez:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}
}
sendText(msg.chat.id,result,msg.message_id, 'md',keyboard)
end

if Black and (Black:match('^nextone (.*)') or Black:match('^نکست وان (.*)')) and is_JoinChannel(msg) then
local name = Black:match('^nextone (.*)') or Black:match('^موزیک (.*)')
result, res = https.request("https://api.codebazan.ir/music/?type=search&query="..name.."&page=1")
if res ~= 200 then
return sendText(msg.chat.id,"مشکل در ارتباط با سرور!",msg.message_id,'md')
else
data = json:decode(result)
if data.Ok then
text = '『 موزیک شما در نکست وان 』 '
for k,v in pairs(data.Result) do
text = text..'\n🎧'..v.Title..'\n📥[دانلود آهنگ]('..v.Link..')\n'
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id}
}
}
return sendText(msg.chat.id,""..text.."\n",msg.message_id,'md',keyboard)
else
return sendText(msg.chat.id,"اشکال در ایجاد کلمه لطفا دوباره تلاش کنید!",msg.message_id,'md')
end
end
end
if (Black == 'sher' or Black == 'شعر') and is_JoinChannel(msg)  then
local url , res = http.request('http://c.ganjoor.net/beyt-json.php')
if res ~= 200 then
return
end
local jdat = json:decode(url)
text = "*"..jdat.m1.."* \n *"..jdat.m2.."*\nسروده شده توسط \n ——————————\n👤"..jdat.poet
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '🥀 بریم شعر بعدی 🥀',callback_data = 'Ramin:shere:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}
}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end

if (Black == 'diyalog' or Black == 'دیالوگ ماندگار') and is_JoinChannel(msg)  then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/dialog/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '💫 دیالوگ ماندگار بعدی 💫',callback_data = 'Ramin:dialog:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}
}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end






if (Black == 'tosticker' or Black == 'تبدیل به استیکر') and is_JoinChannel(msg) then
if msg.reply_to_message then
if msg.reply_to_message.photo then
PhotoFile = msg.reply_to_message.photo[4] or msg.reply_to_message.photo[3] or msg.reply_to_message.photo[2] or msg.reply_to_message.photo[1]
PhotoFileId = PhotoFile.file_id
PhotoPathRes = getRes("getFile?file_id="..PhotoFileId)
if PhotoPathRes.ok then
FilePath = PhotoPathRes.result.file_path
FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
PathToSave = "./Alpha/data"
Photo = download(FileUrl,PathToSave,"BD.web")
sendSticker(msg.chat.id,Photo,msg.message_id)
end
else
sendReply(msg,'فقط #عکس ها قابل تبدیل میباشد',true)
end
end
end
 




if (Black == 'joke' or Black == 'جوک') and is_JoinChannel(msg) then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/jok/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '😂 جوک بعدی 😂',callback_data = 'Ramin:joke:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end

if (Black == 'khatereh text' or Black == 'خاطرات خنده دار') and is_JoinChannel(msg) then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/jok/khatere/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '😀 خاطرات خنده دار بعدی 😀',callback_data = 'Ramin:khatereh:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end
if (Black == 'pnp' or Black == 'پ ن پ') and is_JoinChannel(msg) then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/jok/pa-na-pa/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '🤪 جوکهای پ ن پ بعدی 🤪',callback_data = 'Ramin:pnp:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end
if (Black == 'dastan' or Black == 'داستان کوتاه') and is_JoinChannel(msg) then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/dastan/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '✍🏻 داستان کوتاه بعدی ✍🏻',callback_data = 'Ramin:dastan:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end
if (Black == 'biogerafi' or Black == 'بیوگرافی باحال') and is_JoinChannel(msg)  then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/bio/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '🥰 بیوگرافی بعدی 🥰',callback_data = 'Ramin:biogerafi:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
sendText(msg.chat.id,text,msg.message_id, 'md',keyboard)
end


------------------------------------------------------------
if Black and (Black:match('^لیست کل حذف') or  Black:match('^list memberall (.*)')) then
silntlst = base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
end
list = base:smembers('Del:')
num = base:scard('Del:')
t = '☟ لیست کاربران  ربات (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* کاربر تلگرام\n\n'
silntlstt = silntlst * 5
for k,v in pairs(list) do
if (k > silntlstt - 5) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list == 0 then
t = '» لیست کاربران خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:IDlist:'..msg.chat.id},
{text = '≼ بعدی ', callback_data = 'Ramin:IDlist1:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end



if Black and (Black:match('^لیست کل کاربران') or  Black:match('^list memberall (.*)')) then
silntlst = base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
end
list = base:smembers('ID:')
num = base:scard('ID:')
t = '☟ لیست کاربران  ربات (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* کاربر تلگرام\n\n'
silntlstt = silntlst * 5
for k,v in pairs(list) do
if (k > silntlstt - 5) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list == 0 then
t = '» لیست کاربران خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:IDlist:'..msg.chat.id},
{text = '≼ بعدی ', callback_data = 'Ramin:IDlist1:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end




if Black and (Black:match('^لیست تبچی') or  Black:match('^list tabchi (.*)')) then
silntlst = base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
end
list = base:smembers(TD_ID..'AGTMute:')
num = base:scard(TD_ID..'AGTMute:')
t = '☟ لیست کاربران  تبچی ها (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* تبچی \n\n'
silntlstt = silntlst * 20
for k,v in pairs(list) do
if (k > silntlstt - 20) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list == 0 then
t = '» لیست تبچی خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:tabchilist:'..msg.chat.id},
{text = '≼ بعدی ', callback_data = 'Ramin:tabchilist1:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end



if Black and (Black:match('^لیست سکوت') or  Black:match('^list mute (.*)')) then
silntlst = base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
end
list = base:smembers(TD_ID..'MuteList:'..msg.chat.id)
t = '☟ لیست کاربران  سکوت شده (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'daymute:'..msg.chat.id..v)
if day then
d = day
else
d = 'نامشخص'
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n\n('..d..')\n'
end
end
if #list == 0 then
t = '» لیست سکوت درحال حاضر خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:silentlist:'..msg.chat.id},
{text = '≼ بعدی ', callback_data = 'Ramin:silentlist1:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end

if Black and (Black:match('^لیست سکوت رسانه') or  Black:match('^list mutemedia (.*)')) then
silntlst = base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
end
list = base:smembers(TD_ID..'MuteMediaList:'..msg.chat.id)
t = '☟ لیست کاربران  سکوت رسانه (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'daymute:'..msg.chat.id..v)
if day then
d = day
else
d = 'نامشخص'
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n\n('..d..')\n'
end
end
if #list == 0 then
t = '» لیست سکوت رسانه درحال حاضر خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:silentlistmedia:'..msg.chat.id},
{text = '≼ بعدی ', callback_data = 'Ramin:silentlistmedia1:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end



if Black and (Black:match('^لیست مسدود') or  Black:match('^list ban (.*)'))  then
silntlst = base:get(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers(TD_ID..'BanUser:'..msg.chat.id)
t = '☟ لیست کاربران  مسدود شده ها(صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'dayban:'..msg.chat.id..v)

t = t..''..k..'-['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n'
end
end
if #list == 0 then
t = '» لیست مسدود درحال حاضر خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
--Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:banlist:'..msg.chat.id},
{text = '≼ بعدی ', callback_data = 'Ramin:banlist1:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end

if Black and (Black:match('^لیست اخطار') or  Black:match('^list warn (.*)'))  then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message_id.. ":" .. msg.chat.id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message_id .. ":" .. msg.chat.id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..msg.chat.id
else
mssss = 'Ramin:warnlist:'..msg.chat.id
end
list = base:hkeys(TD_ID..msg.chat.id..':warn')
t = '☟ لیست کاربران  اخطار (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
cont = base:hget(TD_ID..msg.chat.id..':warn',v)
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
if not base:get(TD_ID..'Warn:Max:'..msg.chat.id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat.id)
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n✧تعداد اخطار :*'..(cont - 1)..'*از'..warn..'\n'
end
end
if #list == 0 then
t = 'لیست اخطار ها خالی می باشد.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanwarnlist:'..msg.chat.id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id},},}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '≼ بعدی  ', callback_data = 'Ramin:warnlist1:'..msg.chat.id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanwarnlist:'..msg.chat.id}
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id}}}
sendText(msg.chat.id,t,msg.message_id,'md',keyboard)
end
end

if (Black == 'لینک پیوی' or Black == 'لینک عکسدار پیوی' or Black == 'لینک عکس دار پیوی' or Black == 'لینک گروه پیوی') and is_JoinChannel(msg)  and is_ModPanelCmd(msg.chat.id,msg.from.id) then
local Rank = getChatMember(msg.chat.id,msg.from.id)
local Ran = Rank.result.status
local rank = "---"
if Ran == "creator" then
rank = "مالک گروه"
elseif Ran == "administrator" then
rank = "ادمین گروه"
elseif Ran == "member" then
rank = "کاربر عادی"
else
rank = "---"
end
local typ = msg.chat.type
local typs = "---"
if typ == "supergroup" then
typs = "Supergroup"
elseif typ == "group" then
typs = "Group Manual"
else
typs = "---"
end
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
if not getChat(msg.chat.id).result.photo then
local IDS = "◈ نام گروه : "..msg.chat.title.."\n◈ نوع گروه : "..typs.."\n◈ تعداد ممبر: "..membersgroup.."\n◈ بیوگرافی گروه:\n"..about.."\n\n◈ لینک گروه:\n"..link..""
local keyboard = {}
keyboard.inline_keyboard = {{
{text=' مراجعه به پیوی ربات ',url='https://t.me/'..Paybot..''},},}
sendText(msg.chat.id,'• لینک گروه به پیوی شما ارسال شد!',msg.message_id, 'html',keyboard)
sendText(msg.from.id,IDS,msg.message_id, 'html',keyboard)
else
local IDS = "◈ نام گروه : "..msg.chat.title.."\n◈ نوع گروه : "..typs.."\n◈ تعداد ممبر: "..membersgroup.."\n◈ بیوگرافی گروه:\n"..about.."\n\n◈ لینک گروه:\n"..link..""
if getChat(msg.chat.id).result.photo then
local fileid = getChat(msg.chat.id).result.photo.big_file_id
downloadFile(fileid, "./Alpha/photo"..msg.chat.title..".jpg")
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text=' مراجعه به پیوی ربات ',url='https://t.me/'..Paybot..''},},}
sendText(msg.chat.id,'• لینک گروه به پیوی شما ارسال شد!',msg.message_id, 'html',keyboard)
sendPhoto2(msg.from.id, "./Alpha/photo"..msg.chat.title..".jpg",IDS)
else
return IDS
end
end
end



if (Black == 'لینک عکس دار' or Black == 'لینک عکسدار' or Black == 'لینک' or Black == 'لینک گروه') and is_JoinChannel(msg) and is_ModPanelCmd(msg.chat.id,msg.from.id) then
local Rank = getChatMember(msg.chat.id,msg.from.id)
local Ran = Rank.result.status
local rank = "---"
if Ran == "creator" then
rank = "مالک گروه"
elseif Ran == "administrator" then
rank = "ادمین گروه"
elseif Ran == "member" then
rank = "کاربر عادی"
else
rank = "---"
end
local typ = msg.chat.type
local typs = "---"
if typ == "supergroup" then
typs = "Supergroup"
elseif typ == "group" then
typs = "Group Manual"
else
typs = "---"
end
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
if not getChat(msg.chat.id).result.photo then
local IDS = "◈ نام گروه : "..msg.chat.title.."\n◈ نوع گروه : "..typs.."\n◈ تعداد ممبر: "..membersgroup.."\n◈ بیوگرافی گروه:\n"..about.."\n\n◈ لینک گروه:\n"..link..""
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '◈ اشتراک لینک',url ='https://telegram.me/share/url?url='..link..'/&text=لینک گروه' }
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exit:'..msg.chat.id}}}
sendText(msg.chat.id,IDS,msg.message_id, 'md',keyboard)
else
local IDS = "◈ نام گروه : "..msg.chat.title.."\n◈ نوع گروه : "..typs.."\n◈ تعداد ممبر: "..membersgroup.."\n◈ بیوگرافی گروه:\n"..about.."\n\n◈ لینک گروه :\n"..link.."\n"
if getChat(msg.chat.id).result.photo then
local fileid = getChat(msg.chat.id).result.photo.big_file_id
downloadFile(fileid, "./Alpha/photo"..msg.chat.title..".jpg")
sendPhoto2(msg.chat.id, "./Alpha/photo"..msg.chat.title..".jpg",IDS)
else
return IDS
end
end
end


if Black == 'اشتراک لینک'  and is_JoinChannel(msg) and is_ModPanelCmd(msg.chat.id,msg.from.id) then

local Rank = getChatMember(msg.chat.id,msg.from.id)
local Ran = Rank.result.status
local rank = "---"
if Ran == "creator" then
rank = "مالک گروه"
elseif Ran == "administrator" then
rank = "ادمین گروه"
elseif Ran == "member" then
rank = "کاربر عادی"
else
rank = "---"
end

local typ = msg.chat.type
local typs = "---"
if typ == "supergroup" then
typs = "Supergroup"
elseif typ == "group" then
typs = "Group Manual"
else
typs = "---"
end

local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end

if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end



local IDS = "◈ نام گروه : "..msg.chat.title.."\n◈ نوع گروه : "..typs.."\n◈ تعداد ممبر: "..membersgroup.."\n◈ بیوگرافی گروه:\n"..about.."\n\n"
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '◈ اشتراک لینک',url ='https://telegram.me/share/url?url='..invitelink..'' }
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exit:'..msg.chat.id}}}
sendText(msg.chat.id,IDS,msg.message_id, 'md',keyboard)
end


if msg.photo then
PhotoFile = msg.photo[4] or msg.photo[3] or msg.photo[2] or msg.photo[1]
PhotoFileId = PhotoFile.file_id
PhotoPathRes = getRes("getFile?file_id="..PhotoFileId)
if PhotoPathRes.ok then
FilePath = PhotoPathRes.result.file_path
FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
PathToSave = "./Alpha/data"
Ramin = download(FileUrl,PathToSave,"Porn.jpg")
vardump(msg) 
local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse/1.1" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_image=@Alpha/data/Porn.jpg"'):read('*all')  
local jdat = json:decode(curl)    
--sendText(msg.chat.id,jdat.porn_moderation.porn_content,msg.message_id, 'html')
if jdat.status then 
if jdat.status == 'failure' then  
elseif jdat.status == 'success' then
if jdat.porn_moderation.porn_content == true then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'Pornmutehallat') then
KickUser(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #عکس ارسال شده  شما پورن🔞 می باشد از گروه اخراج شد!',0, 'md')
else
MuteMedia(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #عکس ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محروم شد!',0, 'md')
end
deleteMessages(msg.chat.id,msg.message_id)
PornType = 'true'
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز #عکس ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محدود شدید!',0, 'md')
local IDS = "🔥 گزارش دریافت قفل پورن \n\n◈ وضعیت سیستم :"..jdat.status.." \n◈ نام گروه : "..msg.chat.title.."\n◈ کاربر ["..msg.from.first_name.."]|"..msg.from.id..")\n◈ وضعیت پورن:"..PornType..""
sendPhoto2(-1001192346957, "./Alpha/data/Porn.jpg",IDS)
else 
end  
end   
end   
end 
end



if (Black == 'پروفایل من') and is_JoinChannel(msg)  and is_ModPanelCmd(msg.chat.id,msg.from.id) then
if not msg.reply_id then
local pro = GetUserProFilePhoto(msg.from.id,0,3)
vardump(msg)
if pro.result.total_count == 0 then
yid = "• شناسه: "
yusername = "• یوزرنیم: @"
yname =  "• نام: "
local text = yname..firstname.."\n"..yid..'`'..msg.from.id..'`'.."\n"..yusername..(username or "---").."\n"
return text
else
yid = "• شناسه: "
yusername = "• یوزرنیم: @"
yname =  "• نام:"
local text = yname..msg.from.first_name.."\n"..yid..msg.from.id.."\n"..yusername..(username_2 or "---").."\n"
local GetArryPhotos = pro.result.photos
local profilephotos ={}
for k in pairs(GetArryPhotos) do
profilephotos[k] = {type = "photo",media = GetArryPhotos[k][3].file_id,caption = text}
end 
local keyboard = {}
keyboard.inline_keyboard = {{
{text= '⊴ بستن',callback_data = 'Ramin:Exit:'..msg.chat.id}}}
SendMedia(msg.chat.id,JSON.encode(profilephotos),msg.message_id,keyboard)

end
end
if msg.reply_id and not msg.reply.fwd_from then
return '`'..msg.reply.id..'`'
end
end





---GetLimitCmd
if is_Owner(msg.chat.id,msg.from.id) then
mmd = base:get(TD_ID..'limit_cmd'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:limitcmd:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'دستور '..Black..'\nبـہ لیست محدودیت دستورات افزودہ شد\n\nتوصیـہ میشود کـہ هم دستور انگلیسی و هم دستور فارسی دستور مورد نظر خود را بـہ لیست اضافـہ کنید پس اگر فقط یک مورد را اضافـہ کردہ اید اقدام بـہ اضافـہ کردن دستور دیگر کنید !',keyboard,'md')
base:sadd(TD_ID..'LimitCmd:'..msg.chat.id,Black)
base:del(TD_ID..'limit_cmd'..msg.chat.id..msg.from.id)
end
mmd = base:get(TD_ID..'limit_cmds'..msg.chat.id..msg.from.id)
if Black and mmd then
editMessageText(msg.chat.id,tonumber(mmd),'دستور '..Black..'\nاز لیست محدودیت دستورات حذف شد\n\nبا مراجعـہ بـہ لیست دستورات محدود شدہ مطمئن شوید این دستور با زبان دیگر خود محدود نشدہ باشد !',keyboard,'md')
base:srem(TD_ID..'LimitCmd:'..msg.chat.id,Black)
base:del(TD_ID..'limit_cmds'..msg.chat.id..msg.from.id)
end

mmd = base:get(TD_ID..'limit_editsudo'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'ویرایش بازگشت دستور 🔃 ',callback_data = 'Ramin:editsudo1:'..msg.chat.id},
{text = 'ریست پاسخ ♻️',callback_data = 'Ramin:editsudoreset:'..msg.chat.id}
},{{text = 'بازگشت ◂',callback_data = 'Ramin:editlo:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'◈ متن پاسخگوی دستور [افزودن سودو] به : \n *'..Black..'* \nتغییر یافت! \n ⚡️ نکته : جهت ویرایش بازگشت دستور افزودن سودو دکمه ویرایش بازگشت دستور لمس کنید!',keyboard,'md')
base:set(TD_ID..'Text:editsudo:',Black)
base:del(TD_ID..'limit_editsudo'..msg.chat.id..msg.from.id)
end
mmd = base:get(TD_ID..'limit_editsudo1'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:editlo:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'◈ متن پاسخگوی دستور بازگشتی [افزودن سودو] به : \n *'..Black..'* \nتغییر یافت!',keyboard,'md')
base:set(TD_ID..'Text:editsudo1:',Black)
base:del(TD_ID..'limit_editsudo1'..msg.chat.id..msg.from.id)
end

mmd = base:get(TD_ID..'limit_editsudorem'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'ویرایش بازگشت دستور 🔃 ',callback_data = 'Ramin:editsudorem1:'..msg.chat.id},
{text = 'ریست پاسخ ♻️',callback_data = 'Ramin:editsudoreset:'..msg.chat.id}
},{{text = 'بازگشت ◂',callback_data = 'Ramin:editlo:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'◈ متن پاسخگوی دستور [حذف سودو] به : : \n *'..Black..'* \nتغییر یافت! \n⚡️ نکته : جهت ویرایش بازگشت دستور حذف سودو دکمه ویرایش بازگشت دستور لمس کنید!',keyboard,'md')
base:set(TD_ID..'Text:editsudorem:',Black)
base:del(TD_ID..'limit_editsudorem'..msg.chat.id..msg.from.id)
end
mmd = base:get(TD_ID..'limit_editsudorem1'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:editlo:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'◈ ◈ متن پاسخگوی دستور بازگشتی [حذف سودو] به : \n *'..Black..'* \nتغییر یافت!',keyboard,'md')
base:set(TD_ID..'Text:editsudorem1:',Black)
base:del(TD_ID..'limit_editsudorem1'..msg.chat.id..msg.from.id)
end


--GetFilter

mmd = base:get(TD_ID..'limit_filterjoin'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' کلمه *'..Black..'*\nبه لیست فیلترجوین اجباری کلمات اضافه شد!',keyboard,'md')
base:sadd(TD_ID..'Filtersjoin:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filterjoin'..msg.chat.id..msg.from.id)
end


mmd = base:get(TD_ID..'limit_filterjoin'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'کلمه *'..Black..'*\nاز لیست فیلتر جوین اجباری کلمات حذف شد',keyboard,'md')
base:srem(TD_ID..'Filtersjoin:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filteradd'..msg.chat.id..msg.from.id)
end


mmd = base:get(TD_ID..'limit_filtername'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' اسم  *'..Black..'*\nدرلیست غیر مجاز شده ها قرار گرفت!',keyboard,'md')
base:sadd(TD_ID..'FilterName:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filtername'..msg.chat.id..msg.from.id)
end

mmd = base:get(TD_ID..'limit_filtername'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'اسم *'..Black..'*\nاز لیست غیرمجاز شده ها حذف شد!',keyboard,'md')
base:srem(TD_ID..'FilterName:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filtername'..msg.chat.id..msg.from.id)
end

mmd = base:get(TD_ID..'limit_filterbio'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' بیوگرافی  *'..Black..'*\nدرلیست غیر مجاز شده ها قرار گرفت!',keyboard,'md')
base:sadd(TD_ID..'FilterBio:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filterbio'..msg.chat.id..msg.from.id)
end
mmd = base:get(TD_ID..'limit_filtername'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'بیوگرافی *'..Black..'*\nاز لیست غیرمجاز شده ها حذف شد!',keyboard,'md')
base:srem(TD_ID..'FilterBio:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filterbio'..msg.chat.id..msg.from.id)
end


mmd = base:get(TD_ID..'limit_WelcomeText'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Wlc:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' متن خوش آمدگویی گروه شما : \n *'..Black..'*',keyboard,'md')
base:set(TD_ID..'Text:Welcome:'..msg.chat.id,Black)
base:del(TD_ID..'limit_WelcomeText'..msg.chat.id..msg.from.id)
end


mmd = base:get(TD_ID..'limit_filteradd'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'کلمه *'..Black..'*\nاز لیست فیلتر ادا اجباری کلمات حذف شد',keyboard,'md')
base:srem(TD_ID..'Filtersjoin:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filterjoin'..msg.chat.id..msg.from.id)
end

mmd = base:get(TD_ID..'limit_SetStartCl'..msg.chat.id..msg.from.id)
if Black and Black:match('(%d+):(%d+)')  and mmd then
local CmdFa = {
string.match(Black, "(%d+):(%d+)")
}
local Matches1 = CmdFa[1]
local Matches2 = CmdFa[2]
local End = Matches1..":"..Matches2 + 1
local Start = Matches1..":"..Matches2
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto2:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' • پاکسازی خودکار پیام گروه فعال شد! \nپاکسازی خودکار پیام ها هر روز در ساعت '..Start..' به صورت کامل پاکسازی خواهد شد!\n━┄┅┄┅┄┅┄┅┄┅┄┅┄━\nبرای غیرفعال کردن پاکسازی خودکار پیام از دستور زیر استفاده نمایید :\n• *پاکسازی خودکار پیام غیرفعال*',keyboard,'md')
base:sadd(TD_ID..'Gp2:'..chat_id,'autoclener')
base:set(TD_ID.."DelaUtO"..chat_id,Start)
base:set(TD_ID.."DelaUtO2"..chat_id,End)
--base:setex(TD_ID..'limit_SetStartCl'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
end

mmd = base:get(TD_ID..'limit_SetStartAuto'..msg.chat.id..msg.from.id)
if Black and Black:match('(%d+):(%d+)-(%d+):(%d+)')  and mmd then
local CmdFa = {
string.match(Black, "(%d+):(%d+)-(%d+):(%d+)")
}
local Matches1 = CmdFa[1]
local Matches2 = CmdFa[2]
local Matches3 = CmdFa[3]
local Matches4 = CmdFa[4]
local End = Matches3..":"..Matches4
local Start = Matches1..":"..Matches2
if End == Start then
editMessageText(msg.chat.id,tonumber(mmd),'ساعت ارسالی شما اشتباه می باشد ساعت استارت با ساعت پایانی نمی تواند درسیستم ربات ثبت شود.',keyboard,'md')
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' • زمان قفل خودکار گروه تنظیم شده به : \n*'..Start..'* الی *'..End..'*\n━┄┅┄┅┄┅┄┅┄┅┄┅┄━\nبه صورت اتوماتیک قفل خودکار تنظیم شده در گروه انجام خواهد شد! ',keyboard,'md')
base:sadd(TD_ID..'Gp2:'..chat_id,'autoon')
base:set(TD_ID.."atolct1"..chat_id,Start)
base:set(TD_ID.."atolct2"..chat_id,End)
--base:setex(TD_ID..'limit_SetEndAuto'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
end
end


mmd = base:get(TD_ID..'limit_SetStartPin'..msg.chat.id..msg.from.id)
if Black and Black:match('(%d+):(%d+)-(%d+):(%d+)')  and mmd then
local CmdFa = {
string.match(Black, "(%d+):(%d+)-(%d+):(%d+)")
}
local Matches1 = CmdFa[1]
local Matches2 = CmdFa[2]
local Matches3 = CmdFa[3]
local Matches4 = CmdFa[4]
local End = Matches3..":"..Matches4
local Start = Matches1..":"..Matches2
if End == Start then
editMessageText(msg.chat.id,tonumber(mmd),'ساعت ارسالی شما اشتباه می باشد ساعت استارت با ساعت پایانی نمی تواند درسیستم ربات ثبت شود.',keyboard,'md')
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' • زمان سنجاق خودکار تنظیم شده به : \n*'..Start..'* الی *'..End..'*\n━┄┅┄┅┄┅┄┅┄┅┄┅┄━\nبه صورت اتوماتیک سنجاق تنظیم شده در گروه انجام خواهد شد!',keyboard,'md')
base:set(TD_ID.."Autopin1"..chat_id,Start)
base:set(TD_ID.."Autopin2"..chat_id,End)
--base:setex(TD_ID..'limit_SetStartPin'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
end
end

mmd = base:get(TD_ID..'limit_SetMsgPin'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' متن ارسال شده شما :\n *'..Black..'*\n\n درسیستم ربات تنظیم شد!',keyboard,'md')
base:set(TD_ID.."MsgPin"..msg.chat.id,Black)
base:del(TD_ID..'limit_SetMsgPin'..msg.chat.id..msg.from.id)
end



mmd = base:get(TD_ID..'limit_filname'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipnl:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' نام کاربر *'..Black..'*\nارسالی در لیست  تبچی از نوع تاییده توسط ادمین ها اضافه شد!',keyboard,'md')
base:sadd(TD_ID..'FilterTab:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filname'..msg.chat.id..msg.from.id)
end
mmd = base:get(TD_ID..'limit_filname'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipnl:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'نام کاربر *'..Black..'*\nارسالی در لیست  تبچی از نوع تاییده توسط ادمین ها حذف شد!',keyboard,'md')
base:srem(TD_ID..'FilterTab:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filterjoin'..msg.chat.id..msg.from.id)
end









mmd = base:get(TD_ID..'limit_filteradd'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' کلمه *'..Black..'*\nبه لیست فیلتر اد اجباری کلمات اضافه شد!',keyboard,'md')
base:sadd(TD_ID..'Filtersjoin:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filteradd'..msg.chat.id..msg.from.id)
end


mmd = base:get(TD_ID..'limit_filteradd'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'کلمه *'..Black..'*\nاز لیست فیلتر ادا اجباری کلمات حذف شد',keyboard,'md')
base:srem(TD_ID..'Filtersjoin:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filterjoin'..msg.chat.id..msg.from.id)
end



mmd = base:get(TD_ID..'limit_filter'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),' کلمه '..Black..'\nبـہ لیست فیلتر کلمات افزودہ شد',keyboard,'md')
base:sadd(TD_ID..'Filters:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filter'..msg.chat.id..msg.from.id)
end


mmd = base:get(TD_ID..'limit_filters'..msg.chat.id..msg.from.id)
if Black and mmd then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(mmd),'کلمه '..Black..'\nاز لیست فیلتر کلمات حذف شد',keyboard,'md')
base:srem(TD_ID..'Filters:'..msg.chat.id,Black)
base:del(TD_ID..'limit_filters'..msg.chat.id..msg.from.id)
end
links = base:get(TD_ID..'links'..msg.chat.id..msg.from.id)
if Black and Black:match('/joinchat/') or Black:match('/t.me/') and links then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'ورود بـہ پنل ⫸',callback_data = 'Ramin:menu:'..msg.chat.id}}}
editMessageText(msg.chat.id,tonumber(links),'لینک شما باموفقیت ثبت شد\n'..msg.text,keyboard)
sendText(Sudoid,'♨ لینک گروہ با موفقیت تغییر یافت !\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n',0,false,keyboard)
base:set(TD_ID..'Link:'..msg.chat.id,msg.text)
base:del(TD_ID..'links'..msg.chat.id..msg.from.id)
end

end
end--BotAdded
end--supergroup

if is_Mod(msg.chat.id,msg.from.id) then
if msg.chat.type == 'supergroup' then
if Black == 'fixadd' then
ChatId = msg.chat.id
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'FixAdd')
sendReply(msg,'Group Fixed',true)
end

if (Black == 'installcleaner'  or Black == 'نصب رایگان') then
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
sendText(-1001472763096,'نصب '..invitelink..'',0,'md')
--sendText(ChatId,'• 〔نصب وراه اندازی ربات به صورت کامل انجام شد .〕',0,'md')
end--]]

--promotemember(chat_id,tonumber(msg.reply.id),0,0,0,1,1,1,1,0)
if Black and (Black:match('^(.*)'))  then
promotemember(msg.chat.id,BotCliId,1,1,1,1,1,1,1,1)
end





if (Black == 'installfree' or Black == 'نصب رایگان' or Black == 'addfree' or Black == '/start@AlphaAntiFree1_Bot') then
if not  base:sismember(TD_ID..'Gp2:'..msg.chat.id,'FixAdd') then
GpName = ec_name(msg.chat.title)
else
GpName = '#عدم ساپورت'
end
local membersgroup = ( membersCount(msg.chat.id).result or "--")
if tonumber(membersgroup) < 20 then
sendText(chat_id,'leave '..msg.chat.id..'',0,'md')
local keyboard = {}
keyboard.inline_keyboard = {{
{text=' کانال دستورات • ',url='https://t.me/'..Channel..''},},}
sendText(msg.chat.id,'◈ کاربر عزیز  ['..ec_name(msg.from.first_name)..'](tg://user?id='..msg.from.id..') از انتخاب شما سپاسگزاریم !\n ربات درگروه '..GpName..'  نصب نشد تعداد ممبر از 20 عدد کمتر می باشد!\n ربات از گروه شما خارج شد!',0,'md',keyboard)
leave(msg.chat.id)
else
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'added') then
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'Welcomeon')
if not  base:sismember(TD_ID..'Gp2:'..msg.chat.id,'FixAdd') then
GpName = ec_name(msg.chat.title)
else
GpName = '#عدم ساپورت'
end 
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' 🔥 نصب ربات کمکی 🔥 ',callback_data = 'Ramin:addcleaner:'..msg.chat.id},
},{
{text = '  ⚡️ ورود به پنل مدیریتی ⚡️',callback_data = 'Ramin:menu:'..msg.chat.id},
}}
promotemember(msg.chat.id,TD_ID,0,0,0,1,1,1,1,0)
sendText(msg.chat.id,' ◈ کاربر عزیز  ['..ec_name(msg.from.first_name)..'](tg://user?id='..msg.from.id..') \n ربات درگروه '..GpName..'  قبلان در سیستم ربات نصب شده است!',0,'md',keyboard)
else

if not  base:sismember(TD_ID..'Gp2:'..msg.chat.id,'FixAdd') then
GpName = ec_name(msg.chat.title)
else
GpName = '#عدم ساپورت'
end
local t = '`مالک گروہ` :\n'
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.first_name
t = t..''..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..'\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
base:sadd(TD_ID..'OwnerList:'..msg.chat.id,owner_id)
end
end
end
t = t..'ادمین ها گروه :\n'
list = getChatAdministrators(msg.chat.id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id
admin_names = v.user.first_name
t = t..k..' - '..'['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'..'\n'
end
end
end
t = t..''
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end

base:set(TD_ID..'StatsGpByName'..msg.chat.id,GpName)
if not base:get(TD_ID..'ExpireDatafree:') then
num = "31"
else
num = base:get(TD_ID..'ExpireDatafree:')
end
base:setex(TD_ID..'ExpireData:'..msg.chat.id,day*num,true)
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'added')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Link')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Username')
base:set(TD_ID.."warn_stats"..msg.chat.id,"silenttime")
base:set(TD_ID..'mutetime:'..msg.chat.id,3600)
base:set(TD_ID..'Warn:Max:'..msg.chat.id,3)
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Bots')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Ban:Bots')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Channelpost')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Hyper')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Username')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Sticker')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Inline')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Mention')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Tag')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Location')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Forward')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Contact')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Gif')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Video')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Videomsg')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Game')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Document')
base:sadd(TD_ID..'Gp:'..msg.chat.id,'Del:Biolink')
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'Welcomeon')
base:set(TD_ID.."sg:link"..msg.chat.id,"del")
base:set(TD_ID.."sg:hyper"..msg.chat.id,"del")
base:set(TD_ID.."sg:post"..msg.chat.id,"del")
base:set(TD_ID.."sg:bot"..msg.chat.id,"del")
base:set(TD_ID.."sg:user"..msg.chat.id,"del")
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = ' 🔥 نصب ربات کمکی 🔥 ',callback_data = 'Ramin:addcleaner:'..msg.chat.id},
},{
{text = ' ⚡️ ورود به پنل مدیریتی ⚡️ ',callback_data = 'Ramin:menu:'..msg.chat.id},
}}
promotemember(msg.chat.id,TD_ID,0,0,0,1,1,1,1,0)
sendText(msg.chat.id,' ◈ مدیر عزیز  ['..ec_name(msg.from.first_name)..'](tg://user?id='..msg.from.id..') \n\n ◀️ ربات در گروه  '..GpName..' با موفقیت نصب و راه اندازی شد خب مرحله آخر نصب ربات کمکی می باشد برای نصب و راه اندازی  دکمه {🔥 نصب ربات کمکی 🔥} را لمس کنید:\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈\n☄️ کانال دستورات : \n@'..escape_markdown(Channel)..'\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ ',0,'md',keyboard)
ChatId = msg.chat.id
local keyboard2 = {}
keyboard2.inline_keyboard = {{
{text = '︾پلن های شارژ گروه︾',callback_data = 'Ramin:ERROR:'..ChatId}
},{
{text = 'شارژ\n1ماهه',callback_data = 'Ramin:planOne:'..ChatId},
{text = 'شارژ\n2ماهه',callback_data = 'Ramin:planTwo:'..ChatId},
{text = 'شارژ\nنامحدود',callback_data = 'Ramin:planThree:'..ChatId}
},{
{text = '• عضویت در گروه',callback_data = 'Ramin:AddMan:'..ChatId},
{text = 'خروج ربات ❌',callback_data = 'Ramin:left:'..ChatId}
},{
{text = 'بستن پنل گزارش',callback_data = 'Ramin:Exitspanl:'..ChatId},},}--]]
txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local typ = msg.chat.type
local typs = "---"
if typ == "supergroup" then
typs = "Supergroup"
elseif typ == "group" then
typs = "Group Manual"
else
typs = "---"
end
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local DescriptionGroup=getChat(msg.chat.id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..msg.chat.id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
local IDS = "\n✔️ نام گروہ جدید: "..msg.chat.title.."\n🎚نوع گروه: "..typs.."\n👨‍👨‍👧‍👦تعداد ممبرگروه: "..membersgroup.."\n📜 توضیحات گروه:\n\n"..about.."\n\n🌐 لینک گروہ:\n"..link..""
Alphainstall = '📜 گزارش نصب ربات دریک گروهی  به صورت تست رایگان \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n👨🏻‍💻 فرد نصب کنندہ ربات : ['..ec_name(msg.from.first_name)..'](tg://user?id='..msg.from.id..')\n🔷 ایدی عددی نصب کنندہ : *'..msg.from.id..'*\n👤 '..t..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁ ⁃\n'..txt..'\n\n'..IDS..''
sendText(935728510,Alphainstall,0,'md',keyboard2)
sendText(-1001472763096,'نصب '..invitelink..'',0,'md')
sendText(BotCliId,'نصب '..invitelink..'',0,'md')
promotemember(msg.chat.id,TD_ID,0,0,0,1,1,1,1,0)
sendText(-1001472763096,Alphainstall,0,'md',keyboard2)

---statsurl
end---if Black
end
end
end
end
--«»SPGS_SUDO«»--
if is_Sudo(msg) then
if msg.chat.type == 'supergroup' then
if Black == 'fixadd' then
base:sadd(TD_ID..'Gp2:'..msg.chat.id,'FixAdd')
sendReply(msg,'Group Fixed',true)
end
if (Black == 'add' or Black == 'نصب') then
if not base:sismember(TD_ID..'Gp2:'..msg.chat.id,'FixAdd') then
GpName = ec_name(msg.chat.title)
else
GpName = '#عدم ساپورت'
end
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'added') then
dofile('./Alpha/time.lua')
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◂ ورود به پنل',callback_data = 'Ramin:menu:'..msg.chat.id}}}
sendText(msg.chat.id,'◂ گروہ : `'..GpName..'`\n قبلان در سیستم لیست ربات نصب شدہ است !',0,'md',keyboard)
else
local t = 'مالک گروہ:'
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.first_name
t = t..''..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..''
base:sadd(TD_ID..'OwnerList:'..msg.chat.id,owner_id)
end
end
end
t = t..''
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ◂ نصب ربات  ',callback_data = 'Add'}},{
{text = ' ╳ لغونصب',callback_data = 'ExitBot'},},}
sendText(msg.chat.id,'◂ مالک ربات ['..ec_name(msg.from.first_name)..'](tg://user?id='..msg.from.id..') جهت انجام عملیات نصب ربات در گروه دکمه مورد نظر خود را لمس کنید.\n',0,'md',keyboard)
end
end

if (Black == 'rem' or Black == 'لغو نصب') then
if not base:sismember(TD_ID..'Gp2:'..msg.chat.id,'FixAdd') then
GpName = ec_name(msg.chat.title)
else
GpName = '#عدم ساپورت'
end
base:del(TD_ID..'joinwarn:'..msg.chat.id)
base:del(TD_ID..'Text:AddTXT:'..msg.chat.id)
base:del(TD_ID..'Text:ChName:'..msg.chat.id)
base:del(TD_ID..'Text:Chjoin:'..msg.chat.id)
base:del(TD_ID..'Gp:'..msg.chat.id)
base:del(TD_ID..'Gp3:'..msg.chat.id)
base:del(TD_ID..'NewUser'..msg.chat.id)
base:del(TD_ID.."ExpireData:"..msg.chat.id)
base:srem(TD_ID.."group:",msg.chat.id)
base:del(TD_ID.."ModList:"..msg.chat.id)
base:del(TD_ID..'OwnerList:'..msg.chat.id)
base:del(TD_ID.."MuteList:"..msg.chat.id)
base:del(TD_ID.."SilentList:"..msg.chat.id)
base:del(TD_ID..'setmode:'..msg.chat.id)
base:del(TD_ID..'Text:Welcome:'..msg.chat.id)
base:del(TD_ID..'settag'..msg.chat.id)
--base:del(TD_ID..'Link:'..msg.chat.id)
base:del(TD_ID..'Pin_id'..msg.chat.id)
base:del(TD_ID..'Textlist:'..msg.chat.id)
base:del(TD_ID..'Text:'..msg.chat.id)
base:del(TD_ID..'CmDlist:'..msg.chat.id)
base:del(TD_ID..'CmD:'..msg.chat.id)
base:del(TD_ID..'EndTimeSee'..msg.chat.id)
base:del(TD_ID..'StartTimeSee'..msg.chat.id)
base:del(TD_ID..'limitpm:'..msg.chat.id)
base:del(TD_ID..'mutetime:'..msg.chat.id)
base:del(TD_ID..'cgmautotime:'..msg.chat.id)
base:del(TD_ID..'cbmtime:'..msg.chat.id)
base:del(TD_ID..'Flood:Max:'..msg.chat.id)
base:del(TD_ID..'Force:Time:'..msg.chat.id)
base:del(TD_ID..'Force:Pm:'..msg.chat.id)
base:del(TD_ID..'joinwarn:'..msg.chat.id)
base:del(TD_ID..'Warn:Max:'..msg.chat.id)
base:del(TD_ID..'NUM_CH_MAX:'..msg.chat.id)
base:del(TD_ID..'setch:'..msg.chat.id)
base:del(TD_ID..'Text:Welcome:'..msg.chat.id)
base:del(TD_ID..'Rules:'..msg.chat.id)
base:del(TD_ID.."sg:sticker"..msg.chat.id)
base:del(TD_ID.."sg:link"..msg.chat.id)
base:del(TD_ID.."sg:gif"..msg.chat.id)
base:del(TD_ID.."sg:edit"..msg.chat.id)
base:del(TD_ID.."sg:file"..msg.chat.id)
base:del(TD_ID.."sg:film"..msg.chat.id)
base:del(TD_ID.."sg:photo"..msg.chat.id)
base:del(TD_ID.."sg:fwd"..msg.chat.id)
base:del(TD_ID.."sg:post"..msg.chat.id)
base:del(TD_ID.."sg:stickers"..msg.chat.id)
base:del(TD_ID.."sg:txt"..msg.chat.id)
base:del(TD_ID.."sg:user"..msg.chat.id)
base:del(TD_ID.."sg:inline"..msg.chat.id)
base:del(TD_ID.."sg:loc"..msg.chat.id)
base:del(TD_ID.."sg:biolink"..msg.chat.id)
base:del(TD_ID.."sg:farsi"..msg.chat.id)
base:del(TD_ID.."sg:english"..msg.chat.id)
base:del(TD_ID.."sg:hyper"..msg.chat.id)
base:del(TD_ID.."sg:mention"..msg.chat.id)
base:del(TD_ID.."sg:voice"..msg.chat.id)
base:del(TD_ID.."sg:music"..msg.chat.id)
base:del(TD_ID.."sg:self"..msg.chat.id)
base:del(TD_ID.."sg:caption"..msg.chat.id)
base:del(TD_ID.."sg:game"..msg.chat.id)
base:del(TD_ID.."sg:tag"..msg.chat.id)
base:del(TD_ID.."sg:bot"..msg.chat.id)
base:del(TD_ID.."sg:contact"..msg.chat.id)
base:del(TD_ID.."sg:malware"..msg.chat.id)
base:del(TD_ID..'Total:messages:'..msg.chat.id)
base:del(TD_ID..'Total:JoinedByLink:'..msg.chat.id)
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat.id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..msg.chat.id..v)
base:del(TD_ID..'Total:AddUser:'..msg.chat.id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat.id..':'..v)
base:del(TD_ID..'Total:BanUser:'..msg.chat.id..':'..v)
base:del(TD_ID..'Total:KickUser:'..msg.chat.id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat.id..':'..os.date("%Y/%m/%d")..':'..v)
end
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'added') then
name = msg.from.username or ec_name(msg.from.first_name)
dofile('./Alpha/time.lua')
txt1 = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txt= '◂ ربات از لیست سیستم گروہ های مدیریتی لغو نصب شد \n\n'..txt1..''
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🔺 نصب مجدد ربات ',callback_data = 'Add'}},{
{text = '❌ خروج ربات',callback_data = 'ExitBot'},},}
sendText(msg.chat.id,txt,0,'md',keyboard)
links = base:get(TD_ID..'Link:'..msg.chat.id)
local t = ''
local status = getChatAdministrators(msg.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.first_name
t = t..''..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..''
end
end
end
t = t..''
if base:get(TD_ID..'Link:'..msg.chat.id) then
link = '\n'..base:get(TD_ID..'Link:'..msg.chat.id)..''
else
link = '\n[لینک گروہ شناسایی نشد !](https://telegram.me/'..Channel..')'
end


if not base:get(TD_ID.."Link:"..msg.chat.id) or not getChat(msg.chat.id).result.invite_link then
GetInvate(msg.chat.id)
local getChat = getChat(msg.chat.id)
if getChat.result.invite_link  then
link = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..msg.chat.id,link)
end
else
link =  '\n[ورود به گروه]('..base:get(TD_ID.."Link:"..msg.chat.id)..')'
end

local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن پنل گزارش',callback_data = 'Ramin:Exitspanl:'..msg.chat.id}}}
dofile('./Alpha/time.lua')

txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
sendText(Sudoid,'♨ گزارش لغو نصب وراـہ اندازی ربات\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات فرد حذف کنندہ \n• نام کاربری : ['..name..'](tg://user?id='..msg.from.id..')\n• ایدی کاربر : '..msg.from.id..' \n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات گروہ حذف شدہ \n• نام گروہ : '..msg.chat.title..'\n• ایدی گروہ :'..msg.chat.id..'\n• مالک گروہ : '..t..'\n'..txt..'\n\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n• لینک گروہ : '..link..'',0,'md',keyboard)
sendText(IDSup,'♨ گزارش لغو نصب وراـہ اندازی ربات\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات فرد حذف کنندہ \n• نام کاربری : ['..name..'](tg://user?id='..msg.from.id..')\n• ایدی کاربر : '..msg.from.id..' \n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات گروہ حذف شدہ \n• نام گروہ : '..msg.chat.title..'\n• ایدی گروہ :'..msg.chat.id..'\n• مالک گروہ : '..t..'\n'..txt..'\n\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n• لینک گروہ : '..link..'',0,'md',keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🔺 نصب مجدد ربات ',callback_data = 'Add'}},{
{text = '❌ خروج ربات',callback_data = 'ExitBot'},},}
txt1 = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
txt= '◂ ربات در لیست نصب شده ها نمی باشد.\n\n'..txt1..''
sendText(msg.chat.id,txt,0,'md',keyboard)
end
base:del(TD_ID..'Gp2:'..msg.chat.id)
base:del(TD_ID..'StatsGpByName'..msg.chat.id)
end
if is_FullSudo(msg) then
if (Black == 'sudopanel' or Black == 'پنل سودو' or Black == 'ویرایش ربات') then
pnlsudo(msg,msg.chat.id,msg.message_id,'send')
end
if Black == 'sudos' or Black == 'سودوها' then
GetSudo('mrr619',msg,'send')
end
if Black == 'fwd pv' or Black == 'فوروارد به پیوی ها'   then
local list = base:smembers(TD_ID..'ChatPrivite')
for i = 1, #list do
forward(list[i],msg.chat.id,msg.reply_to_message.message_id)
end
end
if Black == 'fwd gp' or Black == 'فوروارد به گروه ها'   then
local list = base:smembers(TD_ID..'SuperGp')
for i = 1, #list do
forward(list[i],msg.chat.id,msg.reply_to_message.message_id)
end
end
if Black == 'fwd owner' or Black == 'فوروارد به مالکان'   then
local list = base:smembers(TD_ID..'group:')
for k,v in pairs(list) do
local users = base:smembers(TD_ID..'OwnerList:'..v)
for i = 1, #users do
forward(users[i],msg.chat.id,msg.reply_to_message.message_id)
--sendText(msg.chat.id,"◈ پیام شما به   "..#users.." مالکان گروه ارسال شد!",0,'md')
end
end
end
end
end--SPGS_SUDO
end--SUDO(msg)
end--function(msg)







end--supergroups
----------------------------------------
function callback(msg)
function lock_add(name,mrr)
base:sadd(TD_ID..''..name..''..chat_id,mrr)
end
function lock_rem(arg,data)
base:srem(TD_ID..''..arg..''..chat_id,data)
end
function tdlock(chat_id,BD)
if BD == 'Document' then
text = 'فایل'
elseif BD == 'Inline' then
text = 'اینلاین'
elseif BD == 'Link' then
text = 'ارسال لینک'
elseif BD == 'Weblink' then
text = 'وب'
elseif BD == 'Font' then
text = 'ارسال فونت کلمات'
elseif BD == 'Tag' then
text = 'ارسال تِگ'
elseif BD == 'Game' then
text = 'بازی'
elseif BD == 'Username' then
text = 'ارسال یوزرنیم'
elseif BD == 'Photo' then
text = 'عکس'
elseif BD == 'Gif' then
text = 'تصاویر متحرک'
elseif BD == 'Video' then
text = 'ویدئو'
elseif BD == 'Voice' then
text = 'وویس'
elseif BD == 'Audio' then
text = 'موزیک'
elseif BD == 'Text' then
text = 'متن'
elseif BD == 'Sticker' then
text = 'استیکر'
elseif BD == 'Stickers' then
text = 'استیکر متحرک'
elseif BD == 'Contact' then
text = 'مخاطبین'
elseif BD == 'Forward' then
text = 'فوروارد'
elseif BD == 'Persian' then
text = 'فارسی'
elseif BD == 'English' then
text = 'انگلیسی'
elseif BD == 'Bots' then
text = 'ربات'
elseif BD == 'Channelpost' then
text = 'پست کانال'
elseif BD == 'Videomsg' then
text = 'فیلم سلفی'
elseif BD == 'Location' then
text = 'موقعیت مکانی'
elseif BD == 'Edit' then
text = 'ویرایش'
elseif BD == 'Mention' then
text = 'منشن'
elseif BD == 'Hyper' then
text = 'هایپرلینک'
elseif BD == 'Flood' then
text = 'پیام مکرر'
elseif BD == 'Spam' then
text = 'هرزنامه'
elseif BD == 'Caption' then
text = 'کَپشِن'
elseif BD == 'Biolink' then
text = 'لینک بیو'
elseif BD == 'Malware' then
text = 'بدافزار'
else
text = BD
end
end
--<><>add and rem <><>--

GaUrd = msg.data
ChatId = msg.message.chat.id
lang = base:sismember(TD_ID..'Gp2:'..ChatId,'diamondlang')
ChatName = msg.message.chat.title
ChatType = msg.message.chat.type
User_Id = msg.from.id
User_Name = ec_name(msg.from.first_name)
User_Username = msg.from.username
if GaUrd == 'Add' and is_Sudo(msg) then
base:sadd(TD_ID..'group:',ChatId)
creator = getAdminlist(ChatId) or ''
name = User_Username or User_Name
links = base:get(TD_ID..'Link:'..ChatId)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '︾پلن های شارژ گروه︾',callback_data = 'Ramin:ERROR:'..ChatId}
},{
{text = 'شارژ\n1ماهه',callback_data = 'Ramin:planOne:'..ChatId},
{text = 'شارژ\n2ماهه',callback_data = 'Ramin:planTwo:'..ChatId},
{text = 'شارژ\nنامحدود',callback_data = 'Ramin:planThree:'..ChatId}
},{
{text = '• عضویت در گروه',callback_data = 'Ramin:AddMan:'..ChatId},
{text = 'خروج ربات ❌',callback_data = 'Ramin:left:'..ChatId}
},{
{text = 'بستن پنل گزارش',callback_data = 'Ramin:Exitspanl:'..ChatId},},}--]]

if not base:get(TD_ID.."Link:"..ChatId) or not getChat(ChatId).result.invite_link then
GetInvate(ChatId)
local getChat = getChat(ChatId)
if getChat.result.invite_link  then
links = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..ChatId,links)
end
else
links =  '\n[ورود به گروه]('..base:get(TD_ID.."Link:"..ChatId)..')'
end

local t = '👤سازندہ گروہ :\n'
local status = getChatAdministrators(ChatId)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
t = t..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..'\n'
base:sadd(TD_ID..'gpuser:'..owner_id,ChatId)
end
end
end
t = t..' 👥 ادمین های این گروہ :\n'
list = getChatAdministrators(ChatId)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id
admin_names = v.user.first_name
t = t..'['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'..'\n'
end
end
end
txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
Alphainstall = '📜 گزارش نصب جدید ربات در یک گروہ  \n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n👨🏻‍💻 فرد نصب کنندہ ربات : @'..name..'\n🔷 ایدی عددی نصب کنندہ : *'..User_Id..'*\n✔️ نام گروہ جدید : *'..ChatName..'*\n♨️ شناسـہ عددی گروہ : *'..ChatId..'*\n👤 مالک گروہ جدید : @'..creator..'\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'..txt..'\n'..t..''
sendText(Sudoid,Alphainstall,0,'md',keyboard)
sendText(IDSup,Alphainstall,0,'md',keyboard)
if not base:get(TD_ID..'ExpireData:'..ChatId) or base:get(TD_ID..'ExpireData:'..ChatId) == 'Alpha' then
base:setex(TD_ID..'ExpireData:'..ChatId,day*8,true)
end
Hash = TD_ID..'StatsGpByName'..ChatId
base:set(Hash,ChatName)
base:srem(TD_ID..'Gp2:'..ChatId,'chex3')
base:srem(TD_ID..'Gp2:'..ChatId,'chex2')
base:srem(TD_ID..'Gp2:'..ChatId,'chex1')
base:sadd(TD_ID..'Gp2:'..ChatId,'added')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Link')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Username')
base:set(TD_ID.."warn_stats"..ChatId,"silenttime")
base:set(TD_ID..'mutetime:'..ChatId,3600)
base:set(TD_ID..'Warn:Max:'..ChatId,3)
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Bots')
base:sadd(TD_ID..'Gp:'..ChatId,'Ban:Bots')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Channelpost')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Hyper')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Username')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Sticker')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Inline')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Mention')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Tag')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Location')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Forward')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Contact')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Gif')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Video')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Videomsg')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Game')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Document')
base:sadd(TD_ID..'Gp:'..ChatId,'Del:Biolink')
base:set(TD_ID.."sg:link"..ChatId,"del")
base:set(TD_ID.."sg:hyper"..ChatId,"del")
base:set(TD_ID.."sg:post"..ChatId,"del")
base:set(TD_ID.."sg:bot"..ChatId,"del")
base:set(TD_ID.."sg:user"..ChatId,"del")
local t = 'سازندہ گروہ :\n'
local status = getChatAdministrators(ChatId)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
t = t..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..'\n'
base:sadd(TD_ID..'gpuser:'..owner_id,ChatId)
end
end
end
t = t..' ✭ ادمین های این گروہ :\n'
list = getChatAdministrators(ChatId)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id
admin_names = v.user.first_name
t = t..'['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'..'\n'
end
end
end
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '◂ شناسایی ادمین ها ',callback_data = 'Config:All'}}}
EdiT(msg,'◂ *⚡️ انجام عملیات جهت شناسایی و پیکربندی ادمین ها*.',keyboard,true)
end
if GaUrd:match('Config:') and is_Sudo(msg) then
list = getChatAdministrators(ChatId)
if GaUrd == 'Config:All' or GaUrd == 'Config:Owner' then
for m,n in pairs(list.result) do
if n.status == 'creator' then
if n.user.id then
base:sadd(TD_ID..'OwnerList:'..ChatId,n.user.id)
end
end
end
end
if GaUrd == 'Config:All' then
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModCleanList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModBanList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModMuteList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModWarnList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModLockList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModpanelList:'..ChatId,admin_ids)
base:sadd(TD_ID..'ModVipList:'..ChatId,admin_ids)
end
end
end
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '•آزمایشی ',callback_data = 'ExpireGp:345600'},
{text = 'شارژ➊هفته',callback_data = 'ExpireGp:604800'},
},{
{text = 'شارژ➋هفته',callback_data = 'ExpireGp:1209600'},
{text = 'شارژ➌هفته',callback_data = 'ExpireGp:1814400'},
},{
{text = 'شارژ➊ماه',callback_data = 'ExpireGp:2592000'},
{text = 'شارژ➋ماه',callback_data = 'ExpireGp:5184000'},
},{
{text = 'شارژ➌ماه',callback_data = 'ExpireGp:7776000'},
{text = 'شارژ➏ماه',callback_data = 'ExpireGp:15552000'},
},{
{text = 'شارژ➊سال',callback_data = 'ExpireGp:31104000'},
{text = 'تمدید دائمی',callback_data = 'ExpireGp:MrGaurd'}}}

EdiT(msg,'◈ خواهشمند است مدت اعتبار ربات را تعیین کنید.',keyboard,true)
end
if GaUrd == 'ExitBot' and is_Sudo(msg) then
--local keyboard = {}
--keyboard.inline_keyboard = {{
--{text = 'خرید ربات',url = 'https://t.me/'..Sudo1}}}
sendText(ChatId,'❌ربات از گروہ خارج شد...!',0,'md')
--EdiT(msg,'❌ربات از گروہ خارج شد...!',keyboard,true)
leave(ChatId)
end
if GaUrd:match('ExpireGp:') and is_Sudo(msg) then
GaUrd = GaUrd:split(':')
Expire = GaUrd[2]
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' ورود به پنل',callback_data = 'Ramin:menu:'..ChatId},
}}
base:srem(TD_ID..'Gp2:'..ChatId,'chex3')
base:srem(TD_ID..'Gp2:'..ChatId,'chex2')
base:srem(TD_ID..'Gp2:'..ChatId,'chex1')
if User_Username then
Username = User_Username
else
Username = 'NotFound'
end
yyy = '◂ نصب و راه اندازی ربات در گروه به صورت کامل انجام شد.'

if Expire == 'MrGaurd' then
base:set(TD_ID.."ExpireData:"..ChatId,true)
EdiT(msg,yyy,keyboard,true)
local t = '👤سازندہ گروہ :\n'
local status = getChatAdministrators(ChatId)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
t = t..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..'\n'
base:sadd(TD_ID..'gpuser:'..owner_id,ChatId)
end
end
end
t = t..' 👥 ادمین های این گروہ :\n'
list = getChatAdministrators(ChatId)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id
admin_names = v.user.first_name
t = t..'['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'..'\n'
end
end
end
if not base:get(TD_ID.."Link:"..ChatId) or not getChat(ChatId).result.invite_link then
GetInvate(ChatId)
local getChat = getChat(ChatId)
if getChat.result.invite_link  then
links = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..ChatId,links)
end
else
links =  '\n[ورود به گروه]('..base:get(TD_ID.."Link:"..ChatId)..')'
end
txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local BD = '♨ گروهی به صورت دائمی شارژ شد!\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات شارژ کنندہ :\n• یوزرنیم :['..Username or 'nil'..'](tg://user?id='..User_Id..')\n• نام : ['..User_Name:escape_hard()..'](tg://user?id='..User_Id..')\n• شناسـہ : *'..User_Id..'*\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'..txt..'\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات گروہ :\n📜 نام گروہ : *'..ChatName..'*\n💬 ایدی گروه : *'..ChatId..'*\n'..t..'\n'..links..''
sendText(Sudoid,BD,0,'md')
sendText(IDSup,BD,0,'md')
else
dayex = math.floor(Expire / 86400)
base:setex(TD_ID.."ExpireData:"..ChatId,tonumber(Expire),true)
base:set(TD_ID..'ExpireDataNum:'..ChatId,dayex)
EdiT(msg,yyy,keyboard,true)
local t = '👤سازندہ گروہ :\n'
local status = getChatAdministrators(ChatId)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
t = t..'['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')'..'\n'
base:sadd(TD_ID..'gpuser:'..owner_id,ChatId)
end
end
end
t = t..' 👥 ادمین های این گروہ :\n'
list = getChatAdministrators(ChatId)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id
admin_names = v.user.first_name
t = t..'['..admin_names:escape_hard()..'](tg://user?id='..admin_ids..')'..'\n'
end
end
end
if not base:get(TD_ID.."Link:"..ChatId) or not getChat(ChatId).result.invite_link then
GetInvate(ChatId)
local getChat = getChat(ChatId)
if getChat.result.invite_link  then
links = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..ChatId,links)
end
else
links =  '\n[ورود به گروه]('..base:get(TD_ID.."Link:"..ChatId)..')'
end
txt = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local BD = '♨ گروه به مدت '..dayex..' روز شارژ شد !\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات شارژ کنندہ :\n• یوزرنیم :['..Username or 'nil'..'](tg://user?id='..User_Id..')\n• نام : ['..User_Name:escape_hard()..'](tg://user?id='..User_Id..')\n• شناسـہ : *'..User_Id..'*\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'..txt..'\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n⫸ مشخصات گروہ :\n📜 نام گروہ : *'..ChatName..'*\n💬 ایدی گروه : *'..ChatId..'*\n'..t..'\n'..links..''
sendText(Sudoid,BD,0,'md')
sendText(IDSup,BD,0,'md')
end
end

---*<><><>**Modern Locks--*<><><>**---
if msg.data:match('(-%d+):(del):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Del:'..BD) then
lock_rem('Gp:','Del:'..BD)
txt = 'حذف '..text..' غیرفعال شد ❌'
Alert(msg.id,txt)
else
lock_add('Gp:','Del:'..BD)
txt = 'حذف '..text..' فعال شد ✅'
Alert(msg.id,txt)
end
SETT(msg,chat_id,page)
end
end
if msg.data:match('(-%d+):(warn):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !2\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Warn:'..BD) then
lock_rem('Gp:','Warn:'..BD)
txt = 'اخطار '..text..' غیرفعال شد ❌'
Alert(msg.id,txt,true)
else
if base:sismember(TD_ID..'Gp:'..chat_id,'Kick:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Kick:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Ban:'..BD)
end
lock_add('Gp:','Warn:'..BD)
txt = 'اخطار '..text..' فعال شد ✅'
Alert(msg.id,txt,true)
end
SETT(msg,chat_id,page)
end
end
if msg.data:match('(-%d+):(mute):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

base:sadd(TD_ID..'AGTMute:',msg.from.id)
end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Mute:'..BD) then
lock_rem('Gp:','Mute:'..BD)
txt = 'محدودیت '..text..' غیرفعال شد ❌'
Alert(msg.id,txt,true)
else
if base:sismember(TD_ID..'Gp:'..chat_id,'Kick:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Kick:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Silent:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Silent:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Ban:'..BD)
end
lock_add('Gp:','Mute:'..BD)
txt = 'محدودیت '..text..' فعال شد ✅'
Alert(msg.id,txt,true)
end
SETT(msg,chat_id,page)
end
end
if msg.data:match('(-%d+):(silent):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Silent:'..BD) then
lock_rem('Gp:','Silent:'..BD)
txt = 'سایلنت '..text..' غیرفعال شد ❌'
Alert(msg.id,txt,true)
else
if base:sismember(TD_ID..'Gp:'..chat_id,'Mute:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Mute:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Kick:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Kick:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Ban:'..BD)
end
lock_add('Gp:','Silent:'..BD)
txt = 'سایلنت '..text..' فعال شد ✅'
Alert(msg.id,txt,true)
end
SETT(msg,chat_id,page)
end
end
if msg.data:match('(-%d+):(kick):(.*):(%d)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Kick:'..BD) then
lock_rem('Gp:','Kick:'..BD)
txt = 'اخراج '..text..' غیرفعال شد ❌'
Alert(msg.id,txt,true)
else
if base:sismember(TD_ID..'Gp:'..chat_id,'Warn:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Warn:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Ban:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Mute:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Mute:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Silent:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Silent:'..BD)
end
lock_add('Gp:','Kick:'..BD)
txt = 'اخراج '..text..' فعال شد ✅'
Alert(msg.id,txt,true)
end
SETT(msg,chat_id,page)
end
end
if msg.data:match('(-%d+):(ban):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:'..BD) then
lock_rem('Gp:','Ban:'..BD)
txt = 'مسدود '..text..' غیرفعال شد ❌'
Alert(msg.id,txt,true)
else
if base:sismember(TD_ID..'Gp:'..chat_id,'Warn:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Warn:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Kick:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Kick:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Mute:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Mute:'..BD)
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Silent:'..BD) then
base:srem(TD_ID..'Gp:'..chat_id,'Silent:'..BD)
end
lock_add('Gp:','Ban:'..BD)
txt = 'مسدود '..text..' فعال شد ✅'
Alert(msg.id,txt,true)
end
SETT(msg,chat_id,page)
end
end
--- «»UnLock«» ---
if msg.data:match('(-%d+):(unlockall):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlock(chat_id,BD)

if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Del:'..BD) or base:sismember(TD_ID..'Gp:'..chat_id,'Warn:'..BD) or base:sismember(TD_ID..'Gp:'..chat_id,'Ban:'..BD) or base:sismember(TD_ID..'Gp:'..chat_id,'Mute:'..BD) or base:sismember(TD_ID..'Gp:'..chat_id,'Kick:'..BD) or base:sismember(TD_ID..'Gp:'..chat_id,'Silent:'..BD) then
lock_rem('Gp:','Del:'..BD)
lock_rem('Gp:','Warn:'..BD)
lock_rem('Gp:','Kick:'..BD)
lock_rem('Gp:','Ban:'..BD)
lock_rem('Gp:','Mute:'..BD)
lock_rem('Gp:','Silent:'..BD)
txt = 'قفل '..text..' ازاد شد ✖'
Alert(msg.id,txt,true)
else
txt = 'قفل '..text..' ازاد بود ⚫'
Alert(msg.id,txt,true)
end
SETT(msg,chat_id,page)
end
end

if msg.data:match('(AddMoj):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid"..chat_id)
base:sadd(TD_ID..'VipAdd:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '♨❌ معاف کاربر ║ توسط ادمین 👮🏻‍♀️',callback_data = 'RemMoj:'..chat_id..':'..formid..''},
}}
txt = '👤 '..name..' تبریک بـہ شما 💐💥 \n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 شما از طرف ❪'..nametd..'❫  بـہ صورت کامل از افزودن اجباری گروہ معاف شد !\n\n'
Edit(msg,txt,keyboard,true)
end


if msg.data:match('(AddJoin):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(chat_id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid"..chat_id)
base:sadd(TD_ID..'VipJoin:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '♨❌ حذف معاف ║ توسط ادمین 👮🏻‍♀️',callback_data = 'RemJoin:'..chat_id..':'..formid..''},
}}
txt = '👤 '..name..' تبریک بـہ شما 💐💥 \n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 شما از طرف ❪'..nametd..'❫  از عضویت اجباری کانال معاف شدید!\n\n'
Edit(msg,txt,keyboard,true)
end

if msg.data:match('(RemJoin):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid"..chat_id)
base:srem(TD_ID..'VipJoin:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '❎ اجبار کاربر ║ توسط ادمین 👮🏻‍♀️',callback_data = 'AddJoin:'..chat_id..':'..formid..''},
}}

txt = '👤 '..name..'  محدودیت عضویت اجباری  شما از طرف ❪'..nametd..'❫  فعال گردید !\n'
Edit(msg,txt,keyboard,true)
end


if msg.data:match('(RemMoj):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid"..chat_id)
base:srem(TD_ID..'VipAdd:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '❎ اجبار کاربر ║ توسط ادمین 👮🏻‍♀️',callback_data = 'AddMoj:'..chat_id..':'..formid..''},
}}

txt = '👤 '..name..'  محدودیت افزودن اجباری  شما از طرف ❪'..nametd..'❫  فعال گردید !\n'
Edit(msg,txt,keyboard,true)
end

----------------------------------------------------------

if msg.data:match('(Menu):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه اصلی 』'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = ' تنظیمات ⚙️',callback_data = 'Ramin:Ramin:'..chat_id},
{text = '🗂 اطلاعات',callback_data = 'Ramin:groupinfo:'..chat_id},
},{
{text =' آمار گروه 📊',callback_data = 'Ramin:statsmem:'..chat_id},
{text = '☠️ ضد ربات ',callback_data = 'Ramin:AntiTabchipnl:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,txt,keyboard,true)
end



if msg.data:match('(AlphD):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshLimitFormid3"..chat_id)
base:sadd(TD_ID..'ModList:'..chat_id,formid)
base:sadd(TD_ID..'ModList:'..chat_id,formid)
base:sadd(TD_ID..'ModCleanList:'..chat_id,formid)
base:sadd(TD_ID..'ModBanList:'..chat_id,formid)
base:sadd(TD_ID..'ModMuteList:'..chat_id,formid)
base:sadd(TD_ID..'ModWarnList:'..chat_id,formid)
base:sadd(TD_ID..'ModLockList:'..chat_id,formid)
base:sadd(TD_ID..'ModpanelList:'..chat_id,formid)
base:sadd(TD_ID..'ModVipList:'..chat_id,formid)
promotemember(chat_id,formid,0,0,0,1,1,1,1,0)
txt = '👤 '..name..' به عنوان ادمین گروه و ربات تعیین شد و اجازه دسترسی  دستورات ربات وتنظیمات گروه داده شد\n┈┅┅━━━━━━✦━━━━━┅┅┈\n📝 توسط : ❪'..nametd..'❫ '
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '❌ عزل از ادمینی ❌',callback_data = 'AlphF:'..chat_id..':'..formid..''},
}}
Edit(msg,txt,keyboard,true)
end


if msg.data:match('(AlphF):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshLimitFormid3"..chat_id)
base:srem(TD_ID..'ModList:'..chat_id,formid)
base:srem(TD_ID..'ModList:'..chat_id,formid)
base:srem(TD_ID..'ModCleanList:'..chat_id,formid)
base:srem(TD_ID..'ModBanList:'..chat_id,formid)
base:srem(TD_ID..'ModMuteList:'..chat_id,formid)
base:srem(TD_ID..'ModWarnList:'..chat_id,formid)
base:srem(TD_ID..'ModLockList:'..chat_id,formid)
base:srem(TD_ID..'ModpanelList:'..chat_id,formid)
base:srem(TD_ID..'ModVipList:'..chat_id,formid)
base:del(TD_ID..'Total:messages:'..chat_id..':'..formid)
base:del(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..formid or 00000000)
promotemember(chat_id,formid,0,0,0,0,0,0,0,0)
txt = '👤 '..name..' از ادمینی گروه عزل شد!\n┈┅┅━━━━━━✦━━━━━┅┅┈\n📝 توسط : ❪'..nametd..'❫ '
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🎖 ارتقا به ادمین گروه 🎖',callback_data = 'AlphD:'..chat_id..':'..formid..''},
}}
Edit(msg,txt,keyboard,true)
end



if msg.data:match('(AlphL):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshLimitFormid3"..chat_id)
UnRes(chat_id,formid)
--base:srem(TD_ID..'limituser:'..chat_id,formid)
--base:sadd(TD_ID..'Gp2:'..chat_id,'limitpm'..formid)
base:del(TD_ID..'Total:messages:'..chat_id..':'..formid)
base:del(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..formid or 00000000)
txt = '👤 '..name..' از محدودیت لیمیت پیام در روز رها شد و از سکوت نیز خارج شد.\n┈┅┅━━━━━━✦━━━━━┅┅┈\n📝 توسط : ❪'..nametd..'❫ '
EdiT(msg,txt,false,true)
end



if msg.data:match('(Alphm):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid3"..chat_id)
UnRes(chat_id,formid)
base:srem(TD_ID..'SilentList:'..chat_id,formid)
base:srem(TD_ID..'MuteList:'..chat_id,formid)
if formid then
username = "["..base:get(TD_ID..'FirstName:'..formid).."](tg://user?id="..formid..")"
else
username = "["..base:get(TD_ID..'UserName:'..formid).."](tg://user?id="..formid..")"
end
dofile('./Alpha/time.lua')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'

tarikh = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سکوت کاربر ◈',callback_data = 'Alphr:'..chat_id..':'..formid..''},
}}
txt = '◈ کاربر '..username..' در گروه '..gp..' توسط '..nametd..' حذف سکوت شد.\n\n'..tarikh..'\n'
Edit(msg,txt,keyboard,true)
end
if msg.data:match('(Alphr):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formidw = base:get(TD_ID.."ToshFormid3"..chat_id)
MuteUser(chat_id,formidw,0)
base:sadd(TD_ID..'MuteList:'..chat_id,formidw)
dofile('./Alpha/time.lua')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'

tarikh = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
if formidw then
username = "["..base:get(TD_ID..'FirstName:'..formidw).."](tg://user?id="..formidw..")"
else
username = "["..base:get(TD_ID..'UserName:'..formidw).."](tg://user?id="..formidw..")"
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف سکوت ◈',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
}}
txt = '◈ کاربر '..username..' در گروه '..gp..' توسط '..nametd..' دوباره سکوت شد.\n\n'..tarikh..'\n'
Edit(msg,txt,keyboard,true)
end
---------------------------
if msg.data:match('(BanA):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid3"..chat_id)
UnRes(chat_id,formid)
base:srem(TD_ID..'BanUser:'..chat_id,formid)
if formid then
username = "["..base:get(TD_ID..'FirstName:'..formid).."](tg://user?id="..formid..")"
else
username = "["..base:get(TD_ID..'UserName:'..formid).."](tg://user?id="..formid..")"
end
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
tarikh = ''..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..''
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ مسدود کاربر ◈',callback_data = 'BanB:'..chat_id..':'..formid..''},
}}
txt = '◈ کاربر '..username..' در گروه '..gp..' توسط '..nametd..' حذف مسدود شد.\n\n'..tarikh..'\n'
Edit(msg,txt,keyboard,true)
end
if msg.data:match('(BanB):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formidw = base:get(TD_ID.."ToshFormid3"..chat_id)
KickUser(chat_id,formidw)
base:sadd(TD_ID..'BanUser:'..chat_id,formidw)
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if formidw then
username = "["..base:get(TD_ID..'FirstName:'..formidw).."](tg://user?id="..formidw..")"
else
username = "["..base:get(TD_ID..'UserName:'..formidw).."](tg://user?id="..formidw..")"
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف مسدود ◈',callback_data = 'BanA:'..chat_id..':'..formidw..''},
}}
txt = '◈ کاربر '..username..' در گروه '..gp..' توسط '..nametd..' دوباره مسدود شد.\n\n'..tarikh..'\n'
Edit(msg,txt,keyboard,true)
end




-----------------------------------------------------------------------
if msg.data:match('(WarMoj):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid2"..chat_id)
MuteUser(chat_id,formid,0)
base:sadd(TD_ID..'MuteList:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• کاربر رفع سکوت بشـہ !',callback_data = 'MutMoj:'..chat_id..':'..formid..''},
}}
txt = '👤 '..name..' بـہ علت بی نظمی ازحالت اخطار بـہ سکوت تنظیم شد !\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 توسط : ❪'..nametd..'❫ '
Edit(msg,txt,keyboard,true)
end

if msg.data:match('(MutMoj):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid2"..chat_id)
UnRes(chat_id,formid)
base:srem(TD_ID..'SilentList:'..chat_id,formid)
base:srem(TD_ID..'MuteList:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• کاربر سکوت بشه !',callback_data = 'WarMoj:'..chat_id..':'..formid..''},
},{
{text = '• رفع اخطار گردد !',callback_data = 'WarnMoj:'..chat_id..':'..formid..''},
}}
txt = '👤 '..name..' بـہ علت توبـہ کردن درگروہ از حالت سکوت بـہ حالت اخطار بازگشت دادہ شد !\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 توسط : ❪'..nametd..'❫ '
Edit(msg,txt,keyboard,true)
end

if msg.data:match('(ScanAlphaMute):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid5"..chat_id)
KickUser(chat_id,formid)
--base:sadd(TD_ID..'MuteList:'..chat_id,formid)
base:sadd(TD_ID..'AGTMute:',formid)
base:srem(TD_ID..'TabAdd:'..chat_id,formid)
deleteMessages(chat_id,msg.message.message_id)
EdiT(msg,'پنل بسته شد!',false,true)
Alert(msg.id,'مدیر عزیز از انتخاب شما متشکرم  شما به صورت رسمی اعلام کردید این کاربر یک ربات است ✅',true)
end

if msg.data:match('(ScanAlphaNot):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid5"..chat_id)
UnRes(chat_id,formid)
base:srem(TD_ID..'AGTMute:',formid)
base:srem(TD_ID..'MuteList:'..chat_id,formid)
base:srem(TD_ID..'BanList:'..chat_id,formid)
base:sadd(TD_ID..'TabAdd:'..chat_id,formid)
deleteMessages(chat_id,msg.message.message_id)
EdiT(msg,'پنل بسته شد!',false,true)
Alert(msg.id,'مدیر عزیز از انتخاب شما متشکرم  شما به صورت رسمی اعلام کردید این کاربر ربات نیست! ✅',true)
end


if msg.data:match('(TabAlphaMute):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid5"..chat_id)
MuteUser(chat_id,formid,0)
--base:sadd(TD_ID..'MuteList:'..chat_id,formid)
base:sadd(TD_ID..'AGTMute:',formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🚫 مسدود ازهمه گروه ها 🚫',callback_data = 'TAlphaBan:'..chat_id..':'..formid..''},
},{
{text = '️ ☑️ آزاد ازهمه گروه ها ☑️',callback_data = 'TabAlphaNot:'..chat_id..':'..formid..''},
},{
{text = 'بستن پنل گزارش',callback_data = 'Ramin:Exitspanl:'..chat_id}
}}
txt = '✅ عملیات ثبت محدود از همه گروه ثبت شد.\n👤 '..name..' به عنوان مخرب گروه ها در سیستم AGTربات به صورت #محدودیت کلی ثبت وتنظیم شد.\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 توسط : ❪'..nametd..'❫ '
Edit(msg,txt,keyboard,true)
end


if msg.data:match('(TTBan):(-%d+)')  then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Nazem(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز معاونین گروه دسترسی دارند \nدر صورت تکرار بیش از اندازه اخراج خواهی شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid"..chat_id)
KickUser(chat_id,formid)
base:sadd(TD_ID..'AGTMute:',formid)
base:sadd(TD_ID..'BanList:'..chat_id,formid)
base:sadd(TD_ID..'TabAdd:'..chat_id,formid)
deleteMessages(chat_id,msg.message.message_id)
if formid then
username = "["..base:get(TD_ID..'FirstName:'..formid).."](tg://user?id="..formid..")"
else
username = "["..base:get(TD_ID..'UserName:'..formid).."](tg://user?id="..formid..")"
end
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
txt = '◈ کاربر '..base:get(TD_ID..'FirstName:'..formid)..' در گروه '..gp..' توسط '..msg.from.first_name:escape_hard()..' به عنوان ربات تبچی (تبلیغگر) ثبت شد.'
Alert(msg.id,txt,true)
end


if msg.data:match('(TAlphaBan):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid5"..chat_id)
KickUser(chat_id,formid)
base:sadd(TD_ID..'AGTMute:',formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🚫 محدود ازهمه گروه ها 🚫',callback_data = 'TabAlphaMute:'..chat_id..':'..formid..''},
},{
{text = '☑️ آزاد ازهمه گروه ها ☑️',callback_data = 'TabAlphaNot:'..chat_id..':'..formid..''},
},{
{text = 'بستن پنل گزارش',callback_data = 'Ramin:Exitspanl:'..chat_id}
}}
txt = '✅ عملیات ثبت مسدود از همه گروه ثبت شد.\n👤 '..name..' به عنوان مخرب گروه ها در سیستم AGTربات به صورت #مسدودیت کلی ثبت وتنظیم شد.\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 توسط : ❪'..nametd..'❫ '
Edit(msg,txt,keyboard,true)
end
if msg.data:match('(TabAlphaNot):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid5"..chat_id)
UnRes(chat_id,formid)
base:srem(TD_ID..'AGTMute:',formid)
base:srem(TD_ID..'MuteList:'..chat_id,formid)
base:srem(TD_ID..'BanList:'..chat_id,formid)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '📵 محدود ازهمه گروه ها 📵',callback_data = 'TabAlphaMute:'..chat_id..':'..formid..''},
},{
{text = '🚫 مسدود ازهمه گروه ها 🚫',callback_data = 'TAlphaBan:'..chat_id..':'..formid..''},
},{
{text= '⊴ بستن پنل',callback_data = 'Ramin:Exitspanl:'..chat_id}
}}
txt = '✅ عملیات ثبت آزاد از همه گروه ثبت شد..\n👤 '..name..' قبلان درسیستم AGTبه عنوان مخرب گروه ها شناخته شده بود ازحالت ریپورتی ربات خارج شد.\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 توسط : ❪'..nametd..'❫ '
Edit(msg,txt,keyboard,true)
end
if msg.data:match('(WarnMoj):(-%d+)') then
Split = msg.data:split(':')
user = Split[2]
chat_id = Split[2]
name = Split[3]
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)
end
return
end
name = '[کاربر](tg://user?id='..name..')'
nametd = '['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')'
local formid = base:get(TD_ID.."ToshFormid2"..chat_id)
local warnhash = base:hget(TD_ID..chat_id..':warn',formid)
local hashwarn = TD_ID..chat_id..':warn'
base:hdel(hashwarn,formid,'0')
txt = '👤 '..name..' تمامی اخطار های ثبت شدہ در سیستم ربات  ریست وپاکسازی شد !\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n📝 توسط : ❪'..nametd..'❫ '
Edit(msg,txt,keyboard,true)
end

if msg.data:match('AdmincmddPage:') then
Split = msg.data:split(':')
page = tonumber(Split[2])
PG = tonumber(page)
local status = getChatAdministrators(msg.message.chat.id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
else
owner_id = BotJoiner
owner_name = 'دیلیت اکانت شده'
end
end
end
local keyboard = {}
keyboard.inline_keyboard = {}
list = getChatAdministrators(msg.message.chat.id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
admin_ids = v.user.id or 219201071
admin_names = v.user.first_name or 'Not Found !'
PGs = math.floor(k / 5)
if k%5 > 0 then PGs = PGs + 1 end
PGs = PGs - 1
if k == 0 then
txt = 'Not Found !'
else
dofile('./Alpha/time.lua')
txt = '✭لیست ادمین های گروہ :\nجهت تغییر دسترسی ادمین ها بر روی ادمین مورد نظر کلیک کنید !\nسازندہ گروہ : ['..owner_name:escape_hard()..'](tg://user?id='..owner_id..')\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n'
if (k > PG*5) and (k < PG*5+6) then
if txt then
temp = {{{text = ''..k..'-'..admin_names:escape_hard()..'',callback_data = 'Ramin:getcmdadmin'..admin_ids..':'..msg.message.chat.id}}}
end
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
end
end
end
end
if PG == 0 then
if PGs > 0 then
temp = {{{text= '➲ بعدی',callback_data = 'AdmincmddPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
elseif PG == PGs then
temp = {{{text= 'قبلی ◤',callback_data = 'AdmincmddPage:'..(PG-1)}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else
temp = {{{text = 'قبلی ◤',callback_data = 'AdmincmddPage:'..(PG-1)},{text = '➲ بعدی',callback_data = 'AdmincmddPage:'..(PG+1)}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
temp = {{{text= 'خروج ☒',callback_data = 'Ramin:Exit:'..msg.message.chat.id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
Edit(msg,txt,keyboard,true)
end






--- <>END LOCKS<> ---
--- <>tabchi<> ---
if msg.data:match('Gaurd:IsTabchi(.*):(-%d+)') then
Split = msg.data:split(':')
chat_id = Split[3]
MenuName = Split[2]
Split2 = MenuName:split('>')
user = tonumber(Split2[2])
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
mmltxt = 'محدود خواهید شد!'
mmltxt2 = 'محدود'
mmltxt3 = 'محدود کردن'
else
mmltxt = 'مسدود خواهی شد!'
mmltxt2 = 'اخراج'
mmltxt3 = 'اخراج'
end
if tonumber(user) == tonumber(msg.from.id) then
name = msg.from.username or ec_name(msg.from.first_name)
if MenuName:match('IsTabchiFalse>') then
base:srem(TD_ID..'AntiTabchiUser'..chat_id,user)
deleteMessages(chat_id,msg.message.message_id)
Alert(msg.id,'✅ با تشکر شما می توانید در گروه بدون هیچ محدودیتی فعالیت داشته باشید!',true)
end
if MenuName:match('IsTabchiTrue>') then
local keyboard = {}
TexT = '◈کاربر عزیز <a href="tg://user?id='..msg.from.id..'">'..name..'</a> پاسخ شما اشتباه می باشد!\n\nاین اخرین تلاش شما جهت پاسخگویی در صورت اشتباه مجدد در گروه '..mmltxt..'\n\n شما #یک دقیقه فرصت دارید!'
Mohammad2 = {'MohammadrezaRosta','B_D'}
Mohammadr_r = {'BD','MrGaurd','Babak','TeleDiamondCh'}
BDAntiTabchi = Mohammadr_r[math.random(#Mohammadr_r)]
if Mohammad2[math.random(#Mohammad2)] == 'MohammadrezaRosta' then
mrr619 = {0,1,2,3,4,5,6,7,8,9}
randnum = mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]
randnum2 = mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]
randnum3 = mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]
randnum4 = mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]..mrr619[math.random(#mrr619)]
if tonumber(randnum) == tonumber(randnum2) or tonumber(randnum) == tonumber(randnum3) or tonumber(randnum) == tonumber(randnum3) then
randnum = 1000
end
if BDAntiTabchi == 'MrGaurd' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id},{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id}},
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
if BDAntiTabchi == 'BD' then
keyboard.inline_keyboard = {
{{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id},{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id}},
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
if BDAntiTabchi == 'TeleDiamondCh' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id},{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id}},
{{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
if BDAntiTabchi == 'Babak' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id},{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id}},
{{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id},{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
local randnum = randnum:gsub("[0123456789]", {["0"] = "0️⃣", ["1"] = "1️⃣", ["2"] = "2️⃣", ["3"] = "3️⃣", ["4"] = "4️⃣", ["5"] = "5️⃣", ["6"] = "6️⃣", ["7"] = "7️⃣", ["8"] = "8️⃣", ["9"] = "9️⃣"})
EdiT(msg,TexT..'\n\n>معکوس عدد '..randnum..' را از میان دکمه های زیر پیدا کرده و بر روی آن کلیک کنید !',keyboard)
else
mrr619 = {'❤️','😍','✅','😭','🍦','🍌','🍉','🍏','🍎','🦆','💰','🔑','🐥','🎀','🎈','🔧','🗡','🤖','💄','💍','🐒','⚽️','0️⃣','1️⃣','2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣','🔟','✔️','⚫️','🔴','🔵','⚪️','🇮🇷'}
randnum = mrr619[math.random(#mrr619)]
randnum2 = mrr619[math.random(#mrr619)]
randnum3 = mrr619[math.random(#mrr619)]
randnum4 = mrr619[math.random(#mrr619)]
if tostring(randnum) == tostring(randnum2) or tostring(randnum) == tostring(randnum3) or tostring(randnum) == tostring(randnum3) then
randnum = '😡'
end
if BDAntiTabchi == 'MrGaurd' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id},{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id}},
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
if BDAntiTabchi == 'BD' then
keyboard.inline_keyboard = {
{{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id},{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id}},
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
if BDAntiTabchi == 'TeleDiamondCh' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id},{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id}},
{{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
if BDAntiTabchi == 'Babak' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>6:'..chat_id},{text = randnum3,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>5:'..chat_id}},
{{text = randnum4,callback_data='Gaurd:IsTabchiTrue2>'..msg.from.id..'>4:'..chat_id},{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.from.id..':'..chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.from.id..':'..chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.from.id..':'..chat_id}},
}
end
local randnum = randnum:gsub(randnum,{["0️⃣"] = "شماره صفر", ["1️⃣"] = "شماره یک", ["2️⃣"] = "شماره دو", ["3️⃣"] = "شماره سه", ["4️⃣"] = "شماره چهار", ["5️⃣"] = "شماره پنج", ["6️⃣"] = "شماره شیش", ["7️⃣"] = "شماره هفت", ["8️⃣"] = "شماره هشت", ["9️⃣"] = "شماره نه", ["❤️"] = "قلب", ["😍"] = "چشم های قلبی", ["✅"] = "تیک سبز", ["😭"] = "گریه", ["🍦"] = "بستنی", ["🍌"] = "موز", ["🍉"] = "هندوانه", ["🍏"] = "سیب سبز", ["🍎"] = "سیب قرمز", ["🦆"] = "اردک", ["💰"] = "کیسه پول", ["🔑"] = "کلید", ["🐥"] = "جوجه", ["🎀"] = "پاپیون", ["🎈"] = "بادکنک قرمز", ["🔧"] = "اچهار فرانسه", ["🗡"] = "شمشیر", ["🤖"] = "ربات", ["💄"] = "رژ لب", ["💍"] = "انگشتر نگین دار", ["🐒"] = "میمون", ["⚽️"] = "توپ فوتبال", ["✔️"] = "تیک مشکی", ["⚫️"] = "دایره مشکی", ["🔴"] = "دایره قرمز", ["🔵"] = "دایره ابی", ["⚪️"] = "دایره سفید", ["🇮🇷"] = "پرچم ایران",["😡"] = "ادم عصبانی"})
EdiT(msg,TexT..'\n\n> اموجی '..randnum..' را از میان دکمه های زیر پیدا کرده و بر روی آن کلیک کنید !',keyboard)
end
end
if MenuName:match('IsTabchiTrue2>') then
local url  = https.request(BASSE .. '/getChatMember?chat_id='..chat_id..'&user_id='..Config.BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_restrict_members == true then
EdiT(msg,'◈کاربر عزیز <a href="tg://user?id='..msg.from.id..'">'..name..'</a> به علت اشتباه پاسخ دادن به سوالات ربات  '..mmltxt2..' ومتاسفانه به عنوان ربات تبچی شناسایی شد!',nil)
base:sadd(TD_ID..'AGTMute:',msg.from.id)
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
MuteUser(chat_id,msg.from.id,1)
else
KickUser(chat_id,msg.from.id)
end
base:srem(TD_ID..'AntiTabchiUser'..chat_id,msg.from.id)
else
EdiT(msg,'◈کاربر عزیز <a href="tg://user?id='..msg.from.id..'">'..name..'</a> به علت اشتباه پاسخ دادن به سوالات ربات '..mmltxt3..' کاربر رو ندارد ربات در گروه ادمین نمی باشد!',nil)
end
end
else
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'تو حریم شخصی دیگران دخالت نکن افرین!',true)
else
banUser(chat_id,msg.from.id)
base:sadd(TD_ID..'AGTMute:',msg.from.id)
end
return
end
end
--<><>Is Mod<><>--
if msg.data:match('(Ramin):(.*):(-%d+)') then
Split = msg.data:split(':')
chat_id = Split[3]
MenuName = Split[2]
if MenuName:match('>') then
Splitss = MenuName:split('>')
UseriD  = Splitss[2]
end
if msg.message.chat.type == 'supergroup' then
gpname = msg.message.chat.title
else
gpname = base:get(TD_ID..'StatsGpByName'..chat_id) or 'Not Found'
end
if not is_req(msg) then
Alert(msg.id,'• شما دسترسی کار کردن با این پنل را ندارید !',true)
return
end
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
banUser(chat_id,msg.from.id)
base:sadd(TD_ID..'AGTMute:',msg.from.id)
end
return
end
if MenuName == 'menu' then
if lang then
txt = 'Welcome to the Main Catalog and Panel Management\n\n*Time : '..os.date('%H:%M')..'*  *Date : '..os.date('%Y/%m/%d')..'*'
else
dofile('./Alpha/time.lua')
txtmmd = '▁▁▁▂▂▂▂▂▂▂▁▁▁\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'

gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه اصلی 』 '
end
Edit(msg,txt,menu(chat_id,1),true)

elseif MenuName == 'gpmenu' then
if lang then
txt = 'Welcome to the Main Catalog and Panel Management\n\n*Time : '..os.date('%H:%M')..'*  *Date : '..os.date('%Y/%m/%d')..'*'
else
dofile('./Alpha/time.lua')
txtmmd = '▁▁▁▂▂▂▂▂▂▂▁▁▁\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'
txt = '• 〔👤 کاربر: (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')) عزیز جهت تنظیمات بخش دلخواه خود را انتخاب کنید.〕'
end
Edit(msg,txt,menu(chat_id,11),true)
elseif MenuName == 'gpmenustart' then
if lang then
txt = 'Welcome to the Main Catalog and Panel Management\n\n*Time : '..os.date('%H:%M')..'*  *Date : '..os.date('%Y/%m/%d')..'*'
else
dofile('./Alpha/time.lua')
txtmmd = '▁▁▁▂▂▂▂▂▂▂▁▁▁\n👤 ڪاربر درخواست دهندہ : (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..'))'

txt = '• 〔👤 کاربر: (['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')) عزیز جهت تنظیمات بخش دلخواه خود را انتخاب کنید.〕'
end
Edit(msg,txt,menu(chat_id,64),true)


elseif MenuName == 'AddMan' then
local url  = https.request(BASSE .. '/getChatMember?chat_id='..chat_id..'&user_id='..BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' then
sendText(BotCliId,""..chat_id..":"..Sudoid.."",0,'md')
Alert(msg.id,'مدیر عزیز شما رو به گروه اد کردم!',true)
else
Alert(msg.id,'ربات در گروه ادمین نمی باشد!',true)
end
elseif MenuName == 'Forsat' then
local membersgroup = ( membersCount(chat_id).result or "--")
local DescriptionGroup=getChat(chat_id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..chat_id) or not getChat(chat_id).result.invite_link then
GetInvate(chat_id)
local getChat = getChat(chat_id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..chat_id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..chat_id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
Alert(msg.id,'مالک عزیز به شارژ ربات شما یک روز فرصت داده شد تا تمدید کنید!',true)
deleteMessages(chat_id,msg.message.message_id)
local time = tonumber(1) * day
base:setex(TD_ID.."ExpireData:"..chat_id,time-1,true)
base:srem(TD_ID..'Gp2:'..chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..chat_id,'chex1')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
sendText(Sudoid,'『 فرصت یک روزه تمدید گروه 』\n\n ◈ گروه `'..gp..'` توسط ['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..') اعلام کردند تا یک روز دیگر تمدید خواهم کرد!\n\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n\n◈ شناسه گروه :'..chat_id..' \n ◈ لینک گروه : \n'..link..' \n◈ تعداد ممبر : *'..membersgroup..'*\n\n ◈ بیوگرافی گروه : \n `'..about..'` ',0,'md')

elseif MenuName == 'newsetting' then
menu(chat_id,4)
elseif MenuName == 'attacknew' then
menu(chat_id,15)
elseif MenuName == 'statsmem' then
menu(chat_id,61)
elseif MenuName == 'suppuortbot' then
menu(chat_id,80)
elseif MenuName == 'dasrasi' then
menu(chat_id,62)
elseif MenuName == 'setdisplay'  then
menu(chat_id,63)
elseif MenuName == 'Ramin' then
menu(chat_id,99)
elseif MenuName == 'editlo' and is_FullSudo(msg)  then
menu(chat_id,53)
elseif MenuName == 'addcleaner'  then
local membersgroup = ( membersCount(chat_id).result or "--")
local DescriptionGroup=getChat(chat_id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..chat_id) or not getChat(chat_id).result.invite_link then
GetInvate(chat_id)
local getChat = getChat(chat_id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..chat_id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..chat_id)
end
if GroupDescription then
about = GroupDescription
else
about = 'توضیحات گروه تنظیم نشده است!'
end
if invitelink then
link = invitelink
else
link = 'ربات به بخش استخراج لینک گروه دسترسی ندارد!'
end
sendText(BotCliId,'نصب '..invitelink..'',0,'md')
sendText(-1001472763096,'نصب '..invitelink..'',0,'md')
promotemember(chat_id,TD_ID,0,0,0,1,1,1,1,0)
menu(chat_id,32)
elseif MenuName == 'editlorem' and is_FullSudo(msg)  then
menu(chat_id,54)
elseif MenuName == 'Hallat' and is_JoinChannelpanel(msg)  then
menu(chat_id,36)
elseif MenuName == 'Hallat1' and is_JoinChannelpanel(msg)  then
menu(chat_id,37)
elseif MenuName == 'Permissions' and is_JoinChannelpanel(msg)  then
menu(chat_id,74)
elseif MenuName == 'management' then
menu(chat_id,2)
elseif MenuName == 'adminsetcmd' then
if not is_Owner(chat_id,msg.from.id) then
Alert(msg.id,'⚠️ کاربر عزیز شما به این بخش دسترسی ندارید\nفقط مالک گروه دسترسی به این بخش را دارد!',true)
return
else
menu(chat_id,7)
end
elseif MenuName == 'permossionmodlist' then
if not is_Owner(chat_id,msg.from.id) then
Alert(msg.id,'⚠️ کاربر عزیز شما به این بخش دسترسی ندارید\nفقط مالک گروه دسترسی به این بخش را دارد!',true)
return
else
menu(chat_id,60)
end
elseif MenuName == 'cleandeleted' then
menu(chat_id,42)
elseif MenuName == 'cleanblacklist' then
menu(chat_id,43)
elseif MenuName == 'cleanbots' then
menu(chat_id,44)
elseif MenuName == 'cleanrestricts' then
menu(chat_id,45)
elseif MenuName == 'cleanpanel' then
menu(chat_id,39)

elseif MenuName == 'cleanmsgnum' then
menu(chat_id,80)
elseif MenuName == 'cleanpaneltab' then
menu(chat_id,40)
elseif MenuName == 'cleanallother' then
menu(chat_id,41)
elseif MenuName == 'cleanallmsg' then
menu(chat_id,38)
elseif MenuName == 'cleanalltab' then
base:set(TD_ID.."CleanTabchi"..chat_id,true)
menu(chat_id,40)
elseif MenuName == 'cleanalllink' then
sendText(chat_id,'• پاکسازی لینک ها درحال انجام لطفا  تا اتمام پاکسازی هیچ دستوری ارسال نشود!',0,'md')
menu(chat_id,65)
elseif MenuName == 'mod' then
menu(chat_id,5)
elseif MenuName == 'lockauto' and is_JoinChannelpanel(msg)  then
menu(chat_id,87)
elseif MenuName == 'lockauto2' then
menu(chat_id,88)
elseif MenuName == 'adminauto'  then
if not is_Owner(chat_id,msg.from.id) then
Alert(msg.id,'⚠️ کاربر عزیز شما به این بخش دسترسی ندارید\nفقط مالک گروه دسترسی به این بخش را دارد!',true)
return
else
menu(chat_id,21)
end

elseif MenuName == 'easy8' then
menu(chat_id,8)
elseif MenuName == 'LimitMsg' then
menu(chat_id,23)
elseif MenuName == 'easy9' then
menu(chat_id,7)
elseif MenuName == 'tagadmin' then
menu(chat_id,63)
elseif MenuName == 'taguser' then
menu(chat_id,69)
elseif MenuName == 'lockSettings' then
SETT(msg,chat_id,1)
elseif MenuName == 'NextLock' then
SETT(msg,chat_id,2)
elseif MenuName == 'mediaSettings' then
SETT(msg,chat_id,3)
elseif MenuName == 'moreSettings' then
SETT(msg,chat_id,4)
elseif MenuName == 'moreSettings2' then
SETT(msg,chat_id,55)
elseif MenuName == 'Forceadd' then
SETT(msg,chat_id,5)
elseif MenuName == 'Forcejoin' then
SETT(msg,chat_id,6)
elseif MenuName == 'joinejbari' then
SETT(msg,chat_id,33)
elseif MenuName == 'PanelPorn' then
SETT(msg,chat_id,34)
elseif MenuName == 'Wlc' then
SETT(msg,chat_id,7)
elseif MenuName == 'groupinfo' and is_JoinChannelpanel(msg)  then
SETT(msg,chat_id,8)
elseif MenuName == 'easy' then
SETT(msg,chat_id,9)
elseif MenuName == 'easy1' then
SETT(msg,chat_id,10)
elseif MenuName == 'easy2' then
SETT(msg,chat_id,11)
elseif MenuName == 'easy3' then
SETT(msg,chat_id,12)
elseif MenuName == 'easy4' then
SETT(msg,chat_id,13)
elseif MenuName == 'mahdod' then
SETT(msg,chat_id,14)
elseif MenuName == 'backpanel' then
SETT(msg,chat_id,15)
elseif MenuName == 'easy5' then
SETT(msg,chat_id,16)
elseif MenuName == 'easy6' then
SETT(msg,chat_id,17)
elseif MenuName == 'clean' then
SETT(msg,chat_id,30)
elseif MenuName == 'groupinfo1' then
SETT(msg,chat_id,31)
elseif MenuName == 'groupinfo2' then
SETT(msg,chat_id,32)


elseif MenuName == 'locktxt1' then
SETT(msg,chat_id,90)
elseif MenuName == 'locktxt2' then
SETT(msg,chat_id,91)
elseif MenuName == 'locktxt3' then
SETT(msg,chat_id,92)
elseif MenuName == 'lockmedia4' then
SETT(msg,chat_id,98)
elseif MenuName == 'lockmedia1' then
SETT(msg,chat_id,93)
elseif MenuName == 'lockmedia2' then
SETT(msg,chat_id,94)

elseif MenuName == 'NotAdmin' then
Alert(msg.id,'لینک گروہ ثبت نشدہ است',true)
elseif MenuName == 'ERROR' then
Alert(msg.id,'کاربر عزیز اشتباه میزنی :(',true)
elseif MenuName == 'TimeErorCl' then
t1 = base:get(TD_ID.."DelaUtO"..chat_id)
if t1  then
stats1 = ''..t1..''
else
stats1 = 'تنظیم نشده'
end
Alert(msg.id,'پاکسازی کلی پیام ها :'..stats1..'\n جهت تنظیم ساعت پاکسازی خودکار دکمه ساعت پاکسازی را کلیک کنید!',true)
elseif MenuName == 'TimeErorPin' then
p1 =  base:get(TD_ID.."Autopin1"..chat_id)
p2 =  base:get(TD_ID.."Autopin2"..chat_id)
if p1 and p2 then
stats1 = ''..p1..'الی'..p2..''
else
stats1 = 'تنظیم نشده'
end
Alert(msg.id,'سنجاق خودکار  :'..stats1..'\nجهت تنظیم ساعت دکمه ساعت سنجاق را کلیک کنید!',true)


elseif MenuName == 'TimeEror' then
t1 = base:get(TD_ID.."atolct1"..chat_id)
t2 = base:get(TD_ID.."atolct2"..chat_id)
if t1 and t2 then
stats1 = ''..t1..'الی'..t2..''
else
stats1 = 'تنظیم نشده'
end
Alert(msg.id,'قفل خودکار  :'..stats1..'\nجهت تنظیم ساعت قفل خودکار دکمه ساعت قفل را کلیک کنید!',true)


elseif MenuName:match('Is_Tabchino>') then
base:srem(TD_ID..'AntiTabchiUser'..chat_id,UseriD)
base:srem(TD_ID..'AGTMute',UseriD)
deleteMessages(chat_id,msg.message.message_id)
UnRes(chat_id,UseriD)
Alert(msg.id,'✔ شما تایید کردید کـہ این کاربر ربات نیست !',true)
elseif MenuName:match('Is_Tabchiyes>') then
base:srem(TD_ID..'AntiTabchiUser'..chat_id,UseriD)
base:srem(TD_ID..'AGTMute',UseriD)
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
mmltxt2 = 'محدود'
MuteUser(chat_id,tonumber(UseriD),1)
else
mmltxt2 = 'اخراج'
banUser(chat_id,tonumber(UseriD))
end
deleteMessages(chat_id,msg.message.message_id)
Alert(msg.id,'✔ شما تایید کردید کـہ این کاربر ربات است و کاربر از گروہ '..mmltxt2..' شد !',true)
elseif MenuName:match('getbanpnl') then
GetCmdBanStats(msg,chat_id,'','')
elseif MenuName:match('getbnepnl') then
GetBan(msg,chat_id,'','')

elseif MenuName:match('getadminpnl') then
GetAdmins(msg,chat_id,'','')

elseif MenuName:match('getpownerpnl') then
GetOwner(msg,chat_id,'','')
elseif MenuName:match('getadmincml') then
GetCmdAdmins(msg,chat_id,'','')



elseif MenuName:match('getcmdadmin') then
user = MenuName:gsub('getcmdadmin','')
GetCmdAdminStats(msg,chat_id,user)

elseif MenuName:match('getpanelstats') then
user = MenuName:gsub('getpanelstats','')
GetPanelStats(msg,chat_id,user)

elseif MenuName:match('getpanelback') then
user = MenuName:gsub('getpanelback','')
Panelkarbar(msg,chat_id,'','')
elseif MenuName:match('getadminpnl') then
GetAdmins(msg,chat_id,'','')
elseif MenuName:match('getadmin') then
user = MenuName:gsub('getadmin','')
GetAdminStats(msg,chat_id,user)

--Note Tabchi
elseif MenuName:match('AntiTabchipnl') then
AntiTabchiPnl(msg,chat_id)

elseif MenuName:match('AntiTabchipn2') then
AntiTabchi2(msg,chat_id)
elseif MenuName:match('ChatPermissions') then
ChatPermissions(msg,chat_id)
----------------راهنما-------------------------------------------
elseif MenuName == 'helpsudo' then
txt = '• 〔 به راهنمای سودو ربات ['..NameBot..'](tg://user?id='..BotJoiner..') خوش آمدید !〕'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بخش اول',callback_data = 'Ramin:sudoown:'..chat_id},
},{
{text = 'بخش دوم',callback_data = 'Ramin:sudotwo:'..chat_id},
},{
{text = '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'hFa' then
txt = '• به راهنمای ربات ['..NameBot..'](tg://user?id='..BotJoiner..') خوش آمدید !'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ راهنما کاربری',callback_data = 'Ramin:modh:'..chat_id} ,
{text = '◈ مدیریت گروه',callback_data = 'Ramin:seth:'..chat_id},
},{
{text = '◈ دستورات قفل ها',callback_data = 'Ramin:lockh:'..chat_id}
},{
{text = '◈ دستورات پاکسازی',callback_data = 'Ramin:cleanh:'..chat_id} ,
{text = '◈ دستورات سرگرمی',callback_data = 'Ramin:funh:'..chat_id}
},{
{text = '◈ دستورات عضویت اجباری',callback_data = 'Ramin:forch:'..chat_id},
},{ 
{text = '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}}}
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
dofile('./Alpha/time.lua')
txt = '◆ بخش مورد نظر را انتخاب کنید : \n『 صفحه راهنما 』'
Edit(msg,txt,keyboard,true)

-------------------مدیریت راهنما---------------
 
elseif MenuName == 'joke' then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/jok/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '🤣 بریم جوک بعدی 🤣',callback_data = 'Ramin:joke:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'shere' then
local url , res = http.request('http://c.ganjoor.net/beyt-json.php')
if res ~= 200 then
return
end
local jdat = json:decode(url)
text = "*"..jdat.m1.."* \n *"..jdat.m2.."*\nسروده شده توسط \n ——————————\n👤"..jdat.poet
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '🥀 بریم شعر بعدی 🥀',callback_data = 'Ramin:shere:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)
elseif MenuName == 'khatereh' then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/jok/khatere/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '😀 خاطرات خنده دار بعدی 😀',callback_data = 'Ramin:khatereh:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'pnp' then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/jok/pa-na-pa/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '🤪 جوکهای پ ن پ بعدی 🤪',callback_data = 'Ramin:pnp:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'dastan' then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/dastan/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '✍🏻 داستان کوتاه بعدی ✍🏻',callback_data = 'Ramin:dastan:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)
elseif MenuName == 'biogerafi' then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/bio/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '🥰 بیوگرافی بعدی 🥰',callback_data = 'Ramin:biogerafi:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'dialog' then
texty = io.popen(" wget -O ./Alpha/index.html https://api.codebazan.ir/dialog/"):read('*all')
text = io.popen("cat Alpha/index.html"):read('*all')
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text = '💫 دیالوگ ماندگار بعدی 💫',callback_data = 'Ramin:dialog:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,text,keyboard,true)


elseif MenuName == 'danestani' then
local  url , res = https.request('http://api.novateamco.ir/danestani/')
if res ~= 200 then
end
local jdat = json:decode(url)
result = jdat.result
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '🌏 دانستنی بعدی 🌏',callback_data = 'Ramin:danestani:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,result,keyboard,true)

elseif MenuName == 'hafez' then
local  url , res = https.request('http://api.novateamco.ir/falhafez/')
if res ~= 200 then
end
local jdat = json:decode(url)
result = jdat.result
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '🔮 شعر حافظ بعدی 🔮',callback_data = 'Ramin:hafez:'..chat_id},
},{
{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,result,keyboard,true)





elseif MenuName == 'sudoown' then
txt = [[

به دستورات سودو بخش اول خوش آمدید!
━━━━━━━━━━━━━━━

مالک ریپلای | یوزرنیم | ایدی | منشن
● تنظیم کاربر به عنوان مالک گروه

حذف مالک ریپلای | یوزرنیم | ایدی | منشن
● تنزل مقام کاربر از مالکیت گروه

● لیست مالکان
● لیست مالکان گروه

افزودن لیست سیاه
● افزودن اعضای مسدود شده به گروه

تنظیم مقام متن
● تنظیم لقب کاربر با ریپلی

حذف مقام
● حذف لقب کاربر با ریپلی

●بن گلوبال ریپلای | یوزرنیم | ایدی | منشن
افزودن کاربر به لیست مسدودیت های کلی

ان بن گلوبال ریپلای | یوزرنیم | ایدی | منشن
● حذف کاربر از لیست مسدودیت های کلی

بلاک ریپلای | یوزرنیم | ایدی | منشن
● بلاک کردن کاربر از اکانت ربات

انبلاک ریپلای | یوزرنیم | ایدی | منشن
● انبلاک کردن کاربر از اکانت ربات

لیست گلوبال
● لیست کاربران مسدودشده کلی

پاکسازی لیست گلوبال
● پاکسازی لیست مسدود شدگان کلی

امار
● امار ربات

ریستارت
● بازنشانی امار ربات

ارسال به گروها ریپلای
● ارسال پیام به همه گروها با ریپلی بر روی پیام

فوروارد به گروها ریپلای
● فوروارد پیام به همه گروه ها با ریپلی بر روی
پیام

فوروارد به مالکان ریپلای
● فوروارد پیام به همه مالکان گروها با ریپلی بر روی پیام

تنظیم بلاک خودکار عدد
● تنظیم تعداد دستور پشت سر هم مجاز در پی وی ربات

بلاک خودکار فعال | غیرفعال
● فعال ویا غیرفعال کردن بلاک کردن خودکار در صورت اسپم کردن دستورات در پی وی ربات





]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'بازگشت',callback_data = 'Ramin:helpsudo:'..chat_id},
{text = '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'sudotwo' then
txt = [[
به دستورات سودو بخش دوم خوش آمدید!
━━━━━━━━━━━━━━━

ریلود
● ریلود سورس


لیست گروها
● گروهای ربات


استارت @Username
● استارت کردن ربات api توسط ربات

پنل گروها
● دریافت پنل گروهای ربات


جوین چنل روشن | خاموش
● فعال یا غیرفعال کردن عضویت در چنل برای دستور دادن به ربات

شماره ربات
● جهت دریافت شماره اکانت Cli

تنظیم یوزرنیم @Username
● تنظیم نام کاربری ربات

تنظیم نام
● تنظیم نام ربات

تنظیم بیو
● تنظیم متن بیوگرافی ربات

افزودن سودو ریپلای | یوزرنیم | ایدی | منشن
● تنظیم کاربر به مقام سودو ربات

حذف سودو ریپلای | یوزرنیم | ایدی | منشن
● تنزل کاربر از مقام سودو ربات

لیست سودو ها
● لیست سودو های ربات

پاکسازی لیست سودو
● پاکسازی لیست سودو های ربات

تیک دوم فعال | غیرفعال
● فعال و یاغیرفعال کردن تیک دوم

منشی فعال | غیرفعال
● فعال و یاغیرفعال کردن منشی

تنظیم منشی متن
● تنظیم متن منشی

تنظیم نرخ متن
● تنظیم متن نرخ خرید ربات


]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'بازگشت',callback_data = 'Ramin:helpsudo:'..chat_id},
{text = '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}}}
Edit(msg,txt,keyboard,true)


elseif MenuName == 'modh' then
txt = [[
•• راهنمای مربوط به تنظیمات کاربری بخش اول :

◈ دستور تنظیم کردن ادمین گروه وربات،کاربری هست که می تواند با این دستور به هم به ادمینی گروه و ربات تنظیم شود و به دستورات تنظیمات ربات  با توجه به ادمین بودن گروه انجام وظیفه کند.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 ادمین
🅵 حذف ادمین
🅵 ادمین ها

دستورات انگلیسی🇬🇧:

🅴 setadmin
🅴 remadmin
🅴 admins



]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'modhm' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش دوم :

◈ دستور مدیر کردن ربات  توسط مالکین گروه انجام می شود و کاربر تنظیم شده به عنوان ادمین ربات ارتقا داده می شود کاربر مدیر شده  به هیچ وجه به دستورات مالک گروه دسترسی نداردمعمولا با این دستور کاربرانی که ادمین هستند ارتقا داده می شود.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 ارتقا
🅵 عزل
🅵 لیست مدیران

دستورات انگلیسی🇬🇧:

🅴 promote
🅴 demote
🅴 modlist

◈ برای ارتقا دادن کلی ادمین های گروه به ادمین ربات می توانید با این دستور انجام دهید به صورت کلی ادمین های گروه ارتقا به ادمین ربات داده می شود.

دستورات فارسی🇮🇷:

🅵 پیکربندی

دستورات انگلیسی🇬🇧:

🅴 config

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'modhe' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش سوم :

> *  ارتقا دادن کاربر به دستورات ربات  :*

• `تنظیم معاون`
• `حذف معاون`
• `لیست معاون ها`


• `setnazem`
• `remnazem`
• `nazemlist`

○ _ دستور تنظیم معاون گروه فقط به وسیله مالک گروه انجام می شود و مالک گروه می تواند یک کاربر رو به عنوان معاون انتخاب کند تا دستورات مالک گروه دسترسی داشته باشد._

◆_ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید._



]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'mojaz' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش چهارم :

◈ دستور مجاز کردن یا عضو ویژه  توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان کاربر ویژه ارتقا داده می شود کاربر ویژه به این صورت است به دستورات کلی ربات دسترسی ندارد ولی موارد قفل شده و ارسال تمام موارد آزاد می شود.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 عضو ویژه
🅵 حذف ویژه
🅵 لیست ویژه

دستورات انگلیسی🇬🇧:

🅴 setvip
🅴 remvip
🅴 viplist

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'nazemset' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش پنجم :

◈ دستور مدیر افتخاری توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان ادمین تست ارتقا داده می شود کاربر مدیر افتخاری به هیچ وجه با کاربر ویژه شده فرق دارد.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 مدیر افتخاری
🅵 حذف افتخاری
🅵 لیست مدیران افتخاری

دستورات انگلیسی🇬🇧:

🅴 promotetest
🅴 demotetset
🅴 modlisttest


]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'banset' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش ششم :

◈ دستور مسدود کردن کاربر توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان کاربر مسدود شده (اخراج )شناخته می شود کاربر مسدود شده به این صورت است به صورت کامل از گروه حذف و دسترسی  عضو شدن دوباره ندارد.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 مسدود
🅵 حذف مسدود
🅵 لیست مسدود

دستورات انگلیسی🇬🇧:

🅴 ban
🅴 unban
🅴 ban list

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'muteset' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش هفتم :

◈ دستور سکوت کردن کاربر توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان کاربر سکوت شده (بسته شدن پیام)شناخته می شود کاربر سکوت شده به این صورت است به صورت کامل در گروه توانایی چت کردن و ندارد.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 سکوت
🅵 حذف سکوت
🅵 لیست سکوت

دستورات انگلیسی🇬🇧:

🅴 mute
🅴 unmute
🅴 mute list

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'mutesetmedia' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش یازدهم :

◈ دستور سکوت کردن کاربر توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان کاربر سکوت رسانه شده (بسته شدن پیام های رسانه ای)شناخته می شود کاربر سکوت رسانه شده به این صورت است به صورت کامل در گروه توانایی ارسال گیف ،استیکر،فیلم،استیکرمتحرک،فیلم سلفی،ارسال بازی،موزیک،فایل را ندارد.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵  سکوت رسانه
🅵 حذف سکوت رسانه
🅵 لیست سکوت رسانه
🅵 سکوت رسانه عدد دقیقه
دستورات انگلیسی🇬🇧:

🅴 mutemedia
🅴 unmutemedia
🅴 mutemedia list
🅴 mutemedia num d

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'warnset' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش هشتم :

◈ دستور اخطار دادن به کاربر توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان کاربر اخطاری گروه شناخته می شود کاربر اخطار شده به این صورت است به صورت کامل در گروه توانایی چت کردن دارد ولی به حداکثر اخطار تنظیمی برسد از گروه به سه حالت ممکن(اخراج-سکوت-سکوت زمانی) اعمال می شود .

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

༻بخش اول دستورات تنظیم اخطار༺

دستورات فارسی🇮🇷:

🅵 اخطار
🅵 حذف اخطار
🅵 لیست اخطار
دستورات انگلیسی🇬🇧:

🅴 warn
🅴 unwarn
🅴 warn list

༻بخش دوم دستورات تنظیم اخطار༺

دستورات فارسی🇮🇷:
◆ با دستورات می توانید از اخراج ، سکوت، سکوت زمانی استفاده کنید.

🅵 حالت اخطار
🅵 حداکثر اخطار عدد

دستورات انگلیسی🇬🇧:

🅴 setwarn
🅴 warnmax num

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'tabchiset' then
txt = [[

••راهنمای مربوط به تنظیمات کاربری بخش نهم :

◈ دستور تبچی کردن کاربر توسط مالکین و ادمین های گروه انجام می شود و کاربر تنظیم شده به عنوان کاربر ربات تبلیغگر شده (مسدود از همه گروه ها)شناخته می شود کاربر تبچی شده به این صورت است به صورت کامل در تمامی گروه توانایی عضو شدن را  ندارد.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 تبچی
🅵 ازاد
🅵 پاکسازی تبچی ها

دستورات انگلیسی🇬🇧:

🅴 tabchi
🅴 free
🅴 clean tabchi


]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
Edit(msg,txt,keyboard,true)

elseif MenuName == 'rankset' then
txt = [[
••راهنمای مربوط به تنظیمات کاربری بخش دهم :

◈ دستور لقب دادن کاربر توسط مالک گروه انجام می شود به این صورت است که وقتی به کاربر لقب می دهی بالای باکس پیامش لقب کاربر قابل مشاهده می شود.
نکته حتما کاربر توسط ربات ارتقا ادمین شدن گروه داده بشود.

◆ با دستورات می توانید از ریپلای ، یوزرنیم ، منشن و آیدی عددی استفاده کنید.

دستورات فارسی🇮🇷:

🅵 تنظیم لقب کلمه
🅵 حذف لقب

دستورات انگلیسی🇬🇧:

🅴 setrank
🅴 delrank

]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'ادمین کردن',callback_data = 'Ramin:modh:'..chat_id},
{text = 'مدیر کردن ',callback_data = 'Ramin:modhm:'..chat_id},
},{{text = 'معاون کردن',callback_data = 'Ramin:modhe:'..chat_id},
{text = 'مجازکردن',callback_data = 'Ramin:mojaz:'..chat_id},
},{{text = 'مدیر افتخاری',callback_data = 'Ramin:nazemset:'..chat_id},
{text = 'مسدودکردن',callback_data = 'Ramin:banset:'..chat_id},
},{{text = 'سکوت زدن',callback_data = 'Ramin:muteset:'..chat_id},
{text = 'اخطاردادن',callback_data = 'Ramin:warnset:'..chat_id},
},{{text = 'تبچی زدن',callback_data = 'Ramin:tabchiset:'..chat_id},
{text = 'سکوت رسانه',callback_data = 'Ramin:mutesetmedia:'..chat_id},
},{{text = 'تنظیم مقام',callback_data = 'Ramin:rankset:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'seth' then
txt = [[
•• `راهنمای مربوط به قفل گروه` :
▁▁▁▂▂▂▂▂▂▂▁▁▁

*>  قفل کردن ساعتی دقیق گروه  :*

• قفل گروه  |`ساعت دقیقه ثانیه`|
• lockgp |`hor min sec`|


○ _این دستور برای قفل کردن گروه به صورت دقیق به کار می رود که با فعال شدن این دستور چت کردن کلی برای کاربران به صورت زمانی بسته می شود._
⁃------------------------------------------⁃
*> قفل کردن ساعتی گروه روش دوم(ساعتی):*

• قفل گروه |`عدد س`|
• lockgp |`num h`|


○ _این دستور برای قفل کردن گروه به صورت دقیق به کار می رود که با فعال شدن این دستور چت کردن کلی برای کاربران به صورت زمانی ساعتی بسته می شود._

⁃------------------------------------------⁃
*> قفل کردن ساعتی گروه به روش سوم(دقیقه ای):*

• قفل گروه |`عدد د`|
• lockgp | `num d`|

○ _این دستور برای قفل کردن گروه به صورت دقیق به کار می رود که با فعال شدن این دستور چت کردن کلی برای کاربران به صورت زمانی دقیقه ای بسته می شود._
⁃------------------------------------------⁃
*> دستور باز کردن گروه:*

• بازکردن گروه
• unmuteall

○ _این دستور برای باز کردن گروه  به کار می رود که با غیرفعال شدن این دستور چت کردن کلی برای کاربران به صورت کلی  باز می شود._
⁃------------------------------------------⁃
*> دستور قفل کردن خودکار گروه(تنظیم زمان قفل):*

• قفل خودکار  |`ساعت پایان` -`ساعت شروع`|
• lock auto (`hour start`-`hour end`)

» مثال :
قفل خودکار 08:00-02:00
○ _این دستور برای قفل کردن گروه به صورت خودکار به کار می رود که با فعال شدن  قفل گروه چت کردن کلی برای کاربران به صورت کلی  از ساعت شروع تا ساعت پایان قفل می شود._
⁃------------------------------------------⁃
> *دستور قفل کردن خودکار گروه:*

• قفل خودکار |`فعال-غیرفعال`|
•  lockauto |`on-off`|

○ _این دستور برای فعال یا غیرفعال کردن گروه به صورت خودکار به کار می رود که بعد از تنظیم کردن زمان قفل خودکار دستور قفل خودکار فعال را ارسال می کنیم._
⁃------------------------------------------⁃
*> دستور حالت کردن قفل خودکار گروه:*

•  حالت قفل خودکار |`محدود-حذف`|
•  muteall |`mute-del`|


○ _این دستور برای حالت گذاشتن قفل خودکار گروه به کار می رود که بعد از تنظیم کردن حالت قفل خودکار می توانیم حالت پاک شدن پیام های کاربران گروه را انجام دهیم._
⁃------------------------------------------⁃
*> دستور سنجاق کردن در گروه:*

•  سنجاق |`ریپلای پیام`|
• pin |`replymsg`|

○ _این دستور برای سنجاق کردن  پیام گروه به کار می رود که بعد از ریپلای کردن رو پیام کاربر می توانیم پیام های دلخواه کاربران گروه را سنجاق کنیم._

⁃------------------------------------------⁃
*> دستور حذف سنجاق  در گروه:*

•  حذف سنجاق |`ریپلای پیام سنجاقی`|
• unpin |`replye pin msg`|

○ _این دستور برای حذف سنجاق شده پیام گروه به کار می رود که بعد از ریپلای کردن رو پیام کاربر می توانیم پیام های دلخواه  سنجاق شده را از سنجاقی حذف کنیم._
⁃------------------------------------------⁃
*> دستور حذف سنجاق  در گروه:*

• جوین  |`فعال-غیرفعال`|
• join |`on-off`|

○ _این دستور برای قفل کردن لینک گروه جهت جوین نشدن به کار می رود که کاربر جدید به محض عضو شدن در گروه از گروه اخراج خواهد شد._
⁃------------------------------------------⁃
*> دستور تنظیم سکوت زمانی  در گروه:*

• زمان سکوت |`عدد ساعت`|
• setmutetime |`num hour`|

○ _این دستور برای تنظیم کردن زمان سکوت شدن کاربرانی که داخل گروه سکوت و محدود می شوند می توانید تعداد ساعت سکوت را افزایش یا کاهش دهید._
]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '► بعدی',callback_data = 'Ramin:sethlock:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
------------------تنظیمات راهنما-----------------
elseif MenuName == 'sethlock' then
txt = [[
•• راهنمای مربوط به تنظیمات ربات در گروه بخش دوم:
▁▁▁▂▂▂▂▂▂▂▁▁▁

> *ارسال خوش آمدگویی ربات :*

• خوش امدگویی  |`فعال-غیرفعال`|
• welcome |`on-off`|

○ _این دستور برای خوش آمدگویی گفتن گروه به کار می رود که با فعال شدن این دستور هر کاربری در گروه عضو شود پیام خوش آمدگویی توسط ربات ارسال می شود._

⁃------------------------------------------⁃
> *تنظیم متن خوش آمدگویی ربات :*

• تنظیم خوش امدگویی |`متن`|
• setwelcome |`text`|

○ _شما میتوانید در متن خوش امد گویی از عبارات زیر استفاده کنید_ :
☐ FIRSTNAME >> `نام کوچک`
☐ LASTNAME >> `نام خانوادگی`
☐ USERNAME >> `یوزرنیم`
☐ RULES >> `قوانین`
☐ GROUP >> `نام گروه`
☐ LINK >> `لینک گروه`
☐ ABOUT >>` درباره گروه`
⁃------------------------------------------⁃
> *حذف متن خوش آمدگویی ربات :*

• حذف خوش امدگویی
• remwelcome

○ _این دستور برای حذف متن خوش آمدگویی درگروه به کار می رود که با ارسال این دستور متن پیام خوش آمدگویی به حالت پیش فرض تنظیم می شود._

⁃------------------------------------------⁃
> *خوش آمدگویی ربات به صورت ساعتی :*

• خوش امدگویی |`عدد س`|
• welcometime |`num h`|

○ _این دستور برای ارسال خوش آمدگویی درگروه به صورت ساعتی به کار می رود که با ارسال این دستور متن پیام خوش آمدگویی در یک ساعت مشخص ارسال می شود._
⁃------------------------------------------⁃

> *تنظیم ربات به وسیله پنل شیشه ای :*

•  پنل
• panel

○ _این دستور برای تنظیم کردن ربات به صورت دکمه شیشه ای به کار می رود که با ظاهرشدن دکمه شیشه ای ربات می توانیم بدون هیچ دستور متنی تنظیمات ربات را انجام دهیم._
⁃------------------------------------------⁃

> *تنظیم ربات به وسیله پنل شیشه ای در پیوی :*

•  پنل پیوی
• panel pv

○ _این دستور برای تنظیم کردن ربات به صورت دکمه شیشه ای در پیوی ربات به کار می رود که با ظاهرشدن دکمه شیشه ای ربات در پیوی می توانیم بدون هیچ دستور متنی تنظیمات ربات در پیوی  انجام دهیم._

⁃------------------------------------------⁃


]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = ' قبلی ◄',callback_data = 'Ramin:seth:'..chat_id},
{text = '► بعدی ',callback_data = 'Ramin:sethclear:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'sethclear' then
txt = [[
•• راهنمای مربوط به تنظیمات ربات در گروه بخش سوم:
▁▁▁▂▂▂▂▂▂▂▁▁▁

> *ریست کردن کلیه تنظیمات ربات :*

• تنظیمات کارخانه
• unlock mode

○ _این دستور برای ریست کردن و غیر فعال کردن تمامی تنظیمات ربات  می باشد که با ارسال این دستور تمام قفل های ربات به حالت غیرفعال تنظیم می شود._

⁃------------------------------------------⁃

> *محدود کردن پنل مدیریتی :*

• قفل پنل |`فعال-غیرفعال`|
• panel |`public-privite`|

○ _این دستور برای دسترسی عمومی وخصوصی بودن پنل مدیریتی به کار می رود._
⁃------------------------------------------⁃
> *محدود کردن دستورات ربات :*

• دستورات |`فعال-غیرفعال`|
• cmds |`on-off`|

○ _این دستور برای دسترسی عمومی وخصوصی بودن دستورات عادی از کاربران گروه به کار می رود._
⁃------------------------------------------⁃
> *پاکسازی دستور ارسال کننده :*

• پاکسازی دستور |`فعال-غیرفعال`|
• delcmd |`on-off`|

○ _این دستور برای پاکسازی دستور مدیر ها به کار می رود که هر مدیری از دستورات ربات استفاده کند پیام دستور اولیه در گروه حذف و مخفی خواهد شد._
⁃------------------------------------------⁃

> *پاکسازی خودکار کلیه پیام ها :*

• پاکسازی خودکار |`فعال-غیرفعال`|
• cgm |`on-off`|

○ _این دستور برای پاکسازی خودکار کلیه پیام ها به کار می رود که با تنظیم کردن تعداد ساعت پاکسازی پیام ها عملیات پاکسازی کلی پیام در ساعات مشخص انجام می شود._

⁃------------------------------------------⁃
> *تنظیم زمان پاکسازی کلی  خودکار پیام ها :*

• زمان پاکسازی خودکار |`عدد ساعت`|
•  cleanerautotime |num h|

○ _این دستور برای تنظیم ساعت پاکسازی خودکار کلیه پیام ها به کار می رود که با تنظیم کردن تعداد ساعت پاکسازی پیام ها عملیات پاکسازی کلی پیام در ساعات تنظیم شده انجام می شود._
⁃------------------------------------------⁃
> * پاکسازی  خودکار پیام ربات :*

• پاکسازی پیام ربات |`فعال-غیرفعال`|
• cbm |on-off|


○ _این دستور برای تنظیم پاکسازی خودکار  پیام های ربات به کار می رود که با تنظیم کردن تعداد زمان پاکسازی پیام ربات عملیات پاکسازی پیام  ربات در ساعات تنظیم شده انجام می شود._

⁃------------------------------------------⁃

> * زمان پاکسازی  خودکار پیام ربات :*

• زمان پاکسازی پیام ربات |`عدد ثانیه`|
• cbmtime |`num s`|

○ _این دستور برای تنظیم زمان پاکسازی خودکار  پیام های ربات به کار می رود که با تنظیم کردن تعداد زمان پاکسازی پیام ربات عملیات پاکسازی پیام  ربات در زمان تنظیم شده انجام می شود._

⁃------------------------------------------⁃



]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'قبلی ◄',callback_data = 'Ramin:sethlock:'..chat_id},
{text = '► بعدی ',callback_data = 'Ramin:seth2:'..chat_id}
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'seth2' then
txt = [[
•• راهنمای مربوط به تنظیمات ربات در گروه بخش چهارم :
▁▁▁▂▂▂▂▂▂▂▁▁▁

> *فیلتر کردن اسم اکانت  :*

• فیلتر اسم  |`نام`|
• filtername |`name`|

○ _این دستور برای فیلتر کردن کاربر های که با اسم غیر اخلاقی وارد گروه می شود به کار برده می شود معمولا ربات های تبچی چنین اسم هایی دارند._
⁃------------------------------------------⁃

> *حذف فیلتر کردن اسم اکانت  :*

• حذف فیلتر اسم |`نام`|
•  remfiltername |`name`|

○ _این دستور برای حذف فیلتر کردن کاربر های که با اسم غیر اخلاقی وارد گروه می شود به کار برده می شود که با حذف اسم دلخواه کاربر اجازه ورود در گروه را خواهد داشت._

⁃------------------------------------------⁃

> * فیلتر کردن بیوگرافی اکانت  :*

•  فیلتر بیو |`متن بیوگرافی`|
•  filterbio |`text bio`|

○ _این دستور برای فیلتر کردن کاربر های که با بیوگرافی غیر اخلاقی وارد گروه می شود به کار برده می شود معمولا ربات های تبچی چنین بیوگرافی هایی دارند._

⁃------------------------------------------⁃

> *حذف فیلتر کردن بیوگرافی اکانت  :*

•  حذف فیلتر بیو |`متن بیوگرافی`|
• remfilterbio |`text bio`|

○ _این دستور برای حذف فیلتر کردن کاربر های که با بیوگرافی غیر اخلاقی وارد گروه می شود به کار برده می شود که با حذف بیوگرافی  دلخواه کاربر اجازه ورود در گروه را خواهد داشت._
⁃------------------------------------------⁃

• مسدود فیلتر استیکر |`روشن-خاموش`|
• ban filtersticker |`on-off`|

○ _این دستور برای استیکر هایی که در لیست فیلتر ها می باشد به کار می رود که با فیلتر کردن پک استیکر غیراخلاقی هر کاربری از استیکر فیلتر شده به کار ببرد از گروه مسدود خواهد شد._
⁃------------------------------------------⁃
> * فیلتر کردن کلمه دلخواه  :*

• فیلترکردن |`کلمه`|
• filter |`text`|


○ _این دستور برای کلمه هایی که در لیست فیلتر ها می باشد به کار می رود که با فیلتر کردن کلمه غیراخلاقی ،هر کاربری از کلمه  فیلتر شده به کار ببرد حذف خواهد شد._

⁃------------------------------------------⁃
> *حذف فیلتر کردن کلمه دلخواه  :*

• حذف فیلتر |`کلمه`|
• remfilter |`text`|

○ _این دستور برای کلمه هایی که در لیست فیلتر ها می باشد به کار می رود که باحذف فیلتر کردن کلمه غیراخلاقی ،هر کاربری ازکلمه فیلتر شده به کار ببرد حذف نخواهد شد._

⁃------------------------------------------⁃

> *حذف فیلتر کردن استیکر دلخواه  :*

• فیلتر پک استیکر |`ریپلای استیکر`|
• filterstickerpack |`replysticker`|

○ _این دستور برای کلمه هایی که در لیست فیلتر ها می باشد به کار می رود که با فیلتر کردن کلمه غیراخلاقی ،هر کاربری از کلمه  فیلتر شده به کار ببرد حذف خواهد شد._
⁃------------------------------------------⁃

• حذف پک استیکر |`ریپلای استیکر`|
• remfilterstickerpack |`replysticker`|

○ _این دستور برای استیکرهایی که در لیست فیلتر ها می باشد به کار می رود که با حذف پک استیکر غیراخلاقی ،هر کاربری از استیکر که  فیلتر شده به کار ببرد حذف نخواهد شد._
⁃------------------------------------------⁃
]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = ' قبلی ◄ ',callback_data = 'Ramin:sethclear:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

------------------------------------------------
elseif MenuName == 'forch' then
txt = [[

•• راهنمای مربوط به محدودیت اجباری گروه  بخش اول:
▁▁▁▂▂▂▂▂▂▂▁▁▁

> *دستور اداجباری گروه :*

• افزودن اجباری |`فعال-غیرفعال`|
• forceadd |`on-off`|

○ _این دستور برای فعال کردن محدودیت اداجباری کاربر ها استفاده می شود.که کاربران گروه به مقدار تعیین شده باید اد بزنند تا چت کردن در گروه آزاد باشند._
⁃------------------------------------------⁃

> *دستور ریست افزودن اجباری:*

•` شروع دوباره افزودن اجباری`
• `restart forceadd`

○ _این دستور برای ریست کردن محدودیت اداجباری کاربر ها استفاده می شود._
⁃------------------------------------------⁃
> *دستور اد فیلتر افزودن اجباری:*

• اد فیلتر |`فعال-غیرفعال`|
•  add filter |on-off|

○ _این دستور برای تنظیم کردن محدودیت اد اجباری کاربر ها به صورت فیلترکردن کلمات استفاده می شود._
⁃------------------------------------------⁃
> *دستور  فیلتر جوین افزودن اجباری:*

• فیلتر جوین |`کلمه`|
• filterjoin |`text`|

○ _این دستور برای تنظیم کردن کلمه جوین اجباری کاربر ها  استفاده می شود._
⁃------------------------------------------⁃
> *دستور  تغییر متن  افزودن اجباری:*

• تنظیم متن اداجباری |`متن`|
•  settextadd |`text`|

○ _این دستور برای تنظیم متن اختیاری اداجباری استفاده می شود.شما میتوانید در متن ادجباری اختیاری از عبارات زیر استفادہ کنید : _
FIRSTNAMEMAN >>` نام کاربر `
FIRSTNAME >>` نام اول کاربر`
LASTNAME >>` نام دوم کاربر `
USERNAME >>` یوزرنیم `
MANDE >>` مانده کل اداجباری`
FORCEMAX >>` کل اداجباری`
ADDED >>` تعداد ادکرده`

⁃------------------------------------------⁃
> *دستور  حذف متن  افزودن اجباری:*

• حذف پیام اداجباری
• deltextjoin

○ _این دستور برای حذف متن اختیاری تنظیمی اداجباری استفاده می شود._

]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = '► بعدی',callback_data = 'Ramin:forch1:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
elseif MenuName == 'forch1' then
txt = [[
•• راهنمای مربوط به محدودیت اجباری کانال  بخش اول:
▁▁▁▂▂▂▂▂▂▂▁▁▁

> *دستور جوین اجباری گروه به کانال :*

• جوین اجباری |`فعال-غیرفعال`|
• forcejoin |`on-off`|

○ _این دستور برای فعال جوین اجباری کانال تنظیمی استفاده می شود.که هر کاربری در گروه به محض چت کردن در گروه باید عضو کانال دلخواه شما شود._
⁃------------------------------------------⁃
> *دستور تنظیم اجباری کانال :*

• تنظیم کانال |`یوزرنیم کانال بدون @`|
• setch |`username not @`|

○ _این دستور برای تنظیم کردن جوین اجباری کانال  استفاده می شود._
⁃------------------------------------------⁃
> *دستور تنظیم جوی اجباری کانال :*

• جوین فیلتر |`فعال-غیرفعال`|
• join filter |on-off|

○ _این دستور برای تنظیم کردن محدودیت جوین اجباری کاربر ها به صورت فیلترکردن کلمات استفاده می شود._

⁃------------------------------------------⁃

> *دستور تنظیم فیلتر جوین اجباری کانال :*

• فیلتر جوین |`کلمه`|
• filterjoin |text|

○ _ این دستور برای تنظیم کردن کلمه جوین اجباری کاربر ها  استفاده می شود._
⁃------------------------------------------⁃
> *دستور تنظیم متن جوین اجباری کانال :*

• تنظیم متن عضویت اجباری |`متن`|
• settextjoin |`text`|

○ _این دستور برای تنظیم عضویت اجباری کانال اختیاری استفاده می شود.شما میتوانید در متن عضویت اجباری کانال اختیاری از عبارات زیر استفادہ کنید :_

FIRSTNAMEMAN >>` نام کاربر `
FIRSTNAME >>` نام اول کاربر`
LASTNAME >>` نام دوم کاربر `
USERNAME >>` یوزرنیم `
NameCH >>` نام کانال تنظیمی`

⁃------------------------------------------⁃

> *دستور تنظیم حذف متن جوین اجباری کانال :*

• حذف پیام عضویت اجباری
•  deltextjoin

○ _این دستور برای حذف متن اختیاری عضویت اجباری کانال استفاده می شود._
⁃------------------------------------------⁃

> *دستور تنظیم نام جوین اجباری کانال :*

•  تنظیم اسم کانال |`نام`|
• setnamejoin

○ _این دستور برای تنظیم نام اختیاری دکمه عضویت اجباری کانال استفاده می شود._

⁃------------------------------------------⁃
> *دستور تنظیم نام جوین اجباری کانال :*

• حذف اسم کانال
• delnamejoin

○ _این دستور برای حذف نام اختیاری دکمه عضویت اجباری کانال استفاده می شود._

]]

local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = ' قبلی ◄',callback_data = 'Ramin:forch:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
-------------------------قفل ها-------------------------
elseif MenuName == 'lockh' then
txt = [[
•• بخش راهنمای قفل ها:
▁▁▁▂▂▂▂▂▂▂▁▁▁
⟁ قفل ربات
🄱 بازکردن ربات
⟁ قفل لینک
🄱 بازکردن لینک
⟁ قفل لینک بیو
🄱 بازکردن لینک بیو
⟁ قفل فوروارد
🄱 بازکردن فوروارد
⟁ قفل فحش
🄱 بازکردن فحش
⟁ قفل وب
🄱 بازکردن وب
⟁ قفل فونت
🄱 بازکردن فونت
⟁ قفل فراخانی
🄱 بازکردن فراخانی
⟁ قفل هشتگ
🄱 بازکردن هشتگ
⟁ قفل یوزرنیم
🄱 بازکردن یوزرنیم
⟁ قفل فارسی
🄱 بازکردن فارسی
⟁ قفل اسپم
🄱 بازکردن اسپم
⟁ قفل آهنگ
🄱 بازکردن آهنگ
⟁ قفل فیلم
🄱 بازکردن فیلم
⟁ قفل کپشن
🄱 بازکردن کپشن
⟁ قفل متن
🄱 بازکردن متن
⟁ قفل پیام مکرر
🄱 بازکردن پیام مکرر
⟁ قفل ویرایش
🄱 بازکردن ویرایش
⟁ قفل هایپر
🄱 بازکردن هایپر
⟁ قفل بدافزار
🄱 بازکردن بدافزار
⟁ قفل پست کانال
🄱 بازکردن پست کانال
⟁ قفل استیکر
🄱 بازکردن استیکر
⟁ قفل استیکر متحرک
🄱 بازکردن استیکر متحرک
⟁ قفل مخاطب
🄱 بازکردن مخاطب
⟁ قفل موقعیت مکانی
🄱 بازکردن موقعیت مکانی
⟁ قفل موقعیت مکانی
🄱 بازکردن موقعیت مکانی
⟁ قفل ویس
🄱 بازکردن ویس
⟁ قفل ویدیومسیج
🄱 بازکردن ویدیومسیج
⟁ قفل بازی
🄱 بازکردن بازی

]]
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '► بعدی ',callback_data = 'Ramin:lockh1:'..chat_id},
},{
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'lockh1' then
txt = [[
••  بخش راهنمای قفل ها به صورت واکنشی:
▁▁▁▂▂▂▂▂▂▂▁▁▁
برای تنظیم کردن حالت های قفل ها به صورت واکنشی باید مواردی که در زیر هست را درنظر بگیریم:

لیست قفل ها :   {`ربات-لینک-لینک بیو-فوروارد-فحش-وب-فونت -فراخانی-هشتگ-یوزرنیم-فارسی-اسپم-آهنگ-فیلم-کپشن-متن-پیام مکرر-ویرایش-هایپر-بدافزار-پست کانال-استیکر- استیکر متحرک-مخاطب-موقعیت مکانی-موقعیت مکانی-ویس-ویدیومسیج-بازی`}

» تعداد حالت ها : {`مسدود-اخراج-سکوت-سایلنت-اخطار`}

مثال : می خواهیم حالت واکنشی حذف لینک رو به مسدود شدن کاربر تغییر بدهیم برای ارسال دستور به صورت ذیل است

`حالت لینک مسدود`
`حالت عکس مسدود`


🄺 حذف (آپشن ها) `عدد س`
✓ `منظور از آپشن ها {لینک-یوزرنیم-گیف-استیکر-گیف-فیلم-فورواردوغیره}`
✓ `منظور از س یعنی ساعت`
✓ `منظور از د یعنی دقیقه`
✓ `منظور از ث یعنی ثانیه`
✓ `مثال دستوری : حذف لینک 1س`
دراین اینجا لینک از حالت قفل ثابت خارج به صورت زمانی تغییر میکند وبعد اتمام زمان قفل لینک باز خواهد شد.


]]
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'قبلی ◄ ',callback_data = 'Ramin:lockh:'..chat_id},
{text = '► بعدی ',callback_data = 'Ramin:lockh2:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'lockh2' then
txt = 'این بخش به زودی با آپدیت های جدید تکمیل خواهد شد !'
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text = 'قبلی ◄ ',callback_data = 'Ramin:lockh:'..chat_id},
},{{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
---------------------------راهنما پاکسازی-------------------------------
elseif MenuName == 'cleanh' then
txt = [[
•• بخش کلیه دستورات پاکسازی ربات:
━━━━━━━━━━━━━━━━
> *دستور پاکسازی پیام ها :*

• پاکسازی پیام
• پاکسازی |عدد|
• cgmall
• cgm |num|

○ _از این دستور می توانیم پیام های گروه رو به صورت عددی از 1تا 1000پاکسازی کنیم. _

⁃------------------------------------------⁃
○ _در این بخش می توانیم با توجه به لیست های تعیین شده موارد را از سیستم ربات پاکسازی کنیم_

> *دستور پاکسازی لیست ها بخش اول  :*


•  پاکسازی |لیست ها|
•  clean |list|

◂لیست ها:
{ربات ها-لینک ها-یوزرنیم ها-آهنگ ها-فیلم ها-استیکر ها-ویس ها-سرویس تلگرام-بازی ها-گیف ها-عکس ها}

> list :
{stickers,videos,files,photos,gifs,musics,voices,games,tgservice}
» مثال : پاکسازی لینک ها

⁃------------------------------------------⁃

> *دستور پاکسازی لیست ها بخش دوم :*


◂لیست ها:
{بیوهای غیرمجاز-اسم غیرمجاز-فیلتر-محدود-اخطار-ویژه-معاف-فیک-دلیت اکانت ها-سایلنت-سکوت-مسدود-محدود شدگان قفلی-مدیران-معاون ها}

> list : {filterbiolist-filternamelist-filterlist-res-warnlist-viplist-vipaddlist-fake-deleteacc-mutelist-banlist-lockedlist-modlist-NazemList}

]]
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)

elseif MenuName == 'funh' then
txt = [[
◂ زمان
◂ هواشناسی {شهر}
◂ زیباسازی لاتین {کلمه}
◂ سگ | گربه | پرنده
◂ تعبیر خواب {کلمه}
◂ اذان {شهر}
◂ وضعیت من
◂ عکس پروفایل {عدد}
◂ پروفایل من
◂ تبدیل به استیکر
◂ تبدیل به عکس
◂ ایدی
◂ بشمار {ایدی-یوزرنیم-ریپلای}
◂ نجوا {ریپلای}
◂ ارز
◂ آمار کرونا
◂ دانستنی
◂ شعر حافظ
◂ شعر
◂ دیالوگ ماندگار
◂ جوک
◂ خاطرات خنده دار
◂ پ ن پ
◂ داستان کوتاه
◂ بیوگرافی باحال
◂ لینک عکسدار
◂ لینک عکسدار پیوی
◂ بیکاران گروه
]]
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '➲ راهنما اصلی',callback_data = 'Ramin:hFa:'..chat_id}}}
Edit(msg,txt,keyboard,true)
---------------------------------------------------------------


-----------------------------------------------------------

elseif MenuName == 'lockjoin' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Lock:Join') then
base:srem(TD_ID..'Gp:'..chat_id,'Lock:Join')
Alert(msg.id,'قفل ورود اعضا با لینک غیرفعال شد!',true)
else
base:sadd(TD_ID..'Gp:'..chat_id,'Lock:Join')
Alert(msg.id,'قفل ورود اعضا با لینک فعال شد!',true)
end
SETT(msg,chat_id,55)
elseif MenuName == 'privpanel' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'PanelPv') then
base:srem(TD_ID..'Gp2:'..chat_id,'PanelPv')
Alert(msg.id,'محدویت پنل مدیریت فعال شد.',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'PanelPv')
Alert(msg.id,'محدویت پنل مدیریتی غیرفعال شد.',true)
end
SETT(msg,chat_id,55)
elseif MenuName == 'lockcmds' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Lock:Cmd') then
base:srem(TD_ID..'Gp:'..chat_id,'Lock:Cmd')
Alert(msg.id,'دستورات برای کاربران عادی غیرفعال شد!',true)
else
base:sadd(TD_ID..'Gp:'..chat_id,'Lock:Cmd')
Alert(msg.id,'دستورات برای کاربران عادی فعال شد!',true)
end
SETT(msg,chat_id,55)

elseif MenuName == 'locktabalpha'  then
if base:get(TD_ID.."sg:locktabalpha"..chat_id) == "lock" then
base:del(TD_ID.."sg:locktabalpha"..chat_id)
Alert(msg.id,'• قفل ضد تبچی هوشمند غیر فعال شد.',true)
else
base:set(TD_ID.."sg:locktabalpha"..chat_id,"lock")
Alert(msg.id,'• قفل ضد تبچی هوشمند فعال شد..\nمالک عزیز شناسایی کاربران تبلیغگر ومخرب در گروه از این بابت فعالیت داشته باشد به پیوی شما ارسال خواهد شد.',true)
end
AntiTabchiPnl(msg,chat_id)



elseif MenuName == 'TIMEtabchiredown' then
if not base:get(TD_ID..'CL:tabchire:'..chat_id) then
ST = 5
else
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..chat_id))
end
local res = ST - 1
t = res * 60
if not (res < 1) then
base:set(TD_ID..'CL:tabchire:'..chat_id,res)
base:set(TD_ID..'tabchimediatime:'..chat_id,t)
Alert(msg.id,"• زمان تبچی رسانه تنظیم شد به "..res.." دقیقه!",true)
else
Alert(msg.id,'• حداقل دقیقه می باشد.',true)
end
AntiTabchi2(msg,chat_id)
elseif MenuName == 'TIMEtabchireup' then
if not base:get(TD_ID..'CL:tabchire:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..chat_id))
end
local res = ST + 1
t = res * 60
if not (res > 120 ) then
base:set(TD_ID..'CL:tabchire:'..chat_id,res)
base:set(TD_ID..'tabchimediatime:'..chat_id,t)
Alert(msg.id,"•زمان تبچی رسانه تنظیم شد به "..res.." دقیقه!",true)
else
Alert(msg.id,'• حداکثر 120 دقیقه می باشد !',true)
end
AntiTabchi2(msg,chat_id)

elseif MenuName == 'TIMEtabchire2down' then
if not base:get(TD_ID..'CL:tabchire:'..chat_id) then
ST = 5
else
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..chat_id))
end
local res = ST - 2
t = res * 60
if not (res < 1) then
base:set(TD_ID..'CL:tabchire:'..chat_id,res)
base:set(TD_ID..'tabchimediatime:'..chat_id,t)
Alert(msg.id,"• زمان تبچی رسانه تنظیم شد به "..res.." دقیقه!",true)
else
Alert(msg.id,'• حداقل دقیقه می باشد.',true)
end
AntiTabchi2(msg,chat_id)
elseif MenuName == 'TIMEtabchire2up' then
if not base:get(TD_ID..'CL:tabchire:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..chat_id))
end
local res = ST + 2
t = res * 60
if not (res > 120 ) then
base:set(TD_ID..'CL:tabchire:'..chat_id,res)
base:set(TD_ID..'tabchimediatime:'..chat_id,t)
Alert(msg.id,"•زمان تبچی رسانه تنظیم شد به "..res.." دقیقه!",true)
else
Alert(msg.id,'• حداکثر 120 دقیقه می باشد !',true)
end
AntiTabchi2(msg,chat_id)


elseif MenuName == 'TIMEscandown' then
if not base:get(TD_ID..'CL:TimeScan:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:TimeScan:'..chat_id))
end
local res = ST - 1
t = res * 3600
if not (res < 1) then
base:set(TD_ID..'CL:TimeScan:'..chat_id,res)
base:set(TD_ID..'scantabchiautotime:'..chat_id,t)
Alert(msg.id,"• زمان اسکن تبلیغگر خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداقل ساعت 1 می باشد !',true)
end
AntiTabchi2(msg,chat_id)
elseif MenuName == 'TIMEscanup' then
if not base:get(TD_ID..'CL:TimeScan:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:TimeScan:'..chat_id))
end
local res = ST + 1
t = res * 3600
if not (res > 72) then
base:set(TD_ID..'CL:TimeScan:'..chat_id,res)
base:set(TD_ID..'scantabchiautotime:'..chat_id,t)
Alert(msg.id,"• زمان اسکن تبلیغگر خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر ساعت 72 می باشد !',true)
end
AntiTabchi2(msg,chat_id)


elseif MenuName == 'TIMEscan2down' then
if not base:get(TD_ID..'CL:TimeScan:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:TimeScan:'..chat_id))
end
local res = ST - 2
t = res * 3600
if not (res < 1) then
base:set(TD_ID..'CL:TimeScan:'..chat_id,res)
base:set(TD_ID..'scantabchiautotime:'..chat_id,t)
Alert(msg.id,"• زمان اسکن تبلیغگر خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداقل ساعت 1 می باشد !',true)
end
AntiTabchi2(msg,chat_id)
elseif MenuName == 'TIMEscan2up' then
if not base:get(TD_ID..'CL:TimeScan:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:TimeScan:'..chat_id))
end
local res = ST + 2
t = res * 3600
if not (res > 72) then
base:set(TD_ID..'CL:TimeScan:'..chat_id,res)
base:set(TD_ID..'scantabchiautotime:'..chat_id,t)
Alert(msg.id,"• زمان اسکن تبلیغگر خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر ساعت 72 می باشد !',true)
end
AntiTabchi2(msg,chat_id)

elseif MenuName == 'Scantabautoon' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'scantabautoon') then
base:srem(TD_ID..'Gp2:'..chat_id,'scantabautoon')
base:del(TD_ID..'scantabauto:'..chat_id)
base:del(TD_ID..'scantabchiautotime:'..chat_id)
base:del(TD_ID..'CL:TimeScan:'..chat_id)
Alert(msg.id,'• اسکن تبلیغگر خودکار غیرفعال شد!',true)
else
local timecgm = base:get(TD_ID..'scantabchiautotime:'..chat_id)
if not timecgm then
Alert(msg.id,'• اسکن تبلیغگر خودکار فعال نشد!\nلطفا اول زمان اسکن تبلیغگر را تنظیم کنید جهت تنظیم دکمه ساعت اسکن تبلیغگر کلیک کنید!',true)
else
if timecgm then
local timecgm2 = timecgm / 3600
base:setex(TD_ID..'scantabauto:'..chat_id,timecgm,true)
base:sadd(TD_ID..'Gp2:'..chat_id,'scantabautoon')
Alert(msg.id,'• اسکن تبلیغگر خودکار فعال شد!\n━┄┅┄┅┄┅┄┅┄┅┄┅┄━\n🏷 • زمان اسکن جهت عملیات  '..timecgm2..' ساعت یکبار انجام خواهد شد. ',true)
end
end
end
AntiTabchi2(msg,chat_id)


elseif MenuName == 'lockporn'  then
if is_FullSudo(msg) then
if base:sismember(TD_ID..'Gp:'..chat_id,'Lock:Porn') then
base:srem(TD_ID..'Gp:'..chat_id,'Lock:Porn')
Alert(msg.id,'قفل پورن غیر فعال شد!.')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Lock:Porn')
Alert(msg.id,'قفل پورن فعال شد!')
end
else 
Alert(msg.id,'کاربر عزیز راه اندازی قفل پورن در سیستم شما تعریف نشده است جهت فعالسازی با مالک ربات در ارتباط باشید!',true)
end
SETT(msg,chat_id,34)


elseif MenuName == 'lockpin' then
if base:get(TD_ID.."sg:pin"..chat_id) == "lock" then
base:del(TD_ID.."sg:pin"..chat_id)
Alert(msg.id,'قفل سنجاق غیر فعال شد.')
else
base:set(TD_ID.."sg:pin"..chat_id,"lock")
Alert(msg.id,'قفل سنجاق فعال شد!')
end
SETT(msg,chat_id,98)

elseif MenuName == 'lockpin2' then
if base:get(TD_ID.."sg:pin"..chat_id) == "lock" then
base:del(TD_ID.."sg:pin"..chat_id)
Alert(msg.id,'مجوز سنجاق کردن پیام ها برکلیه ادمین غیرفعال شد.',true)
else
base:set(TD_ID.."sg:pin"..chat_id,"lock")
Alert(msg.id,'مجوز سنجاق کردن پیام ها برکلیه ادمین ها غیرفعال شد.',true)
end
menu(chat_id,60)
elseif MenuName == 'lockpermissions' then
if base:get(TD_ID.."sg:permissions"..chat_id) == "lock" then
base:del(TD_ID.."sg:permissions"..chat_id)
Alert(msg.id,'قفل اتک ادمین ها غیرفعال شد.',true)
else
base:set(TD_ID.."sg:permissions"..chat_id,"lock")
Alert(msg.id,'قفل اتک ادمین ها فعال شد. ',true)
end
menu(chat_id,7)
elseif MenuName == 'alphaautogp' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'autoon') then
base:srem(TD_ID..'Gp2:'..chat_id,'autoon')
base:del(TD_ID.."atolct1"..chat_id)
base:del(TD_ID.."atolct2"..chat_id)
base:del(TD_ID.."lc_ato:"..chat_id)
Alert(msg.id,'• 〔قفل خودکار کلی گروه غیرفعال شد.〕',true)
else
t1 = base:get(TD_ID.."atolct1"..chat_id)
t2 = base:get(TD_ID.."atolct2"..chat_id)
if not t1 or t2 then
Alert(msg.id,'• زمان قفل خودکار تنظیم نشده است لطفا دکمه ساعت قفل را کلیک و زمان را تنظیم کنید! ',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'autoon')
Alert(msg.id,'• قفل خودکار کلی گروه فعال شد!  ',true)
end
end
menu(chat_id,87)
elseif MenuName == 'alphaautopin' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'autoonpin') then
base:del(TD_ID.."Autopin1"..chat_id)
base:del(TD_ID.."Autopin2"..chat_id)
base:del(TD_ID.."autoonpin:"..chat_id)
base:del(TD_ID.."MsgPin:"..chat_id)
Alert(msg.id,'• قفل خودکار سنجاق غیرفعال شد.',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'autoonpin')
Alert(msg.id,'• قفل خودکار سنجاق فعال شد!  ',true)
end
menu(chat_id,87)



elseif MenuName == 'SetCleanHour' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'cgmautoon') then
base:srem(TD_ID..'Gp2:'..chat_id,'cgmautoon')
base:del(TD_ID..'cgmauto:'..chat_id)
base:del(TD_ID..'cgmauto1:'..chat_id)
base:del(TD_ID..'cgmauto2:'..chat_id)
base:del(TD_ID..'cgmauto3:'..chat_id)
base:del(TD_ID..'cgmauto4:'..chat_id)
base:del(TD_ID..'CL:Time:'..chat_id)
base:del(TD_ID..'cgmautotime:'..chat_id)
Alert(msg.id,'• پاکسازی خودکار غیرفعال شد!',true)
else
local timecgm = base:get(TD_ID..'cgmautotime:'..chat_id)
if not timecgm then
Alert(msg.id,'• پاکسازی خودکار پیام ها فعال نشد!\nلطفا اول زمان پاکسازی را تنظیم کنید جهت تنظیم دکمه ساعت پاکسازی کلیک کنید!',true)
else
if timecgm then
local timecgm2 = timecgm / 3600
t1 = timecgm - 60
t2 = timecgm - 300
t3 = timecgm - 1200
t4 = timecgm - 3540
base:setex(TD_ID..'cgmauto:'..chat_id,timecgm,true)
base:setex(TD_ID..'cgmauto1:'..chat_id,t1,true)
base:setex(TD_ID..'cgmauto2:'..chat_id,t2,true)
base:setex(TD_ID..'cgmauto3:'..chat_id,t3,true)
base:setex(TD_ID..'cgmauto4:'..chat_id,t4,true)
base:sadd(TD_ID..'Gp2:'..chat_id,'cgmautoon')
Alert(msg.id,'• پاکسازی خودکار پیام ها فعال شد!\n━┄┅┄┅┄┅┄┅┄┅┄┅┄━\n🏷 • زمان پاکسازی خودکار کلی پیام  '..timecgm2..' ساعت یکبار انجام خواهد شد. ',true)
end
end
end
menu(chat_id,39)



elseif MenuName == 'SetCleanAlarm' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'cgmautoalarm') then
base:srem(TD_ID..'Gp2:'..chat_id,'cgmautoalarm')
Alert(msg.id,'• ارسال اعلان زمانی قفل های خودکار غیرفعال شد!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'cgmautoalarm')
Alert(msg.id,'• ارسال اعلان زمانی قفل های خودکار فعال شد!\nارسال اعلان قفل خودکاری ربات درگروه ارسال خواهد شد!',true)
end
menu(chat_id,39)



elseif MenuName == 'Adminpm' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'Adminpm:on') then
base:del(TD_ID.."Adminpm:"..chat_id)
base:del(TD_ID.."CL:Adminpm:"..chat_id)
base:srem(TD_ID..'Gp2:'..chat_id,'Adminpm:on')
Alert(msg.id,'• حالت تعیین خودکار ادمین غیرفعال شد.',true)
else
t1 = base:get(TD_ID.."Adminpm:"..chat_id)
if not t1 then
Alert(msg.id,'• تعداد آمار پیام تعیین نشده است !',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'Adminpm:on')
base:set(TD_ID.."Adminsendpm"..chat_id,"OwnerGp")
Alert(msg.id,'• حالت تعیین خودکار ادمین فعال شد.\n┈┅┅━━━━━━✦━━━━━┅┅┈\n🏷 تعداد پیام جهت تعیین ادمین : '..t1..'عدد',true)
end
end
menu(chat_id,21)

elseif MenuName == 'cleanpmon' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'cleanpm:on') then
base:del(TD_ID.."cleanpm:"..chat_id)
base:del(TD_ID.."CL:clean:"..chat_id)
base:srem(TD_ID..'Gp2:'..chat_id,'cleanpm:on')
Alert(msg.id,'• 〔پاکسازی خودکار عددی پیام گروه غیرفعال شد!〕',true)
else
t1 = base:get(TD_ID.."cleanpm:"..chat_id)
if not t1 then
Alert(msg.id,'• پاکسازی خودکار عددی پیام گروه فعال نشد!\nلطفا تعداد عملیات جهت پاکسازی عددی را تنظیم کنید!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'cleanpm:on')
Alert(msg.id,'• پاکسازی خودکار عددی پیام گروه فعال شد!\n┈┅┅━━━━━━✦━━━━━┅┅┈\n🏷 تعداد پیام کلی جهت عملیات پاکسازی کلی   : '..base:get(TD_ID..'cleanpm:'..chat_id)..' ',true)
end
end
menu(chat_id,88)


elseif MenuName == 'SetLimit' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'limitpm:on') then
base:srem(TD_ID..'Gp2:'..chat_id,'limitpm:on')
base:del(TD_ID.."limitpm:"..chat_id)
base:del(TD_ID.."Li:clean:"..chat_id)
Alert(msg.id,'• حالت لیمیت پیام غیرفعال شد.\n┈┅┅━━━━━━✦━━━━━┅┅┈\n🏷 کاربرانی که به در لیست لیمیت ارسال پیام بودند آزاد شدند!',true)
else
t1 = base:get(TD_ID.."limitpm:"..chat_id)
if not t1 then
Alert(msg.id,'• حالت لیمیت پیام فعال نشد!\n┈┅┅━━━━━━✦━━━━━┅┅┈\n🏷لطفا تعداد لیمیت ارسال هرکاربر تعداد لیمیت پیام اول تنظیم کنید!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'limitpm:on')
Alert(msg.id,'• حالت لیمیت پیام فعال شد.\n┈┅┅━━━━━━✦━━━━━┅┅┈\n🏷 تعداد لیمیت ارسال هرکاربر : '..base:get(TD_ID.."limitpm:"..chat_id)..'\nزمان محدویت هرکاربر : '..base:get(TD_ID..'Li:Time:'..chat_id)..' ساعت',true)
end
end
menu(chat_id,23)


elseif MenuName == 'SetCleanHallat' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'autoclener') then
base:srem(TD_ID..'Gp2:'..chat_id,'autoclener')
base:del(TD_ID.."DelaUtO"..chat_id)
base:del(TD_ID.."DelaUtO2"..chat_id)
base:srem(TD_ID..'Gp2:'..chat_id,'autoclener')
Alert(msg.id,'• 〔پاکسازی خودکار پیام گروه غیرفعال شد!〕',true)
else
t1 = base:get(TD_ID.."DelaUtO"..chat_id)
if not t1 then
Alert(msg.id,'• پاکسازی خودکار پیام ها فعال نشد!\nلطفا اول زمان پاکسازی را تنظیم کنید جهت تنظیم دکمه ساعت پاکسازی کلیک کنید!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'autoclener')
Alert(msg.id,'• پاکسازی خودکار پیام ها فعال شد!\n┈┅┅━━━━━━✦━━━━━┅┅┈\n🏷 زمان استارت : '..base:get(TD_ID.."DelaUtO"..chat_id)..' ',true)
end
end
menu(chat_id,39)

elseif MenuName == 'SetHallat' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'Tele_Mute') then
base:srem(TD_ID..'Gp2:'..chat_id,'Tele_Mute')
Alert(msg.id,'•  قفل خودکارگروه در حالت حذف پیام کاربر قرار گرفت',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'Tele_Mute')
Alert(msg.id,'• قفل خودکار گروہ در حالت محدود سازی قرار گرفت.',true)
end
menu(chat_id,87)



elseif MenuName == 'ModLockOptionNazar' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLockOptionNazar') then
base:srem(TD_ID..'Gp:'..chat_id,'ModLockOptionNazar')
base:del(TD_ID..'ModLockOptionNazar:'..chat_id)
base:del(TD_ID.."sg:OptionNazar"..chat_id)
Alert(msg.id,'مجوز ارسال نظرسنجی برکلیه ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModLockOptionNazar:'..chat_id,v.user.id)
end
end
end
base:set(TD_ID.."sg:OptionNazar"..chat_id,"lock")
base:sadd(TD_ID..'Gp:'..chat_id,'ModLockOptionNazar')
Alert(msg.id,'مجوز ارسال نظرسنجی برکلیه ادمین فعال شد.',true)
end
menu(chat_id,7)


elseif MenuName == 'ModLockOptionLink' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLockOptionLink') then
base:srem(TD_ID..'Gp:'..chat_id,'ModLockOptionLink')
base:del(TD_ID..'ModLockOptionLink:'..chat_id)
base:del(TD_ID.."sg:OptionLink"..chat_id)
Alert(msg.id,'مجوز ارسال تبلیغات برکلیه ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModLockOptionLink:'..chat_id,v.user.id)
end
end
end
base:set(TD_ID.."sg:OptionLink"..chat_id,"lock")
base:sadd(TD_ID..'Gp:'..chat_id,'ModLockOptionLink')
Alert(msg.id,'مجوز ارسال تبلیغات برکلیه ادمین فعال شد.',true)
end
menu(chat_id,7)
elseif MenuName == 'ModLockOptionBot' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLockOptionBot') then
base:srem(TD_ID..'Gp:'..chat_id,'ModLockOptionBot')
base:del(TD_ID..'ModLockOptionBot:'..chat_id)
base:del(TD_ID.."sg:OptionBot"..chat_id)
Alert(msg.id,'مجوز ادزدن ربات(api) برکلیه ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModLockOptionBot:'..chat_id,v.user.id)
end
end
end
base:set(TD_ID.."sg:OptionBot"..chat_id,"lock")
base:sadd(TD_ID..'Gp:'..chat_id,'ModLockOptionBot')
Alert(msg.id,'مجوز ادکردن ربات (api) برکلیه ادمین فعال شد.',true)
end
menu(chat_id,7)


elseif MenuName == 'ModClList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModClList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModClList')
base:del(TD_ID..'ModCleanList:'..chat_id)
Alert(msg.id,'ارسال دستورات پاکسازی توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModCleanList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModClList')
Alert(msg.id,'ارسال دستورات پاکسازی توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)

elseif MenuName == 'ModPnList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModPnList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModPnList')
base:del(TD_ID..'ModPinList:'..chat_id)
Alert(msg.id,'ارسال دستورات سنجاق کردن توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModPinList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModPnList')
Alert(msg.id,'ارسال دستورات سنجاق کردن توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)
elseif MenuName == 'ModBnList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModBnList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModBnList')
base:del(TD_ID..'ModBanList:'..chat_id)
Alert(msg.id,'ارسال دستورات مسدود توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModBanList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModBnList')
Alert(msg.id,'ارسال دستورات مسدود توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)
elseif MenuName == 'ModMutList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModMutList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModMutList')
base:del(TD_ID..'ModMuteList:'..chat_id)
Alert(msg.id,'ارسال دستورات سکوت توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModMuteList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModMutList')
Alert(msg.id,'ارسال دستورات سکوت توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)

elseif MenuName == 'ModWarList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModWarList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModWarList')
base:del(TD_ID..'ModMuteList:'..chat_id)
Alert(msg.id,'ارسال دستورات اخطاردادن توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModMuteList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModWarList')
Alert(msg.id,'ارسال دستورات اخطار دادن توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)
elseif MenuName == 'ModLokList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModLokList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModLokList')
base:del(TD_ID..'ModLockList:'..chat_id)
Alert(msg.id,'ارسال دستورات قفل یا بازکردن توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModLockList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModLokList')
Alert(msg.id,'ارسال دستورات قفل یا بازکردن توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)

elseif MenuName == 'ModpnelList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModpnelList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModpnelList')
base:del(TD_ID..'ModpanelList:'..chat_id)
Alert(msg.id,'ارسال دستورات تنظیمات پنلی توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModpanelList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModpnelList')
Alert(msg.id,'ارسال دستورات تنظیمات پنلی توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)
elseif MenuName == 'ModVpList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModVpList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModVpList')
base:del(TD_ID..'ModVipList:'..chat_id)
Alert(msg.id,'ارسال دستورات مجازکردن توسط ادمین ها غیرفعال شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModVipList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModVpList')
Alert(msg.id,'ارسال دستورات مجازکردن توسط ادمین ها فعال شد!',true)
end
menu(chat_id,7)

elseif MenuName == 'ModAlList' then
if base:sismember(TD_ID..'Gp:'..chat_id,'ModAlList') then
base:srem(TD_ID..'Gp:'..chat_id,'ModAlList')
base:srem(TD_ID..'Gp:'..chat_id,'ModClList')
base:srem(TD_ID..'Gp:'..chat_id,'ModBnList')
base:srem(TD_ID..'Gp:'..chat_id,'ModMutList')
base:srem(TD_ID..'Gp:'..chat_id,'ModWarList')
base:srem(TD_ID..'Gp:'..chat_id,'ModLokList')
base:srem(TD_ID..'Gp:'..chat_id,'ModVpList')
base:srem(TD_ID..'Gp:'..chat_id,'ModpnelList')
base:srem(TD_ID..'Gp:'..chat_id,'ModPnList')

base:del(TD_ID..'ModpanelList:'..chat_id)
base:del(TD_ID..'ModAllList:'..chat_id)
base:del(TD_ID..'ModCleanList:'..chat_id)
base:del(TD_ID..'ModBanList:'..chat_id)
base:del(TD_ID..'ModMuteList:'..chat_id)
base:del(TD_ID..'ModWarnList:'..chat_id)
base:del(TD_ID..'ModLockList:'..chat_id)
base:del(TD_ID..'ModVipList:'..chat_id)
base:del(TD_ID..'ModPinList:'..chat_id)
Alert(msg.id,'ارسال تمامی دستورات هفتگانه ربات از دسترسی ادمین ها خارج شد!',true)
else
list = getChatAdministrators(chat_id)
for k,v in pairs(list.result) do
if v.status == 'administrator' then
if v.user.id then
base:sadd(TD_ID..'ModCleanList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModBanList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModMuteList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModWarnList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModLockList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModpanelList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModVipList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModAllList:'..chat_id,v.user.id)
base:sadd(TD_ID..'ModPinList:'..chat_id,v.user.id)
end
end
end
base:sadd(TD_ID..'Gp:'..chat_id,'ModAlList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModClList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModBnList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModMutList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModWarList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModLokList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModVpList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModpnelList')
base:sadd(TD_ID..'Gp:'..chat_id,'ModPnList')
Alert(msg.id,'ارسال تمامی دستورات هفتگانه ربات به دسترسی ادمین قرار داده شد!',true)
end
menu(chat_id,7)

-------------------------------------
elseif MenuName == 'ehrazhovit' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'AntiTabchi') then
base:srem(TD_ID..'Gp2:'..chat_id,'AntiTabchi')
Alert(msg.id,'احراز هویت برای کاربران جدید غیرفعال شد !',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'AntiTabchi')
Alert(msg.id,'احراز هویت برای کاربران جدید فعال شد !',true)
end
AntiTabchi2(msg,chat_id)

elseif MenuName == 'nameanti' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'NameAntiTabchi') then
base:srem(TD_ID..'Gp2:'..chat_id,'NameAntiTabchi')
base:srem(TD_ID..'Gp2:'..chat_id,'filtername')
base:srem(TD_ID..'FilterName:'..chat_id,'خاله')
Alert(msg.id,'اسکن نام تبچی غیرفعال شد! ',true) 
else
base:sadd(TD_ID..'Gp2:'..chat_id,'NameAntiTabchi')
base:sadd(TD_ID..'Gp2:'..chat_id,'filtername')
base:sadd(TD_ID..'FilterName:'..chat_id,'خاله') 
Alert(msg.id,' اسکن نام تبچی فعال شد!',true)
end
AntiTabchiPnl(msg,chat_id)
elseif MenuName == 'fisrtmute' then 
if base:sismember(TD_ID..'Gp2:'..chat_id,'FirstTabchiMute') then 
base:srem(TD_ID..'Gp2:'..chat_id,'FirstTabchiMute')
Alert(msg.id,'محدودیت بـہ محض ورود غیرفعال شد و کاربران تازہ وارد میتوانند بدون پاسخ بـہ احراز هویت تا اتمام زمان احراز هویت در گروہ چت کنند !',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'FirstTabchiMute')
Alert(msg.id,'محدودیت بـہ محض ورود فعال شد و در صورت فعال بودن احراز هویت هر کاربری کـہ وارد گروہ میشود تا زمانی کـہ بـہ سوال احراز هویت پاسخ ندهد محدود خواهند ماند !',true)
end
AntiTabchiPnl(msg,chat_id)
elseif MenuName == 'Error404' then
Alert(msg.id,'مجازات\nپاسخ نداد بـہ سوال احراز هویت\nداشتن اسم غیرمجاز\nداشتن بیوگرافی غیرمجاز\nرا توسط دکمـہ های بالای مجازات تعیین کنید !',true)
elseif MenuName == 'bioanti' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'BioAntiTabchi') then
base:srem(TD_ID..'Gp2:'..chat_id,'BioAntiTabchi')

Alert(msg.id,' اسکن بیوگرافی غیرفعال شد!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'BioAntiTabchi')
base:sadd(TD_ID..'FilterName:'..chat_id,'خاله')


Alert(msg.id,' اسکن بیوگرافی فعال شد!',true)
end
AntiTabchiPnl(msg,chat_id)
elseif MenuName == 'modeehrazm' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
Alert(msg.id,'حالت بررسی تبچی ها بر روی مسدود تنظیم شد !',true)
base:srem(TD_ID..'Gp2:'..chat_id,'MuteAntiTab')
else
base:sadd(TD_ID..'Gp2:'..chat_id,'MuteAntiTab')
Alert(msg.id,'حالت بررسی تبچی بر روی سکوت تنظیم شد!',true)
end
AntiTabchiPnl(msg,chat_id)

elseif MenuName == 'biorname' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'biorname') then
base:srem(TD_ID..'Gp2:'..chat_id,'biorname')
base:srem(TD_ID..'FilterBio:'..chat_id,'خاله')
base:srem(TD_ID..'FilterBio:'..chat_id,'پیوی')
base:srem(TD_ID..'FilterBio:'..chat_id,'۰۹۰')
Alert(msg.id,' حالت پیش فرض فیلتر کلمات بیوگرافی غیرفعال شد !')
else
base:sadd(TD_ID..'Gp2:'..chat_id,'biorname')
base:sadd(TD_ID..'FilterBio:'..chat_id,'خاله')
base:sadd(TD_ID..'FilterBio:'..chat_id,'پیوی')
base:sadd(TD_ID..'FilterBio:'..chat_id,'۰۹۰')
Alert(msg.id,'حالت پیش فرض فیلتر کلمات بیوگرافی فعال شد!')
end
AntiTabchi2(msg,chat_id)



elseif MenuName == 'tabchiresmedia' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'tabchiresmedia') then
base:srem(TD_ID..'Gp2:'..chat_id,'tabchiresmedia')
Alert(msg.id,'• محدودیت تبچی رسانه به محض ورودغیر فعال شد.',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'tabchiresmedia')
Alert(msg.id,'• محدودیت تبچی رسانه به محض ورود فعال شد.\n●▬▬▬▬▬▬▬▬▬●\nاین مورد به این صورت هست که کاربری که به محض ورود داخل گروه از موارد رسانه محدود خواهد شد وبعد اتمام زمان  تنظیمی آزاد می شود',true)
end
AntiTabchi2(msg,chat_id)

elseif MenuName == 'tabchires' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'tabchires') then
base:srem(TD_ID..'Gp2:'..chat_id,'tabchires')
Alert(msg.id,'• محدودیت تبچی به محض ورودغیر فعال شد.',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'tabchires')
Alert(msg.id,'• محدودیت تبچی به محض ورود فعال شد.\nاین مورد به این صورت هست که کاربری که به محض ورود 5ثانیه داخل گروه سکوت خواهد شد وبعد اتمام زمان آزاد می شود.',true)
end
AntiTabchiPnl(msg,chat_id)


elseif MenuName == 'ScanAntiTabchi' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'ScanAntiTabchi') then
base:srem(TD_ID..'Gp2:'..chat_id,'ScanAntiTabchi')
base:srem(TD_ID..'FilterTab:'..chat_id,'خاله')
base:srem(TD_ID..'FilterTab:'..chat_id,'پیوی')
base:srem(TD_ID..'FilterTab:'..chat_id,'بزنگ')
base:srem(TD_ID..'FilterTab:'..chat_id,'سوپر')
base:srem(TD_ID..'FilterTab:'..chat_id,'09')
base:srem(TD_ID..'FilterTab:'..chat_id,'سکس')
base:srem(TD_ID..'FilterTab:'..chat_id,'چت')
base:srem(TD_ID..'FilterTab:'..chat_id,'بیو') 
base:srem(TD_ID..'FilterTab:'..chat_id,'داغ')
base:srem(TD_ID..'FilterTab:'..chat_id,'کص')
base:srem(TD_ID..'FilterTab:'..chat_id,'ممه')
base:srem(TD_ID..'FilterTab:'..chat_id,'داغم')
base:srem(TD_ID..'FilterTab:'..chat_id,'شماره')
base:srem(TD_ID..'FilterTab:'..chat_id,'خانم')
base:srem(TD_ID..'FilterTab:'..chat_id,'پی وی')
base:srem(TD_ID..'FilterTab:'..chat_id,'کون')
base:srem(TD_ID..'FilterTab:'..chat_id,'صکص')
base:srem(TD_ID..'FilterTab:'..chat_id,'PV')
base:srem(TD_ID..'FilterTab:'..chat_id,'pv')
base:srem(TD_ID..'FilterTab:'..chat_id,'حضوری')
base:srem(TD_ID..'FilterTab:'..chat_id,'فیلم')
base:srem(TD_ID..'FilterTab:'..chat_id,'۰۹۰')
Alert(msg.id,'بررسی تبچی ها به محض ارسال پیام غیرفعال شد!')
else
base:sadd(TD_ID..'Gp2:'..chat_id,'ScanAntiTabchi')
base:sadd(TD_ID..'FilterTab:'..chat_id,'خاله')
base:sadd(TD_ID..'FilterTab:'..chat_id,'پیوی')
base:sadd(TD_ID..'FilterTab:'..chat_id,'بزنگ')
base:sadd(TD_ID..'FilterTab:'..chat_id,'سوپر')
base:sadd(TD_ID..'FilterTab:'..chat_id,'09')
base:sadd(TD_ID..'FilterTab:'..chat_id,'سکس')
base:sadd(TD_ID..'FilterTab:'..chat_id,'بانو')
base:sadd(TD_ID..'FilterTab:'..chat_id,'چت')
base:sadd(TD_ID..'FilterTab:'..chat_id,'بیو')
base:sadd(TD_ID..'FilterTab:'..chat_id,'کیر')
base:sadd(TD_ID..'FilterTab:'..chat_id,'کص')
base:sadd(TD_ID..'FilterTab:'..chat_id,'ممه')
base:sadd(TD_ID..'FilterTab:'..chat_id,'داغم')
base:sadd(TD_ID..'FilterTab:'..chat_id,'شماره')
base:sadd(TD_ID..'FilterTab:'..chat_id,'خانم')
base:sadd(TD_ID..'FilterTab:'..chat_id,'پی وی')
base:sadd(TD_ID..'FilterTab:'..chat_id,'کون')
base:sadd(TD_ID..'FilterTab:'..chat_id,'صکص')
base:sadd(TD_ID..'FilterTab:'..chat_id,'PV')
base:sadd(TD_ID..'FilterTab:'..chat_id,'pv')
base:sadd(TD_ID..'FilterTab:'..chat_id,'حضوری')
base:sadd(TD_ID..'FilterTab:'..chat_id,'فیلم')
base:sadd(TD_ID..'FilterTab:'..chat_id,'۰۹۰')
base:sadd(TD_ID..'FilterTab:'..chat_id,'خـ💋ـالــه')
base:sadd(TD_ID..'FilterTab:'..chat_id,'خــالــه')
base:sadd(TD_ID..'FilterTab:'..chat_id,'سکسی')
base:sadd(TD_ID..'FilterTab:'..chat_id,'سکسی')
Alert(msg.id,'بررسی تبچی ها به محض ارسال پیام فعال شد!')
end
AntiTabchiPnl(msg,chat_id)



elseif MenuName == "AccessWeb" then
if getChat(chat_id).result.permissions.can_add_web_page_previews then
AccessWeb = false
Alert(msg.id,'❌ارسال لینک ممنوع شد.',true)
else
AccessWeb = true
Alert(msg.id,'✅ارسال لینک آزاد شد.',true)
end
AccessOther = getChat(chat_id).result.permissions.can_send_other_messages
AccessPolls = getChat(chat_id).result.permissions.can_send_polls
AccessMedia = getChat(chat_id).result.permissions.can_send_media_messages
AccessChangeInfo = getChat(chat_id).result.permissions.can_change_info
AccessInviteUsers = getChat(chat_id).result.permissions.can_invite_users
AccessPinMessage = getChat(chat_id).result.permissions.can_pin_messages
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)

elseif MenuName == "AccessOther" then
if getChat(chat_id).result.permissions.can_send_other_messages then
AccessOther = false
Alert(msg.id,'❌ارسال دیگر پیام ها ممنوع شد.',true)
else
AccessOther = true
Alert(msg.id,'✅ارسال دیگر پیام ها آزاد شد.',true)
end
AccessWeb = getChat(chat_id).result.permissions.can_add_web_page_previews
AccessPolls = getChat(chat_id).result.permissions.can_send_polls
AccessMedia = getChat(chat_id).result.permissions.can_send_media_messages
AccessChangeInfo = getChat(chat_id).result.permissions.can_change_info
AccessInviteUsers = getChat(chat_id).result.permissions.can_invite_users
AccessPinMessage = getChat(chat_id).result.permissions.can_pin_messages
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == "AccessPolls"  then
if getChat(chat_id).result.permissions.can_send_polls then
AccessPolls = false
Alert(msg.id,'❌ارسال نظرسنجی ممنوع شد.',true)
else
AccessPolls = true
Alert(msg.id,'✅ارسال نظرسنجی آزاد شد.',true)
end
AccessOther = getChat(chat_id).result.permissions.can_send_other_messages
AccessWeb = getChat(chat_id).result.permissions.can_add_web_page_previews
AccessMedia = getChat(chat_id).result.permissions.can_send_media_messages
AccessChangeInfo = getChat(chat_id).result.permissions.can_change_info
AccessInviteUsers = getChat(chat_id).result.permissions.can_invite_users
AccessPinMessage = getChat(chat_id).result.permissions.can_pin_messages
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == "AccessMedia"  then
if getChat(chat_id).result.permissions.can_send_media_messages then
AccessMedia = false
Alert(msg.id,'❌ارسال رسانه ها ممنوع شد.',true)
else
AccessMedia = true
Alert(msg.id,'✅ارسال رسانه ها آزاد شد.',true)
end
AccessOther = getChat(chat_id).result.permissions.can_send_other_messages
AccessPolls = getChat(chat_id).result.permissions.can_send_polls
AccessWeb = getChat(chat_id).result.permissions.can_add_web_page_previews
AccessChangeInfo = getChat(chat_id).result.permissions.can_change_info
AccessInviteUsers = getChat(chat_id).result.permissions.can_invite_users
AccessPinMessage = getChat(chat_id).result.permissions.can_pin_messages
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == "AccessChangeInfo"  then
if getChat(chat_id).result.permissions.can_change_info then
AccessChangeInfo = false
Alert(msg.id,'❌تغییر اطلاعات گروه ممنوع شد.',true)
else
AccessChangeInfo = true
Alert(msg.id,'✅ تغییر اطلاعات گروه آزاد شد. ',true)
end
AccessOther = getChat(chat_id).result.permissions.can_send_other_messages
AccessPolls = getChat(chat_id).result.permissions.can_send_polls
AccessMedia = getChat(chat_id).result.permissions.can_send_media_messages
AccessWeb = getChat(chat_id).result.permissions.can_add_web_page_previews
AccessInviteUsers = getChat(chat_id).result.permissions.can_invite_users
AccessPinMessage = getChat(chat_id).result.permissions.can_pin_messages
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == "AccessInviteUsers"  then
if getChat(chat_id).result.permissions.can_invite_users then
AccessInviteUsers = false
Alert(msg.id,'❌عضو کردن کاربر جدید درگروه ممنوع شد.',true)
else
AccessInviteUsers = true
Alert(msg.id,'✅ عضو کردن کاربر جدید درگروه آزاد شد.',true)
end
AccessOther = getChat(chat_id).result.permissions.can_send_other_messages
AccessPolls = getChat(chat_id).result.permissions.can_send_polls
AccessMedia = getChat(chat_id).result.permissions.can_send_media_messages
AccessChangeInfo = getChat(chat_id).result.permissions.can_change_info
AccessWeb = getChat(chat_id).result.permissions.can_add_web_page_previews
AccessPinMessage = getChat(chat_id).result.permissions.can_pin_messages
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == "AccessPinMessage"  then
if getChat(chat_id).result.permissions.can_pin_messages then
AccessPinMessage = false
Alert(msg.id,'❌سنجاق کردن درگروه ممنوع شد.',true)
else
AccessPinMessage = true
Alert(msg.id,'✅ سنجاق کردن درگروه آزاد شد.',true)
end
AccessOther = getChat(chat_id).result.permissions.can_send_other_messages
AccessPolls = getChat(chat_id).result.permissions.can_send_polls
AccessMedia = getChat(chat_id).result.permissions.can_send_media_messages
AccessChangeInfo = getChat(chat_id).result.permissions.can_change_info
AccessInviteUsers = getChat(chat_id).result.permissions.can_invite_users
AccessWeb = getChat(chat_id).result.permissions.can_add_web_page_previews
AccessSendMessage = getChat(chat_id).result.permissions.can_send_messages
Permissions = {
can_send_messages = AccessSendMessage,
can_send_media_messages = AccessMedia,
can_send_other_messages = AccessOther,
can_send_polls = AccessPolls,
can_change_info = AccessChangeInfo,
can_invite_users = AccessInviteUsers,
can_pin_messages = AccessPinMessage,
can_add_web_page_previews = AccessWeb
}
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == "AccessSendMessage"  then
if getChat(chat_id).result.permissions.can_send_messages then
Permissions = {
can_send_messages = false,
can_send_media_messages = false,
can_send_other_messages = false,
can_send_polls = false,
can_change_info = false,
can_invite_users = false,
can_pin_messages = false,
can_add_web_page_previews = false
}
Alert(msg.id,'❌ارسال تمامی پیام ها ممنوع شد.',true)
else
Permissions = {
can_send_messages = true,
can_send_media_messages = true,
can_send_other_messages = true,
can_send_polls = true,
can_change_info = true,
can_invite_users = true,
can_pin_messages = true,
can_add_web_page_previews = true
}
Alert(msg.id,'✅ارسال تمامی پیام ها آزاد شد.',true)
end
setChatPermissions(chat_id, Permissions)
ChatPermissions(msg, chat_id)


elseif MenuName == 'locktas' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Lock:Poll') then
base:srem(TD_ID..'Gp:'..chat_id,'Lock:Poll')
Alert(msg.id,'قفل نظرسنجی تلگرام غیرفعال شد!')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Lock:Poll')
Alert(msg.id,'قفل نظرسنجی تلگرام فعال شد!')
end
SETT(msg,chat_id,94)
elseif MenuName == 'locktgservice' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Lock:TGservice') then
base:srem(TD_ID..'Gp:'..chat_id,'Lock:TGservice')
Alert(msg.id,'سرویس تلگرام غیرفعال شد!')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Lock:TGservice')
Alert(msg.id,'سرویس تلگرام فعال شد!')
end
SETT(msg,chat_id,98)

elseif MenuName == 'lockdice' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Del:Dice') then
base:srem(TD_ID..'Gp:'..chat_id,'Del:Dice')
Alert(msg.id,'قفل ایموجی حرکتی غیرفعال شد!')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Dice')
Alert(msg.id,'قفل ایموجی حرکتی فعال شد!')
end
SETT(msg,chat_id,99)
elseif MenuName == 'lockreply' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Del:Reply') then
base:srem(TD_ID..'Gp:'..chat_id,'Del:Reply')
Alert(msg.id,'قفل ریپلای پیام غیرفعال شد!')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Reply')
Alert(msg.id,'قفل ریپلای فعال شد!')
end
SETT(msg,chat_id,99)

elseif MenuName == 'Welcomeon' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'Welcomeon') then
base:srem(TD_ID..'Gp2:'..chat_id,'Welcomeon')
base:del(TD_ID.."Welcome:Photo" .. chat_id)
base:del(TD_ID.."Welcome:Gif" .. chat_id)
base:del(TD_ID.."Welcome:voice" .. chat_id)
base:del(TD_ID.."Welcome:video" .. chat_id)
base:del(TD_ID.."Welcome:Document" .. chat_id)
Alert(msg.id,'خوش آمدگویی بـہ صورت متنی غیرفعال شد!')
else
base:sadd(TD_ID..'Gp2:'..chat_id,'Welcomeon')
Alert(msg.id,'خوش آمدگویی بـہ صورت متنی فعال شد!')
end
SETT(msg,chat_id,7)

elseif MenuName == 'cleanwelcome' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'cleanwelcome') then
base:srem(TD_ID..'Gp2:'..chat_id,'cleanwelcome')
Alert(msg.id,'پاکسازی خودکار خوش آمدگویی غیرفعال شد.')
else
timecgms = base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20
base:sadd(TD_ID..'Gp2:'..chat_id,'cleanwelcome')
Alert(msg.id,'• پاکسازی خودکار خوش آمدگویی فعال شد : '..timecgms..' ثانیه \n●▬▬▬▬▬▬▬▬▬●\n• کاربر گرامی پاکسازی پیام های خودکار خوش آمدگویی ربات ['..timecgms..' ثانیه] یکبار به صورت خودکار انجام خواهد شد. ',true)
end
SETT(msg,chat_id,7)


elseif MenuName == 'cleanwelcometimeMAXup' and is_Owner(chat_id,msg.from.id) then
if tonumber(MAX) == 1000 then
Alert(msg.id,'حداکثر زمان 500 ثانیه می باشد!',true)
else
MAX = (base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20)
MAX= tonumber(MAX) + 1
Alert(msg.id,MAX)
base:set(TD_ID..'cleanwelcometime:'..chat_id,MAX)
end
SETT(msg,chat_id,7)
elseif MenuName == 'cleanwelcometimeMAXdown' and is_Owner(chat_id,msg.from.id) then
if tonumber(TIME) == 10 then
Alert(msg.id,'حداقل زمان تنظیمی 10 ثانیه می باشد!',true)
else
TIME = (base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20)
TIME = tonumber(TIME) - 1
Alert(msg.id,TIME)
base:set(TD_ID..'cleanwelcometime:'..chat_id,TIME)
end
SETT(msg,chat_id,7)

elseif MenuName == 'cleanwelcometimeMAX2up' and is_Owner(chat_id,msg.from.id) then
if tonumber(MAX) == 1000 then
Alert(msg.id,'حداکثر زمان 500 ثانیه می باشد!',true)
else
MAX = (base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20)
MAX= tonumber(MAX) + 2
Alert(msg.id,MAX)
base:set(TD_ID..'cleanwelcometime:'..chat_id,MAX)
end
SETT(msg,chat_id,7)
elseif MenuName == 'cleanwelcometimeMAX2down' and is_Owner(chat_id,msg.from.id) then
if tonumber(TIME) == 10 then
Alert(msg.id,'حداقل زمان تنظیمی 10 ثانیه می باشد!',true)
else
TIME = (base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20)
TIME = tonumber(TIME) - 2
Alert(msg.id,TIME)
base:set(TD_ID..'cleanwelcometime:'..chat_id,TIME)
end
SETT(msg,chat_id,7)

elseif MenuName == 'filterban' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:Filter') then
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Filter')
Alert(msg.id,'کلمات فیلتر برحالت حذف تنظیم شد!')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Filter')
Alert(msg.id,'کلمات فیلتر شده برحالت مسدود تنظیم شد!')
end
filters(msg,chat_id)

elseif MenuName == 'filterstickerban' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Ban:FilterSticker') then
base:srem(TD_ID..'Gp:'..chat_id,'Ban:FilterSticker')
Alert(msg.id,'فیلتر پک استیکر برحالت حذف تنظیم شد!')
else
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:FilterSticker')
Alert(msg.id,'فیلتر پک استیکر برحالت مسدود تنظیم شد!')
end
filters(msg,chat_id)
------Apshen Locks ha-----------@MrTmAlpha---------------------------------
----file


---link
elseif MenuName == 'locklink' then
if not base:get(TD_ID.."sg:link"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Link')
base:set(TD_ID.."sg:link"..chat_id,"del")
elseif base:get(TD_ID.."sg:link"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Link')
base:set(TD_ID.."sg:link"..chat_id,"mute")
elseif base:get(TD_ID.."sg:link"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Link')
base:set(TD_ID.."sg:link"..chat_id,"warn")
elseif base:get(TD_ID.."sg:link"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Link')
base:set(TD_ID.."sg:link"..chat_id,"ban")
elseif base:get(TD_ID.."sg:link"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:link"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Link')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Link')
end
Alert(msg.id,'وضعیت قفل لینک به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,9)
--web
elseif MenuName == 'lockweb' then
if not base:get(TD_ID.."sg:web"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Weblink')
base:set(TD_ID.."sg:web"..chat_id,"del")
elseif base:get(TD_ID.."sg:web"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Weblink')
base:set(TD_ID.."sg:web"..chat_id,"mute")
elseif base:get(TD_ID.."sg:web"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Weblink')
base:set(TD_ID.."sg:web"..chat_id,"warn")
elseif base:get(TD_ID.."sg:web"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Weblink')
base:set(TD_ID.."sg:web"..chat_id,"ban")
elseif base:get(TD_ID.."sg:web"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:web"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Weblink')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Weblink')
end
Alert(msg.id,'وضعیت قفل وب به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,9)
---hyper
elseif MenuName == 'lockhyper' then
if not base:get(TD_ID.."sg:hyper"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Hyper')
base:set(TD_ID.."sg:hyper"..chat_id,"del")
elseif base:get(TD_ID.."sg:hyper"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Hyper')
base:set(TD_ID.."sg:hyper"..chat_id,"mute")
elseif base:get(TD_ID.."sg:hyper"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Hyper')
base:set(TD_ID.."sg:hyper"..chat_id,"warn")
elseif base:get(TD_ID.."sg:hyper"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Hyper')
base:set(TD_ID.."sg:hyper"..chat_id,"ban")
elseif base:get(TD_ID.."sg:hyper"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:hyper"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Hyper')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Hyper')
end
Alert(msg.id,'وضعیت قفل هایپرلینک به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,10)


elseif MenuName == 'lockbiolink' then
if not base:get(TD_ID.."sg:biolink"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Biolink')
base:set(TD_ID.."sg:biolink"..chat_id,"del")
elseif base:get(TD_ID.."sg:biolink"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Biolink')
base:set(TD_ID.."sg:biolink"..chat_id,"mute")
elseif base:get(TD_ID.."sg:biolink"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Biolink')
base:set(TD_ID.."sg:biolink"..chat_id,"warn")
elseif base:get(TD_ID.."sg:biolink"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Biolink')
base:set(TD_ID.."sg:biolink"..chat_id,"ban")
elseif base:get(TD_ID.."sg:biolink"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:biolink"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Biolink')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Biolink')
end
Alert(msg.id,'وضعیت قفل بیوگرافی لینک به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,16)


elseif MenuName == 'lockbot' then
if not base:get(TD_ID.."sg:bot"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Bots')
base:set(TD_ID.."sg:bot"..chat_id,"del")
elseif base:get(TD_ID.."sg:bot"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Bots')
base:set(TD_ID.."sg:bot"..chat_id,"mute")
elseif base:get(TD_ID.."sg:bot"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Bots')
base:set(TD_ID.."sg:bot"..chat_id,"warn")
elseif base:get(TD_ID.."sg:bot"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Bots')
base:set(TD_ID.."sg:bot"..chat_id,"ban")
elseif base:get(TD_ID.."sg:bot"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:bot"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Bots')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Bots')
end
Alert(msg.id,'وضعیت قفل ربات به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,16)

elseif MenuName == 'locknumber' then
if not base:get(TD_ID.."sg:number"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Number')
base:set(TD_ID.."sg:number"..chat_id,"del")
elseif base:get(TD_ID.."sg:number"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Number')
base:set(TD_ID.."sg:number"..chat_id,"mute")
elseif base:get(TD_ID.."sg:number"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Number')
base:set(TD_ID.."sg:number"..chat_id,"warn")
elseif base:get(TD_ID.."sg:number"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Number')
base:set(TD_ID.."sg:number"..chat_id,"ban")
elseif base:get(TD_ID.."sg:number"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:number"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Number')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Number')
end
Alert(msg.id,'وضعیت قفل شماره  : '..text..' تنظیم شد !')
SETT(msg,chat_id,91)
elseif MenuName == 'lockedit' then
if not base:get(TD_ID.."sg:edit"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Edit')
base:set(TD_ID.."sg:edit"..chat_id,"del")
elseif base:get(TD_ID.."sg:edit"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Edit')
base:set(TD_ID.."sg:edit"..chat_id,"mute")
elseif base:get(TD_ID.."sg:edit"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Edit')
base:set(TD_ID.."sg:edit"..chat_id,"warn")
elseif base:get(TD_ID.."sg:edit"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Edit')
base:set(TD_ID.."sg:edit"..chat_id,"ban")
elseif base:get(TD_ID.."sg:edit"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:edit"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Edit')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Edit')
end
Alert(msg.id,'وضعیت قفل ویرایش پیام به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,9)


elseif MenuName == 'lockfwd' then
if not base:get(TD_ID.."sg:fwd"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Forward')
base:set(TD_ID.."sg:fwd"..chat_id,"del")
elseif base:get(TD_ID.."sg:fwd"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Forward')
base:set(TD_ID.."sg:fwd"..chat_id,"mute")
elseif base:get(TD_ID.."sg:fwd"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Forward')
base:set(TD_ID.."sg:fwd"..chat_id,"warn")
elseif base:get(TD_ID.."sg:fwd"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Forward')
base:set(TD_ID.."sg:fwd"..chat_id,"ban")
elseif base:get(TD_ID.."sg:fwd"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:fwd"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Forward')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Forward')
end
Alert(msg.id,'وضعیت قفل فوروارد پیام به  : '..text..' تنظیم شد !')
SETT(msg,chat_id,9)


---post

elseif MenuName == 'lockpost' then
if not base:get(TD_ID.."sg:post"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Channelpost')
base:set(TD_ID.."sg:post"..chat_id,"del")
elseif base:get(TD_ID.."sg:post"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Channelpost')
base:set(TD_ID.."sg:post"..chat_id,"mute")
elseif base:get(TD_ID.."sg:post"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Channelpost')
base:set(TD_ID.."sg:post"..chat_id,"warn")
elseif base:get(TD_ID.."sg:post"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Channelpost')
base:set(TD_ID.."sg:post"..chat_id,"ban")
elseif base:get(TD_ID.."sg:post"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:post"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Channelpost')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Channelpost')
end
Alert(msg.id,'وضعیت قفل فوروارد ازکانال  : '..text..' تنظیم شد !')
SETT(msg,chat_id,10)

elseif MenuName == 'locktag' then
if not base:get(TD_ID.."sg:tag"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Tag')
base:set(TD_ID.."sg:tag"..chat_id,"del")
elseif base:get(TD_ID.."sg:tag"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Tag')
base:set(TD_ID.."sg:tag"..chat_id,"mute")
elseif base:get(TD_ID.."sg:tag"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Tag')
base:set(TD_ID.."sg:tag"..chat_id,"warn")
elseif base:get(TD_ID.."sg:tag"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Tag')
base:set(TD_ID.."sg:tag"..chat_id,"ban")
elseif base:get(TD_ID.."sg:tag"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:tag"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Tag')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Tag')
end
Alert(msg.id,'وضعیت قفل هشتگ  : '..text..' تنظیم شد !')
SETT(msg,chat_id,9)



elseif MenuName == 'lockuser' then
if not base:get(TD_ID.."sg:user"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Username')
base:set(TD_ID.."sg:user"..chat_id,"del")
elseif base:get(TD_ID.."sg:user"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Username')
base:set(TD_ID.."sg:user"..chat_id,"mute")
elseif base:get(TD_ID.."sg:user"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Username')
base:set(TD_ID.."sg:user"..chat_id,"warn")
elseif base:get(TD_ID.."sg:user"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Username')
base:set(TD_ID.."sg:user"..chat_id,"ban")
elseif base:get(TD_ID.."sg:user"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:user"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Username')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Username')
end
Alert(msg.id,'وضعیت قفل یوزرنیم  : '..text..' تنظیم شد !')
SETT(msg,chat_id,16)

elseif MenuName == 'locksticker' then
if not base:get(TD_ID.."sg:sticker"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Sticker')
base:set(TD_ID.."sg:sticker"..chat_id,"del")
elseif base:get(TD_ID.."sg:sticker"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Sticker')
base:set(TD_ID.."sg:sticker"..chat_id,"mute")
elseif base:get(TD_ID.."sg:sticker"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Sticker')
base:set(TD_ID.."sg:sticker"..chat_id,"warn")
elseif base:get(TD_ID.."sg:sticker"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Sticker')
base:set(TD_ID.."sg:sticker"..chat_id,"ban")
elseif base:get(TD_ID.."sg:sticker"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:sticker"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Sticker')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Sticker')
end
Alert(msg.id,'وضعیت قفل استیکر  : '..text..' تنظیم شد !')
SETT(msg,chat_id,11)


elseif MenuName == 'lockstickers' then
if not base:get(TD_ID.."sg:stickers"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Stickers')
base:set(TD_ID.."sg:stickers"..chat_id,"del")
elseif base:get(TD_ID.."sg:stickers"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Stickers')
base:set(TD_ID.."sg:stickers"..chat_id,"mute")
elseif base:get(TD_ID.."sg:stickers"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Stickers')
base:set(TD_ID.."sg:stickers"..chat_id,"warn")
elseif base:get(TD_ID.."sg:stickers"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Stickers')
base:set(TD_ID.."sg:stickers"..chat_id,"ban")
elseif base:get(TD_ID.."sg:stickers"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:stickers"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Stickers')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Stickers')
end
Alert(msg.id,'وضعیت قفل استیکر متحرک  : '..text..' تنظیم شد !')
SETT(msg,chat_id,12)


elseif MenuName == 'lockvoice' then
if not base:get(TD_ID.."sg:voice"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Voice')
base:set(TD_ID.."sg:voice"..chat_id,"del")
elseif base:get(TD_ID.."sg:voice"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Voice')
base:set(TD_ID.."sg:voice"..chat_id,"mute")
elseif base:get(TD_ID.."sg:voice"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Voice')
base:set(TD_ID.."sg:voice"..chat_id,"warn")
elseif base:get(TD_ID.."sg:voice"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Voice')
base:set(TD_ID.."sg:voice"..chat_id,"ban")
elseif base:get(TD_ID.."sg:voice"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:voice"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Voice')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Voice')
end
Alert(msg.id,'وضعیت قفل ویس  : '..text..' تنظیم شد !')
SETT(msg,chat_id,11)


elseif MenuName == 'lockmusic' then
if not base:get(TD_ID.."sg:music"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Audio')
base:set(TD_ID.."sg:music"..chat_id,"del")
elseif base:get(TD_ID.."sg:music"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Audio')
base:set(TD_ID.."sg:music"..chat_id,"mute")
elseif base:get(TD_ID.."sg:music"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Audio')
base:set(TD_ID.."sg:music"..chat_id,"warn")
elseif base:get(TD_ID.."sg:music"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Audio')
base:set(TD_ID.."sg:music"..chat_id,"ban")
elseif base:get(TD_ID.."sg:music"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:music"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Audio')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Audio')
end
Alert(msg.id,'وضعیت قفل آهنگ  : '..text..' تنظیم شد !')
SETT(msg,chat_id,11)



elseif MenuName == 'lockmention' then
if not base:get(TD_ID.."sg:mention"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Mention')
base:set(TD_ID.."sg:mention"..chat_id,"del")
elseif base:get(TD_ID.."sg:mention"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Mention')
base:set(TD_ID.."sg:mention"..chat_id,"mute")
elseif base:get(TD_ID.."sg:mention"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Mention')
base:set(TD_ID.."sg:mention"..chat_id,"warn")
elseif base:get(TD_ID.."sg:mention"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Mention')
base:set(TD_ID.."sg:mention"..chat_id,"ban")
elseif base:get(TD_ID.."sg:mention"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:mention"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Mention')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Mention')
end
Alert(msg.id,'وضعیت قفل فراخوانی(منشن)  : '..text..' تنظیم شد !')
SETT(msg,chat_id,10)

elseif MenuName == 'lockself' then
if not base:get(TD_ID.."sg:self"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Videomsg')
base:set(TD_ID.."sg:self"..chat_id,"del")
elseif base:get(TD_ID.."sg:self"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Videomsg')
base:set(TD_ID.."sg:self"..chat_id,"mute")
elseif base:get(TD_ID.."sg:self"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Videomsg')
base:set(TD_ID.."sg:self"..chat_id,"warn")
elseif base:get(TD_ID.."sg:self"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Videomsg')
base:set(TD_ID.."sg:self"..chat_id,"ban")
elseif base:get(TD_ID.."sg:self"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:self"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Videomsg')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Videomsg')
end
Alert(msg.id,'وضعیت قفل فیلم سلفی  : '..text..' تنظیم شد !')
SETT(msg,chat_id,11)

elseif MenuName == 'lockphoto' then
if not base:get(TD_ID.."sg:photo"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Photo')
base:set(TD_ID.."sg:photo"..chat_id,"del")
elseif base:get(TD_ID.."sg:photo"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Photo')
base:set(TD_ID.."sg:photo"..chat_id,"mute")
elseif base:get(TD_ID.."sg:photo"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Photo')
base:set(TD_ID.."sg:photo"..chat_id,"warn")
elseif base:get(TD_ID.."sg:photo"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Photo')
base:set(TD_ID.."sg:photo"..chat_id,"ban")
elseif base:get(TD_ID.."sg:photo"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:photo"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Photo')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Photo')
end
Alert(msg.id,'وضعیت قفل عکس  : '..text..' تنظیم شد !')
SETT(msg,chat_id,11)



elseif MenuName == 'lockgif' then
if not base:get(TD_ID.."sg:gif"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Gif')
base:set(TD_ID.."sg:gif"..chat_id,"del")
elseif base:get(TD_ID.."sg:gif"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Gif')
base:set(TD_ID.."sg:gif"..chat_id,"mute")
elseif base:get(TD_ID.."sg:gif"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Gif')
base:set(TD_ID.."sg:gif"..chat_id,"warn")
elseif base:get(TD_ID.."sg:gif"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Gif')
base:set(TD_ID.."sg:gif"..chat_id,"ban")
elseif base:get(TD_ID.."sg:gif"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:gif"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Gif')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Gif')
end
Alert(msg.id,'وضعیت قفل گیف  : '..text..' تنظیم شد !')
SETT(msg,chat_id,12)


elseif MenuName == 'lockfilm' then
if not base:get(TD_ID.."sg:film"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Video')
base:set(TD_ID.."sg:film"..chat_id,"del")
elseif base:get(TD_ID.."sg:film"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Video')
base:set(TD_ID.."sg:film"..chat_id,"mute")
elseif base:get(TD_ID.."sg:film"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Video')
base:set(TD_ID.."sg:film"..chat_id,"warn")
elseif base:get(TD_ID.."sg:film"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Video')
base:set(TD_ID.."sg:film"..chat_id,"ban")
elseif base:get(TD_ID.."sg:film"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:film"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Video')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Video')
end
Alert(msg.id,'وضعیت قفل فیلم  : '..text..' تنظیم شد !')
SETT(msg,chat_id,12)

elseif MenuName == 'lockcontact' then
if not base:get(TD_ID.."sg:contact"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Contact')
base:set(TD_ID.."sg:contact"..chat_id,"del")
elseif base:get(TD_ID.."sg:contact"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Contact')
base:set(TD_ID.."sg:contact"..chat_id,"mute")
elseif base:get(TD_ID.."sg:contact"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Contact')
base:set(TD_ID.."sg:contact"..chat_id,"warn")
elseif base:get(TD_ID.."sg:contact"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Contact')
base:set(TD_ID.."sg:contact"..chat_id,"ban")
elseif base:get(TD_ID.."sg:contact"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:contact"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Contact')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Contact')
end
Alert(msg.id,'وضعیت قفل مخاطب  : '..text..' تنظیم شد !')
SETT(msg,chat_id,10)

elseif MenuName == 'lockgame' then
if not base:get(TD_ID.."sg:game"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Game')
base:set(TD_ID.."sg:game"..chat_id,"del")
elseif base:get(TD_ID.."sg:game"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Game')
base:set(TD_ID.."sg:game"..chat_id,"mute")
elseif base:get(TD_ID.."sg:game"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Game')
base:set(TD_ID.."sg:game"..chat_id,"warn")
elseif base:get(TD_ID.."sg:game"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Game')
base:set(TD_ID.."sg:game"..chat_id,"ban")
elseif base:get(TD_ID.."sg:game"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:game"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Game')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Game')
end
Alert(msg.id,'وضعیت قفل بازی تلگرام  : '..text..' تنظیم شد !')
SETT(msg,chat_id,12)



elseif MenuName == 'lockfile' then
if not base:get(TD_ID.."sg:file"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Document')
base:set(TD_ID.."sg:file"..chat_id,"del")
elseif base:get(TD_ID.."sg:file"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Document')
base:set(TD_ID.."sg:file"..chat_id,"mute")
elseif base:get(TD_ID.."sg:file"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Document')
base:set(TD_ID.."sg:file"..chat_id,"warn")
elseif base:get(TD_ID.."sg:file"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Document')
base:set(TD_ID.."sg:file"..chat_id,"ban")
elseif base:get(TD_ID.."sg:file"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:file"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Document')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Document')
end
Alert(msg.id,'وضعیت قفل فایل   : '..text..' تنظیم شد !')
SETT(msg,chat_id,12)


elseif MenuName == 'lockloc' then
if not base:get(TD_ID.."sg:loc"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Location')
base:set(TD_ID.."sg:loc"..chat_id,"del")
elseif base:get(TD_ID.."sg:loc"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Location')
base:set(TD_ID.."sg:loc"..chat_id,"mute")
elseif base:get(TD_ID.."sg:loc"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Location')
base:set(TD_ID.."sg:loc"..chat_id,"warn")
elseif base:get(TD_ID.."sg:loc"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Location')
base:set(TD_ID.."sg:loc"..chat_id,"ban")
elseif base:get(TD_ID.."sg:loc"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:loc"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Location')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Location')
end
Alert(msg.id,'وضعیت قفل لوکیشن   : '..text..' تنظیم شد !')
SETT(msg,chat_id,16)


elseif MenuName == 'lockcaption' then
if not base:get(TD_ID.."sg:caption"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Caption')
base:set(TD_ID.."sg:caption"..chat_id,"del")
elseif base:get(TD_ID.."sg:caption"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Caption')
base:set(TD_ID.."sg:caption"..chat_id,"mute")
elseif base:get(TD_ID.."sg:caption"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Caption')
base:set(TD_ID.."sg:caption"..chat_id,"warn")
elseif base:get(TD_ID.."sg:caption"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Caption')
base:set(TD_ID.."sg:caption"..chat_id,"ban")
elseif base:get(TD_ID.."sg:caption"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:caption"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Caption')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Caption')
end
Alert(msg.id,'وضعیت قفل کپشن پیام   : '..text..' تنظیم شد !')
SETT(msg,chat_id,10)





elseif MenuName == 'lockinline' then
if not base:get(TD_ID.."sg:inline"..chat_id) then
text = "حذف"
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Inline')
base:set(TD_ID.."sg:inline"..chat_id,"del")
elseif base:get(TD_ID.."sg:inline"..chat_id) == "del" then
text = "سکوت"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Inline')
base:set(TD_ID.."sg:inline"..chat_id,"mute")
elseif base:get(TD_ID.."sg:inline"..chat_id) == "mute" then
text = "اخطار"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Inline')
base:set(TD_ID.."sg:inline"..chat_id,"warn")
elseif base:get(TD_ID.."sg:inline"..chat_id) == "warn" then
text = "مسدود"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Inline')
base:set(TD_ID.."sg:inline"..chat_id,"ban")
elseif base:get(TD_ID.."sg:inline"..chat_id) == "ban" then
text = "غیرفعال "
base:del(TD_ID.."sg:inline"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Inline')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Inline')
end
Alert(msg.id,'وضعیت قفل اینلاین(دکمه شیشه ای)   : '..text..' تنظیم شد !')
SETT(msg,chat_id,16)



---game


---malware
elseif MenuName == 'lockmalware' then
if not base:get(TD_ID.."sg:malware"..chat_id) then
text = "📵 حذف فایل بدافزار "
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:set(TD_ID.."sg:malware"..chat_id,"del")
elseif base:get(TD_ID.."sg:malware"..chat_id) == "del" then
text = "📵محدود کاربر "
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:set(TD_ID.."sg:malware"..chat_id,"mute")
elseif base:get(TD_ID.."sg:malware"..chat_id) == "mute" then
text = "⚠️اخطارکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:set(TD_ID.."sg:malware"..chat_id,"warn")
elseif base:get(TD_ID.."sg:malware"..chat_id) == "warn" then
text = "🚫مسدودکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:set(TD_ID.."sg:malware"..chat_id,"ban")
elseif base:get(TD_ID.."sg:malware"..chat_id) == "ban" then
text = "🔇سایلنت کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:set(TD_ID.."sg:malware"..chat_id,"silent")
elseif base:get(TD_ID.."sg:malware"..chat_id) == "silent" then
text = "❌اخراج کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:set(TD_ID.."sg:malware"..chat_id,"kick")
elseif base:get(TD_ID.."sg:malware"..chat_id) == "kick" then
text = "❎ بدون حالت "
base:del(TD_ID.."sg:malware"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Malware')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Malware')
end
Alert(msg.id,'قفل حالتی واکنشی فایل بدافزارها تنظیم شدہ بـہ : '..text..'')
SETT(msg,chat_id,12)

----farsi
elseif MenuName == 'lockfarsi' then
if not base:get(TD_ID.."sg:farsi"..chat_id) then
text = "📵 حذف چت فارسی "
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:set(TD_ID.."sg:farsi"..chat_id,"del")
elseif base:get(TD_ID.."sg:farsi"..chat_id) == "del" then
text = "📵محدود کاربر "
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:set(TD_ID.."sg:farsi"..chat_id,"mute")
elseif base:get(TD_ID.."sg:farsi"..chat_id) == "mute" then
text = "⚠️اخطارکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:set(TD_ID.."sg:farsi"..chat_id,"warn")
elseif base:get(TD_ID.."sg:farsi"..chat_id) == "warn" then
text = "🚫مسدودکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:set(TD_ID.."sg:farsi"..chat_id,"ban")
elseif base:get(TD_ID.."sg:farsi"..chat_id) == "ban" then
text = "🔇سایلنت کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:set(TD_ID.."sg:farsi"..chat_id,"silent")
elseif base:get(TD_ID.."sg:farsi"..chat_id) == "silent" then
text = "❌اخراج کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:set(TD_ID.."sg:farsi"..chat_id,"kick")
elseif base:get(TD_ID.."sg:farsi"..chat_id) == "kick" then
text = "❎ بدون حالت "
base:del(TD_ID.."sg:farsi"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Persian')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Persian')
end
Alert(msg.id,'قفل حالتی واکنشی چت فارسی تنظیم شدہ بـہ : '..text..'')
SETT(msg,chat_id,10)
--english
elseif MenuName == 'lockenglish' then
if not base:get(TD_ID.."sg:english"..chat_id) then
text = "📵 حذف فایل "
base:sadd(TD_ID..'Gp:'..chat_id,'Del:English')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:set(TD_ID.."sg:english"..chat_id,"del")
elseif base:get(TD_ID.."sg:english"..chat_id) == "del" then
text = "📵محدود کاربر "
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:set(TD_ID.."sg:english"..chat_id,"mute")
elseif base:get(TD_ID.."sg:english"..chat_id) == "mute" then
text = "⚠️اخطارکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:set(TD_ID.."sg:english"..chat_id,"warn")
elseif base:get(TD_ID.."sg:english"..chat_id) == "warn" then
text = "🚫مسدودکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:set(TD_ID.."sg:english"..chat_id,"ban")
elseif base:get(TD_ID.."sg:english"..chat_id) == "ban" then
text = "🔇سایلنت کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:set(TD_ID.."sg:english"..chat_id,"silent")
elseif base:get(TD_ID.."sg:english"..chat_id) == "silent" then
text = "❌اخراج کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:set(TD_ID.."sg:english"..chat_id,"kick")
elseif base:get(TD_ID.."sg:english"..chat_id) == "kick" then
text = "❎ بدون حالت "
base:del(TD_ID.."sg:english"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:English')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:English')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:English')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:English')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:English')
base:srem(TD_ID..'Gp:'..chat_id,'Del:English')
end
Alert(msg.id,'قفل حالتی واکنشی چت انگلیسی تنظیم شدہ بـہ : '..text..'')
SETT(msg,chat_id,10)

elseif MenuName == 'locktxt' then
if not base:get(TD_ID.."sg:txt"..chat_id) then
text = "📵 حذف پیام متنی "
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:set(TD_ID.."sg:txt"..chat_id,"del")
elseif base:get(TD_ID.."sg:txt"..chat_id) == "del" then
text = "📵محدود کاربر "
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:set(TD_ID.."sg:txt"..chat_id,"mute")
elseif base:get(TD_ID.."sg:txt"..chat_id) == "mute" then
text = "⚠️اخطارکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:set(TD_ID.."sg:txt"..chat_id,"warn")
elseif base:get(TD_ID.."sg:txt"..chat_id) == "warn" then
text = "🚫مسدودکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:set(TD_ID.."sg:txt"..chat_id,"ban")
elseif base:get(TD_ID.."sg:txt"..chat_id) == "ban" then
text = "🔇سایلنت کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:set(TD_ID.."sg:txt"..chat_id,"silent")
elseif base:get(TD_ID.."sg:txt"..chat_id) == "silent" then
text = "❌اخراج کاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:set(TD_ID.."sg:txt"..chat_id,"kick")
elseif base:get(TD_ID.."sg:txt"..chat_id) == "kick" then
text = "❎ بدون حالت "
base:del(TD_ID.."sg:txt"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Text')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Text')
end
Alert(msg.id,'قفل حالتی واکنشی پیام متنی تنظیم شدہ بـہ : '..text..'')
SETT(msg,chat_id,9)



elseif MenuName == 'lockspam' then
if not base:get(TD_ID.."Del:Spam"..chat_id) then
text = "حذف اسپم "
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Spam')
base:set(TD_ID.."Del:Spam"..chat_id,"del")
elseif base:get(TD_ID.."Del:Spam"..chat_id) == "del" then
text = "سکوت اسپم"
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Spam')
base:set(TD_ID.."Del:Spam"..chat_id,"mute")
elseif base:get(TD_ID.."Del:Spam"..chat_id) == "mute" then
text = "اخطار اسپم"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Spam')
base:set(TD_ID.."Del:Spam"..chat_id,"warn")
elseif base:get(TD_ID.."Del:Spam"..chat_id) == "warn" then
text = "غیرفعال"
base:del(TD_ID.."Del:Spam"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Spam')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Spam')
end
Alert(msg.id,'قفل اسپم به  : '..text..' تنظیم شد.',true)
SETT(msg,chat_id,4)


elseif MenuName == 'lockflood' then
if not base:get(TD_ID.."Del:Flood"..chat_id) then
text = "📵 حذف فلود "
base:sadd(TD_ID..'Gp:'..chat_id,'Del:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Flood')
base:set(TD_ID.."Del:Flood"..chat_id,"del")
elseif base:get(TD_ID.."Del:Flood"..chat_id) == "del" then
text = "📵محدود کاربر "
base:sadd(TD_ID..'Gp:'..chat_id,'Mute:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Flood')
base:set(TD_ID.."Del:Flood"..chat_id,"mute")
elseif base:get(TD_ID.."Del:Flood"..chat_id) == "mute" then
text = "⚠️اخطارکاربر"
base:sadd(TD_ID..'Gp:'..chat_id,'Warn:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Flood')
base:set(TD_ID.."Del:Flood"..chat_id,"warn")
elseif base:get(TD_ID.."Del:Flood"..chat_id) == "warn" then
text = "غیرفعال "
base:del(TD_ID.."Del:Flood"..chat_id)
base:srem(TD_ID..'Gp:'..chat_id,'Mute:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Ban:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Warn:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Silent:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Kick:Flood')
base:srem(TD_ID..'Gp:'..chat_id,'Del:Flood')
end
Alert(msg.id,'وضعیت قفل فلود : '..text..'',true)
SETT(msg,chat_id,4)


elseif MenuName == 'Sethalatwarn' then
if not base:get(TD_ID.."warn_stats"..chat_id) then
text = "اخراج کاربر"
base:set(TD_ID.."warn_stats"..chat_id,"kick")
elseif base:get(TD_ID.."warn_stats"..chat_id) == "kick" then
text = "سکوت کاربر"
base:set(TD_ID.."warn_stats"..chat_id,"silent")
elseif base:get(TD_ID.."warn_stats"..chat_id) == "silent" then
text = "سکوت زمانی"
base:set(TD_ID.."warn_stats"..chat_id,"silenttime")
elseif base:get(TD_ID.."warn_stats"..chat_id) == "silenttime" then
text = "اخراج کاربر"
base:set(TD_ID.."warn_stats"..chat_id,"kick")
end
Alert(msg.id,'حالت اخطاری کاربران تغییر کرد به : '..text..'')
SETT(msg,chat_id,55)



elseif MenuName == 'Sethalatban' then
if not base:get(TD_ID.."ban_stats"..chat_id) then
text = "📵سکوت دائمی"
base:set(TD_ID.."ban_stats"..chat_id,"ban")
elseif base:get(TD_ID.."ban_stats"..chat_id) == "ban" then
text = "⏰سکوت زمانی"
base:set(TD_ID.."ban_stats"..chat_id,"bantime")
elseif base:get(TD_ID.."ban_stats"..chat_id) == "bantime" then
text = "📵سکوت دائمی"
base:set(TD_ID.."ban_stats"..chat_id,"ban")
elseif base:get(TD_ID.."ban_stats"..chat_id) == "ban" then
text = "⏰سکوت زمانی"
base:set(TD_ID.."ban_stats"..chat_id,"bantime")
end
Alert(msg.id,'حالت مسدود کاربران تغییر کرد به : '..text..'')
SETT(msg,chat_id,55)

elseif MenuName == 'Sethalatmute' then
if not base:get(TD_ID.."mute_stats"..chat_id) then
text = "📵سکوت دائمی"
base:set(TD_ID.."mute_stats"..chat_id,"mute")
elseif base:get(TD_ID.."mute_stats"..chat_id) == "mute" then
text = "⏰سکوت زمانی"
base:set(TD_ID.."mute_stats"..chat_id,"mutetime")
elseif base:get(TD_ID.."mute_stats"..chat_id) == "mutetime" then
text = "📵سکوت دائمی"
base:set(TD_ID.."mute_stats"..chat_id,"mute")
elseif base:get(TD_ID.."mute_stats"..chat_id) == "mute" then
text = "⏰سکوت زمانی"
base:set(TD_ID.."mute_stats"..chat_id,"mutetime")
end
Alert(msg.id,'حالت سکوت کاربران تغییر کرد به : '..text..'')
SETT(msg,chat_id,55)



elseif MenuName == 'Adminsendpm' then
if not base:get(TD_ID.."Adminsendpm"..chat_id) then
text = "﹝👮🏻‍♂️ مالک﹞"
base:set(TD_ID.."Adminsendpm"..chat_id,"OwnerGp")
elseif base:get(TD_ID.."Adminsendpm"..chat_id) == "OwnerGp" then
text = "﹝🔇 کل مدیران﹞"
base:set(TD_ID.."Adminsendpm"..chat_id,"OwnerAllGp")
elseif base:get(TD_ID.."Adminsendpm"..chat_id) == "OwnerAllGp" then
text = "﹝👮🏻‍♂️ ادمین ها﹞"
base:set(TD_ID.."Adminsendpm"..chat_id,"AdminGp")
elseif base:get(TD_ID.."Adminsendpm"..chat_id) == "AdminGp" then
text = "﹝👮🏻‍♂️ مالک﹞"
base:set(TD_ID.."Adminsendpm"..chat_id,"OwnerGp")
end
Alert(msg.id,'ارسال پیشنهاد پیام به  : '..text..'',true)
menu(chat_id,21)


elseif MenuName == 'forceaddfilter' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Add:Filter') then
base:srem(TD_ID..'Gp:'..chat_id,'Add:Filter')
Alert(msg.id,'قفل اداجباری فیلتر کلمات غیرفعال شد.',true)
else
base:sadd(TD_ID..'Gp:'..chat_id,'Add:Filter')
Alert(msg.id,'قفل اداجباری فیلتر کلمات فعال شد.',true)
end
SETT(msg,chat_id,5)
elseif MenuName == 'forcejoinemoji' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Join:Emoji') then
base:srem(TD_ID..'Gp:'..chat_id,'Join:Emoji')
Alert(msg.id,'قفل جوین ایموجی غیرفعال شد.',true)
else
base:sadd(TD_ID..'Gp:'..chat_id,'Join:Emoji')
Alert(msg.id,'قفل جوین ایموجی فعال شد',true)
end
SETT(msg,chat_id,6)



elseif MenuName == 'forcejoinmutetext' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutejoin') then
base:srem(TD_ID..'Gp2:'..chat_id,'forcejoinmutejoin')
base:sadd(TD_ID..'Gp2:'..chat_id,'forcejoinmutetext')
Alert(msg.id,'◈ قفل جوین اجباری احراز کاربر به ارسال پیام فعال شد!\nیعنی هر کاربری داخل گروه پیام ارسال کند باید عضو کانال شده واحزار عوضیت کند!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'forcejoinmutejoin')
base:srem(TD_ID..'Gp2:'..chat_id,'forcejoinmutetext')
Alert(msg.id,'◈ قفل جوین اجباری احراز کاربر به محض ورود فعال شد!\nیعنی هرکاربری به محض ورود به گروه باید عضو کانال شده و احراز عضویت کند!',true)
end
SETT(msg,chat_id,33)



elseif MenuName == 'Pornmutehallat' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'Pornmutehallat') then
base:srem(TD_ID..'Gp2:'..chat_id,'Pornmutehallat')
Alert(msg.id,'◈ حالت قفل پورن بر روی سکوت رسانه کاربر فعال شد!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'Pornmutehallat')
Alert(msg.id,'◈ حالت قفل پورن بر روی اخراج کاربر فعال شد!\n',true)
end
SETT(msg,chat_id,34)


elseif MenuName == 'forcejoinmutehallat' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat') then
base:srem(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat')

local timemutejoin = tonumber(base:get(TD_ID..'mutetimejoin:'..chat_id) or 3600)
local Time_ = getTimeUptime(timemutejoin)
Alert(msg.id,'◈ حالت جوین اجباری سکوت زمانی فعال شد\n◈ یعنی هر کاربری که در گروه عضو کانال(جوین اجباری)  نشده باشد به مدت '..Time_..' سکوت خواهد شد.',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat')
Alert(msg.id,'◈ حالت جوین اجباری سکوت دائمی فعال شد\n◈ یعنی هر کاربری که در گروه عضو کانال(جوین اجباری) نشده باشد در گروه سکوت دائم خواهد شد.',true)
end
SETT(msg,chat_id,33)

elseif MenuName == 'forcejoinmute' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmute') then
base:srem(TD_ID..'Gp2:'..chat_id,'forcejoinmute')
Alert(msg.id,'◈ قفل جوین اجباری احراز کاربرغیرفعال شد',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'forcejoinmute')
Alert(msg.id,'◈ قفل جوین اجباری احراز کاربرفعال شد',true)
end
SETT(msg,chat_id,33)
elseif MenuName == 'duplipost' then
if base:get(TD_ID.."bot:duplipost:mute" .. chat_id) then
base:del(TD_ID.."bot:duplipost:mute"..chat_id)
Alert(msg.id,'◈ قفل پیام تکراری کاربر غیرفعال شد!',true)
else
base:set(TD_ID.."bot:duplipost:mute" .. chat_id, true)
Alert(msg.id,'◈ قفل پیام تکراری فعال شد!',true)
end
SETT(msg,chat_id,4)

elseif MenuName == 'forcejoinfilter' then
if base:sismember(TD_ID..'Gp:'..chat_id,'Join:Filter') then
base:srem(TD_ID..'Gp:'..chat_id,'Join:Filter')
Alert(msg.id,'قفل جوین فیلتر کلمات غیرفعال شد.',true)
else
base:sadd(TD_ID..'Gp:'..chat_id,'Join:Filter')
Alert(msg.id,'قفل جوین فیلتر کلمات فعال شد.',true)
end
SETT(msg,chat_id,6)
elseif MenuName == 'forcejoinduc' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinduc') then
base:srem(TD_ID..'Gp2:'..chat_id,'forcejoinduc')
Alert(msg.id,'جوین اجباری رسانه غیرفعال شد',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'forcejoinduc')
Alert(msg.id,'جوین اجباری رسانه فعال شد',true)
end
SETT(msg,chat_id,6)
elseif MenuName == 'msgcheckpm' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'MsgCheckPm') then
base:srem(TD_ID..'Gp2:'..chat_id,'MsgCheckPm')
Alert(msg.id,'در صورتی کـہ قفل های (سایلنت,اخطار,اخراج,محدود) فعال باشند پیام های مربوط بـہ  آن ها نیز ارسال خواهند شد !',true)
else
Alert(msg.id,'در صورتی کـہ قفل های (سایلنت,اخطار,اخراج,محدود) فعال باشند پیام های مربوط بـہ  آن ها برای شلوغ نشدن گروہ ارسال نخواهند شد !',true)
base:sadd(TD_ID..'Gp2:'..chat_id,'MsgCheckPm')
end
SETT(msg,chat_id,55)

-----AddMAXup
elseif MenuName == 'AddMAXup' then
if not base:get(TD_ID..'Force:Max:'..chat_id) then
JoinWarn = 10
else
JoinWarn = tonumber(base:get(TD_ID..'Force:Max:'..chat_id))
end
local res = JoinWarn + 1
if not (res > 200) then
base:set(TD_ID..'Force:Max:'..chat_id,res)
Alert(msg.id,"• تعداد افزودن اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد افرودن اجباری 30 می باشد !',true)
end
SETT(msg,chat_id,5)

-----
elseif MenuName == 'AddMAXdown' then
if not base:get(TD_ID..'Force:Max:'..chat_id) then
JoinWarn = 10
else
JoinWarn = tonumber(base:get(TD_ID..'Force:Max:'..chat_id))
end
local res = JoinWarn - 1
if not (res < 2) then
base:set(TD_ID..'Force:Max:'..chat_id,res)
Alert(msg.id,"• تعداد افزودن اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد افزودن اجباری 2 می باشد !',true)
end
SETT(msg,chat_id,6)
elseif MenuName == 'AddMAX2up' then
if not base:get(TD_ID..'Force:Max:'..chat_id) then
JoinWarn = 10
else
JoinWarn = tonumber(base:get(TD_ID..'Force:Max:'..chat_id))
end
local res = JoinWarn + 2
if not (res > 200) then
base:set(TD_ID..'Force:Max:'..chat_id,res)
Alert(msg.id,"• تعداد افزودن اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد افرودن اجباری 30 می باشد !',true)
end
SETT(msg,chat_id,6)
-----
elseif MenuName == 'AddMAX2down' then
if not base:get(TD_ID..'Force:Max:'..chat_id) then
JoinWarn = 10
else
JoinWarn = tonumber(base:get(TD_ID..'Force:Max:'..chat_id))
end
local res = JoinWarn - 2
if not (res < 2) then
base:set(TD_ID..'Force:Max:'..chat_id,res)
Alert(msg.id,"• تعداد افزودن اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد افزودن اجباری 2 می باشد !',true)
end
SETT(msg,chat_id,5)
------JoinWarnMAXup


elseif MenuName == 'ForcWarnMAXup' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn + 1
if not (res > 30) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار احراز جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد جوین اجباری 30 می باشد !',true)
end
SETT(msg,chat_id,33)
-----
elseif MenuName == 'ForcWarnMAXdown' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn - 1
if not (res < 2) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار احراز جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل اخطار جوین اجباری 2 می باشد !',true)
end
SETT(msg,chat_id,33)
elseif MenuName == 'ForcWarnMAX2up' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn + 2
if not (res > 30) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار احراز جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد جوین اجباری 30 می باشد !',true)
end
SETT(msg,chat_id,33)
-----
elseif MenuName == 'ForcWarnMAX2down' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn - 2
if not (res < 2) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار احراز جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل اخطار جوین اجباری 2 می باشد !',true)
end
SETT(msg,chat_id,33)



elseif MenuName == 'JoinWarnMAXup' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn + 1
if not (res > 30) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد جوین اجباری 30 می باشد !',true)
end
SETT(msg,chat_id,6)
-----
elseif MenuName == 'JoinWarnMAXdown' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn - 1
if not (res < 2) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل اخطار جوین اجباری 2 می باشد !',true)
end
SETT(msg,chat_id,6)
elseif MenuName == 'JoinWarnMAX2up' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn + 2
if not (res > 30) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد جوین اجباری 30 می باشد !',true)
end
SETT(msg,chat_id,6)
-----
elseif MenuName == 'JoinWarnMAX2down' then
if not base:get(TD_ID..'joinwarn:'..chat_id) then
JoinWarn = 4
else
JoinWarn = tonumber(base:get(TD_ID..'joinwarn:'..chat_id))
end
local res = JoinWarn - 2
if not (res < 2) then
base:set(TD_ID..'joinwarn:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار جوین اجباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل اخطار جوین اجباری 2 می باشد !',true)
end
SETT(msg,chat_id,6)


-----

----warnMAXup
elseif MenuName == 'warnMAXup' then
if not base:get(TD_ID..'Warn:Max:'..chat_id) then
warn = 5
else
warn = tonumber(base:get(TD_ID..'Warn:Max:'..chat_id))
end
local res = warn + 1
if not (res > 10) then
base:set(TD_ID..'Warn:Max:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار بر روی هر کاربر "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد اخطار 10 می باشد !',true)
end
SETT(msg,chat_id,55)

-----
elseif MenuName == 'warnMAXdown' then
if not base:get(TD_ID..'Warn:Max:'..chat_id) then
warn = 5
else
warn = tonumber(base:get(TD_ID..'Warn:Max:'..chat_id))
end
local res = warn - 1
if not (res < 2) then
base:set(TD_ID..'Warn:Max:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار بر روی هر کاربر "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد اخطار ها 2 می باشد !',true)
end
SETT(msg,chat_id,55)

elseif MenuName == 'warnMAX2up' then
if not base:get(TD_ID..'Warn:Max:'..chat_id) then
warn = 5
else
warn = tonumber(base:get(TD_ID..'Warn:Max:'..chat_id))
end
local res = warn + 2
if not (res > 10) then
base:set(TD_ID..'Warn:Max:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار بر روی هر کاربر "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد اخطار 10 می باشد !',true)
end
SETT(msg,chat_id,55)

-----
elseif MenuName == 'warnMAX2down' then
if not base:get(TD_ID..'Warn:Max:'..chat_id) then
warn = 5
else
warn = tonumber(base:get(TD_ID..'Warn:Max:'..chat_id))
end
local res = warn - 2
if not (res < 2) then
base:set(TD_ID..'Flood:Max:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار بر روی هر کاربر "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد اخطار ها 2 می باشد !',true)
end
SETT(msg,chat_id,55)





-----forcepmMAXup

elseif MenuName == 'forcepmMAXup' then
if not base:get(TD_ID..'Force:Pm:'..chat_id) then
forcepm = 5
else
forcepm = tonumber(base:get(TD_ID..'Force:Pm:'..chat_id))
end
local res = forcepm + 1
if not (res > 20) then
base:set(TD_ID..'Force:Pm:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار افزودن اجباری"..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد اخطار 20 می باشد !',true)
end
SETT(msg,chat_id,5)
-----
elseif MenuName == 'forcepmMAXdown' then
if not base:get(TD_ID..'Force:Pm:'..chat_id) then
forcepm = 5
else
forcepm = tonumber(base:get(TD_ID..'Force:Pm:'..chat_id))
end
local res = forcepm - 1
if not (res < 2) then
base:set(TD_ID..'Force:Pm:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار افزودن اجباری"..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد اخطار ها 2 می باشد !',true)
end
SETT(msg,chat_id,5)

elseif MenuName == 'forcepmMAX2up' then
if not base:get(TD_ID..'Force:Pm:'..chat_id) then
forcepm = 5
else
forcepm = tonumber(base:get(TD_ID..'Force:Pm:'..chat_id))
end
local res = forcepm + 2
if not (res > 20) then
base:set(TD_ID..'Force:Pm:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار افزودن اجباری"..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداکثر تعداد اخطار 20 می باشد !',true)
end
SETT(msg,chat_id,5)
-----
elseif MenuName == 'forcepmMAX2down' then
if not base:get(TD_ID..'Force:Pm:'..chat_id) then
forcepm = 5
else
forcepm = tonumber(base:get(TD_ID..'Force:Pm:'..chat_id))
end
local res = forcepm - 2
if not (res < 2) then
base:set(TD_ID..'Force:Pm:'..chat_id,res)
Alert(msg.id,"• تعداد اخطار افزودن اجباری"..res.." عدد تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد اخطار ها 2 می باشد !',true)
end
SETT(msg,chat_id,5)


----

-----MSGMAXup
elseif MenuName == 'MSGMAXup' then
if not base:get(TD_ID..'Flood:Max:'..chat_id) then
TIME_CHECK = 10
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Max:'..chat_id))
end
local res = TIME_CHECK + 1
if not (res > 50) then
base:set(TD_ID..'Flood:Max:'..chat_id,res)
Alert(msg.id,"• تعداد پیام رگباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'حداکثر تعداد پیام رگباری 50 میباشد !',true)
end
SETT(msg,chat_id,4)

-----
elseif MenuName == 'MSGMAXdown' then
if not base:get(TD_ID..'Flood:Max:'..chat_id) then
TIME_CHECK = 10
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Max:'..chat_id))
end
local res = TIME_CHECK - 1
if not (res < 2) then
base:set(TD_ID..'Flood:Max:'..chat_id,res)
Alert(msg.id,"• تعداد پیام رگباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'حداقل تعداد پیام رگباری 2 میباشد !',true)
end
SETT(msg,chat_id,4)

elseif MenuName == 'MSGMAX2up' then
if not base:get(TD_ID..'Flood:Max:'..chat_id) then
TIME_CHECK = 10
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Max:'..chat_id))
end
local res = TIME_CHECK + 2
if not (res > 50) then
base:set(TD_ID..'Flood:Max:'..chat_id,res)
Alert(msg.id,"• تعداد پیام رگباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'حداکثر تعداد پیام رگباری 50 میباشد !',true)
end
SETT(msg,chat_id,4)

-----
elseif MenuName == 'MSGMAX2down' then
if not base:get(TD_ID..'Flood:Max:'..chat_id) then
TIME_CHECK = 10
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Max:'..chat_id))
end
local res = TIME_CHECK - 2
if not (res < 2) then
base:set(TD_ID..'Flood:Max:'..chat_id,res)
Alert(msg.id,"• تعداد پیام رگباری "..res.." عدد تنظیم شد !")
else
Alert(msg.id,'حداقل تعداد پیام رگباری 2 میباشد !',true)
end
SETT(msg,chat_id,4)
-----TIMEMAXup

elseif MenuName == 'TIMEMUTEUP' then
if not base:get(TD_ID..'mutetime:'..chat_id) then
mutetime = 9999999
else
mutetime = tonumber(base:get(TD_ID..'mutetime:'..chat_id))
end
local res = mutetime + 3600
if not (res > 9999999) then
base:set(TD_ID..'mutetime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم سکوت "..Time_.." تنظیم شد")
else
Alert(msg.id,'حداکثر ',true)
end
SETT(msg,chat_id,55)
elseif MenuName == 'TIMEMUTEDOWN' then
if not base:get(TD_ID..'mutetime:'..chat_id) then
mutetime = 3600
else
mutetime = tonumber(base:get(TD_ID..'mutetime:'..chat_id))
end
local res = mutetime - 3600
if not (res < 3600) then
base:set(TD_ID..'mutetime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم سکوت "..Time_.." تنظیم شد")
else
Alert(msg.id,'• حداقل تایم سکوت در سیستم یک ساعت می باشد !',true)
end
SETT(msg,chat_id,55)

elseif MenuName == 'TIMEMUTE2UP' then
if not base:get(TD_ID..'mutetime:'..chat_id) then
mutetime = 9999999
else
mutetime = tonumber(base:get(TD_ID..'mutetime:'..chat_id))
end
local res = mutetime + 7200
if not (res > 9999999) then
base:set(TD_ID..'mutetime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم سکوت "..Time_.." تنظیم شد")
else
Alert(msg.id,'حداکثر ',true)
end
SETT(msg,chat_id,55)

elseif MenuName == 'TIMEMUTE2DOWN' then
if not base:get(TD_ID..'mutetime:'..chat_id) then
mutetime = 3600
else
mutetime = tonumber(base:get(TD_ID..'mutetime:'..chat_id))
end
local res = mutetime - 7200
if not (res < 3600) then
base:set(TD_ID..'mutetime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم سکوت "..Time_.." تنظیم شد")
else
Alert(msg.id,'• حداقل تایم سکوت در سیستم یک ساعت می باشد !',true)
end
SETT(msg,chat_id,55)






elseif MenuName == 'TIMEBANDOWN' then
if not base:get(TD_ID..'bantime:'..chat_id) then
mutetime = 86400
else
mutetime = tonumber(base:get(TD_ID..'bantime:'..chat_id))
end
local res = mutetime - 86400
if not (res < 86400) then
base:set(TD_ID..'bantime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم مسدود شدن "..Time_.." تنظیم شد")
else
Alert(msg.id,'• حداقل تایم مسدود در سیستم یک روز می باشد !',true)
end
SETT(msg,chat_id,55)
elseif MenuName == 'TIMEBANUP' then
if not base:get(TD_ID..'bantime:'..chat_id) then
mutetime = 86400
else
mutetime = tonumber(base:get(TD_ID..'bantime:'..chat_id))
end
local res = mutetime + 86400
if not (res > 9999999) then
base:set(TD_ID..'bantime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم مسدود شدن "..Time_.." تنظیم شد")
else
Alert(msg.id,'حداکثر ',true)
end
SETT(msg,chat_id,55)
elseif MenuName == 'TIMEBAN2UP' then
if not base:get(TD_ID..'bantime:'..chat_id) then
mutetime = 86400
else
mutetime = tonumber(base:get(TD_ID..'bantime:'..chat_id))
end
local res = mutetime + 172800
if not (res > 9999999) then
base:set(TD_ID..'bantime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم مسدود شدن "..Time_.." تنظیم شد")
else
Alert(msg.id,'حداکثر ',true)
end
SETT(msg,chat_id,55)

elseif MenuName == 'TIMEBAN2DOWN' then
if not base:get(TD_ID..'bantime:'..chat_id) then
mutetime = 86400
else
mutetime = tonumber(base:get(TD_ID..'bantime:'..chat_id))
end
local res = mutetime - 172800
if not (res < 86400) then
base:set(TD_ID..'bantime:'..chat_id,res)
local Time_ = getTimeUptime(res)
Alert(msg.id,"• تایم مسدود شدن "..Time_.." تنظیم شد")
else
Alert(msg.id,'• حداقل تایم مسدود در سیستم یک روز می باشد !',true)
end
SETT(msg,chat_id,55)




elseif MenuName == 'TIMEStatsup' then
if not base:get(TD_ID..'ST:Time:'..chat_id) then
ST = 7
else
ST = tonumber(base:get(TD_ID..'ST:Time:'..chat_id))
end
local res = ST + 1
local res2 = 86400 * res
if not (res > 31) and not (res2 > 2592000)  then
base:set(TD_ID..'ST:Time:'..chat_id,res)
base:set(TD_ID..'timestats:'..chat_id,res2)
Alert(msg.id,"• زمان ریست شدن امار "..res.." روز تنظیم شد!")
else
Alert(msg.id,'حداکثر روز 31 می باشد !',true)
end
menu(chat_id,61)

-----


elseif MenuName == 'Licleandown' then
if not base:get(TD_ID..'Li:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:clean:'..chat_id))
end
local res = ST - 100
if not (res < 100) then
base:set(TD_ID..'Li:clean:'..chat_id,res)
base:set(TD_ID..'cleanpm:'..chat_id,res)
Alert(msg.id,"🏷 تعداد لیمیت ارسال هرکاربر "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل تعداد لیمیت 100 می باشد!',true)
end
menu(chat_id,23)
elseif MenuName == 'Licleanup' then
if not base:get(TD_ID..'Li:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:clean:'..chat_id))
end
local res = ST + 100
if not (res > 10000) then
base:set(TD_ID..'Li:clean:'..chat_id,res)
base:set(TD_ID..'limitpm:'..chat_id,res)
Alert(msg.id,"🏷 تعداد لیمیت ارسال هرکاربر "..res.." پیام",true)
else
Alert(msg.id,'• حداقل تعداد لیمیت 10000 می باشد!',true)
end
menu(chat_id,23)


elseif MenuName == 'Liclean3down' then
if not base:get(TD_ID..'Li:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:clean:'..chat_id))
end
local res = ST - 200
if not (res < 100) then
base:set(TD_ID..'Li:clean:'..chat_id,res)
base:set(TD_ID..'cleanpm:'..chat_id,res)
Alert(msg.id,"🏷 تعداد لیمیت ارسال هرکاربر "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل تعداد لیمیت 100 می باشد!',true)
end
menu(chat_id,23)
elseif MenuName == 'Liclean2up' then
if not base:get(TD_ID..'Li:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:clean:'..chat_id))
end
local res = ST + 200
if not (res > 10000) then
base:set(TD_ID..'Li:clean:'..chat_id,res)
base:set(TD_ID..'limitpm:'..chat_id,res)
Alert(msg.id,"🏷 تعداد لیمیت ارسال هرکاربر "..res.." پیام",true)
else
Alert(msg.id,'• حداقل تعداد لیمیت 10000 می باشد!',true)
end
menu(chat_id,23)


elseif MenuName == 'Adminpmdown' then
if not base:get(TD_ID..'CL:Adminpm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Adminpm:'..chat_id))
end
local res = ST - 100
if not (res < 100) then
base:set(TD_ID..'CL:Adminpm:'..chat_id,res)
base:set(TD_ID..'Adminpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام تعیین خودکار ادمین هر کاربر در گروه تنظیم شد به : "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل عملیات جهت تعیین عددی 100 می باشد!',true)
end
menu(chat_id,21)
elseif MenuName == 'Adminpmup' then
if not base:get(TD_ID..'CL:Adminpm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Adminpm:'..chat_id))
end
local res = ST + 100
if not (res > 10000) then
base:set(TD_ID..'CL:Adminpm:'..chat_id,res)
base:set(TD_ID..'Adminpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام تعیین خودکار ادمین هر کاربر در گروه تنظیم شد به : "..res.." پیام",true)
else
Alert(msg.id,'• حداکثر عملیات جهت تعیین عددی 10000 تا می باشد!',true)
end
menu(chat_id,21)



elseif MenuName == 'DownCleanNumberMsg' then
if not base:get(TD_ID..'CL:CleanNumber:'..chat_id) then
ST = 0
else
ST = tonumber(base:get(TD_ID..'CL:CleanNumber:'..chat_id))
end
local res = ST - 100
if not (res < 10) then
base:set(TD_ID..'CL:CleanNumber:'..chat_id,res)
base:set(TD_ID..'CleanMsgNumber:'..chat_id,res)
Alert(msg.id,"• تعداد پیام جهت پاکسازی : "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل عملیات جهت تعیین عددی 100 می باشد!',true)
end
menu(chat_id,80)
elseif MenuName == 'DownDownCleanNumberMsg' then
if not base:get(TD_ID..'CL:CleanNumber:'..chat_id) then
ST = 0
else
ST = tonumber(base:get(TD_ID..'CL:CleanNumber:'..chat_id))
end
local res = ST - 200
if not (res < 10) then
base:set(TD_ID..'CL:CleanNumber:'..chat_id,res)
base:set(TD_ID..'CleanMsgNumber:'..chat_id,res)
Alert(msg.id,"• تعداد پیام جهت پاکسازی : "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل عملیات جهت تعیین عددی 100 می باشد!',true)
end
menu(chat_id,80)
elseif MenuName == 'UpUpCleanNumberMsg' then
if not base:get(TD_ID..'CL:CleanNumber:'..chat_id) then
ST = 0
else
ST = tonumber(base:get(TD_ID..'CL:CleanNumber:'..chat_id))
end
local res = ST + 200
if not (res > 1000) then
base:set(TD_ID..'CL:CleanNumber:'..chat_id,res)
base:set(TD_ID..'CleanMsgNumber:'..chat_id,res)
Alert(msg.id,"•  تعداد پیام جهت پاکسازی : "..res.." پیام",true)
else
Alert(msg.id,'• حداکثر عملیات 1000تا می باشد!',true)
end
menu(chat_id,80)
elseif MenuName == 'UpCleanNumberMsg' then
if not base:get(TD_ID..'CL:CleanNumber:'..chat_id) then
ST = 0
else
ST = tonumber(base:get(TD_ID..'CL:CleanNumber:'..chat_id))
end
local res = ST + 100
if not (res > 1000) then
base:set(TD_ID..'CL:CleanNumber:'..chat_id,res)
base:set(TD_ID..'CleanMsgNumber:'..chat_id,res)
Alert(msg.id,"•  تعداد پیام جهت پاکسازی : "..res.." پیام",true)
else
Alert(msg.id,'• حداکثر عملیات 1000تا می باشد!',true)
end
menu(chat_id,80)









elseif MenuName == 'Adminpm2down' then
if not base:get(TD_ID..'CL:Adminpm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Adminpm:'..chat_id))
end
local res = ST - 200
if not (res < 100) then
base:set(TD_ID..'CL:Adminpm:'..chat_id,res)
base:set(TD_ID..'Adminpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام تعیین خودکار ادمین هر کاربر در گروه تنظیم شد به : "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل عملیات جهت تعیین عددی 100 می باشد!',true)
end
menu(chat_id,21)
elseif MenuName == 'Adminpm2up' then
if not base:get(TD_ID..'CL:Adminpm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Adminpm:'..chat_id))
end
local res = ST + 200
if not (res > 10000) then
base:set(TD_ID..'CL:Adminpm:'..chat_id,res)
base:set(TD_ID..'Adminpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام تعیین خودکار ادمین هر کاربر در گروه تنظیم شد به : "..res.." پیام",true)
else
Alert(msg.id,'• حداکثر عملیات جهت تعیین عددی 10000 تا می باشد!',true)
end
menu(chat_id,21)

elseif MenuName == 'cleanpmdown1' then
if not base:get(TD_ID..'CL:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:clean:'..chat_id))
end
local res = ST - 100
if not (res < 100) then
base:set(TD_ID..'CL:clean:'..chat_id,res)
base:set(TD_ID..'limitpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام کلی جهت عملیات پاکسازی کلی "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل عملیات جهت پاکسازی عددی 100 می باشد!',true)
end
menu(chat_id,88)
elseif MenuName == 'cleanpmup1' then
if not base:get(TD_ID..'CL:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:clean:'..chat_id))
end
local res = ST + 100
if not (res > 10000) then
base:set(TD_ID..'CL:clean:'..chat_id,res)
base:set(TD_ID..'cleanpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام کلی جهت عملیات پاکسازی کلی "..res.." پیام",true)
else
Alert(msg.id,'• حداکثر عملیات جهت پاکسازی عددی 10000 تا می باشد!',true)
end
menu(chat_id,88)

elseif MenuName == 'cleanpmdown' then
if not base:get(TD_ID..'CL:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:clean:'..chat_id))
end
local res = ST - 2000
if not (res < 2000) then
base:set(TD_ID..'CL:clean:'..chat_id,res)
base:set(TD_ID..'cleanpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام کلی جهت عملیات پاکسازی کلی "..res.." پیام!",true)
else
Alert(msg.id,'• حداقل عملیات جهت پاکسازی عددی 2000می باشد!',true)
end
menu(chat_id,88)
elseif MenuName == 'cleanpmup' then
if not base:get(TD_ID..'CL:clean:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:clean:'..chat_id))
end
local res = ST + 2000
if not (res > 10000) then
base:set(TD_ID..'CL:clean:'..chat_id,res)
base:set(TD_ID..'cleanpm:'..chat_id,res)
Alert(msg.id,"• تعداد پیام کلی جهت عملیات پاکسازی کلی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر عملیات جهت پاکسازی عددی 10000 تا می باشد!',true)
end
menu(chat_id,88)

elseif MenuName == 'TIMEFocdown' then
if not base:get(TD_ID..'Li:TimeFoc:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFoc:'..chat_id))
end
local res = ST - 1
t = res * 60
if not (res < 1) then
base:set(TD_ID..'Li:TimeFoc:'..chat_id,res)
base:set(TD_ID..'GaurdClearPm:'..chat_id,t)
Alert(msg.id,"• زمان مهلت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,'• حداقل 1 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)
elseif MenuName == 'TIMEFocup' then
if not base:get(TD_ID..'Li:TimeFoc:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFoc:'..chat_id))
end
local res = ST + 1
t = res * 60
if not (res > 72) then
base:set(TD_ID..'Li:TimeFoc:'..chat_id,res)
base:set(TD_ID..'GaurdClearPm:'..chat_id,t)
Alert(msg.id,"• زمان مهلت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,' • حداکثر 72 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)

elseif MenuName == 'TIMEFoc2down' then
if not base:get(TD_ID..'Li:TimeFoc:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFoc:'..chat_id))
end
local res = ST - 2
t = res * 60
if not (res < 1) then
base:set(TD_ID..'Li:TimeFoc:'..chat_id,res)
base:set(TD_ID..'GaurdClearPm:'..chat_id,t)
Alert(msg.id,"• زمان مهلت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,'• حداقل 1 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)
elseif MenuName == 'TIMEFoc2up' then
if not base:get(TD_ID..'Li:TimeFoc:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFoc:'..chat_id))
end
local res = ST + 2
t = res * 60
if not (res > 72) then
base:set(TD_ID..'Li:TimeFoc:'..chat_id,res)
base:set(TD_ID..'GaurdClearPm:'..chat_id,t)
Alert(msg.id,"• زمان مهلت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,'• حداکثر 72 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)


elseif MenuName == 'TIMEFocmdown' then
if not base:get(TD_ID..'Li:TimeFocm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFocm:'..chat_id))
end
local res = ST - 1
t = res * 60
if not (res < 1) then
base:set(TD_ID..'Li:TimeFocm:'..chat_id,res)
base:set(TD_ID..'mutetimejoin:'..chat_id,t)
Alert(msg.id,"• زمان سکوت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,'• حداقل 1 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)
elseif MenuName == 'TIMEFocmup' then
if not base:get(TD_ID..'Li:TimeFocm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFocm:'..chat_id))
end
local res = ST + 1
t = res * 60
if not (res > 72) then
base:set(TD_ID..'Li:TimeFocm:'..chat_id,res)
base:set(TD_ID..'mutetimejoin:'..chat_id,t)
Alert(msg.id,"• زمان سکوت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,' • حداکثر 72 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)

elseif MenuName == 'TIMEFoc2mdown' then
if not base:get(TD_ID..'Li:TimeFoc:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFocm:'..chat_id))
end
local res = ST - 2
t = res * 60
if not (res < 1) then
base:set(TD_ID..'Li:TimeFocm:'..chat_id,res)
base:set(TD_ID..'mutetimejoin:'..chat_id,t)
Alert(msg.id,"• زمان سکوت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,'• حداقل 1 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)
elseif MenuName == 'TIMEFocm2up' then
if not base:get(TD_ID..'Li:TimeFocm:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:TimeFocm:'..chat_id))
end
local res = ST + 2
t = res * 60
if not (res > 72) then
base:set(TD_ID..'Li:TimeFocm:'..chat_id,res)
base:set(TD_ID..'mutetimejoin:'..chat_id,t)
Alert(msg.id,"• زمان سکوت احراز جوین اجباری "..res.." دقیقه دیگر!",true)
else
Alert(msg.id,'• حداکثر 72 دقیقه می باشد !',true)
end
SETT(msg,chat_id,33)


elseif MenuName == 'TIMELimdown' then
if not base:get(TD_ID..'Li:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:Time:'..chat_id))
end
local res = ST - 1
t = res * 3600
if not (res < 1) then
base:set(TD_ID..'Li:Time:'..chat_id,res)
base:set(TD_ID..'mutetime:'..chat_id,t)
Alert(msg.id,"• زمان محدود کاربر بعد لیمیت پیام "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداقل ساعت 1 می باشد !',true)
end
menu(chat_id,23)
elseif MenuName == 'TIMELimup' then
if not base:get(TD_ID..'Li:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:Time:'..chat_id))
end
local res = ST + 1
t = res * 3600
if not (res > 72) then
base:set(TD_ID..'Li:Time:'..chat_id,res)
base:set(TD_ID..'mutetime:'..chat_id,t)
Alert(msg.id,"• زمان محدود کاربر بعد لیمیت پیام "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر ساعت 72 می باشد !',true)
end
menu(chat_id,23)

elseif MenuName == 'TIMELim2down' then
if not base:get(TD_ID..'Li:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:Time:'..chat_id))
end
local res = ST - 2
t = res * 3600
if not (res < 1) then
base:set(TD_ID..'Li:Time:'..chat_id,res)
base:set(TD_ID..'mutetime:'..chat_id,t)
Alert(msg.id,"• زمان محدود کاربر بعد لیمیت پیام "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداقل ساعت 1 می باشد !',true)
end
menu(chat_id,23)
elseif MenuName == 'TIMELim2up' then
if not base:get(TD_ID..'Li:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'Li:Time:'..chat_id))
end
local res = ST + 2
t = res * 3600
if not (res > 72) then
base:set(TD_ID..'Li:Time:'..chat_id,res)
base:set(TD_ID..'mutetime:'..chat_id,t)
Alert(msg.id,"• زمان محدود کاربر بعد لیمیت پیام "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر ساعت 72 می باشد !',true)
end
menu(chat_id,23)

elseif MenuName == 'TIMECldown' then
if not base:get(TD_ID..'CL:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Time:'..chat_id))
end
local res = ST - 1
t = res * 3600
if not (res < 1) then
base:set(TD_ID..'CL:Time:'..chat_id,res)
base:set(TD_ID..'cgmautotime:'..chat_id,t)
base:set(TD_ID..'cgmautotime1:'..chat_id,t)
base:set(TD_ID..'cgmautotime2:'..chat_id,t)
base:set(TD_ID..'cgmautotime3:'..chat_id,t)
base:set(TD_ID..'cgmautotime4:'..chat_id,t)
Alert(msg.id,"• زمان پاکسازی خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداقل ساعت 1 می باشد !',true)
end
menu(chat_id,39)
elseif MenuName == 'TIMEClup' then
if not base:get(TD_ID..'CL:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Time:'..chat_id))
end
local res = ST + 1
t = res * 3600
if not (res > 72) then
base:set(TD_ID..'CL:Time:'..chat_id,res)
base:set(TD_ID..'cgmautotime:'..chat_id,t)
base:set(TD_ID..'cgmautotime1:'..chat_id,t)
base:set(TD_ID..'cgmautotime2:'..chat_id,t)
base:set(TD_ID..'cgmautotime3:'..chat_id,t)
base:set(TD_ID..'cgmautotime4:'..chat_id,t)
Alert(msg.id,"• زمان پاکسازی خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر ساعت 72 می باشد !',true)
end
menu(chat_id,39)


elseif MenuName == 'TIMECl2down' then
if not base:get(TD_ID..'CL:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Time:'..chat_id))
end
local res = ST - 2
t = res * 3600
if not (res < 1) then
base:set(TD_ID..'CL:Time:'..chat_id,res)
base:set(TD_ID..'cgmautotime:'..chat_id,t)
base:set(TD_ID..'cgmautotime1:'..chat_id,t)
base:set(TD_ID..'cgmautotime2:'..chat_id,t)
base:set(TD_ID..'cgmautotime3:'..chat_id,t)
base:set(TD_ID..'cgmautotime4:'..chat_id,t)
Alert(msg.id,"• زمان پاکسازی خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداقل ساعت 1 می باشد !',true)
end
menu(chat_id,39)
elseif MenuName == 'TIMECl2up' then
if not base:get(TD_ID..'CL:Time:'..chat_id) then
ST = 1
else
ST = tonumber(base:get(TD_ID..'CL:Time:'..chat_id))
end
local res = ST + 2
t = res * 3600
if not (res > 72) then
base:set(TD_ID..'CL:Time:'..chat_id,res)
base:set(TD_ID..'cgmautotime:'..chat_id,t)
base:set(TD_ID..'cgmautotime1:'..chat_id,t)
base:set(TD_ID..'cgmautotime2:'..chat_id,t)
base:set(TD_ID..'cgmautotime3:'..chat_id,t)
base:set(TD_ID..'cgmautotime4:'..chat_id,t)
Alert(msg.id,"• زمان پاکسازی خودکار تنظیم شد بر روی "..res.." ساعت دیگر!",true)
else
Alert(msg.id,'• حداکثر ساعت 72 می باشد !',true)
end
menu(chat_id,39)



elseif MenuName == 'TIMEStatsup' then
if not base:get(TD_ID..'ST:Time:'..chat_id) then
ST = 7
else
ST = tonumber(base:get(TD_ID..'ST:Time:'..chat_id))
end
local res = ST + 1
local res2 = 86400 * res
if not (res > 31) and not (res2 > 2592000)  then
base:set(TD_ID..'ST:Time:'..chat_id,res)
base:set(TD_ID..'timestats:'..chat_id,res2)
Alert(msg.id,"• زمان ریست شدن امار "..res.." روز تنظیم شد!")
else
Alert(msg.id,'حداکثر روز 31 می باشد !',true)
end
menu(chat_id,61)

elseif MenuName == 'TIMEStatsdown' then
if not base:get(TD_ID..'ST:Time:'..chat_id) then
ST = 7
else
ST = tonumber(base:get(TD_ID..'ST:Time:'..chat_id))
end
local res = ST - 1
local res2 = 86400 * res
if not (res < 1) then
base:set(TD_ID..'ST:Time:'..chat_id,res)
base:set(TD_ID..'timestats:'..chat_id,res2)
Alert(msg.id,"• زمان ریست شدن امار "..res.." روز تنظیم شد!")
else
Alert(msg.id,'• حداقل روز 1 می باشد !',true)
end
menu(chat_id,61)

elseif MenuName == 'TIMEStats2up' then
if not base:get(TD_ID..'ST:Time:'..chat_id) then
ST = 7
else
ST = tonumber(base:get(TD_ID..'ST:Time:'..chat_id))
end
local res = ST + 2
local res2 = 86400 * res
if not (res > 31) and not (res2 > 2592000)  then
base:set(TD_ID..'ST:Time:'..chat_id,res)
base:set(TD_ID..'timestats:'..chat_id,res2)
Alert(msg.id,"• زمان ریست شدن امار "..res.." روز تنظیم شد!")
else
Alert(msg.id,'حداکثر روز 31 می باشد !',true)
end
menu(chat_id,61)

elseif MenuName == 'TIMEStats2down' then
if not base:get(TD_ID..'ST:Time:'..chat_id) then
ST = 7
else
ST = tonumber(base:get(TD_ID..'ST:Time:'..chat_id))
end
local res = ST - 2
local res2 = 86400 * res
if not (res < 1) then
base:set(TD_ID..'ST:Time:'..chat_id,res)
base:set(TD_ID..'timestats:'..chat_id,res2)
Alert(msg.id,"• زمان ریست شدن امار "..res.." روز تنظیم شد!")
else
Alert(msg.id,'• حداقل روز 1 می باشد !',true)
end
menu(chat_id,61)

elseif MenuName == 'TIMEStatsnumup' then
if not base:get(TD_ID..'ST:Number:'..chat_id) then
ST = 10
else
ST = tonumber(base:get(TD_ID..'ST:Number:'..chat_id))
end
local res = ST + 1
if not (res > 20)   then
base:set(TD_ID..'ST:Number:'..chat_id,res)
Alert(msg.id,"• تعداد آمار کاربران به "..res.." تنظیم شد!",true)
else
Alert(msg.id,'حداکثر جهت نمایش 20 کاربر می باشد! !',true)
end
menu(chat_id,61)

elseif MenuName == 'TIMEStatsnumdown' then
if not base:get(TD_ID..'ST:Number:'..chat_id) then
ST = 10
else
ST = tonumber(base:get(TD_ID..'ST:Number:'..chat_id))
end
local res = ST - 1
if not (res < 3) then
base:set(TD_ID..'ST:Number:'..chat_id,res)
Alert(msg.id,"• تعداد آمار کاربران به "..res.." تنظیم شد!",true)
else
Alert(msg.id,'• حداقل جهت نمایش 3نفر می باشد',true)
end
menu(chat_id,61)



elseif MenuName == 'TIMEStatsnum2up' then
if not base:get(TD_ID..'ST:Number:'..chat_id) then
ST = 10
else
ST = tonumber(base:get(TD_ID..'ST:Number:'..chat_id))
end
local res = ST + 2
if not (res > 20)   then
base:set(TD_ID..'ST:Number:'..chat_id,res)
Alert(msg.id,"• تعداد آمار کاربران به "..res.." تنظیم شد!",true)
else
Alert(msg.id,'حداکثر جهت نمایش 20 کاربر می باشد! !',true)
end
menu(chat_id,61)

elseif MenuName == 'TIMEStatsnum2down' then
if not base:get(TD_ID..'ST:Number:'..chat_id) then
ST = 10
else
ST = tonumber(base:get(TD_ID..'ST:Number:'..chat_id))
end
local res = ST - 2
if not (res < 3) then
base:set(TD_ID..'ST:Number:'..chat_id,res)
Alert(msg.id,"• تعداد آمار کاربران به "..res.." تنظیم شد!",true)
else
Alert(msg.id,'• حداقل جهت نمایش 3نفر می باشد',true)
end
menu(chat_id,61)



elseif MenuName == 'TIMEMAXup' then
if not base:get(TD_ID..'Flood:Time:'..chat_id) then
TIME_CHECK = 5
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Time:'..chat_id))
end
local res = TIME_CHECK + 1
if not (res > 20) then
base:set(TD_ID..'Flood:Time:'..chat_id,res)
Alert(msg.id,"• حساسیت پیام رگباری "..res.." ثانیـہ تنظیم شد !")
else
Alert(msg.id,'حداکثر حساسیت فلود 20 میباشد !',true)
end
SETT(msg,chat_id,4)

elseif MenuName == 'TIMEJOINup' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG + 1
if not (res > 120) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'حداکثر زمان 120 ثانیه می باشد!',true)
end
SETT(msg,chat_id,6)
-----
elseif MenuName == 'TIMEJOINdown' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG - 1
if not (res < 5) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'• حداقل 5ثانیه می باشد !',true)
end
SETT(msg,chat_id,6)




elseif MenuName == 'TIMEForc2up' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG + 2
if not (res > 120) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'حداکثر زمان 120 ثانیه می باشد!',true)
end
SETT(msg,chat_id,33)
-----
elseif MenuName == 'TIMEForc2down' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG - 2
if not (res < 5) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'• حداقل 5ثانیه می باشد !',true)
end
SETT(msg,chat_id,33)


elseif MenuName == 'TIMEForcup' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG + 1
if not (res > 120) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'حداکثر زمان 120 ثانیه می باشد!',true)
end
SETT(msg,chat_id,33)
-----
elseif MenuName == 'TIMEForcdown' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG - 1
if not (res < 5) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'• حداقل 5ثانیه می باشد !',true)
end
SETT(msg,chat_id,33)




elseif MenuName == 'TIMEJOIN2up' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG + 2
if not (res > 120) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'حداکثر زمان 120 ثانیه می باشد!',true)
end
SETT(msg,chat_id,6)
-----
elseif MenuName == 'TIMEJOIN2down' then
if not base:get(TD_ID..'JoinMSG:Time:'..chat_id) then
JoinMSG = 15
else
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id))
end
local res = JoinMSG - 2
if not (res < 5) then
base:set(TD_ID..'JoinMSG:Time:'..chat_id,res)
Alert(msg.id,"• زمان پاکسازی پیام جوین اجباری به "..res.." ثانیه تنظیم شد !",true)
else
Alert(msg.id,'• حداقل 5ثانیه می باشد !',true)
end
SETT(msg,chat_id,6)


elseif MenuName == 'TIMEMAXdown' then
if not base:get(TD_ID..'Flood:Time:'..chat_id) then
TIME_CHECK = 5
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Time:'..chat_id))
end
local res = TIME_CHECK - 1
if not (res < 2) then
base:set(TD_ID..'Flood:Time:'..chat_id,res)
Alert(msg.id,"• حساسیت پیام رگباری "..res.." ثانیـہ تنظیم شد !")
else
Alert(msg.id,'• حداقل حساسیت فلود 2 میباشد !',true)
end
SETT(msg,chat_id,4)

elseif MenuName == 'TIMEMAX2up' then
if not base:get(TD_ID..'Flood:Time:'..chat_id) then
TIME_CHECK = 5
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Time:'..chat_id))
end
local res = TIME_CHECK + 2
if not (res > 20) then
base:set(TD_ID..'Flood:Time:'..chat_id,res)
Alert(msg.id,"• حساسیت پیام رگباری "..res.." ثانیـہ تنظیم شد !")
else
Alert(msg.id,'حداکثر حساسیت فلود 20 میباشد !',true)
end
SETT(msg,chat_id,4)

-----
elseif MenuName == 'TIMEMAX2down' then
if not base:get(TD_ID..'Flood:Time:'..chat_id) then
TIME_CHECK = 5
else
TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Time:'..chat_id))
end
local res = TIME_CHECK - 2
if not (res < 2) then
base:set(TD_ID..'Flood:Time:'..chat_id,res)
Alert(msg.id,"• حساسیت پیام رگباری "..res.." ثانیـہ تنظیم شد !")
else
Alert(msg.id,'• حداقل حساسیت فلود 2 میباشد !',true)
end
SETT(msg,chat_id,4)
-----CHMAXup
elseif MenuName == 'CHMAXup' then
if not base:get(TD_ID..'Flood:Time:'..chat_id) then
CH_MAX = 400
else
CH_MAX = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..chat_id))
end
local res = CH_MAX + 50
if not (res > 4096) then
base:set(TD_ID..'NUM_CH_MAX:'..chat_id,res)
Alert(msg.id,"• تعداد کاراکتر هر پیام "..res.." تنظیم شد !")
else
Alert(msg.id,'حداکثر تعداد کاراکتر 4096 می باشد !',true)
end
SETT(msg,chat_id,4)

-----
elseif MenuName == 'CHMAXdown' then
if not base:get(TD_ID..'NUM_CH_MAX:'..chat_id) then
CH_MAX = 400
else
CH_MAX = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..chat_id))
end
local res = CH_MAX - 50
if not (res < 50) then
base:set(TD_ID..'NUM_CH_MAX:'..chat_id,res)
Alert(msg.id,"• تعداد کاراکتر هر پیام "..res.." تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد کاراکتر هر پیام 50 می باشد  !',true)
end
SETT(msg,chat_id,4)

elseif MenuName == 'CHMAX2up' then
if not base:get(TD_ID..'NUM_CH_MAX:'..chat_id) then
CH_MAX = 400
else
CH_MAX = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..chat_id))
end
local res = CH_MAX + 100
if not (res > 4096) then
base:set(TD_ID..'NUM_CH_MAX:'..chat_id,res)
Alert(msg.id,"• تعداد کاراکتر هر پیام "..res.." تنظیم شد !")
else
Alert(msg.id,'حداکثر حساسیت فلود 20 میباشد !',true)
end
SETT(msg,chat_id,4)

-----
elseif MenuName == 'CHMAX2down' then
if not base:get(TD_ID..'NUM_CH_MAX:'..chat_id) then
CH_MAX = 400
else
CH_MAX = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..chat_id))
end
local res = CH_MAX - 100
if not (res < 50) then
base:set(TD_ID..'NUM_CH_MAX:'..chat_id,res)
Alert(msg.id,"• تعداد کاراکتر هر پیام "..res.." تنظیم شد !")
else
Alert(msg.id,'• حداقل تعداد کاراکتر هر پیام 50 می باشد  !',true)
end
SETT(msg,chat_id,4)




------------------




--Number Card

--Source Info

--LIMIT CMD
elseif MenuName == 'limitcmd' and is_Owner(chat_id,msg.from.id) then
base:del(TD_ID..'limit_cmd'..chat_id..msg.from.id)
Limitcmd(msg,chat_id)

elseif MenuName == 'ban+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'ban') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'مسدود') then
Alert(msg.id,'• دستور مسدودکردن از قبل دردسترس می باشد!',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'ban')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'مسدود')
Alert(msg.id,'• دستور مسدود از دسترس مدیران گروہ خارج شد !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'ban-'  and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'ban') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'مسدود') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'ban')
base:srem(TD_ID..'LimitCmd:'..chat_id,'مسدود')
Alert(msg.id,'•  دستور مسدود در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور مسدودازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)
elseif MenuName == 'mute+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'mute') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'سکوت') then
Alert(msg.id,'• دستور سکوت کردن از قبل دردسترس می باشد!',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'mute')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'سکوت')
Alert(msg.id,'• دستور سکوت از دسترس مدیران گروہ خارج شد !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'mute-' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'mute') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'سکوت') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'mute')
base:srem(TD_ID..'LimitCmd:'..chat_id,'سکوت')
Alert(msg.id,'•  دستور سکوت در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور سکوت ازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)

elseif MenuName == 'cmg+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'cmgall') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی')  and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی گروه') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام ها') then
Alert(msg.id,'• دستورپاکسازی کردن از قبل دردسترس می باشد!',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'cmgall')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'پاکسازی')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'پاکسازی گروه')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام ها')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام')
Alert(msg.id,'• دستور پاکسازی کردن از دسترس مدیران گروہ خارج شد !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'cmg-' then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'cmgall') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی')  and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی گروه') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام ها') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'cmgall')
base:srem(TD_ID..'LimitCmd:'..chat_id,'پاکسازی')
base:srem(TD_ID..'LimitCmd:'..chat_id,'پاکسازی گروه')
base:srem(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام ها')
base:srem(TD_ID..'LimitCmd:'..chat_id,'پاکسازی پیام')
Alert(msg.id,'•  دستور پاکسازی کردن در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور پاکسازی کردن ازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)
elseif MenuName == 'muteall+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'muteall') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'تعطیل کردن') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'unmuteall') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'بازکردن') then
Alert(msg.id,'• دستورتعطیل کردن از قبل دردسترس می باشد!',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'muteall')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'تعطیل کردن')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'unmuteall')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'بازکردن')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'بازکردن گروه')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'قفل گروه')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'باز کردن گروه')
Alert(msg.id,'• دستور تعطیل کردن از دسترس مدیران گروہ خارج شد !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'muteall-' then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'muteall') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'تعطیل کردن') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'unmuteall') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'بازکردن') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'muteall')
base:srem(TD_ID..'LimitCmd:'..chat_id,'تعطیل کردن')
base:srem(TD_ID..'LimitCmd:'..chat_id,'unmuteall')
base:srem(TD_ID..'LimitCmd:'..chat_id,'بازکردن')
base:srem(TD_ID..'LimitCmd:'..chat_id,'قفل گروه')
base:srem(TD_ID..'LimitCmd:'..chat_id,'باز کردن گروه')
base:srem(TD_ID..'LimitCmd:'..chat_id,'بازکردن گروه')
Alert(msg.id,'•  دستور تعطیل کردن در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور تعطیل کردن ازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)



elseif MenuName == 'warn+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'warn') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'اخطار') then
Alert(msg.id,'• دستور اخطاردادن از قبل دردسترس می باشد!',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'warn')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'اخطار')
Alert(msg.id,'• دستور اخطاراز دسترس مدیران گروہ خارج شد !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'warn-' then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'warn') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'اخطار') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'warn')
base:srem(TD_ID..'LimitCmd:'..chat_id,'اخطار')
Alert(msg.id,'•  دستور اخطار در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور اخطارازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)



elseif MenuName == 'vip+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'vip') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'ویژه') then
Alert(msg.id,'• دستور ویژه کردن از قبل دردسترس می باشد!',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'vip')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'ویژه')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'مجاز')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'عضوویژه')
Alert(msg.id,'• دستور عضوویژه از دسترس مدیران گروہ خارج شد !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'vip-' then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'vip') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'ویژه') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'vip')
base:srem(TD_ID..'LimitCmd:'..chat_id,'ویژه')
base:srem(TD_ID..'LimitCmd:'..chat_id,'مجاز')
base:srem(TD_ID..'LimitCmd:'..chat_id,'عضوویژه')
Alert(msg.id,'•  دستور عضوویژه در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور عضوویژه ازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)


elseif MenuName == 'locks+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'lock') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'del') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'silent') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'kick') and
base:sismember(TD_ID..'LimitCmd:'..chat_id,'unlock') and
base:sismember(TD_ID..'LimitCmd:'..chat_id,'ddel') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dwarn') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dmute') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dsilent') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dkick') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dban') and
base:sismember(TD_ID..'LimitCmd:'..chat_id,'قفل') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'حذف') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'سایلنت') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'اخراج') then
Alert(msg.id,'• دستور تغییرات قفل هاازقبل در دسترس مدیران گروہ نمی باشد !',true)
else
base:sadd(TD_ID..'LimitCmd:'..chat_id,'lock') base:sadd(TD_ID..'LimitCmd:'..chat_id,'del') base:sadd(TD_ID..'LimitCmd:'..chat_id,'silent') base:sadd(TD_ID..'LimitCmd:'..chat_id,'kick') base:sadd(TD_ID..'LimitCmd:'..chat_id,'unlock')
base:sadd(TD_ID..'LimitCmd:'..chat_id,'ddel') base:sadd(TD_ID..'LimitCmd:'..chat_id,'dwarn') base:sadd(TD_ID..'LimitCmd:'..chat_id,'dmute') base:sadd(TD_ID..'LimitCmd:'..chat_id,'dsilent') base:sadd(TD_ID..'LimitCmd:'..chat_id,'dkick') base:sadd(TD_ID..'LimitCmd:'..chat_id,'dban') base:sadd(TD_ID..'LimitCmd:'..chat_id,'قفل') base:sadd(TD_ID..'LimitCmd:'..chat_id,'حذف') base:sadd(TD_ID..'LimitCmd:'..chat_id,'سایلنت') base:sadd(TD_ID..'LimitCmd:'..chat_id,'اخراج')
Alert(msg.id,'• دستور تغییرات قفل ها در دسترس مدیران گروہ خارج شد ! !',true)  end
Limitcmd(msg,chat_id)
elseif MenuName == 'locks-' then
if base:sismember(TD_ID..'LimitCmd:'..chat_id,'lock') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'del') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'silent') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'kick') and
base:sismember(TD_ID..'LimitCmd:'..chat_id,'unlock') and
base:sismember(TD_ID..'LimitCmd:'..chat_id,'ddel') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dwarn') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dmute') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dsilent') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dkick') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'dban') and  base:sismember(TD_ID..'LimitCmd:'..chat_id,'قفل') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'حذف') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'سایلنت') and base:sismember(TD_ID..'LimitCmd:'..chat_id,'اخراج') then
base:srem(TD_ID..'LimitCmd:'..chat_id,'lock') base:srem(TD_ID..'LimitCmd:'..chat_id,'del') base:srem(TD_ID..'LimitCmd:'..chat_id,'silent') base:srem(TD_ID..'LimitCmd:'..chat_id,'kick') base:srem(TD_ID..'LimitCmd:'..chat_id,'unlock')
base:srem(TD_ID..'LimitCmd:'..chat_id,'ddel') base:srem(TD_ID..'LimitCmd:'..chat_id,'dwarn') base:srem(TD_ID..'LimitCmd:'..chat_id,'dmute') base:srem(TD_ID..'LimitCmd:'..chat_id,'dsilent') base:srem(TD_ID..'LimitCmd:'..chat_id,'dkick') base:srem(TD_ID..'LimitCmd:'..chat_id,'dban') base:srem(TD_ID..'LimitCmd:'..chat_id,'قفل') base:srem(TD_ID..'LimitCmd:'..chat_id,'حذف') base:srem(TD_ID..'LimitCmd:'..chat_id,'سایلنت') base:srem(TD_ID..'LimitCmd:'..chat_id,'اخراج')
Alert(msg.id,'•  دستور تغییرات قفل ها در دسترس مدیران گروہ قرار گرفت !',true)
else
Alert(msg.id,'•  دستور تغییرات قفل هاازقبل در دسترس مدیران گروہ می باشد !',true)
end
Limitcmd(msg,chat_id)



elseif MenuName == 'addcmd' and is_Owner(chat_id,msg.from.id) then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:limitcmd:'..chat_id}}}
base:setex(TD_ID..'limit_cmd'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'دستور جدید را جهت محدود شدن ارسال کنید :',keyboard,true)
elseif MenuName == 'remcmd' and is_Owner(chat_id,msg.from.id) then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:limitcmd:'..chat_id}}}
base:setex(TD_ID..'limit_cmds'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'دستوری کـہ میخواهید از لیست محدودیت ها حذف شود را ارسال کنید :',keyboard,true)
elseif MenuName == 'limitcmdlist' and is_Owner(chat_id,msg.from.id) then
cmd = base:smembers(TD_ID..'LimitCmd:'..chat_id)
text = 'لیست دستورات محدود شدہ :\n'
for k,v in pairs(cmd) do
text = text..k..' - *'..v..'*\n'
end
if #cmd == 0 then
text = 'لیست دستورات محدود شدہ خالی میباشد'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:limitcmd:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanlimitcmdlist:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:limitcmd:'..chat_id}}}
Edit(msg,text,keyboard,true)
end
elseif MenuName == 'cleanlimitcmdlist' and is_Owner(chat_id,msg.from.id) then
text = [[*لیست محدودیت دستورات پاکسازی شد*]]
base:del(TD_ID..'LimitCmd:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:limitcmd:'..chat_id}}}
Edit(msg,text,keyboard,true)
--LIMITPM


--CBM
elseif MenuName == 'cbm' and is_Owner(chat_id,msg.from.id) then
Cbm(msg,chat_id)
elseif MenuName == 'cbm+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'cbmon') then
Alert(msg.id,'پاکسازی پیام های ربات از قبل #فعال بود!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'cbmon')
Alert(msg.id,'> پاکسازی پیام های ربات #فعال شد...!',true)
end
Cbm(msg,chat_id)
elseif MenuName == 'cbm-' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'cbmon') then
base:srem(TD_ID..'Gp2:'..chat_id,'cbmon')
Alert(msg.id,'> پاکسازی پیام های ربات #غیرفعال شد..!',true)
else
Alert(msg.id,'پاکسازی پیام های ربات از قبل #غیرفعال بود!',true)
end
Cbm(msg,chat_id)
--timecgms
elseif MenuName == 'timecgmsMAXup' and is_Owner(chat_id,msg.from.id) then
if tonumber(MAX) == 1000 then
Alert(msg.id,'حداکثر زمانی تنظیمی 1000ثانیـہ می باشد!',true)
else
MAX = (base:get(TD_ID..'cbmtime:'..chat_id) or 10)
MAX= tonumber(MAX) + 2
Alert(msg.id,MAX)
base:set(TD_ID..'cbmtime:'..chat_id,MAX)
end
Cbm(msg,chat_id)
elseif MenuName == 'timecgmsMAXdown' and is_Owner(chat_id,msg.from.id) then
if tonumber(TIME) == 10 then
Alert(msg.id,'حداقل زمان تنظیمی 10 ثانیـہ می باشد!',true)
else
TIME = (base:get(TD_ID..'cbmtime:'..chat_id) or 10)
TIME = tonumber(TIME) - 2
Alert(msg.id,TIME)
base:set(TD_ID..'cbmtime:'..chat_id,TIME)
end
Cbm(msg,chat_id)

--FilterList
elseif MenuName == 'filterpanel' then
base:del(TD_ID..'limit_filter'..chat_id..msg.from.id,60,msg)
filters(msg,chat_id)


elseif MenuName == 'filterstickerlist' then
local packlist = base:smembers(TD_ID.."filterpackname"..chat_id)
text = "لیست استیکرهای قفل شده:\n"
for k,v in pairs(packlist) do
text = text..k.." - t.me/addstickers/"..v.." \n"
end
if #packlist == 0 then
text = "• لیست استیکر ها خالی می باشد!"
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanStickerFilters:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:filterpanel:'..chat_id}}}
Edit(msg,text,keyboard,true)
end

elseif MenuName == 'filteraddlist' then
Filters = base:smembers(TD_ID..'Filtersjoin:'..chat_id)
text = 'لیست کلمات جوین فیلتر ها :\n'
for k,v in pairs(Filters) do
text = text..k..' - *'..v..'*\n'
end
if #Filters == 0 then
text = 'لیست جوین فیلتر خالی میباشد'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanFiltersadd:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:Forcejoin:'..chat_id}}}
Edit(msg,text,keyboard,true)
end

elseif MenuName == 'filternamelist' then
Filters = base:smembers(TD_ID..'FilterName:'..chat_id)
text = 'لیست اسامی نام های غیرمجاز :\n'
for k,v in pairs(Filters) do
text = text..k..' - *'..v..'*\n'
end
if #Filters == 0 then
text = 'لیست فیلتر نام کاربر خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanFiltersnname:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
Edit(msg,text,keyboard,true)
end

elseif MenuName == 'filterbiolist' then
Filters = base:smembers(TD_ID..'FilterBio:'..chat_id)
text = 'لیست اسامی بیوگرافی های غیر مجاز:\n'
for k,v in pairs(Filters) do
text = text..k..' - *'..v..'*\n'
end
if #Filters == 0 then
text = 'لیست بیوگرافی غیرمجاز کاربر خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanFiltersnbio:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
Edit(msg,text,keyboard,true)
end

elseif MenuName == 'filterjoinlist' then
Filters = base:smembers(TD_ID..'Filtersjoin:'..chat_id)
text = 'لیست کلمات جوین فیلتر ها :\n'
for k,v in pairs(Filters) do
text = text..k..' - *'..v..'*\n'
end
if #Filters == 0 then
text = 'لیست جوین فیلتر خالی میباشد'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanFiltersjoin:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:Forcejoin:'..chat_id}}}
Edit(msg,text,keyboard,true)
end

elseif MenuName == 'filterlist' then
Filters = base:smembers(TD_ID..'Filters:'..chat_id)
text = 'لیست کلمات فیلتر گروہ :\n'
for k,v in pairs(Filters) do
text = text..k..' - *'..v..'*\n'
end
if #Filters == 0 then
text = 'لیست فیلتر خالی میباشد'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
Edit(msg,text,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanFilters:'..chat_id},
{text = 'بازگشت ◂', callback_data = 'Ramin:filterpanel:'..chat_id}}}
Edit(msg,text,keyboard,true)
end

elseif MenuName == 'cleanFilters' then
text = [[*لیست کلمات فیلتر شدہ پاکسازی شد*]]
base:del(TD_ID..'Filters:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'filter+' then
if base:sismember(TD_ID..'Gp2:'..chat_id,'FilterSen') then
Alert(msg.id,'✪ حساسیت فیلتر در حالت  ضعیف تنظیم شد!',true)
base:srem(TD_ID..'Gp2:'..chat_id,'FilterSen')
else
base:sadd(TD_ID..'Gp2:'..chat_id,'FilterSen')
Alert(msg.id,'✪ حساسیت فیلتر در حالت  قوی تنظیم شد!',true)
end
filters(msg,chat_id)

elseif MenuName == 'cleanStickerFilters' then
text = [[*پک استیکر فیلتر شدہ ها پاکسازی شد.*]]
base:del(TD_ID..'filterpackname:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'cleanFiltersadd' then
text = [[*لیست کلمات اداجباری فیلتر شدہ پاکسازی شد*]]
base:del(TD_ID..'Filtersjoin:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..chat_id}}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'cleanFiltersnname' then
text = [[*لیست فیلتر نام کاربر ها پاکسازی شد!*]]
base:del(TD_ID..'FilterName:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'cleanFiltersnbio' then
text = [[*لیست فیلتر بیوگرافی کاربر ها پاکسازی شد!*]]
base:del(TD_ID..'FilterBio:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
Edit(msg,text,keyboard,true)

elseif MenuName == 'addstickerfilter' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
base:setex(TD_ID..'limit_filtersticker'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کاربر عزیز استیکر جدید را برای فیلترینگ ارسال کنید :',keyboard,true)

elseif MenuName == 'SetStartPin' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'نمایش پیام سنجاقی',callback_data = 'Ramin:SetPinDisplay:'..chat_id},
},{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..chat_id}}}
base:setex(TD_ID..'limit_SetStartPin'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
dofile('./Alpha/time.lua')
Edit(msg,'• لطفا زمان ساعتی پیام سنجاق شده توسط ربات را ارسال کنید!\nبه طور مثال :\n02:00-06:00\n\n • ساعت الان : *'..Alphaee(hor)..'*:*'..Alphaee(dag)..'*:*'..Alphaee(sec)..'*',keyboard,true)

elseif MenuName == 'SetStartAuto' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..chat_id}}}
base:setex(TD_ID..'limit_SetStartAuto'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
dofile('./Alpha/time.lua')
Edit(msg,'• لطفا زمان ساعتی قفل خودکار را ارسال کنید\n• به طور مثال :\n02:00-06:00\n\n • ساعت الان : *'..Alphaee(hor)..'*:*'..Alphaee(dag)..'*:*'..Alphaee(sec)..'*',keyboard,true)
elseif MenuName == 'SetStartCl' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:cleanpanel:'..chat_id}}}
base:setex(TD_ID..'limit_SetStartCl'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
dofile('./Alpha/time.lua')
Edit(msg,'• لطفا زمان ساعتی  پاکسازی کلی پیام ها را ارسال کنید!\nبه طور مثال :\n02:00\n\n • ساعت الان : *'..Alphaee(hor)..'*:*'..Alphaee(dag)..'*:*'..Alphaee(sec)..'*',keyboard,true)

elseif MenuName == 'SetMsgPin' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'نمایش پیام سنجاقی',callback_data = 'Ramin:SetPinDisplay:'..chat_id},
},{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..chat_id}}}
base:setex(TD_ID..'limit_SetMsgPin'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'لطفا پیامی رو که می خواهید سنجاق شود را ارسال کنید :',keyboard,true)


elseif MenuName == 'addfilteradd' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..chat_id}}}
base:setex(TD_ID..'limit_filteradd'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کلمه جدید را جهت فیلتراجباری ارسال کنید :',keyboard,true)
elseif MenuName == 'remfilteradd' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..chat_id}}}
base:setex(TD_ID..'limit_filteradd'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کلمه ای که می خواهید در فیلتراجباری نباشد را ارسال کنید :',keyboard,true)


elseif MenuName == 'addfilname' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
base:setex(TD_ID..'limit_filname'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,' نام کاربر جهت تایید شدن تبچی توسط ادمین ها ارسال کنید:',keyboard,true)
elseif MenuName == 'remaddfilname' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
base:setex(TD_ID..'limit_filtername'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'نام کاربری که می خواهی در لیست تایید شدن تبچی توسط ادمین قرار نگیرد را ارسال کنید :',keyboard,true)

---------------editsudo----------------------
elseif MenuName == 'editsudo' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:editlo:'..chat_id}}}
base:setex(TD_ID..'limit_editsudo'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'⚡️ کاربر عزیز برای انجام ویرایش دستور [افزودن سودو] خواهشمند است طبق روش زیر انجام دهید :\n🔹 متن پیش فرض ربات  \n\n◆ کاربر *User* سودو شد.\n\n ◆ به عنوان مثال : کاربر user قبلان در لیست سودو می باشد. ',keyboard,true)

elseif MenuName == 'editsudo1' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:editlo:'..chat_id}}}
base:setex(TD_ID..'limit_editsudo1'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'◈ کاربر عزیز برای انجام بازگشت ویرایش دستور [افزودن سودو] خواهشمند است طبق روش زیر انجام دهید :\n🔹 متن پیش فرض ربات \n◆ کاربر *User* سودو می باشد.\n\n ◆ به عنوان مثال : کاربر user به لیست سودو اضافه شد. ',keyboard,true)
---------------editsudorem----------------------
elseif MenuName == 'editsudorem' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:editlorem:'..chat_id}}}
base:setex(TD_ID..'limit_editsudorem'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'⚡️ کاربر عزیز برای انجام ویرایش دستور [حذف سودو] خواهشمند است طبق روش زیر انجام دهید :\n🔹 متن پیش فرض ربات  \n\n◆ کاربر *User* ازسودو ربات عزل شد.\n\n ◆ به عنوان مثال : کاربر user از لیست سودوها حذف شد. ',keyboard,true)

elseif MenuName == 'editsudorem1' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:editlorem:'..chat_id}}}
base:setex(TD_ID..'limit_editsudorem1'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'◈ کاربر عزیز برای انجام بازگشت ویرایش دستور [حذف سودو] خواهشمند است طبق روش زیر انجام دهید :\n🔹 متن پیش فرض ربات \n◆ کاربر *User* سودو نمی باشد.\n\n ◆ به عنوان مثال : کاربر user درلیست سودو ها نمی باشد. ',keyboard,true)

elseif MenuName == 'editsudoreset' then
base:del(TD_ID..'Text:editsudo1:')
base:del(TD_ID..'Text:editsudo:')
base:del(TD_ID..'Text:editsudorem1:')
base:del(TD_ID..'Text:editsudorem:')
Alert(msg.id,'پاسخگویی ویرایش دستور سودو ریست شد.',true)

----------------------------------------------




elseif MenuName == 'addfiltername' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
base:setex(TD_ID..'limit_filtername'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'اسم غیرمجاز کاربر مورد نظر جهت فیلتر ارسال کنید:',keyboard,true)
elseif MenuName == 'remfiltername' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
base:setex(TD_ID..'limit_filtername'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'اسمی که نمی خواهید در فیلتر اسم غیرمجاز نباشد رو ارسال کنید :',keyboard,true)

elseif MenuName == 'addfilterbio' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
base:setex(TD_ID..'limit_filterbio'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'بیوگرافی غیرمجاز کاربر مورد نظر جهت فیلتر ارسال کنید:',keyboard,true)
elseif MenuName == 'remfiltername' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:AntiTabchipn2:'..chat_id}}}
base:setex(TD_ID..'limit_filterbio'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'بیوگرافی که نمی خواهید در فیلتر اسم غیرمجاز نباشد رو ارسال کنید :',keyboard,true)


elseif MenuName == 'SetWelcomeText' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Wlc:'..chat_id}}}
base:setex(TD_ID..'limit_WelcomeText'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'❗️توجه کنید\nلظفا متن تنظیم شده خوش آمدگویی رو ارسال کنید تا به صورت خودکار تنظیم شود شما یک دقیقه فرصت دارید! \n⍻ شما میتوانید در متن خوش امد گویی از عبارات زیر استفاده کنید\n\n FIRSTNAMEMAN >> نام کاربر به صورت منشن \n☐ FIRSTNAME >> نام کاربر به صورت ساده\n☐ LASTNAME >> نام خانوادگی کاربر\n☐ USERNAME >> یوزرنیم کاربر\n☐ RULES >>  قوانین\n☐ GROUP >> نام گروه\n☐ MEMBER >> تعداد ممبرها\n☐ DATE >> تاریخ امروز\n☐ TIME >> ساعت\n\nبه عنوان مثال :\n سلام FIRSTNAMEMAN یه گروه GROUP خوش آمدی!\nزمان : TIME\n\n',keyboard,true)



elseif MenuName == 'addfilterjoin' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..chat_id}}}
base:setex(TD_ID..'limit_filterjoin'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کلمه جدید را جهت فیلترجوین ارسال کنید :',keyboard,true)
elseif MenuName == 'remfilterjoin' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forcejoin:'..chat_id}}}
base:setex(TD_ID..'limit_filterjoin'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کلمه ای که می خواهید در فیلترجوین نباشد را ارسال کنید :',keyboard,true)


elseif MenuName == 'addfilter' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
base:setex(TD_ID..'limit_filter'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کلمه جدید را جهت فیلتر شدن ارسال کنید :',keyboard,true)
elseif MenuName == 'remfilter' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:filterpanel:'..chat_id}}}
base:setex(TD_ID..'limit_filters'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'کلمه کـہ میخواهید از لیست فیلتر حذف شود را ارسال کنید :',keyboard,true)



elseif MenuName == 'forcelist' and is_Owner(chat_id,msg.from.id) then
local list = base:smembers(TD_ID..'VipAdd:'..chat_id)
local t = 'لیست ویژـہ اداجباری :\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
t = t..k..'-『['..v..'](tg://user?id='..v..')』\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
end
if #list == 0 then
t = 'لیست ویژـہ اداجباری خالی میباشد...!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..chat_id}}}
Edit(msg,t..'\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\nجهت معاف کردن افراد ازدستور \n\nsetvipadd [username or userid]\nیا\nمعاف [یوزرنیم کاربر یا ایدی عددی کاربر]\nاستفادہ کنید',keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleanforcelist:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..chat_id}}}
Edit(msg,t,keyboard,true)
end
elseif MenuName == 'cleanforcelist' and is_Owner(chat_id,msg.from.id) then
t = [[*لیست ویژـہ  پاکسازی شد*]]
base:del(TD_ID..'VipAdd:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Forceadd:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'alluser+' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'NewUser') then
base:srem(TD_ID..'Gp2:'..chat_id,'NewUser')
Alert(msg.id,'وضعیت افزودن اجباری کاربران جدید فعال شد!',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'NewUser')
Alert(msg.id,'وضعیت افزودن اجباری برهمه کاربرها فعال شد!',true)
end
SETT(msg,chat_id,6)

--OwnerList


elseif MenuName == 'ownerlist' then
list =  base:smembers(TD_ID..'OwnerList:'..chat_id)
t = '`لیست مالکین گروه :`\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
username = base:get(TD_ID..'FirstName:'..v)
if username then
t = t..k..'-👤نام کاربر:['..username..'](tg://user?id='..v..')\nایدی کاربر:`'..v..'`\n┅┅┅┅┅┅┅┅\n'
else
t = t..k..'-['..v..'](tg://user?id='..v..')\n┅┅┅┅┅┅┅┅\n'
end
end
if #list == 0 then
t = '`لیست مالکین گروه خالی می باشد.`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '» پاک کردن',callback_data = 'Ramin:cleanmodlist:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
end


--VipList

elseif MenuName == 'viplist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:viplist:'..chat_id
end
list = base:smembers(TD_ID..'Vip:'..chat_id)
t = '☟ لیست کاربران  ویژه گروه (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n'
end
end
if #list == 0 then
t = '» هیچ کاربری در این گروه ویژه نشده است!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanViplist:'..chat_id},
},{
{text = 'بازگشت ◂ ', callback_data = mssss}}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:viplist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanViplist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'viplist1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers(TD_ID..'Vip:'..chat_id)
t = '☟ لیست کاربران  ویژه شده (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanViplist:'..chat_id},
},{
{text = 'بازگشت ◂', callback_data = 'Ramin:viplist:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:viplist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:viplist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanViplist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end


elseif MenuName == 'cleanViplist' then
t = [[`لیست ویژه` *پاکسازی شد*]]
base:del(TD_ID..'Vip:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)



--ModList
elseif MenuName == 'modlist' then
list =  base:smembers(TD_ID..'ModList:'..chat_id)
t = '`لیست مدیران گروہ :`\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
username = base:get(TD_ID..'FirstName:'..v)
if username then
t = t..k..'-👤نام کاربر:['..username..'](tg://user?id='..v..')\nایدی کاربر:`'..v..'`\n┅┅┅┅┅┅┅┅\n'
else
t = t..k..'-['..v..'](tg://user?id='..v..')\n┅┅┅┅┅┅┅┅\n'
end
end
if #list == 0 then
t = '`لیست مدیران گروہ خالی میباشد.`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '» پاک کردن',callback_data = 'Ramin:cleanmodlist:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
end
elseif MenuName == 'modlisttest' then
list =  base:smembers(TD_ID..'ModListtest:'..chat_id)
t = '`لیست مدیران افتخاری گروه :`\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
username = base:get(TD_ID..'FirstName:'..v)
if username then
t = t..k..'-👤نام کاربر:['..username..'](tg://user?id='..v..')\nایدی کاربر:`'..v..'`\n┅┅┅┅┅┅┅┅\n'
else
t = t..k..'-['..v..'](tg://user?id='..v..')\n┅┅┅┅┅┅┅┅\n'
end
end
if #list == 0 then
t = '`لیست مدیران افتخاری گروه خالی می باشد.`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '» پاک کردن',callback_data = 'Ramin:cleanmodtestlist:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'MahdodLock' then
local t = '`لیست محدود شدگان قفلی `:\n`برای رفع محدودیت هر کاربر بر روی متن جلوی >  کلیک کردہ و ان را ارسال کنید!`\n\n'
local mrr619 = base:smembers(TD_ID..'Gp3:'..chat_id)
for k,v in pairs(mrr619) do
local list = v:match('^(%d+)')
Name = base:get(TD_ID..'FirstName:'..list) or 'بدون نام'
t = t..k..'-┊㋛['..v..'](tg://user?id='..list..')┊\n['..Name..']\n»`رهایی '..v..'`\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
end
if #mrr619 == 0 then
t = '✭ لیست محدود شدگان قفلی درسیستم خالی می باشد.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '» پاک کردن',callback_data = 'Ramin:cleanMahdodLock:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
end
elseif MenuName == 'cleanMahdodLock' then
t = [[لیست محدودشدگان پاکسازی شد...!]]
base:del(TD_ID..'Gp3:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)

--BanList
elseif MenuName == 'banall' then
local list = base:smembers(TD_ID..'GlobalyBanned:')

t = '`لیست مسدود آل شدہ ها :`\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
username = base:get(TD_ID..'FirstName:'..v)
if username then
t = t..k..'-👤نام کاربر:['..username..'](tg://user?id='..v..')\nایدی کاربر:`'..v..'`\n┅┅┅┅┅┅┅┅\n'
else
t = t..k..'-['..v..'](tg://user?id='..v..')\n┅┅┅┅┅┅┅┅\n'
end
end
if #list == 0 then
t = '`لیست مسدود ال شدہ ها خالی می باشد.`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:raminsudo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '» پاک کردن',callback_data = 'Ramin:cleanbanalllist:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:raminsudo:'..chat_id}}}
Edit(msg,t,keyboard,true)
end
--Mutelist
elseif MenuName == 'mutelist' then
list = base:smembers(TD_ID..'MuteList:'..chat_id)
t = 'لیست کاربران محدودشدہ :\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
t = t..k..'-『['..v..'](tg://user?id='..v..')』\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
end
if #list == 0 then
t = 'لیست محدودشدگان خالی میباشد'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'پاک کردن',callback_data = 'Ramin:cleansilentlist:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
end
-----------------

elseif MenuName == 'IDlist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:silentlist:'..chat_id
end
list = base:smembers('ID:')
num = base:scard('ID:')
t = '☟ لیست کاربران  ربات (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* کاربر \n\n'
silntlstt = silntlst * 20
for k,v in pairs(list) do
if (k > silntlstt - 20) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'

t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list == 0 then
t = '» لیست کاربران ربات خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id}
}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:IDlist1:'..chat_id}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'IDlist1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers('ID:')
num = base:scard('ID:')
t = '☟ لیست کاربران  ربات (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* کاربر \n\n'
silntlstt = silntlst * 20
for k,v in pairs(list) do
if (k > silntlstt - 20) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:IDlist:'..chat_id}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:IDlist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:IDlist1:'..chat_id}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
end



---------------------
elseif MenuName == 'tabchilist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:silentlist:'..chat_id
end
list = base:smembers(TD_ID..'AGTMute:')
num = base:scard(TD_ID..'AGTMute:')
t = '☟ لیست کاربران  تبچی ها (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* تبچی \n\n'
silntlstt = silntlst * 20
for k,v in pairs(list) do
if (k > silntlstt - 20) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'

t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list == 0 then
t = '» لیست تبچی خالی می باشد!'
local keyboard = {}
keyboard.inline_keyboard = {{
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..msg.chat.id}
}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:tabchilist1:'..chat_id}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'tabchilist1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers(TD_ID..'AGTMute:')
num = base:scard(TD_ID..'AGTMute:')
t = '☟ لیست کاربران  تبچی ها (صفحه '..silntlst..'):\nآمارشناسایی شده تا الان :*'..num..'* تبچی \n\n'
silntlstt = silntlst * 20
for k,v in pairs(list) do
if (k > silntlstt - 20) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - *'..v..'*\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:tabchilist:'..chat_id}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:tabchilist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:tabchilist1:'..chat_id}
},{{text= '⊴ بستن',callback_data = 'Ramin:Exhlp:'..chat_id}
}}
Edit(msg,t,keyboard,true)
end

--SilentList1


elseif MenuName == 'silentlist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:silentlist:'..chat_id
end
list = base:smembers(TD_ID..'MuteList:'..chat_id)
t = '☟ لیست کاربران  سکوت شده (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'daymute:'..chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n('..d..')\n'
end
end
if #list == 0 then
t = '» هیچ کاربری در این گروه سکوت نشده است!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentlist:'..chat_id},
},{
{text = 'بازگشت ◂ ', callback_data = mssss}}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:silentlist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'silentlist1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers(TD_ID..'MuteList:'..chat_id)
t = '☟ لیست کاربران  سکوت شده (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'daymute:'..chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n('..d..')\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentlist:'..chat_id},
},{
{text = 'بازگشت ◂', callback_data = 'Ramin:silentlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:silentlist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:silentlist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end



elseif MenuName == 'silentlistmedia' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:silentlist:'..chat_id
end
list = base:smembers(TD_ID..'MuteMediaList:'..chat_id)
t = '☟ لیست کاربران  سکوت رسانه (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'daymute:'..chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n('..d..')\n'
end
end
if #list == 0 then
t = '» هیچ کاربری در این گروه سکوت رسانه نشده است!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentmedialist:'..chat_id},
},{
{text = 'بازگشت ◂ ', callback_data = mssss}}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:silentlistmedia1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentmedialist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'silentlistmedia1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers(TD_ID..'MuteMediaList:'..chat_id)
t = '☟ لیست کاربران  سکوت شده (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
local day = base:get(TD_ID..'daymute:'..chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n('..d..')\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentmedialist:'..chat_id},
},{
{text = 'بازگشت ◂', callback_data = 'Ramin:silentlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:silentlistmedia:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:silentlistmedia1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleansilentmedialist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end
--Group Link







elseif MenuName == 'Deletelink' then
local url  = https.request(BASSE .. '/getChatMember?chat_id='..chat_id..'&user_id='..BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' then
if exportChatInviteLink(chat_id) then
link = exportChatInviteLink(chat_id).result
text = 'لینک جدید ساختـہ شد\n'..link
base:set(TD_ID..'Link:'..chat_id,link)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'ورود بـہ منو ⫸',callback_data = 'Ramin:dasrasi:'..chat_id}}}
EdiT(msg,text,keyboard,true)
end
else
Alert(msg.id,'ربات بـہ قسمت باطل کردن لینک دسرسی ندارد',true)
end
elseif MenuName == 'Setlink' then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:GroupLink:'..chat_id}}}
base:setex(TD_ID..'links'..chat_id..msg.from.id,60,tonumber(msg.message.message_id))
Edit(msg,'جهت ثبت لینک گروه\nلینک گروہ خود را ارسال کنید:',keyboard,true)
elseif MenuName == 'Deletelink' then
local url  = https.request(BASSE .. '/getChatMember?chat_id='..chat_id..'&user_id='..BotJoiner)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' then
if exportChatInviteLink(chat_id) then
link = exportChatInviteLink(chat_id).result
text = 'لینک جدید ساختـہ شد\n'..link
base:set(TD_ID..'Link:'..chat_id,link)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:dasrasi:'..chat_id}}}
EdiT(msg,text,keyboard,true)
end
else
Alert(msg.id,'ربات بـہ قسمت باطل کردن لینک دسرسی ندارد',true)
end
--Rules
elseif MenuName == 'GroupRules' then
rules = base:get(TD_ID..'Rules:'..chat_id) or '*قوانین گروہ ثبت نشدہ است*'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• حذف قوانین •',callback_data = 'Ramin:Delrules:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:dasrasi:'..chat_id}}}
Edit(msg,rules,keyboard,true)
elseif MenuName == 'Delrules' then
base:del(TD_ID..'Rules:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:dasrasi:'..chat_id}}}
Edit(msg,'*قوانین گروہ حذف شد*',keyboard,true)



elseif MenuName == 'SetPinDisplay' then
MsgPin = base:get(TD_ID..'MsgPin:'..chat_id) or '*هیچ متنی برای سنجاق خودکار تنظیم نشده است*'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• حذف پیام سنجاق •',callback_data = 'Ramin:DelPinDisplay:'..chat_id},
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..chat_id}}}
Edit(msg,'`'..MsgPin..'`',keyboard,true)
elseif MenuName == 'DelPinDisplay' then
base:del(TD_ID..'MsgPin:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:lockauto:'..chat_id}}}
Edit(msg,'*پیام سنجاق خودکار با موفقیت از سیستم ربات حذف شد.*',keyboard,true)


---banlist
elseif MenuName == 'banlist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:banlist:'..chat_id
end
list = base:smembers(TD_ID..'BanUser:'..chat_id)
t = '☟ لیست کاربران  مسدود (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
t = t..''..k..'-['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n'
end
end
if #list == 0 then
t = '◂ هیچ کاربری در این گروه مسدود نشده است!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanbanlist:'..chat_id},
},{
{text = 'بازگشت ◂ ', callback_data = mssss}}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:banlist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanbanlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'banlist1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:smembers(TD_ID..'BanUser:'..chat_id)
t = '☟ لیست کاربران  مسدود (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'

t = t..''..k..'-['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanbanlist:'..chat_id},
},{
{text = 'بازگشت ◂', callback_data = 'Ramin:banlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:banlist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:banlist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanbanlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

--WarnList


elseif MenuName == 'gplist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:Exhlp:'..chat_id
else
mssss = 'Ramin:Exhlp:'..chat_id
end
list = base:smembers(TD_ID..'group:')
t = '☟ لیست وضعیت گروه های نصب شده تا الان(صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 5
for k,v in pairs(list) do
GroupsName = base:get(TD_ID..'StatsGpByName'..v) or 'حذف شده'
links = base:get(TD_ID..'Link:'..v)
if links then
link = links
else
link = LinkSuppoRt
end
expire = base:ttl(TD_ID..'ExpireData:'..v)
if expire == -1 then
lang = base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
if lang then
EXPIRE = 'Unlimited'
else
EXPIRE = '🌀 شارژ مادالعمر'
end
else
d = math.floor(expire/day ) + 1
if lang then
EXPIRE = ''..d..' Day'
else
EXPIRE = '🗓 '..d..' روز'
end
end
if (k > silntlstt - 6) and (k < silntlstt + 1) then

t = t..'🄾نام گروه :`'..GroupsName..'`\n🆔 *'..v..'*\n🅸:*'..EXPIRE..'* اعتبار\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
end
end
if #list == 0 then
t = '◂ هیچ گروهی درسیستم ربات ثبت نشده است!'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂',callback_data = 'Ramin:Exhlp:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂ ', callback_data = mssss}}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:gplist2:'..chat_id}}}
Edit(msg,t,keyboard,true)
end


elseif MenuName == 'gplist2' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end

list = base:smembers(TD_ID..'group:')
t = '☟ لیست وضعیت گروه های نصب شده تا الان(صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 5
for k,v in pairs(list) do
GroupsName = base:get(TD_ID..'StatsGpByName'..v) or 'حذف شده'
links = base:get(TD_ID..'Link:'..v)
if links then
link = links
else
link = LinkSuppoRt
end

expire = base:ttl(TD_ID..'ExpireData:'..v)
if expire == -1 then
lang = base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
if lang then
EXPIRE = 'Unlimited'
else
EXPIRE = '🌀 شارژ مادالعمر'
end
else
d = math.floor(expire/day ) + 1
if lang then
EXPIRE = ''..d..' Day'
else
EXPIRE = '🗓 '..d..' روز'
end
end
if (k > silntlstt - 6) and (k < silntlstt + 1) then

t = t..'🄾نام گروه :`'..GroupsName..'`\n🆔 *'..v..'*\n🅸:*'..EXPIRE..'* اعتبار\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
end
end

if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بستن ◂', callback_data = 'Ramin:Exhlp:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:gplist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:gplist2:'..chat_id}
},{
{text = 'بستن ◂', callback_data = 'Ramin:Exhlp:'..chat_id}}}
Edit(msg,t,keyboard,true)
end




elseif MenuName == 'warnlist' then
local silntlst = tonumber(base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)) or 1
if silntlst and silntlst > 1 then
silntlst = silntlst - 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
end
if silntlst < 2 then
mssss = 'Ramin:groupinfo:'..chat_id
else
mssss = 'Ramin:warnlist:'..chat_id
end
list = base:hkeys(TD_ID..chat_id..':warn')
t = '☟ لیست کاربران  اخطار (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
cont = base:hget(TD_ID..chat_id..':warn',v)
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'

if not base:get(TD_ID..'Warn:Max:'..chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..chat_id)
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n✧تعداد اخطار :*'..(cont - 1)..'*از'..warn..'\n'
end
end
if #list == 0 then
t = 'لیست اخطار ها خالی می باشد.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanwarnlist:'..chat_id},
},{
{text = 'بازگشت ◂ ', callback_data = mssss}}}
Edit(msg,t,keyboard,true)
elseif #list > silntlstt then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ', callback_data = mssss},
{text = '≼ بعدی  ', callback_data = 'Ramin:warnlist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanwarnlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'warnlist1' then
silntlst = base:get(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id)
if silntlst then
silntlst = silntlst + 1
base:setex(TD_ID.."sillist:" .. msg.message.message_id .. ":" .. chat_id, 500, silntlst)
else
silntlst = 2
end
list = base:hkeys(TD_ID..chat_id..':warn')

t = '☟ لیست کاربران  اخطار (صفحه '..silntlst..'):\n\n'
silntlstt = silntlst * 30
for k,v in pairs(list) do
if (k > silntlstt - 30) and (k < silntlstt + 1) then
cont = base:hget(TD_ID..chat_id..':warn',v)
local username = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
if not base:get(TD_ID..'Warn:Max:'..chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..chat_id)
end
t = t..'ᴥ ['..username..'](tg://user?id='..v..') - ['..v..'](tg://user?id='..v..')\n✧تعداد اخطار :*'..(cont - 1)..'*از'..warn..'\n'
end
end
if #list < silntlstt + 1 then
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanwarnlist:'..chat_id},
},{
{text = 'بازگشت ◂', callback_data = 'Ramin:warnlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'قبلی ≽ ', callback_data = 'Ramin:warnlist:'..chat_id},
{text = '≼ بعدی ', callback_data = 'Ramin:warnlist1:'..chat_id}
},{
{text = '🗑 پاک کردن',callback_data = 'Ramin:cleanwarnlist:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'actevemodcmd' then
local ban =  base:zrevrange(TD_ID..'bot:ban:'..chat_id..':', 0, 2, 'withscores')
local vip =  base:zrevrange(TD_ID..'bot:vip:'..chat_id..':', 0, 2, 'withscores')
local vipjoin =  base:zrevrange(TD_ID..'bot:vipjoin:'..chat_id..':', 0, 2, 'withscores')
local unban =  base:zrevrange(TD_ID..'bot:unban:'..chat_id..':', 0, 2, 'withscores')
local mute =  base:zrevrange(TD_ID..'bot:mute:'..chat_id..':', 0, 2, 'withscores')
local unmute =  base:zrevrange(TD_ID..'bot:unmute:'..chat_id..':', 0, 2, 'withscores')
local warn =  base:zrevrange(TD_ID..'bot:warn:'..chat_id..':', 0, 2, 'withscores')
local unwarn =  base:zrevrange(TD_ID..'bot:unwarn:'..chat_id..':', 0, 2, 'withscores')
local kick =  base:zrevrange(TD_ID..'bot:kick:'..chat_id..':', 0, 2, 'withscores')
local Tab =  base:zrevrange(TD_ID..'bot:Tab:'..chat_id..':', 0, 2, 'withscores')
local clean =  base:zrevrange(TD_ID..'bot:clean:'..chat_id..':', 0, 2, 'withscores')
local stats = base:zrevrange(TD_ID..'bot:msgusr2:'..chat_id..':', 0, 4, 'withscores')
KickUser = base:get(TD_ID..'Total:KickUser:'..chat_id..'') or 0
BanUser = base:get(TD_ID..'Total:BanUser:'..chat_id..'') or 0
WarnUser = base:get(TD_ID..'Total:WarnUser:'..chat_id..'') or 0
MuteUser = base:get(TD_ID..'Total:MuteUser:'..chat_id..'') or 0
TabUser = base:get(TD_ID..'Total:TabUser:'..chat_id..'') or 0
VipUser = base:get(TD_ID..'Total:VipUser:'..chat_id..'') or 0
JoinUser = base:get(TD_ID..'Total:JoinUser:'..chat_id..'') or 0
CleanUser = base:get(TD_ID..'Total:CleanUser:'..chat_id..'') or 0
dofile('./Alpha/time.lua')
stattextss = '✭ آمار استفاده شده از دستورات ربات تا الان ✭ \n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n◂ فعالترین کاربران از نظر دستورات به ترتیب زیر می باشد : \n\n'
for k, v in pairs(ban) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n⛔️ نفرات برتر دستور مسدود : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end

for k, v in pairs(unban) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n❌ نفرات برتر دستور حذف مسدود : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end

for k, v in pairs(mute) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n📵 نفرات برتر دستور سکوت : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end

for k, v in pairs(unmute) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n⭕️ نفرات برتر دستور حذف سکوت :\n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end

for k, v in pairs(warn) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n⚠️ نفرات برتر دستور اخطار :\n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end


for k, v in pairs(unwarn) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n♻️ نفرات برتر دستور حذف اخطار : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end

for k, v in pairs(kick) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🚷 نفرات برتر دستور اخراج: \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end

for k, v in pairs(Tab) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🏵 نفرات برتر دستور تبچی : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end
for k, v in pairs(vip) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n❇️ نفرات برتر دستور عضوویژه : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end
for k, v in pairs(vipjoin) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n💹 نفرات برتر دستور معاف اجباری : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end
for k, v in pairs(clean) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🗑 نفرات برتر دستور پاکسازی پیام : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " بار \n"
end
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n◂ تعداد کل دستورات مسدودیت : *" ..BanUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل دستور سکوت : *" ..MuteUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل دستور اخطار : *" ..WarnUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل دستور اخراج : *" ..KickUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل دستور تبچی : *" ..TabUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل دستور عضوویژه : *" ..VipUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل دستور معاف شده : *" ..JoinUser.. "* عدد"
stattextss = stattextss .. "\n◂ تعداد کل پاکسازی پیام : *" ..CleanUser.. "* عدد"
if #stats == 0 then
t = '`فعلا هیچ دستوری توسط کاربران در این گروه ارسال نشده است ◂`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ',callback_data = 'Ramin:statsmem:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '❎ ریست آمار دستورات',callback_data = 'Ramin:cleanactevememcmd:'..chat_id}
},{
{text = 'بازگشت ◂ ',callback_data = 'Ramin:statsmem:'..chat_id}}}
Edit(msg,stattextss,keyboard,true)
end


elseif MenuName == 'actevemem' then
local anmisticker =  base:zrevrange(TD_ID..'bot:Unsupported:'..chat_id..':', 0, 2, 'withscores')
local VideoNote =  base:zrevrange(TD_ID..'bot:VideoNote:'..chat_id..':', 0, 2, 'withscores')
local Sticker =  base:zrevrange(TD_ID..'bot:Sticker:'..chat_id..':', 0, 2, 'withscores')
local Audio =  base:zrevrange(TD_ID..'bot:Audio:'..chat_id..':', 0, 2, 'withscores')
local Voice =  base:zrevrange(TD_ID..'bot:Voice:'..chat_id..':', 0, 2, 'withscores')
local Photo =  base:zrevrange(TD_ID..'bot:Photo:'..chat_id..':', 0, 2, 'withscores')
local stats = base:zrevrange(TD_ID..'bot:msgusr2:'..chat_id..':', 0, 4, 'withscores')
local addstats = base:zrevrange(TD_ID..'bot:addusr2:'..chat_id..':', 0, 2, 'withscores')
local Gif =  base:zrevrange(TD_ID..'bot:Gif:'..chat_id..':', 0, 2, 'withscores')
local Msg = base:get(TD_ID..'Total:messages:'..chat_id..'') or 0
local link = base:get(TD_ID..'Total:JoinedByLink:'..chat_id..'') or 0
local ttladd = base:get(TD_ID..'Total:AddUser:'..chat_id) or 0
dofile('./Alpha/time.lua')
stattextss = '✭ آمار فعالیت گروه تا این لحظه ✭ \n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n◂ فعالترین کاربران امروز : \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
for k, v in pairs(stats) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
elseif k == 2 then
rankstat = "➋نفر دوم"
elseif k == 3 then
rankstat = "➌نفر سوم"
elseif k == 4 then
rankstat = "➍نفر چهارم"
else
rankstat = "➎نفر پنچم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با *" .. v[2] .. "* پیام \n"
end
for k, v in pairs(Gif) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🔮 نفرات برتر گیف  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Voice) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🔊 نفرات برتر ویس  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Photo) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n📸 نفرات برتر عکس  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Audio) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🎧 نفرات برتر آهنگ  :\n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(Sticker) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🖼 نفرات برتر استیکر  :\n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(VideoNote) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🤳 نفرات برتر فیلم سلفی  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end
for k, v in pairs(anmisticker) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🤳 نفرات برتر استیکر متحرک  : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " عدد \n"
end

for k, v in pairs(addstats) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🏵 بهترین اضافه کننده ها : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " اد \n"
end
stattextss = stattextss .. "\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ کل پیام های گروه : *" ..Msg.. "* پیام"
stattextss = stattextss .. "\n◂ اعضای عضو شده با لینک : *" ..link.. "* نفر"
stattextss = stattextss .. "\n◂ کل اعضای دعوتی : *" ..ttladd.. "* نفر"
if #stats == 0 then
t = '`سیستم آمار در این گروه در دسترس نیست ◂`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂ ',callback_data = 'Ramin:statsmem:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '❎ ریست وبازنگری',callback_data = 'Ramin:cleanactevemem:'..chat_id}
},{
{text = 'بازگشت ◂ ',callback_data = 'Ramin:statsmem:'..chat_id}}}
Edit(msg,stattextss,keyboard,true)
end
elseif MenuName == 'cleanactevememcmd' and is_Owner(chat_id,msg.from.id) then
base:zremrangebyscore(TD_ID..'bot:ban:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:unban:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:mute:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:unmute:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:warn:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:unwarn:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:kick:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Tab:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:vip:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:vipjoin:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:clean:'..chat_id..':', 0, 2000000)
base:del(TD_ID..'Total:KickUser:'..chat_id)
base:del(TD_ID..'Total:BanUser:'..chat_id)
base:del(TD_ID..'Total:WarnUser:'..chat_id)
base:del(TD_ID..'Total:MuteUser:'..chat_id)
base:del(TD_ID..'Total:TabUser:'..chat_id)
base:del(TD_ID..'Total:VipUser:'..chat_id)
base:del(TD_ID..'Total:JoinUser:'..chat_id)
base:del(TD_ID..'Total:CleanUser:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت',callback_data = 'Ramin:actevemodcmd:'..chat_id}}}
t = [[آمار تمامی دستورات ارسال شده ریست و پاکسازی شد! ◂]]
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleanactevemem' and is_Owner(chat_id,msg.from.id) then
base:zremrangebyscore(TD_ID..'bot:msgusr2:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Unsupported:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:VideoNote:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Sticker:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Audio:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Voice:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Photo:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:addusr2:'..chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Gif:'..chat_id..':', 0, 2000000)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت',callback_data = 'Ramin:actevemem:'..chat_id}}}
t = [[`آمار تمامی پیام ممبرهای گروه ریست وبازنگری شد ◂`]]
Edit(msg,t,keyboard,true)
--Welcome
elseif MenuName == 'actevemodlist' then
list =  base:smembers(TD_ID..'ModList:'..chat_id)
t = '`لیست آمار فعالیت مدیران :`\n⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺⁃╺ ⁃\n'
for k,v in pairs(list) do
local Msg = base:get(TD_ID..'Total:messages:'..chat_id..'') or 0
local Msgs = base:get(TD_ID..'Total:messages:'..chat_id..':'..v) or 0
local Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..v or 00000000)) or 0
Percent_ = tonumber(Msgs) / tonumber(Msg) * 100
if Percent_ < 10 then
Percent = "0" .. string.sub(Percent_, 1, 4)
elseif Percent_ >= 10 then
Percent = string.sub(Percent_, 1, 5)
end

if 10 >= tonumber(Percent) then
if not lang then
UsStatus = "ضعیف🥉"

end
elseif tonumber(Percent) <= 20 then

if not lang then
UsStatus = "معمولی🥈"

end

elseif 100 >= tonumber(Percent) then
if not lang then
UsStatus = "عالی🥉"

end
end
username = base:get(TD_ID..'FirstName:'..v)
if username then
t = t..k..'-👤نام کاربر:['..username..'](tg://user?id='..v..')\n✭فعالیت امروز:`'..Msgsday..'|'..UsStatus..'`\n✭کل پیام:`'..Msgs..'`\n┅┅┅┅┅┅┅┅\n'
end
end
if #list == 0 then
t = '`هیچ ادمینی بـہ مدیریت ربات ارتقا نیافتـہ است`'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂', callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
else
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '❎ ریست وبازنگری',callback_data = 'Ramin:cleanactevemodlist:'..chat_id}
},{
{text = 'بازگشت ◂ ',callback_data = 'Ramin:statsmem:'..chat_id}}}
Edit(msg,t,keyboard,true)
end

elseif MenuName == 'cleanactevemodlist' and is_Owner(chat_id,msg.from.id) then
t = [[`فعالیت های پیامی ادمین ها بازنگری وریست شد.`]]
list =  base:smembers(TD_ID..'ModList:'..chat_id)
for k,v in pairs(list) do
base:del(TD_ID..'Total:messages:'..chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..v or 00000000)
end
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت',callback_data = 'Ramin:actevemodlist:'..chat_id}}}
Edit(msg,t,keyboard,true)

elseif MenuName == 'Delwelcome' then
base:del(TD_ID..'Text:Welcome:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:Wlc:'..chat_id}}}
Edit(msg,'*متن خوش امدگوی گروہ حذف شد*',keyboard,true)
--Start Owner
elseif MenuName == 'cleanmodtestlist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست مدیران افتخاری` *پاکسازی شد*]]
base:del(TD_ID..'ModListtest:'..chat_id)
base:del(TD_ID..'ModCleanList:'..chat_id)
base:del(TD_ID..'ModBanList:'..chat_id)
base:del(TD_ID..'ModMuteList:'..chat_id)
base:del(TD_ID..'ModWarnList:'..chat_id)
base:del(TD_ID..'ModLockList:'..chat_id)
base:del(TD_ID..'ModpanelList:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)


elseif MenuName == 'cleanmodlist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست مدیران` *پاکسازی شد*]]
base:del(TD_ID..'ModList:'..chat_id)
base:del(TD_ID..'ModCleanList:'..chat_id)
base:del(TD_ID..'ModBanList:'..chat_id)
base:del(TD_ID..'ModMuteList:'..chat_id)
base:del(TD_ID..'ModWarnList:'..chat_id)
base:del(TD_ID..'ModLockList:'..chat_id)
base:del(TD_ID..'ModpanelList:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleanbanlist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست مسدود` *پاکسازی شد*]]
base:del(TD_ID..'BanUser:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleanwarnlist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست اخطار`  *پاکسازی شد*]]
base:del(TD_ID..chat_id..':warn')
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleansilentmedialist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست سکوت رسانه`  *پاکسازی شد*]]
base:del(TD_ID..'SilentList:'..chat_id)
base:del(TD_ID..'MuteMediaList:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleansilentlist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست سکوت`  *پاکسازی شد*]]
base:del(TD_ID..'SilentList:'..chat_id)
base:del(TD_ID..'MuteList:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleanmutelist' and is_Owner(chat_id,msg.from.id) then
t = [[`لیست محدودیت`  *پاکسازی شد*]]
base:del(TD_ID..'MuteList:'..chat_id)
base:del(TD_ID..'SilentList:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
elseif MenuName == 'cleanownerlist' and is_sudo1(msg.from.id) then
t = [[`لیست مالکان` *پاکسازی شد*]]
base:del(TD_ID..'OwnerList:'..chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'بازگشت ◂',callback_data = 'Ramin:groupinfo:'..chat_id}}}
Edit(msg,t,keyboard,true)
--EXIT
elseif MenuName == 'Exit' then
lang = base:sismember(TD_ID..'Gp2:'..chat_id,'diamondlang')
if lang then
txt= 'Glass list was successfully closed ヅ\nBy :『['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')』'
EdiT(msg,txt,false,true)
else
txt= 'پنل بسته شد.'
deleteMessages(chat_id,msg.message.message_id)
Alert(msg.id,'پنل بسته شد!',true)
--EdiT(msg,txt,false,true)
end



elseif MenuName == 'Exhlp' then
deleteMessages(chat_id,msg.message.message_id)
Alert(msg.id,'پنل بسته شد!',true)
base:srem(TD_ID..'AntiPanel:'..chat_id,msg.from.id)
elseif MenuName == 'Exitss' then
deleteMessages(chat_id,msg.message.message_id)
Alert(msg.id,'پنل بسته شد!',true)
elseif MenuName == 'Exitsr' then
deleteMessages(chat_id,msg.message.message_id)
Alert(msg.id,'پنل بسته شد!',true)
elseif MenuName == 'Exitspanl' then
deleteMessages(chat_id,msg.message.message_id)
EdiT(msg,'پنل بسته شد!',false,true)
--Alert(msg.id,'پنل بسته شد!',true)
--TV***


---Plan_Charge---
elseif MenuName == 'planOne' and is_FullSudo(msg) then
if not base:sismember(TD_ID..'Gp2:'..chat_id,'added') then
Alert(msg.id,'ربات در گروہ نصب نیست',true)
else
base:setex(TD_ID.."ExpireData:"..chat_id,Plan1,true)
dayex = math.floor(Plan1 / 86400)
base:set(TD_ID..'ExpireDataNum:'..chat_id,dayex)
base:sadd(TD_ID..'Gp2:'..chat_id,'added')
base:srem(TD_ID..'Gp2:'..chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..chat_id,'chex1')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
local status = getChatAdministrators(chat_id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
base:sadd(TD_ID..'Gp2:'..chat_id,'chex3')
if base:get(TD_ID..'Link:'..chat_id) then
link = '('..base:get(TD_ID..'Link:'..chat_id)..')'
else
link = 'لینک گروہ شناسایی نشد !'
end
dofile('./Alpha/time.lua')
local Rank = getChatMember(chat_id,msg.from.id)
local membersgroup = ( membersCount(chat_id).result or "--")
local DescriptionGroup=getChat(chat_id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..chat_id) or not getChat(chat_id).result.invite_link then
GetInvate(chat_id)
local getChat = getChat(chat_id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..chat_id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..chat_id)
end
local IDS = '✭ اشتراک یک ماهه فعال شد !\n• توسط :  ['..msg.from.first_name:escape_hard()..']-[@'..msg.from.username:escape_hard()..'\n• مالک گروه : [@'..owner_name:escape_hard()..']\nنام گروہ : '..gp..'\n• ایدی گروه: '..chat_id..'\n• اعتبار گروہ : 30 روز\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n• لینک گروہ : '..invitelink..''
if getChat(chat_id).result.photo then
local fileid = getChat(chat_id).result.photo.big_file_id
downloadFile(fileid, "./Alpha/"..chat_id..".jpg")
sendPhoto2(chat_id, "./Alpha/"..chat_id..".jpg",IDS)
sendPhoto2(owner_id, "./Alpha/"..chat_id..".jpg",IDS)
sendPhoto2(Sudoid, "./Alpha/"..chat_id..".jpg",IDS)
else
return IDS
end
end
elseif MenuName == 'planTwo' and is_FullSudo(msg) then
if not base:sismember(TD_ID..'Gp2:'..chat_id,'added') then
Alert(msg.id,'ربات در گروہ نصب نیست',true)
else
base:setex(TD_ID.."ExpireData:"..chat_id,Plan1*2,true)
Plan = Plan1*2
dayex = math.floor(Plan / 86400)
base:set(TD_ID..'ExpireDataNum:'..chat_id,dayex)
base:sadd(TD_ID..'Gp2:'..chat_id,'added')
base:srem(TD_ID..'Gp2:'..chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..chat_id,'chex1')
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
local status = getChatAdministrators(chat_id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
base:sadd(TD_ID..'Gp2:'..chat_id,'chex3')
if base:get(TD_ID..'Link:'..chat_id) then
link = '('..base:get(TD_ID..'Link:'..chat_id)..')'
else
link = 'لینک گروہ شناسایی نشد !'
end
dofile('./Alpha/time.lua')
local Rank = getChatMember(chat_id,msg.from.id)
local membersgroup = ( membersCount(chat_id).result or "--")
local DescriptionGroup=getChat(chat_id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..chat_id) or not getChat(chat_id).result.invite_link then
GetInvate(chat_id)
local getChat = getChat(chat_id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..chat_id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..chat_id)
end
local IDS = '✭ اشتراک دو ماهه فعال شد !\n• توسط :  ['..msg.from.first_name:escape_hard()..']-[@'..msg.from.username:escape_hard()..'\n• مالک گروه : [@'..owner_name:escape_hard()..']\n\nنام گروہ : '..gp..'\n\n• ایدی گروه: '..chat_id..'\n\n• اعتبار گروہ : 60 روز\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n• لینک گروہ : '..invitelink..''
if getChat(chat_id).result.photo then
local fileid = getChat(chat_id).result.photo.big_file_id
downloadFile(fileid, "./Alpha/"..chat_id..".jpg")
sendPhoto2(chat_id, "./Alpha/"..chat_id..".jpg",IDS)
sendPhoto2(owner_id, "./Alpha/"..chat_id..".jpg",IDS)
sendPhoto2(Sudoid, "./Alpha/"..chat_id..".jpg",IDS)
else
return IDS
end
end
elseif MenuName == 'planThree' and is_FullSudo(msg) then
if not base:sismember(TD_ID..'Gp2:'..chat_id,'added') then
Alert(msg.id,'ربات در گروہ نصب نیست',true)
else
base:set(TD_ID.."ExpireData:"..chat_id,true)
base:sadd(TD_ID..'Gp2:'..chat_id,'added')
base:srem(TD_ID..'Gp2:'..chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..chat_id,'chex1')
name = msg.from.first_name
local status = getChatAdministrators(chat_id)
for m,n in ipairs(status.result) do
if n.status == 'creator' then
if n.user.id then
owner_id = n.user.id
owner_name = n.user.username or n.user.first_name
end
end
end
if base:get(TD_ID..'Link:'..chat_id) then
link = '('..base:get(TD_ID..'Link:'..chat_id)..')'
else
link = 'لینک گروہ شناسایی نشد !'
end
gp= base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
local Rank = getChatMember(chat_id,msg.from.id)
local membersgroup = ( membersCount(chat_id).result or "--")
local DescriptionGroup=getChat(chat_id)
local GetDescription=JSON.encode(DescriptionGroup.result.description)
local GetDescription=tostring(Discription)
local GetDescription = DescriptionGroup.result.description
local GroupDescription=GetDescription
if not base:get(TD_ID.."Link:"..chat_id) or not getChat(chat_id).result.invite_link then
GetInvate(chat_id)
local getChat = getChat(chat_id)
if getChat.result.invite_link  then
invitelink = tostring(getChat.result.invite_link)
base:set(TD_ID.."Link:"..chat_id,invitelink)
end
else
invitelink = base:get(TD_ID.."Link:"..chat_id)
end
local IDS = '✭ اشتراک دائمی فعال شد !\n• توسط :  ['..msg.from.first_name:escape_hard()..']-[@'..msg.from.username:escape_hard()..'\n• مالک گروه : [@'..owner_name:escape_hard()..']\n\nنام گروہ : '..gp..'\n\n• ایدی گروه: '..chat_id..'\n\n• اعتبار گروہ : دائمی\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n• لینک گروہ : '..invitelink..''
if getChat(chat_id).result.photo then
local fileid = getChat(chat_id).result.photo.big_file_id
downloadFile(fileid, "./Alpha/"..chat_id..".jpg")
sendPhoto2(chat_id, "./Alpha/"..chat_id..".jpg",IDS)
sendPhoto2(owner_id, "./Alpha/"..chat_id..".jpg",IDS)
sendPhoto2(Sudoid, "./Alpha/"..chat_id..".jpg",IDS)
else
return IDS
end
end
elseif MenuName == 'left' and is_FullSudo(msg) then
base:del(TD_ID..'Gp:'..chat_id)
base:del(TD_ID..'Gp3:'..chat_id)
base:del(TD_ID..'NewUser'..chat_id)
base:del(TD_ID.."ExpireData:"..chat_id)
base:del(TD_ID..'ExpireDataNum:'..chat_id)
base:srem(TD_ID.."group:",chat_id)
base:del(TD_ID.."ModList:"..chat_id)
base:del(TD_ID..'OwnerList:'..chat_id)
base:del(TD_ID.."MuteList:"..chat_id)
base:del(TD_ID.."SilentList:"..chat_id)
base:del(TD_ID..'setmode:'..chat_id)
base:del(TD_ID..'Text:Welcome:'..chat_id)
base:del(TD_ID..'settag'..chat_id)
base:del(TD_ID..'Link:'..chat_id)
base:del(TD_ID..'Pin_id'..chat_id)
base:del(TD_ID..'Textlist:'..chat_id)
base:del(TD_ID..'Text:'..chat_id)
base:del(TD_ID..'CmDlist:'..chat_id)
base:del(TD_ID..'CmD:'..chat_id)
base:del(TD_ID..'EndTimeSee'..chat_id)
base:del(TD_ID..'StartTimeSee'..chat_id)
base:del(TD_ID..'limitpm:'..chat_id)
base:del(TD_ID..'mutetime:'..chat_id)
base:del(TD_ID..'cgmautotime:'..chat_id)
base:del(TD_ID..'cbmtime:'..chat_id)
base:del(TD_ID..'Flood:Max:'..chat_id)
base:del(TD_ID..'Force:Time:'..chat_id)
base:del(TD_ID..'Force:Pm:'..chat_id)
base:del(TD_ID..'joinwarn:'..chat_id)
base:del(TD_ID..'Warn:Max:'..chat_id)
base:del(TD_ID..'NUM_CH_MAX:'..chat_id)
base:del(TD_ID..'setch:'..chat_id)
base:del(TD_ID..'Text:Welcome:'..chat_id)
base:del(TD_ID..'Rules:'..chat_id)
base:del(TD_ID..'Total:messages:'..chat_id)
base:del(TD_ID..'Total:JoinedByLink:'..chat_id)
allusers = base:smembers(TD_ID..'AllUsers:'..chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..chat_id..v)
base:del(TD_ID..'Total:AddUser:'..chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..chat_id..':'..v)
base:del(TD_ID..'Total:BanUser:'..chat_id..':'..v)
base:del(TD_ID..'Total:KickUser:'..chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..chat_id..':'..os.date("%Y/%m/%d")..':'..v)
end
gp= base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'

Alert(msg.id,'✭ لطفا کمی صبر کنید...\n⋙ ربات با موفقیت از گروه خارج شد !',true)
sendText(BotCliId,'leave '..chat_id..'',0,'md')
sendText(chat_id,'◂ ربات از لیست مدیریتی گروه توسط واحد فنی تیم خارج شد!\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈\nمدیر فنی : ['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..')\n\n🆔 ایدی گروہ : '..chat_id..'\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈',0,'md')
base:del(Hash)
base:del(TD_ID..'Gp2:'..chat_id)
leave(chat_id)
elseif MenuName == 'plsudo' and is_FullSudo(msg) then
pnlsudo(msg,chat_id,user,'','')
elseif MenuName == 'nasb' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','add') and base:sismember(TD_ID..'PnlSudo:','rem') and base:sismember(TD_ID..'PnlSudo:','نصب') and base:sismember(TD_ID..'PnlSudo:','لغو نصب') then
base:srem(TD_ID..'PnlSudo:','add')
base:srem(TD_ID..'PnlSudo:','rem')
base:srem(TD_ID..'PnlSudo:','نصب')
base:srem(TD_ID..'PnlSudo:','لغو نصب')
Alert(msg.id,'✭ دستور نصب و لغو نصب در دسترس سودو های ربات قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','add')
base:sadd(TD_ID..'PnlSudo:','rem')
base:sadd(TD_ID..'PnlSudo:','نصب')
base:sadd(TD_ID..'PnlSudo:','لغو نصب')
Alert(msg.id,'✭ دستور نصب و لغو نصب از دسترس سودو های ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
pnlsudo(msg,chat_id,'','')
elseif MenuName == 'sendgp' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','send groups') and base:sismember(TD_ID..'PnlSudo:','ارسال به گروها') then
base:srem(TD_ID..'PnlSudo:','send groups')
base:srem(TD_ID..'PnlSudo:','ارسال به گروها')
Alert(msg.id,'✭ دستور ارسال پیام همگانی در دسترس سودو های ربات قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','send groups')
base:sadd(TD_ID..'PnlSudo:','ارسال به گروها')
Alert(msg.id,'✭ دستور ارسال پیام همگانی از دسترس سودو های ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
pnlsudo(msg,chat_id,'','')
elseif MenuName == 'fwdgp' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','fwd groups') and base:sismember(TD_ID..'PnlSudo:','فوروارد به گروها') then
base:srem(TD_ID..'PnlSudo:','fwd groups')
base:srem(TD_ID..'PnlSudo:','فوروارد به گروها')
Alert(msg.id,'✭ دستور فوروارد همگانی در دسترس سودو های ربات قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','fwd groups')
base:sadd(TD_ID..'PnlSudo:','فوروارد به گروها')
Alert(msg.id,'✭ دستور فوروارد همگانی از دسترس سودو های ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
pnlsudo(msg,chat_id,'','')
elseif MenuName == 'chngexpire' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','charge') and base:sismember(TD_ID..'PnlSudo:','شارژ') then
base:srem(TD_ID..'PnlSudo:','charge')
base:srem(TD_ID..'PnlSudo:','شارژ')
Alert(msg.id,'✭ دسترسی شارژ کردن گروہ در دسترس سودو ها قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','charge')
base:sadd(TD_ID..'PnlSudo:','شارژ')
Alert(msg.id,'✭ دسترسی شارژ کردن گروہ از دسترس سودوها خارج شد !',true)
end
pnlsudo(msg,chat_id,'','')
elseif MenuName == 'cleangbans' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','clean gbans') and base:sismember(TD_ID..'PnlSudo:','پاکسازی لیست گلوبال') and base:sismember(TD_ID..'PnlSudo:','banall') and base:sismember(TD_ID..'PnlSudo:','unbanall') and base:sismember(TD_ID..'PnlSudo:','بن گلوبال') and base:sismember(TD_ID..'PnlSudo:','ان بن گلوبال') then
base:srem(TD_ID..'PnlSudo:','clean gbans')
base:srem(TD_ID..'PnlSudo:','پاکسازی لیست گلوبال')
base:srem(TD_ID..'PnlSudo:','banall')
base:srem(TD_ID..'PnlSudo:','unbanall')
base:srem(TD_ID..'PnlSudo:','بن گلوبال')
base:srem(TD_ID..'PnlSudo:','ان بن گلوبال')
Alert(msg.id,'✭ لیست گلوبال در دسترس سودو های ربات قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','clean gbans')
base:sadd(TD_ID..'PnlSudo:','پاکسازی لیست گلوبال')
base:sadd(TD_ID..'PnlSudo:','banall')
base:sadd(TD_ID..'PnlSudo:','unbanall')
base:sadd(TD_ID..'PnlSudo:','بن گلوبال')
base:sadd(TD_ID..'PnlSudo:','ان بن گلوبال')
Alert(msg.id,'✭ لیست گلوبال از دسترس سودو های ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
pnlsudo(msg,chat_id,'','')
elseif MenuName == 'joinch' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','joinchannel off') and base:sismember(TD_ID..'PnlSudo:','جوین چنل خاموش') and base:sismember(TD_ID..'PnlSudo:','joinchannel on') and base:sismember(TD_ID..'PnlSudo:','جوین چنل روشن') then
base:srem(TD_ID..'PnlSudo:','joinchannel off')
base:srem(TD_ID..'PnlSudo:','جوین چنل خاموش')
base:srem(TD_ID..'PnlSudo:','joinchannel on')
base:srem(TD_ID..'PnlSudo:','جوین چنل روشن')
Alert(msg.id,'✭ دستور روشن و خاموش کردن جوین اجباری کانال سودو در دسترس سودو های ربات قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','joinchannel off')
base:sadd(TD_ID..'PnlSudo:','جوین چنل خاموش')
base:sadd(TD_ID..'PnlSudo:','joinchannel on')
base:sadd(TD_ID..'PnlSudo:','جوین چنل روشن')
Alert(msg.id,'✭ دستور روشن و خاموش کردن جوین اجباری کانال سودو از دسترس سودو های ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
pnlsudo(msg,chat_id,'','')
elseif MenuName == 'kickall' and is_FullSudo(msg) then
if base:sismember(TD_ID..'PnlSudo:','kickall') and base:sismember(TD_ID..'PnlSudo:','اخراج همه') then
base:srem(TD_ID..'PnlSudo:','kickall')
base:srem(TD_ID..'PnlSudo:','اخراج همه')
Alert(msg.id,'✭ دستور اخراج کردن همـہ کاربران گروہ در دسترس سودو های ربات قرار گرفت !',true)
else
base:sadd(TD_ID..'PnlSudo:','kickall')
base:sadd(TD_ID..'PnlSudo:','اخراج همه')
Alert(msg.id,'✭ دستور اخراج کردن همـہ کاربران گروہ از دسترس سودو های ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
pnlsudo(msg,chat_id,'','')

elseif MenuName == 'freeinstall' and is_FullSudo(msg) then
if base:get(TD_ID..'freeinstall')  then
Alert(msg.id,'✭ دستور نصب رایگان بر تمامی کاربران تلگرام از دسترس خارج شد!',true)
base:del(TD_ID..'freeinstall')
else
base:set(TD_ID..'freeinstall',true)
Alert(msg.id,'✭ دستور نصب رایگان برتمامی کاربران تلگرام در دسترس قرار گرفت.',true)
end
pnlsudo(msg,chat_id,'','')


elseif MenuName == 'freeinstallup' then
if not base:get(TD_ID..'ExpireDatafree:') then
num = 31
else
num = tonumber(base:get(TD_ID..'ExpireDatafree:'))
end
local res = num + 1
if not (res > 61) then
base:set(TD_ID..'ExpireDatafree:',res)
Alert(msg.id,"• تعداد اعتبار رایگان  به "..res.." روز تنظیم شد!")
else
Alert(msg.id,'• حداکثر 60 روز می باشد.',true)
end
pnlsudo(msg,chat_id,'','')

-----
elseif MenuName == 'freeinstalldown' then
if not base:get(TD_ID..'ExpireDatafree:') then
num = 31
else
num = tonumber(base:get(TD_ID..'ExpireDatafree:'))
end
local res = num - 1
if not (res < 2) then
base:set(TD_ID..'ExpireDatafree:',res)
Alert(msg.id,"• تعداد اعتبار رایگان  به "..res.." روز تنظیم شد!")
else
Alert(msg.id,'• حداقل رایگان 2 روز می باشد',true)
end
pnlsudo(msg,chat_id,'','')

elseif MenuName == 'freeinstall2up' then
if not base:get(TD_ID..'ExpireDatafree:') then
num = 31
else
num = tonumber(base:get(TD_ID..'ExpireDatafree:'))
end
local res = num + 5
if not (res > 61) then
base:set(TD_ID..'ExpireDatafree:',res)
Alert(msg.id,"• تعداد اعتبار رایگان  به "..res.." روز تنظیم شد!")
else
Alert(msg.id,'• نمی توانم عدد5 رو افزایش کنم از دکمه تک تایی استفاده کنید!',true)
end
pnlsudo(msg,chat_id,'','')

-----
elseif MenuName == 'freeinstall2down' then
if not base:get(TD_ID..'ExpireDatafree:') then
num = 31
else
num = tonumber(base:get(TD_ID..'ExpireDatafree:'))
end
local res = num - 5
if not (res < 6) then
base:set(TD_ID..'ExpireDatafree:',res)
Alert(msg.id,"• تعداد اعتبار رایگان  به "..res.." روز تنظیم شد!")
else
Alert(msg.id,'• نمی توانم عدد5 رو کم کنم از دکمه تک تایی استفاده کنید!',true)
end
pnlsudo(msg,chat_id,'','')


elseif MenuName == 'back' and is_FullSudo(msg) then
pnlsudo(msg,chat_id,'','')

elseif MenuName:match('getsudopnl') and is_FullSudo(msg) then
GetSudo(msg,msg.message,'mrr619')
elseif MenuName:match('getbanpnl') then
GetBan(msg,msg.message,'mrr619')
elseif MenuName:match('getsudo') and is_FullSudo(msg) then
user = MenuName:gsub('getsudo','')
GetSudoStats(msg,msg.message,user)

elseif MenuName:match('getban') and is_FullSudo(msg) then
user = MenuName:gsub('getban','')
GetBanStats(msg,msg.message,user)

elseif MenuName:match('banrem>') and is_FullSudo(msg) then
if base:sismember(TD_ID..'BanUser:'..chat_id,UseriD) then
base:srem(TD_ID..'BanUser:'..chat_id,UseriD)
Alert(msg.id,'کاربر ازلیست مسدود حذف شد.',true)
else
base:sadd(TD_ID..'BanUser:'..chat_id,UseriD)
Alert(msg.id,'کاربر مسدود شد!',true)
end
GetBanStats(msg,msg.message,UseriD)

elseif MenuName:match('addremm>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':add') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':rem') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':نصب') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':لغو نصب') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':add') base:srem(TD_ID..'PnlSudo_2:',UseriD..':rem') base:srem(TD_ID..'PnlSudo_2:',UseriD..':نصب')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':لغو نصب')
Alert(msg.id,'✭ دستور نصب و لغو نصب در دسترس سودوی #موردنظر ربات قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','add') and base:sismember(TD_ID..'PnlSudo:','rem') and base:sismember(TD_ID..'PnlSudo:','نصب') and base:sismember(TD_ID..'PnlSudo:','لغو نصب') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':add')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':rem')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':نصب')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':لغو نصب')
Alert(msg.id,'✭ دستور نصب و لغو نصب از دسترس سودوی #موردنظر ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
elseif MenuName:match('sendgpp>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':send groups') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':ارسال به گروها') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':send groups')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':ارسال به گروها')
Alert(msg.id,'✭ دستور ارسال پیام همگانی در دسترس سودوی #موردنظر ربات قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','send groups') and base:sismember(TD_ID..'PnlSudo:','ارسال به گروها') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':send groups')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':ارسال به گروها')
Alert(msg.id,'✭ دستور ارسال پیام همگانی از دسترس سودوی #موردنظر ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
elseif MenuName:match('fwdgpp>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':fwd groups') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':فوروارد به گروها') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':fwd groups')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':فوروارد به گروها')
Alert(msg.id,'✭ دستور فوروارد همگانی در دسترس سودوی #موردنظر ربات قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','فوروارد به گروها') and base:sismember(TD_ID..'PnlSudo:','fwd groups') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':fwd groups')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':فوروارد به گروها')
Alert(msg.id,'✭ دستور فوروارد همگانی از دسترس سودوی #موردنظر ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
elseif MenuName:match('cleangbanss>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':clean gbans') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':پاکسازی لیست گلوبال') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':banall') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':unbanall') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':بن گلوبال') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':ان بن گلوبال') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':clean gbans')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':پاکسازی لیست گلوبال')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':banall') base:srem(TD_ID..'PnlSudo_2:',UseriD..':unbanall')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':بن گلوبال')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':ان بن گلوبال')
Alert(msg.id,'✭ لیست گلوبال در دسترس سودوی #موردنظر ربات قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','clean gbans') and base:sismember(TD_ID..'PnlSudo:','پاکسازی لیست گلوبال') and base:sismember(TD_ID..'PnlSudo:','banall') and base:sismember(TD_ID..'PnlSudo:','unbanall') and base:sismember(TD_ID..'PnlSudo:','بن گلوبال') and base:sismember(TD_ID..'PnlSudo:','ان بن گلوبال') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':clean gbans')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':پاکسازی لیست گلوبال')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':banall') base:sadd(TD_ID..'PnlSudo_2:',UseriD..':unbanall')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':بن گلوبال')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':ان بن گلوبال')
Alert(msg.id,'✭ لیست گلوبال از دسترس سودوی #موردنظر ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
elseif MenuName:match('chngexpiree>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':charge') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':شارژ') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':charge')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':شارژ')
Alert(msg.id,'✭ دسترسی شارژ کردن گروہ در دسترس این سودو قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','charge') and base:sismember(TD_ID..'PnlSudo:','شارژ') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':charge')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':شارژ')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':banall') base:sadd(TD_ID..'PnlSudo_2:',UseriD..':unbanall')
Alert(msg.id,'✭ دسترسی شارژ کردن گروہ از دسترس این سودو خارج شد !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
elseif MenuName:match('joinchh>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':joinchannel off') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':جوین چنل خاموش') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':joinchannel on') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':جوین چنل روشن') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':joinchannel off')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':جوین چنل خاموش')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':joinchannel on')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':جوین چنل روشن')
Alert(msg.id,'✭ دستور روشن و خاموش کردن جوین اجباری کانال سودو در دسترس سودوی #موردنظر ربات قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','joinchannel off') and base:sismember(TD_ID..'PnlSudo:','جوین چنل خاموش') and base:sismember(TD_ID..'PnlSudo:','joinchannel on') and base:sismember(TD_ID..'PnlSudo:','جوین چنل روشن') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':joinchannel off')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':جوین چنل خاموش')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':joinchannel on')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':جوین چنل روشن')
Alert(msg.id,'✭ دستور روشن و خاموش کردن جوین اجباری کانال سودو از دسترس سودوی #موردنظر ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
elseif MenuName:match('kickalll>') and is_FullSudo(msg) then
if is_FullSudo2(UseriD) then
Alert(msg.id,'کاربر مورد نظر فول سودو میباشد امکان ایجاد تغییر در دسترسی های این سودو وجود ندارد !',true)
else
if base:sismember(TD_ID..'PnlSudo_2:',UseriD..':kickall') and base:sismember(TD_ID..'PnlSudo_2:',UseriD..':اخراج همه') and base:sismember(TD_ID..'PnlSudo:','kickall') and base:sismember(TD_ID..'PnlSudo:','اخراج همه') then
base:srem(TD_ID..'PnlSudo_2:',UseriD..':kickall')
base:srem(TD_ID..'PnlSudo_2:',UseriD..':اخراج همه')
Alert(msg.id,'✭ دستور اخراج کردن همـہ کاربران گروہ در دسترس سودوی #موردنظر ربات قرار گرفت !',true)
else
if base:sismember(TD_ID..'PnlSudo:','kickall') and base:sismember(TD_ID..'PnlSudo:','اخراج همه') then
Alert(msg.id,'✭ این دستور برای تمامی سودوها محدود است !',true)
else
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':kickall')
base:sadd(TD_ID..'PnlSudo_2:',UseriD..':اخراج همه')
Alert(msg.id,'✭ دستور اخراج کردن همـہ کاربران گروہ از دسترس سودوی #موردنظر ربات خارج شد و فقط فول سودوی ربات قادر بـہ زدن این دستور خواهد بود !',true)
end
end
GetSudoStats(msg,msg.message,UseriD)
end
end
end

if is_sudo1(msg.from.id) then
if msg.data:match('(ChatsPage):(%d+)') then
Split = msg.data:split(':')
page = tonumber(Split[2])
PG = tonumber(page)
local keyboard = {}
keyboard.inline_keyboard = {}
list = base:smembers(TD_ID..'group:')
PGs = math.floor(#list / 4)
if #list%4 > 0 then PGs = PGs + 1 end
PGs = PGs - 1
if #list == 0 then
txt = 'لیست گروه هاے براے مدیریت خالی میباشد!'
else
txt = '• به لیست کلی گزارشات نصبی وتنظیم ربات ['..botusername..'](tg://user?id='..TD_ID..')خوش امدید.\n• برای تنظیم پنل مدیریتی گروه دلخواه دکمه (تنظیم پنل) یا برای تنظیم لینک گروه (نمایش لینک) را کلیک کنید.\n• با برای تغییرات شارژ ربات دکمه(نمایش اعتبار گروه) را کلیک کنید'
for k,v in pairs(list) do
if (k > PG*4) and (k < PG*4+5) then
GroupsName = base:get(TD_ID..'StatsGpByName'..v)
links = base:get(TD_ID..'Link:'..v)
expire = base:ttl(TD_ID..'ExpireData:'..v)
if expire == -1 then
if base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
then
EXPIRE = 'Unlimited'
else
EXPIRE = '🌀 شارژ مادالعمر'
end
else
d = math.floor(expire/day ) + 1
if base:sismember(TD_ID..'Gp2:'..v,'diamondlang')
then
EXPIRE = ''..d..' Day'
else
EXPIRE = '🗓 '..d..' روز'
end
end
if txt then
temp = {{{text = ''..Alphaee(k)..')'..GroupsName..'',url=links,callback_data = 'Ramin:NotAdmin:'..v}
},{
{text = ' '..EXPIRE..'',callback_data = 'Black:'..v},{text = '⚙️ تنظیم پنل',callback_data = 'Ramin:gpmenu:'..v}
},{
{text = '• نمایش لینک • ',callback_data = 'Ramin:SetGpLink:'..v}
,},}
end
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
end
if PG == 0 then
if PGs > 0 then

temp = {{{text= '➲ بعدی',callback_data = 'ChatsPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
elseif PG == PGs then
temp = {{{text= 'قبلی ◤',callback_data = 'ChatsPage:'..(PG-1)}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else
temp = {{{text = 'قبلی ◤',callback_data = 'ChatsPage:'..(PG-1)},{text = '➲ بعدی',callback_data = 'ChatsPage:'..(PG+1)}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
temp = {{{text = 'خروج ☒',callback_data = 'Ramin:Exit:'..msg.message.chat.id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
Edit(msg,txt,keyboard,true)
end
end
if msg.data:match('SudoPage:') and is_FullSudo(msg) then
Split = msg.data:split(':')
page = tonumber(Split[2])
PG = tonumber(page)
local keyboard = {}
keyboard.inline_keyboard = {}
list = base:smembers(TD_ID..'SUDO')
for k,v in pairs(list) do
PGs = math.floor(k / 14)
if k%14 > 0 then PGs = PGs + 1 end
PGs = PGs - 1
if k == 0 then
txt = 'Not Found !'
else
txt = '✭لیست سودو های ربات :\nجهت تغییر دسترسی سودو ها بر روی سودوی مورد نظر کلیک کنید !\nفول سودو : ['..UserSudo..'](tg://user?id='..Sudoid..')'
if (k > PG*14) and (k < PG*14+15) then
if txt then
temp = {{{text = ''..k..') '..v..'➕'..v,callback_data = 'Ramin:getsudo'..v..':'..msg.message.chat.id}}}
end
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
end
end
if PG == 0 then
if PGs > 0 then
temp = {{{text= '➲ بعدی',callback_data = 'SudoPage:1'}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
elseif PG == PGs then
temp = {{{text= 'قبلی ◤',callback_data = 'SudoPage:'..(PG-1)}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
else
temp = {{{text = 'قبلی ◤',callback_data = 'SudoPage:'..(PG-1)},{text = '➲ بعدی',callback_data = 'SudoPage:'..(PG+1)}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
end
temp = {{{text = 'خروج ☒',callback_data = 'Exit:'..msg.message.chat.id},{text = '◂ بازگشت',callback_data = 'Ramin:menu:'..msg.message.chat.id}}}
for k,v in pairs(temp) do table.insert(keyboard.inline_keyboard,v) end
Edit(msg,txt,keyboard,true)
end




--- «»CallBack Remote & Tpm«» ---
if msg.data:match('(Ramin):(%a+):(-%d+):(%d+):(.*)') then
Split = msg.data:split(':')
MenuName = Split[2]
chat_id = Split[3]
user = Split[4]
name = Split[5]
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
gp = base:get(TD_ID..'StatsGpByName'..chat_id) or 'nil'
if MenuName == 'addsudo' and is_FullSudo(msg) then
if base:sismember(TD_ID..'SUDO',user) then
base:srem(TD_ID..'SUDO',user)
Alert(msg.id,'کاربر از سودو ربات حذف شد.◥',true)
else
base:sadd(TD_ID..'SUDO',user)
Alert(msg.id,'کاربر به مقام سودو ارتقا داده شد.◥',true)
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'addowner' and is_sudo1(msg.from.id) then
if base:sismember(TD_ID..'OwnerList:'..chat_id,user) then
base:srem(TD_ID..'OwnerList:'..chat_id,user)
Alert(msg.id,'کاربر از لیست مالک ربات حذف شد.◥',true)
else
if is_sudo1(user) then
Alert(msg.id,'کاربر مقام بالاتری دارد و نیازی بـہ مالک شدن او نیست ❗️',true)
else
base:sadd(TD_ID..'OwnerList:'..chat_id,user)
Alert(msg.id,'کاربر بـہ مالک ربات ارتقا یافت!◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'addmodanony' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModList:'..chat_id,user) then
base:srem(TD_ID..'ModList:'..chat_id,user)
base:srem(TD_ID..'ModCleanList:'..chat_id,user)
base:srem(TD_ID..'ModBanList:'..chat_id,user)
base:srem(TD_ID..'ModMuteList:'..chat_id,user)
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
base:srem(TD_ID..'ModLockList:'..chat_id,user)
base:srem(TD_ID..'ModpanelList:'..chat_id,user)
base:srem(TD_ID..'ModVipList:'..chat_id,user)
base:srem(TD_ID..'ModListtest:'..chat_id,user)
Alert(msg.id,'کاربر از لیست ادمین ناشناس حذف شد!◥',true)
else
if is_Owner(chat_id,user) then
Alert(msg.id,'کاربر مقام بالاتری دارد و نیازی بـہ مدیر شدن او نیست ❗️',true)
else
base:sadd(TD_ID..'ModList:'..chat_id,user)
base:sadd(TD_ID..'ModCleanList:'..chat_id,user)
base:sadd(TD_ID..'ModBanList:'..chat_id,user)
base:sadd(TD_ID..'ModMuteList:'..chat_id,user)
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
base:sadd(TD_ID..'ModLockList:'..chat_id,user)
base:sadd(TD_ID..'ModpanelList:'..chat_id,user)
base:sadd(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر به ادمین ناشناس ارتقا یافت!◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')


elseif MenuName == 'addmod' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModList:'..chat_id,user) then
base:srem(TD_ID..'ModList:'..chat_id,user)
base:srem(TD_ID..'ModCleanList:'..chat_id,user)
base:srem(TD_ID..'ModBanList:'..chat_id,user)
base:srem(TD_ID..'ModMuteList:'..chat_id,user)
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
base:srem(TD_ID..'ModLockList:'..chat_id,user)
base:srem(TD_ID..'ModpanelList:'..chat_id,user)
base:srem(TD_ID..'ModVipList:'..chat_id,user)
base:srem(TD_ID..'ModListtest:'..chat_id,user)
Alert(msg.id,'کاربر از لیست مدیر ربات حذف شد!◥',true)
else
if is_Owner(chat_id,user) then
Alert(msg.id,'کاربر مقام بالاتری دارد و نیازی بـہ مدیر شدن او نیست ❗️',true)
else
base:sadd(TD_ID..'ModList:'..chat_id,user)
base:sadd(TD_ID..'ModCleanList:'..chat_id,user)
base:sadd(TD_ID..'ModBanList:'..chat_id,user)
base:sadd(TD_ID..'ModMuteList:'..chat_id,user)
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
base:sadd(TD_ID..'ModLockList:'..chat_id,user)
base:sadd(TD_ID..'ModpanelList:'..chat_id,user)
base:sadd(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر به ادمین ربات ارتقا یافت!◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'addnazem' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'NazemList:'..chat_id,user) then
base:srem(TD_ID..'NazemList:'..chat_id,user)
base:srem(TD_ID..'ModCleanList:'..chat_id,user)
base:srem(TD_ID..'ModBanList:'..chat_id,user)
base:srem(TD_ID..'ModMuteList:'..chat_id,user)
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
base:srem(TD_ID..'ModLockList:'..chat_id,user)
base:srem(TD_ID..'ModpanelList:'..chat_id,user)
base:srem(TD_ID..'ModVipList:'..chat_id,user)
base:srem(TD_ID..'ModListtest:'..chat_id,user)
Alert(msg.id,'کاربر از لیست معاون ربات حذف شد!◥',true)
else
if is_Owner(chat_id,user) then
Alert(msg.id,'کاربر مقام بالاتری دارد و نیازی بـہ مدیر شدن او نیست ❗️',true)
else
base:sadd(TD_ID..'NazemList:'..chat_id,user)
base:sadd(TD_ID..'ModCleanList:'..chat_id,user)
base:sadd(TD_ID..'ModBanList:'..chat_id,user)
base:sadd(TD_ID..'ModMuteList:'..chat_id,user)
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
base:sadd(TD_ID..'ModLockList:'..chat_id,user)
base:sadd(TD_ID..'ModpanelList:'..chat_id,user)
base:sadd(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر به معاون ربات ارتقا یافت!◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')


elseif MenuName == 'addmodtest' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModListtest:'..chat_id,user) then
base:srem(TD_ID..'ModListtest:'..chat_id,user)
-- base:srem(TD_ID..'ModBanList:'..chat_id,user)
base:srem(TD_ID..'ModMuteList:'..chat_id,user)
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
-- base:srem(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر از لیست ادمین افتخاری حذف  شد❗️',true)
else
if is_Mod(chat_id,user) then
Alert(msg.id,'کاربر مقام بالاتری دارد و نیازی بـہ مدیر شدن او نیست ❗️',true)
else
base:sadd(TD_ID..'ModListtest:'..chat_id,user)
-- base:sadd(TD_ID..'ModBanList:'..chat_id,user)
base:sadd(TD_ID..'ModMuteList:'..chat_id,user)
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
-- base:sadd(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر به ادمین افتخاری ارتقا یافت.◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'setvip' and is_Mod(chat_id,msg.from.id) then
if base:sismember(TD_ID..'Vip:'..chat_id,user) then
base:srem(TD_ID..'Vip:'..chat_id,user)
Alert(msg.id,' کاربر از عضو مجاز حذف شد.◥',true)
else
if is_Mod(chat_id,user) then
Alert(msg.id,'کاربر مقام بالاتری دارد و نیازی بـہ مدیر شدن او نیست !',true)
else
base:sadd(TD_ID..'Vip:'..chat_id,user)
Alert(msg.id,'کاربر به عضو مجاز ارتقا یافت.◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'Mute' and is_Mod(chat_id,msg.from.id) then
if base:sismember(TD_ID..'MuteList:'..chat_id,user) then
base:srem(TD_ID..'MuteList:'..chat_id,user)
Alert(msg.id,'کاربر از لیست محدود ها حذف شد.◥',true)
else
if is_Vip(chat_id,user) then
Alert(msg.id,'کاربر دارای مقام است !',true)
else
base:sadd(TD_ID..'MuteList:'..chat_id,user)
Alert(msg.id,'کاربر به لیست محدودها اضافه شد.◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'limitpmre' and is_Mod(chat_id,msg.from.id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'limitpm'..user) then
base:srem(TD_ID..'Gp2:'..chat_id,'limitpm'..user)
Alert(msg.id,'کاربر از لیست محدودیت پیام پاک شد!◥',true)
else
if is_Vip(chat_id,user) then
Alert(msg.id,'کاربر دارای مقام است !',true)
else
base:sadd(TD_ID..'Gp2:'..chat_id,'limitpm'..user)
Alert(msg.id,'کاربربه لیست محدودیت پیام اضافه شد!◥',true)
end
end
remote(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
------------------------------------------------
elseif MenuName == 'bancl' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'BanUser:'..chat_id,user) then
base:srem(TD_ID..'BanUser:'..chat_id,user)
Alert(msg.id,'کاربر رفع مسدود شد.',true)
else
if is_Owner(chat_id,user) then
Alert(msg.id,'کاربر عزیز شما مالک گروه نیستید :(',true)
else
base:sadd(TD_ID..'BanUser:'..chat_id,user)
Alert(msg.id,'کاربر به حالت مسدود تنظیم شد.',true)
end
end
GetCmdBanStats(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
-----------------------remoteCmd---------------------------
elseif MenuName == 'cmdclaen' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModCleanList:'..chat_id,user) then
base:srem(TD_ID..'ModCleanList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات پاکسازی ها محدود شد.',true)
else
base:sadd(TD_ID..'ModCleanList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات پاکسازی ها ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'cmdban' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModBanList:'..chat_id,user) then
base:srem(TD_ID..'ModBanList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات مسدودکردن محدود شد.',true)
else
base:sadd(TD_ID..'ModBanList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات مسدود کردن ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'cmdmute' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModMuteList:'..chat_id,user) then
base:srem(TD_ID..'ModMuteList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات سکوت کردن محدود شد.',true)
else
base:sadd(TD_ID..'ModMuteList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات سکوت کردن ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'cmdwarn' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModWarnList:'..chat_id,user) then
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات اخطار محدود شد.',true)
else
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات اخطاردادن ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'cmdwarn' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModWarnList:'..chat_id,user) then
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات اخطار محدود شد.',true)
else
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات اخطاردادن ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'cmdlock' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModLockList:'..chat_id,user) then
base:srem(TD_ID..'ModLockList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات قفل ها محدود شد.',true)
else
base:sadd(TD_ID..'ModLockList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات قفل ها ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'cmdvip' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModVipList:'..chat_id,user) then
base:srem(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر از دستورات مجاز دادن محدود شد.',true)
else
base:sadd(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورات مجازدادن ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'cmdall' and is_Owner(chat_id,msg.from.id)  then
if base:sismember(TD_ID..'ModAllList:'..chat_id,user) then
base:srem(TD_ID..'ModAllList:'..chat_id,user)
base:srem(TD_ID..'ModpanelList:'..chat_id,user)
base:srem(TD_ID..'ModLockList:'..chat_id,user)
base:srem(TD_ID..'ModWarnList:'..chat_id,user)
base:srem(TD_ID..'ModMuteList:'..chat_id,user)
base:srem(TD_ID..'ModBanList:'..chat_id,user)
base:srem(TD_ID..'ModCleanList:'..chat_id,user)
base:srem(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر از کلیه دستورات محدود شد.',true)
else
base:sadd(TD_ID..'ModAllList:'..chat_id,user)
base:sadd(TD_ID..'ModAllList:'..chat_id,user)
base:sadd(TD_ID..'ModpanelList:'..chat_id,user)
base:sadd(TD_ID..'ModLockList:'..chat_id,user)
base:sadd(TD_ID..'ModWarnList:'..chat_id,user)
base:sadd(TD_ID..'ModMuteList:'..chat_id,user)
base:sadd(TD_ID..'ModBanList:'..chat_id,user)
base:sadd(TD_ID..'ModCleanList:'..chat_id,user)
base:sadd(TD_ID..'ModVipList:'..chat_id,user)
Alert(msg.id,'کاربر به کلیه دستورات ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')

elseif MenuName == 'cmdpanel' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModpanelList:'..chat_id,user) then
base:srem(TD_ID..'ModpanelList:'..chat_id,user)
Alert(msg.id,'کاربر از کلیه دستورات پنلی محدود شد.',true)
else
base:sadd(TD_ID..'ModpanelList:'..chat_id,user)
Alert(msg.id,'کاربر به کلیه دستورات پنلی ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')
elseif MenuName == 'cmdpin' and is_Owner(chat_id,msg.from.id) then
if base:sismember(TD_ID..'ModPinList:'..chat_id,user) then
base:srem(TD_ID..'ModPinList:'..chat_id,user)
Alert(msg.id,'کاربر از سنجاق کردن پیام محدود شد',true)
else
base:sadd(TD_ID..'ModPinList:'..chat_id,user)
Alert(msg.id,'کاربر به دستورسنجاق ارتقا داده شد.',true)
end
remoteCmd(msg,chat_id,user,'senmrrd',escape_markdown(name),'MrGaurd')


end
end

end
---Max Locks---
function tdlocks(chat_id,BD)
if BD == 'automuteall' then
txt = 'تعطیل کردن خودکار'
elseif BD == 'forceadd' then
txt = 'افزودن اجباری کلی'
elseif BD == 'forcesticker' then
txt = 'افزودن اجباری استیکر'
elseif BD == 'forcestickers' then
txt = 'افزودن اجباری استیکر متحرک'
elseif BD == 'forcefile' then
txt = 'افزودن اجباری فایل'
elseif BD == 'forcefwd' then
txt = 'افزودن اجباری فورواردکاربر'
elseif BD == 'forcephoto' then
txt = 'افزودن اجباری عکس'
elseif BD == 'forcemusic' then
txt = 'افزودن اجباری موزیک'
elseif BD == 'forcetext' then
txt = 'افزودن اجباری پیام متنی'
elseif BD == 'forcecontact' then
txt = 'افزودن اجباری شر مخاطب'
elseif BD == 'forcevoice' then
txt = 'افزودن اجباری ویس'
elseif BD == 'forcegif' then
txt = 'افزودن اجباری گیف'
elseif BD == 'forcejoin' then
txt = 'عضویت اجباری'
elseif BD == 'Mute_All' then
txt = 'تعطیل کردن همه'
end end
if msg.data:match('(-%d+):(locks2):(.*):(%d+)') then
Q = msg.data:split(':')
chat_id = Q[1]
BD = Q[3]
page = tonumber(Q[4])
tdlocks(chat_id,BD)
if not is_req(msg) then
dofile('./Alpha/time.lua')
Alert(msg.id,'شما دسترسی کار کردن با این پنل را ندارید !\n'..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..'',true)
else
if not is_Mod(chat_id,msg.from.id) then
inlineeqq = base:get(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id) or 0
if tonumber(inlineeqq) < 3 then
base:setex(TD_ID.."antiattackinline:" .. msg.from.id .. ":" .. chat_id, 60, inlineeqq + 1)
Alert(msg.id,'⚠️ کاربر عزیز شما دسترسی ندارید\n⚠️نعداد اخطار ('..inlineeqq..') درصورت لمس بی مورد از تمامی گروه ها محدود خواهید شد!',true)
else
KickUser(msg.chat.id,msg.from.id)

end
return
end
if base:sismember(TD_ID..'Gp2:'..chat_id,''..BD) then
lock_rem('Gp2:',''..BD)
txxt = ''..txt..' غیرفعال شد'
Alert(msg.id,txxt,true)
else
lock_add('Gp2:',''..BD)
txxt = ''..txt..' فعال شد'
Alert(msg.id,txxt,true)
end
SETT(msg,chat_id,page)
end
end




if msg.data:match('(Ramin):(%a+):(%d+)') then
Split = msg.data:split(':')
MenuName = Split[2]
if MenuName == 'nerkhpv' then
Nerkh(msg,'','',2)
elseif MenuName == 'nerkhmem' then
Nerkh(msg,'','',9)
elseif MenuName == 'nerkhbot' then
Nerkh(msg,'','',10)
elseif MenuName == 'farg' then
Nerkh(msg,'','',11)
elseif MenuName == 'Filtering' then
Nerkh(msg,'','',12)
elseif MenuName == 'aboutbot' then
Nerkh(msg,'','',13)
elseif MenuName == 'Nerkh' then
Nerkh(msg,'','',1)
elseif MenuName == 'emkan' then
Nerkh(msg,'','',3)
elseif MenuName == 'Backst' then
Nerkh(msg,'','',8)
elseif MenuName == 'modposh' then
Nerkh(msg,'','',5)
elseif MenuName == 'kharidbot' then
Nerkh(msg,'','',6)
elseif MenuName == 'system' then
Nerkh(msg,'','',7)




elseif MenuName == 'dargah' then
local keyboard = {}
keyboard.inline_keyboard = {{
},{
{text= '◈ خرید یک ماهه',url = pardd1},
{text= '◈ خرید دوماهه',url = pardd2}
},{
{text= '◈ خریدسه ماهه',url = pardd3},
{text= '◈ خرید شش ماهه',url = pardd4}
},{
{text= '◈ خرید یک ساله',url = pardd5}
},{
{text = 'بازگشت ◂',callback_data = 'Ramin:Backst:'..msg.from.id}}}
Edit(msg,'◈ به بخش درگاه و پرداخت ایمن ربات خوش آمدید برای انتخاب وخرید اعتبار ربات حتما در قسمت پاسخ درگاه ایدی عددی گروه خود را ارسال کنید.\n[.](https://t.me/TmGuardian/7)',keyboard,true)



elseif MenuName == 'ExhlStart' then
txt = 'بسته شد.'
EdiT(msg,txt,false,true)
end end

end--callback(msg)

function EditProcess(msg)
if msg.text then
NewContent = msg.text
elseif msg.caption then
NewContent = msg.caption
else
return
end
end

--<><>--<><>--<><><>--<><>--<><>--<><>--<><>--
firstUpdate()
while true do
local res = getUpdates((LastUpdate or 0)+1)
if res then
for i=1, #res.result do
--Najva
local msgm = res.result[i]
if msgm.callback_query then
local Diamond = msgm.callback_query
if Diamond.data:match('Najva::(.*)::(.*)') then
Split = Diamond.data:split('::')
user = Split[2]
if (Diamond.from.username and Diamond.from.username:lower() == user:lower()) or tonumber(Diamond.from.id) == tonumber(user) then
if Split[3]:match('^BDMrr(.*)') then
Mrr = Split[3]:gsub('BDMrr','')
text = base:get(Mrr)
if text then
Alert(Diamond.id,Mrr..text,true)
else
Alert(Diamond.id,'◈ پیام مخفی شما باطل شده است!',true)
end
else
Alert(Diamond.id,Split[3],true)
end
else
gpfozol = base:get(TD_ID..'Fozolgp:')
base:sadd(TD_ID..'FozolList:'..gpfozol,Diamond.from.id)
Alert(Diamond.id,'◈ خجالت بکش '..Diamond.from.first_name..' نمی دونستم تا این حد فضولی ☹️\n ',true)
end
end
end

RaMiN = res.result[i]
if RaMiN.message then
msg = RaMiN.message
if msg.new_chat_members or msg.service or msg.left_chat_member or msg.new_chat_title
or msg.new_chat_photo or msg.delete_chat_photo or msg.group_chat_created
or msg.supergroup_chat_created or msg.channel_chat_created then
msg.service = true
msg.new_chat_members = true
msg.left_chat_member = false
end
if msg.text then
if msg.text:match('@'..BotUsername) then
msg.text = msg.text:gsub('@'..BotUsername, '')
end
end
Runing(msg)
vardump(msg)

if msg.chat.type == 'supergroup' then
if msg.text then
base:sadd('ID:',msg.from.id)

---sendmessage(msg.chat_id, 0, 1,jdat.porn_moderation.porn_content, 1, "html")
print(clr.blue..'['..os.date('%X')..']'..clr.red..' '..msg.text..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end


if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Lock:Poll') and not is_Vip(msg.chat.id,msg.from.id) then
if msg.poll then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.yellow..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end 
 
if not is_Vip(msg.chat.id,msg.from.id) then
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Lock:Porn')  then
if msg.video then
GifId = msg.video.file_id
GifIdRes = getRes("getFile?file_id="..GifId) 
if GifIdRes.ok then  
FilePath = GifIdRes.result.file_path
FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
PathToSave = "./Alpha/data"
Ramin = download(FileUrl,PathToSave,"video.mp4")
vardump(msg) 
local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse_video/1.0" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_video=@Alpha/data/video.mp4"'):read('*all')  
local jdat = json:decode(curl)    
--sendText(msg.chat.id,jdat.porn_moderation.porn_content,msg.message_id, 'html')
if jdat.status then 
if jdat.status == 'failure' then  
elseif jdat.status == 'success' then
if jdat.images_results[1].porn_moderation.porn_content == true then
deleteMessages(msg.chat.id,msg.message_id) 
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'Pornmutehallat') then
KickUser(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #فیلم ارسال شده  شما پورن🔞 می باشد از گروه اخراج شد!',0, 'md')
else
MuteMedia(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #فیلم ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محروم شد!',0, 'md')
end
PornType = 'true'
else 
end  
end   
end  
end
end






if msg.animation then
GifId = msg.animation.file_id
GifIdRes = getRes("getFile?file_id="..GifId) 
if GifIdRes.ok then  
FilePath = GifIdRes.result.file_path
FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
PathToSave = "./Alpha/data"
Ramin = download(FileUrl,PathToSave,"gif.mp4")
vardump(msg)
local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse_video/1.0" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_video=@Alpha/data/gif.mp4"'):read('*all')  
local jdat = json:decode(curl)    
--sendText(msg.chat.id,jdat.porn_moderation.porn_content,msg.message_id, 'html')
if jdat.status then 
if jdat.status == 'failure' then  
elseif jdat.status == 'success' then
if jdat.images_results[1].porn_moderation.porn_content == true then
deleteMessages(msg.chat.id,msg.message_id) 
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'Pornmutehallat') then
KickUser(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #گیف ارسال شده  شما پورن🔞 می باشد از گروه اخراج شد!',0, 'md')
else
MuteMedia(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #گیف ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محروم شد!',0, 'md')
end
PornType = 'true'
else 
end  
end   
end  
end
end
 
-- if msg.sticker then
-- StickerId = msg.sticker.file_id
-- StickerRes = getRes("getFile?file_id="..StickerId) 
-- if StickerRes.ok then 
-- FilePath = StickerRes.result.file_path
-- FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
-- PathToSave = "./Alpha/data"
-- Ramin = download(FileUrl,PathToSave,"Sticker.png")
-- local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse/1.1" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_image=@Alpha/data/Sticker.png"'):read('*all')  
-- local jdat = json:decode(curl)    
-- if jdat.status then 
-- if jdat.status == 'failure' then  
-- elseif jdat.status == 'success' then
-- if jdat.porn_moderation.porn_content == true then 
-- MuteMedia(msg.chat.id,msg.from.id)
-- deleteMessages(msg.chat.id,msg.message_id)
-- PornType = 'true'
-- sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز #استیکر ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محدود شدید!',0, 'md')
-- local IDS = "🔥 گزارش دریافت قفل پورن \n\n◈ وضعیت سیستم :"..jdat.status.." \n◈ نام گروه : "..msg.chat.title.."\n◈ کاربر ["..msg.from.first_name.."]|"..msg.from.id..")\n◈ وضعیت پورن:"..PornType..""
-- sendPhoto2(-1001192346957, "./Alpha/data/Sticker.png",IDS)
-- else 
-- end  
-- end   
-- end   
-- end 
-- end 


function sendPhotoRamin(chat_id,photo,caption, reply_to_message_id) 
local Url = BASSE .. '/sendPhoto?' 
local curl_command = 'curl "' .. Url .. '" -F "chat_id=' .. chat_id .. '" -F "photo=@' .. photo .. '"' 
if reply_to_message_id then 
curl_command = curl_command .. ' -F "reply_to_message_id=' .. reply_to_message_id .. '"' 
end 
if caption then 
curl_command = curl_command .. ' -F "caption=' .. caption .. '"' 
end 
return curlRequest(curl_command) 
end

-- if msg.sticker then
-- StickerId = msg.sticker.file_id
-- StickerRes = getRes("getFile?file_id="..StickerId) 
-- if StickerRes.ok then  
-- FilePath = StickerRes.result.file_path
-- FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
-- PathToSave = "./Alpha/data"
-- Ramin = download(FileUrl,PathToSave,"Sticker.jpg")
-- sendPhotoRamin(-1001192346957, Ramin,'Ramin')
-- base:set(TD_ID.."ToshPornuser",msg.from.id)
-- base:set(TD_ID.."ToshPornchat",msg.chat.id)
-- end  
-- end 


-- if msg.from.id == tonumber(BotJoiner)  then
-- if msg.photo then
-- PhotoFile = msg.photo[4] or msg.photo[3] or msg.photo[2] or msg.photo[1]
-- PhotoFileId = PhotoFile.file_id
-- PhotoPathRes = getRes("getFile?file_id="..PhotoFileId)
-- if PhotoPathRes.ok then
-- FilePath = PhotoPathRes.result.file_path
-- FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
-- PathToSave = "./Alpha/data"
-- Ramin = download(FileUrl,PathToSave,"Porn.jpg") 
-- vardump(msg) 
-- local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse/1.1" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_image=@Alpha/data/Porn.jpg"'):read('*all')  
-- local jdat = json:decode(curl)    
-- --sendText(msg.chat.id,jdat.porn_moderation.porn_content,msg.message_id, 'html')
-- if jdat.status then 
-- if jdat.status == 'failure' then  
-- elseif jdat.status == 'success' then
-- if jdat.porn_moderation.porn_content == true then
-- local ToshPornuser = base:get(TD_ID.."ToshPorn") 
-- local ToshPornchat = base:get(TD_ID.."ToshPornchat") 
-- MuteMedia(ToshPornchat,ToshPornuser)
-- deleteMessages(ToshPornchat,msg.message_id)
-- PornType = 'true'
-- sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز #استیکر ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محدود شدید!',0, 'md')
-- local IDS = "🔥 گزارش دریافت قفل پورن \n\n◈ وضعیت سیستم :"..jdat.status.." \n◈ نام گروه : "..msg.chat.title.."\n◈ کاربر ["..msg.from.first_name.."]|"..msg.from.id..")\n◈ وضعیت پورن:"..PornType..""
-- sendPhoto2(-1001192346957, "./Alpha/data/Porn.jpg",IDS)
-- else 
   
-- end   
-- end 
-- end
-- end
-- end
-- end

if msg.photo then
PhotoFile = msg.photo[4] or msg.photo[3] or msg.photo[2] or msg.photo[1]
PhotoFileId = PhotoFile.file_id
PhotoPathRes = getRes("getFile?file_id="..PhotoFileId)
if PhotoPathRes.ok then
FilePath = PhotoPathRes.result.file_path
FileUrl = "https://api.telegram.org/file/bot"..Config.JoinToken.."/"..FilePath
PathToSave = "./Alpha/data"
Ramin = download(FileUrl,PathToSave,"Porn.jpg")
vardump(msg) 
local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse/1.1" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_image=@Alpha/data/Porn.jpg"'):read('*all')  
local jdat = json:decode(curl)    
--sendText(msg.chat.id,jdat.porn_moderation.porn_content,msg.message_id, 'html')
if jdat.status then 
if jdat.status == 'failure' then  
elseif jdat.status == 'success' then
if jdat.porn_moderation.porn_content == true then
if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'Pornmutehallat') then
KickUser(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #عکس ارسال شده  شما پورن🔞 می باشد از گروه اخراج شد!',0, 'md')
else
MuteMedia(msg.chat.id,msg.from.id)
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز  #عکس ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محروم شد!',0, 'md')
end
deleteMessages(msg.chat.id,msg.message_id)
PornType = 'true'
sendText(msg.chat.id,'◈ کاربر ['..msg.from.first_name..'](tg://user?id='..msg.from.id..') عزیز #عکس ارسال شده  شما پورن🔞 می باشد از ارسال رسانه ها محدود شدید!',0, 'md')
local IDS = "🔥 گزارش دریافت قفل پورن \n\n◈ وضعیت سیستم :"..jdat.status.." \n◈ نام گروه : "..msg.chat.title.."\n◈ کاربر ["..msg.from.first_name.."]|"..msg.from.id..")\n◈ وضعیت پورن:"..PornType..""
sendPhoto2(-1001192346957, "./Alpha/data/Porn.jpg",IDS)
else 
end  
end   
end   
end 
end
end
end 
 




if not is_Vip(msg.chat.id,msg.from.id) then
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Link')   then
if msg.text then
if msg.text:match('[Tt].[Mm][Ee]/') or msg.text:match('[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/') or msg.text:match('[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/') or msg.text:match('[Tt].[Mm][Ee]/') or msg.text:match(' [Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/ ')  then
deleteMessages(msg.chat.id,msg.message_id)
deleteMessagesAlert(msg.chat.id,msg.message_id,'لینک ارسال نکن', true)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
end

if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Username')   then
if msg.text then
if msg.text:match('@') then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Tag')   then
if msg.text then
if msg.text:match('#') then  
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Link')   then
if msg.connected_website then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Forward')   then
if msg.forward_from then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Voice')   then
if msg.voice then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Reply')   then
if msg.reply_to_message then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Dice')  then
if msg.dice then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Photo')  then
if msg.photo then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Stickers')  then
if msg.sticker then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Video')  then
if msg.video then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Videomsg')  then
if msg.video_note then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Contact')  then
if msg.contact then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end

if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Game')  then
if msg.game then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end



if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Game')  then
if msg.via_bot then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Gif')  then
if msg.animation then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Del:Audio')  then
if msg.audio then
deleteMessages(msg.chat.id,msg.message_id)
print(clr.green..'['..os.date('%X')..']'..clr.red..' '..clr.reset..'['..msg.from.first_name..']--> ['..msg.chat.id..']')
end
end

if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Lock:TGservice') then
if msg.new_chat_member or msg.left_chat_member or msg.new_chat_title then
base:sadd('ID:',msg.from.id)
deleteMessages(msg.chat.id,msg.message_id)
end
end

if base:sismember(TD_ID..'Gp:'..msg.chat.id,'Lock:Join') then
if msg.new_chat_member or msg.left_chat_member or msg.new_chat_title  then
sendText(msg.chat.id,'◈کاربر ['..msg.from.first_name:escape_hard()..'](tg://user?id='..msg.from.id..') اخراج شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂علت اخراج : قفل ورود اعضا جدید فعال می باشد.',0,'md')
KickUser(msg.chat.id,msg.from.id)
UnRes(msg.chat.id,msg.from.id)
end
end

if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'tabchires') then
if msg.new_chat_member or msg.left_chat_member or msg.new_chat_title then
MuteUser(msg.chat.id,msg.from.id,0)
UnRes(msg.chat.id,msg.from.id)
end
end

if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'forcejoin') and not is_Vip(msg.chat.id,msg.from.id) and not msg.new_chat_member or msg.left_chat_member or msg.new_chat_title then
local username = '<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..'</a>'
local forcejoin = "◈کاربر عزیز "..username.."\n◈ برای ارسال پیام در این گروہ باید عضو کانال شوید"
local channelnameX = base:get(TD_ID..'setch:'..msg.chat.id) or '..Channel..'
if channelnameX then
url = https.request("https://api.telegram.org/bot"..Token.."/getchatmember?chat_id=@"..channelnameX.."&user_id="..msg.from.id)
LockJoin = json:decode(url)
if LockJoin.ok == false or LockJoin.error_code == 400 then
base:srem(TD_ID..'Gp2:'..msg.chat.id,'forcejoin')
else
if LockJoin.result.status == "left" or LockJoin.result.status == "kicked" or not LockJoin.ok then
deleteMessages(msg.chat.id,msg.message_id)
local warn = base:get(TD_ID..'joinwarn:'..msg.chat.id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat.id
local endwarn = base:hget(startwarn,msg.from.id) or 1
if tonumber(endwarn) > tonumber(warn) then
else
if msg.from.username then
user = '@'..msg.from.username
else
user = '-'
end
local username = '<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..'</a>'
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat.id) or 'عضویت درکانال '
local forcejoin = base:get(TD_ID..'Text:Chjoin:'..msg.chat.id) or ' ◈کاربر عزیز '..username..'\n◈ برای ارسال پیام در این گروہ باید عضو کانال شوید '
local forcejoin = replace(forcejoin,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..'</a>')
local forcejoin = replace(forcejoin,'FIRSTNAME',msg.from.first_name)
local forcejoin = replace(forcejoin,'LASTNAME',msg.from.last_name or '')
local forcejoin = replace(forcejoin,'USERNAME','@'..user)
local forcejoin = replace(forcejoin,'ENDWARN',''..endwarn) or ''
local forcejoin = replace(forcejoin,'WARN',''..warn) or ''
local forcejoin = replace(forcejoin,'NameCH',''..chname) or ''
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = chname,url='https://telegram.me/'..channelnameX}
}
}

send_inline(msg.chat.id,''..forcejoin..'\n',keyboard,'html')
base:hset(startwarn,msg.from.id,tonumber(endwarn) + 1)
end
end
end
else
base:srem(TD_ID..'Gp2:'..msg.chat.id,'forcejoin')
end
end



if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'forcejoinmute') and not is_Vip(msg.chat.id,msg.from.id) and not msg.new_chat_member or msg.left_chat_member or msg.new_chat_title then
local username = '<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..'</a>'
--local forcejoin = "◈کاربر عزیز "..username.."\n◈ برای ارسال پیام در این گروہ باید عضو کانال شوید"
local channelnameX = base:get(TD_ID..'setch:'..msg.chat.id) or '..Channel..'
if channelnameX then
url = https.request("https://api.telegram.org/bot"..Token.."/getchatmember?chat_id=@"..channelnameX.."&user_id="..msg.from.id)
LockJoin = json:decode(url)
if LockJoin.ok == false or LockJoin.error_code == 400 then
base:srem(TD_ID..'Gp2:'..msg.chat.id,'forcejoinmute')
else
if LockJoin.result.status == "left" or LockJoin.result.status == "kicked" or not LockJoin.ok then
deleteMessages(msg.chat.id,msg.message_id)
local warn = base:get(TD_ID..'joinwarn:'..msg.chat.id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat.id
local endwarn = base:hget(startwarn,msg.from.id) or 1
if tonumber(endwarn) > tonumber(warn) then
else
if msg.from.username then
user = '@'..msg.from.username
else
user = '-'
end
local username = '<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..'</a>'
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat.id) or 'عضویت درکانال '
local forcejoin = base:get(TD_ID..'Text:Chjoin:'..msg.chat.id) or ' ◈کاربر عزیز '..username..'\n◈ برای ارسال پیام در این گروہ باید عضو کانال شوید '
local forcejoin = replace(forcejoin,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.from.id..'"> '..msg.from.first_name:escape_hard()..'</a>')
local forcejoin = replace(forcejoin,'FIRSTNAME',msg.from.first_name)
local forcejoin = replace(forcejoin,'LASTNAME',msg.from.last_name or '')
local forcejoin = replace(forcejoin,'USERNAME','@'..user)
local forcejoin = replace(forcejoin,'ENDWARN',''..endwarn) or ''
local forcejoin = replace(forcejoin,'WARN',''..warn) or ''
local forcejoin = replace(forcejoin,'NameCH',''..chname) or ''
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = chname,url='https://telegram.me/'..channelnameX}
}
}

--send_inline(msg.chat.id,''..forcejoin..'\n',keyboard,'html')
base:hset(startwarn,msg.from.id,tonumber(endwarn) + 1)
end
end
end
else
base:srem(TD_ID..'Gp2:'..msg.chat.id,'forcejoinmute')
end
end



if base:sismember(TD_ID..'Gp2:'..msg.chat.id,'tabchiresmedia') then
if msg.new_chat_member or msg.left_chat_member or msg.new_chat_title then
if not base:get(TD_ID..'CL:tabchire:'..msg.chat.id) then
ST = 5
else
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..msg.chat.id))
end
t = ST * 60
MuteMediaTime(msg.chat.id,msg.from.id,msg.date+t)
end
end


if msg.new_chat_member and base:sismember(TD_ID..'Gp2:'..msg.chat.id,'Welcomeon') then
txtt = base:get(TD_ID..'Text:Welcome:'..msg.chat.id) or "🌸 سلام firstnameman \nبه گروه group خوش آمدید !‌‌‌\n "..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..""
local Rules = base:get(TD_ID.."Rules:"..msg.chat.id) or ""
if getChatMember(msg.chat.id, BotJoiner).result.can_invite_users then
exportChatInviteLink(msg.chat.id)
Link = getChat(msg.chat.id).result.invite_link
end
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local mm = "<a href=\"tg://user?id=" .. msg.new_chat_member.id .. "\">" .. check_html(msg.new_chat_member.first_name) .. "</a>"
local time = jdate("#h:#m:#s")
local date = jdate("#x , #Y/#M/#D")
local txtt = txtt:gsub("time", time)
local txtt = txtt:gsub("date", date)
local txtt = txtt:gsub("firstnameman", mm)
local txtt = txtt:gsub("firstname", msg.new_chat_member.first_name or "")
local txtt = txtt:gsub("rules", Rules)
local txtt = txtt:gsub("link", Link or "خطا 404 !")
local txtt = txtt:gsub("lastname", msg.new_chat_member.last_name or "")
local txtt = txtt:gsub("group", msg.chat.title or "---")
local txtt = txtt:gsub("group", "<b>" .. msg.chat.title .. "</b>" or "---")
local txtt = txtt:gsub('member',membersgroup or "")
if not base:get(TD_ID.."Welcome:Document" .. msg.chat.id) and not base:get(TD_ID.."Welcome:Photo" .. msg.chat.id) and not base:get(TD_ID.."Welcome:Gif" .. msg.chat.id) and not base:get(TD_ID.."Welcome:voice" .. msg.chat.id) and not base:get(TD_ID.."Welcome:video" .. msg.chat.id) then
sendText(msg.chat.id, txtt,0 , "html")
elseif base:get(TD_ID.."Welcome:Document" .. msg.chat.id) then
sendDocument(msg.chat.id, base:get(TD_ID.."Welcome:Document" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:voice" .. msg.chat.id) then
sendVoice(msg.chat.id, base:get(TD_ID.."Welcome:voice" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:video" .. msg.chat.id) then
sendVideo(msg.chat.id, base:get(TD_ID.."Welcome:video" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:Gif" .. msg.chat.id) then
sendGif(msg.chat.id, base:get(TD_ID.."Welcome:Gif" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:Photo" .. msg.chat.id) then
sendPhoto(msg.chat.id, base:get(TD_ID.."Welcome:Photo" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:videonote" .. msg.chat.id) then
sendVideonote(msg.chat.id, base:get(TD_ID.."Welcome:videonote" .. msg.chat.id), 0, txtt, "html")
end
end



if msg.new_chat_member and base:get(TD_ID..'welcometime:'..msg.chat.id) then
txtt = base:get(TD_ID..'Text:Welcome:'..msg.chat.id) or "🌸 سلام firstnameman \nبه گروه group خوش آمدید !‌‌‌\n "..jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')..""
local Rules = base:get(TD_ID.."Rules:"..msg.chat.id) or ""
if getChatMember(msg.chat.id, BotJoiner).result.can_invite_users then
exportChatInviteLink(msg.chat.id)
Link = getChat(msg.chat.id).result.invite_link
end
local membersgroup = ( membersCount(msg.chat.id).result or "--")
local mm = "<a href=\"tg://user?id=" .. msg.new_chat_member.id .. "\">" .. check_html(msg.new_chat_member.first_name) .. "</a>"
local time = jdate("#h:#m:#s")
local date = jdate("#x , #Y/#M/#D")
local txtt = txtt:gsub("time", time)
local txtt = txtt:gsub("date", date)
local txtt = txtt:gsub("firstnameman", mm)
local txtt = txtt:gsub("firstname", msg.new_chat_member.first_name or "")
local txtt = txtt:gsub("rules", Rules)
local txtt = txtt:gsub("link", Link or "خطا 404 !")
local txtt = txtt:gsub("lastname", msg.new_chat_member.last_name or "")
local txtt = txtt:gsub("group", msg.chat.title or "---")
local txtt = txtt:gsub("group", "<b>" .. msg.chat.title .. "</b>" or "---")
local txtt = txtt:gsub('member',membersgroup or "")
if not base:get(TD_ID.."Welcome:Document" .. msg.chat.id) and not base:get(TD_ID.."Welcome:Photo" .. msg.chat.id) and not base:get(TD_ID.."Welcome:Gif" .. msg.chat.id) and not base:get(TD_ID.."Welcome:voice" .. msg.chat.id) and not base:get(TD_ID.."Welcome:video" .. msg.chat.id) then
sendText(msg.chat.id, txtt,0 , "html")
elseif base:get(TD_ID.."Welcome:Document" .. msg.chat.id) then
sendDocument(msg.chat.id, base:get(TD_ID.."Welcome:Document" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:voice" .. msg.chat.id) then
sendVoice(msg.chat.id, base:get(TD_ID.."Welcome:voice" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:video" .. msg.chat.id) then
sendVideo(msg.chat.id, base:get(TD_ID.."Welcome:video" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:Gif" .. msg.chat.id) then
sendGif(msg.chat.id, base:get(TD_ID.."Welcome:Gif" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:Photo" .. msg.chat.id) then
sendPhoto(msg.chat.id, base:get(TD_ID.."Welcome:Photo" .. msg.chat.id), 0, txtt, "html")
elseif base:get(TD_ID.."Welcome:videonote" .. msg.chat.id) then
sendVideonote(msg.chat.id, base:get(TD_ID.."Welcome:videonote" .. msg.chat.id), 0, txtt, "html")
end
end


end



elseif msg.chat.type == 'private' then
if msg.text then
--PV(msg)
end
end
elseif RaMiN.callback_query then
msg = RaMiN.callback_query
callback(msg)
vardump(msg)
EditProcess(msg)
end
end
for i,msg in pairs(res.result) do
LastUpdate = msg.update_id
if msg.edited_message then
elseif msg.callback_query then

end
end
else
print(clr.red..'=> Connection Error!'..clr.reset)
end
end
return p
--FINISH BY : @Mrtmalpha
