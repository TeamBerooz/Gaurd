
Config = dofile('./Alpha/Config.lua')
RaminALPHA = '*Alpha Tm*'
SUDO = Config.SUDO_ID
UserSudo = '@'..Config.Sudo1
PvUserSudo = '@'..Config.PvSudo1
Full_Sudo = Config.Full_Sudo
Sudoid = Config.Sudoid
TD_ID = Config.TD_ID
Paybot = Config.Paybot
BotCliId = Config.BotJoiner
BotJoiner = Config.BotJoiner
UserJoiner = Config.UserJoiner
Channel = '@'..Config.Channel
LinkSuppoRt = Config.LinkSuppoRt
JoinToken = Config.JoinToken
json = dofile('./Alpha/JSON.lua')
clr = require 'term.colors'
iP = '185.81.98.195'
serpent = dofile('./Alpha/serpent.lua')
serpent = dofile('./Alpha/serpent.lua')
--Tabchi = (loadfile "./Tabchi.lua")()
lgi = require ('lgi')
notify = lgi.require('Notify')
notify.init ("Telegram updates")
jsons = (loadfile "./Alpha/JSON.lua")()
chats = {}
base = dofile('./Alpha/redis.lua')
tdbot = dofile('./Alpha/tdbot.lua')
base:select(Config.RedisIndex)
utf8 = dofile('./Alpha/utf8.lua')
dkjson = dofile('./Alpha/dkjson.lua')
http = require("socket.http")
https = require("ssl.https")
URL = require("socket.url")
jdate = dofile ('./jdate.lua')
offset = 0
minute = 60
hour = 3600
day = 86400
week = 604800
MsgTime = os.time() - 60
Plan1 = 2592000
Plan2 = 7776000
local Bot_Api = 'https://api.telegram.org/bot' .. JoinToken
local function info_bot(extra, result)
our_id = result.id
end
assert (tdbot_function ({_ = "getMe",}, info_bot, nil))
color = {
ramin = {"\027[30m", "\027[40m"},
red = {"\027[31m", "\027[41m"},
green = {"\027[32m", "\027[42m"},
yellow = {"\027[33m", "\027[43m"},
blue = {"\027[34m", "\027[44m"},
magenta = {"\027[35m", "\027[45m"},
cyan = {"\027[36m", "\027[46m"},
white = {"\027[37m", "\027[47m"},
default = "\027[00m"
}
----------------------------------------------
http.TIMEOUT = 10
notify.init("Telegram updates")
local senspost = {
cappost = 70,
cappostwithtag = 50,
textpost = 200,
textpostwithtag = 130
}


function dl_cb(arg, data)
end
local function getParse(parse_mode)
local P = {}
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P._ = 'textParseModeMarkdown'
elseif mode == 'html' then
P._ = 'textParseModeHTML'
end
end
return P
end




function okname(name)
txt = name
if txt then
if txt:match('_') then
txt = txt:gsub('_','')
elseif txt:match('*') then
txt = txt:gsub('*','')
elseif txt:match('`') then
txt = txt:gsub('`','')
elseif txt:match('#') then
txt = txt:gsub('#','')
elseif txt:match('@') then
txt = txt:gsub('@','')
elseif txt:match('>') then
txt = txt:gsub('>','')
elseif txt:match('<') then
txt = txt:gsub('<','')
elseif txt:match('\n') then
txt = txt:gsub('\n','')
end
return txt
end
end

function isLeaderBots(msg)
local var = false
if msg.sender_user_id == 935728510 then
var = true
end
return var
end
function isLeaderBots1(user)
local var = false
if user == 935728510 then
var = true
end
return var
end

function is_configure(msg)
local var = false
if msg.sender_user_id == 935728510 or isLeaderBots(msg) then
var = true
end
return var
end


--------**Sudo**--------
function is_Sudo(msg)
local var = false
for v,user in pairs(SUDO) do
if user == (msg.sender_user_id) then
var = true
end
end
if base:sismember(TD_ID..'SUDO',msg.sender_user_id) then
var = true
end
if Sudo == tonumber(msg.sender_user_id) then
var = true
end
return var
end
--------**FullSudo**--------
function is_FullSudo(msg)
local var = false
for v,user in pairs(Full_Sudo) do
if user == msg.sender_user_id then
var = true
end
end
return var
end
function do_notify (user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
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
function is_GlobalyBanBot(user_id)
local var = false
local hash = TD_ID..'GlobalyBannedBot:'
local gbanned = base:sismember(hash,user_id)
if gbanned then
var = true
end
return var
end
------------------------
function is_GlobalyMute(user_id)
local var = false
local hash = TD_ID..'AGTMute:'
local gbanned = base:sismember(hash,user_id)
if gbanned then
var = true
end
return var
end
--------**Owner**--------
function is_Owner(msg)
local hash = base:sismember(TD_ID..'OwnerList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) then
return true
else
return false
end
end
function is_Nazem(msg)
local hash = base:sismember(TD_ID..'NazemList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) then
return true
else
return false
end
end
--------**Mod**--------
function is_ModAnony(msg)
local hash = base:sismember(TD_ID..'ModAnony:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end


function is_Mod(msg)
local hash = base:sismember(TD_ID..'ModList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
function is_ModTest(msg)
local hash = base:sismember(TD_ID..'ModListtest:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
---limit Clean mod----
function is_ModPin(msg)
local hash = base:sismember(TD_ID..'ModPinList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
function is_ModLockOptionSticker(msg)
local hash = base:sismember(TD_ID..'ModLockOptionSticker:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
function is_ModLockOptionGif(msg)
local hash = base:sismember(TD_ID..'ModLockOptionGif:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end


function is_ModLockOptionPhoto(msg)
local hash = base:sismember(TD_ID..'ModLockOptionPhoto:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
function is_ModLockOptionForwarded(msg)
local hash = base:sismember(TD_ID..'ModLockOptionForwarded:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
function is_ModLockOptionNazar(msg)
local hash = base:sismember(TD_ID..'ModLockOptionNazar:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end

function is_ModLockOptionFile(msg)
local hash = base:sismember(TD_ID..'ModLockOptionFile:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end

function is_ModLockOptionVoice(msg)
local hash = base:sismember(TD_ID..'ModLockOptionVoice:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end

function is_ModLockOptionLink(msg)
local hash = base:sismember(TD_ID..'ModLockOptionLink:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end

function is_ModLockOptionBot(msg)
local hash = base:sismember(TD_ID..'ModLockOptionBot:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
-------------------------
function is_ModClean(msg)
local hash = base:sismember(TD_ID..'ModCleanList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
---limit BAN mod----
function  is_ModBan(msg)
local hash = base:sismember(TD_ID..'ModBanList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
---------limit mute list------------
function is_ModMute(msg)
local hash = base:sismember(TD_ID..'ModMuteList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end

---------limit warn list------------
function is_ModWarn(msg)
local hash = base:sismember(TD_ID..'ModWarnList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
---------limit lock list------------
function is_ModLock(msg)
local hash = base:sismember(TD_ID..'ModLockList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
---------limit panel list------------
function is_ModPanelCmd(msg)
local hash = base:sismember(TD_ID..'ModpanelList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end

function is_ModVipCmd(msg)
local hash = base:sismember(TD_ID..'ModVipList:'..msg.chat_id,msg.sender_user_id)
if hash or is_Sudo(msg) or is_Owner(msg) or is_Nazem(msg) then
return true
else
return false
end
end
---------limit lock All------------
--------**Vip**--------
function is_Vip(msg)
local hash = base:sismember(TD_ID..'Vip:'..msg.chat_id,msg.sender_user_id)
if hash or is_Mod(msg) then return true
else
return false
end
end
function is_VipJoin(msg)
local hash = base:sismember(TD_ID..'VipJoin:'..msg.chat_id,msg.sender_user_id)
if hash or is_Mod(msg) then return true
else
return false
end
end
--------**BanUser**--------
function is_Banned(chat_id,user_id)
local hash = base:sismember(TD_ID..'BanUser:'..chat_id,user_id)
if hash then
return true
else
return false
end
end
--------**VipUser**--------
function VipUser(msg,user_id)
user_id = user_id or 00
local Mod = base:sismember(TD_ID..'ModList:'..msg.chat_id,user_id)
local Owner = base:sismember(TD_ID..'OwnerList:'..msg.chat_id,user_id)
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if Mod or Owner or Sudo then
return true
else
return false
end
end
function OwnUser(msg,user_id)
user_id = user_id or 00
local Owner = base:sismember(TD_ID..'OwnerList:'..msg.chat_id,user_id)
if Owner then
return true
else
return false
end
end

function NazemUser(msg,user_id)
user_id = user_id or 00
local Owner = base:sismember(TD_ID..'NazemList:'..msg.chat_id,user_id)
if Owner then
return true
else
return false
end
end
function ModUserAnony(msg,user_id)
user_id = user_id or 00
local Mod = base:sismember(TD_ID..'ModAnony:'..msg.chat_id,user_id)
if Mod then
return true
else
return false
end
end
function ModUser(msg,user_id)
user_id = user_id or 00
local Mod = base:sismember(TD_ID..'ModList:'..msg.chat_id,user_id)
if Mod then
return true
else
return false
end
end
function ModUserTest(msg,user_id)
user_id = user_id or 00
local Mod = base:sismember(TD_ID..'ModListtest:'..msg.chat_id,user_id)
if Mod then
return true
else
return false
end
end
--------------------------
function SudUser(msg,user_id)
user_id = user_id or 00
local Sudo = base:sismember(TD_ID..'SUDO',user_id)
if Sudo then
return true
else
return false
end
end

function index_function(user_id)
for k,v in pairs(Tabchi.Tab) do
if user_id == v[1] then
print(k)
return k
end
end
return false
end
function getindex(t,id)
for i,v in pairs(t) do
if v == id then
return i
end
end
return nil
end
function serialize_to_file(data, file, uglify)
file = io.open(file, 'w+')
local serialized
if not uglify then
serialized = serpent.block(data, {
comment = false,
name = '_'
})
else
serialized = serpent.dump(data)
end
file:write(serialized)
file:close()
end
function save_config( )
serialize_to_file(Tabchi, './Tabchi.lua')
end
function get_http_file_name(url, headers)
local file_name = url:match("[^%w]+([%.%w]+)$")
file_name = file_name or url:match("[^%w]+(%w+)[^%w]+$")
file_name = file_name or str:random(5)
local content_type = headers["content-type"]
local extension = nil
if content_type then
extension = mimetype.get_mime_extension(content_type)
end
if extension then
file_name = file_name.."."..extension
end
local disposition = headers["content-disposition"]
if disposition then
file_name = disposition:match('filename=([^;]+)') or file_name
end
return file_name
end
function string.starts(String, Start)
return Start == string.sub(String,1,string.len(Start))
end
function scandir(directory)
local i, t, popen = 0, {}, io.popen
for filename in popen('ls -a "'..directory..'"'):lines() do
i = i + 1
t[i] = filename
end
return t
end
function exi_filef(path, suffix)
local files = {}
local pth = tostring(path)
local psv = tostring(suffix)
for k, v in pairs(scandir(pth)) do
if (v:match('.'..psv..'$')) then
table.insert(files, v)
end
end
return files
end
function file_exif(name, path, suffix)
local fname = tostring(name)
local pth = tostring(path)
local psv = tostring(suffix)
for k,v in pairs(exi_filef(pth, psv)) do
if fname == v then
return true
end
end
return false
end
--------**filter**--------
function is_filter(msg,value)
local list = base:smembers(TD_ID..'Filters:'..msg.chat_id)
var = false
for i=1, #list do
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'FilterSen') then
Ramin = value:match(list[i])
else
Ramin = value:match(' '..list[i]..' ') or value:match('^'..list[i]..' ') or value:match(' '..list[i]..'$') or value:match('^'..list[i]..'$')
end
if Ramin then
var = true
end
end
return var
end


function is_emoji(msg,value)
local list = {
'😀','😃','😄','😁','😆','😅','😂','😉','🙃','🙂','😇','😊','☺️','🤣','😌','😍','🥰','😘','😗','😙','😚','🧐','🤨','🤪','😜','😝','😛','😋','🤓','😎','🤩','🥳','😏','😒','😞','😖','😣','☹️','🙁','😕','😟','😔','😫','😩','🥺','😢','😭','😤','😠','😱','🥶','🥵','😳','🤯','🤬','😡','😨','😰','😥','😓','🤗','🤔','🤭','🙄','😬','😑','😐','😶','🤥','🤫','😯','😦','😧','😮','😲','🥱','😴','🤤','😪','😵','🤐','🥴','🤢','🤮','🤧','😷','🤒','🤕','🤑','🤠','😈','☠️','👽','👾','🤖','🎃','😺','😸','😹','😻','😼','😽','🙀','😿','😾','🤏','🦿','💄','💋','👄','🦷','👅','👂','👃','👣','👁','👀','🧠','🗣','👤','👥','👙','🐵','🙈','🙉','🙊','🌹','🥀','🌺','🌸','🌷','💐','🌾','☄️','💥','🔥','💦','💧','🍆','🍑','💉','💞','💓','❤️','🧡','💛','💚','💙','💜','🖤','💗','💖','💘','💝','❌','⭕️','🛑','⛔️','📛','🚫','🚱','🚳','🚯','🚷','🚭','📵','🔞'
}
var = false
for i=1, #list do
if value:match(list[i]) then
var = true
end
end
return var
end




function is_badw(msg,value)
local list = {
'koni',
"koskash",
"kir",
"kos",
"کونی",
"کیر",
"کون",
"جنده",
"اوبی",
"لز",
"گی",
"سکس",
"سکسی",

}
var = false
for i=1, #list do
if value:match(list[i]) then
var = true
end
end
return var
end



function is_filterjoin(msg,value)
local list = base:smembers(TD_ID..'Filtersjoin:'..msg.chat_id)
var = false
for i=1, #list do
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'FilterSent') then
Ramin = value:match(list[i])
else
Ramin = value:match(' '..list[i]..' ') or value:match('^'..list[i]..' ') or value:match(' '..list[i]..'$') or value:match('^'..list[i]..'$')
end
if Ramin then
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
--------**ec_name**--------
function ec_name(name)
Ramin = name
if Ramin then
if Ramin:match('_') then
Ramin = Ramin:gsub('_','')
end
if Ramin:match('*') then
Ramin = Ramin:gsub('*','')
end
if Ramin:match('*') then
Ramin = Ramin:gsub('*','')
end
Ramin = Ramin:gsub('[[%]]', '')
return Ramin
end
end
--------**check_markdown**--------
function check_markdown(text)
str = text
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
---------**Sleep & Split**--------
local function sleep(n)
os.execute("sleep "..n)
end
function string:split(sep)
local sep, fields = sep or ":", {}
local pattern = string.format("([^%s]+)", sep)
self:gsub(pattern, function(c) fields[#fields+1] = c end)
return fields
end
--------**sendChatAction**--------
function sendChatAction(chatid, act, uploadprogress)
assert (tdbot_function ({
_ = 'sendChatAction',
chat_id = chatid,
action = {
_ = 'chatAction' .. act,
progress = uploadprogress
},
}, dl_cb, nil))
end
---------**GetChatId**--------
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {id = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {id = group_id, type = 'group'}
end
return chat
end
local function getMe(cb)
assert (tdbot_function ({
_ = "getMe",
}, cb, nil))
end
---------**Pin & UnPin**---------
function Pin(channelid,messageid,disablenotification)
assert (tdbot_function ({
_ = "pinChannelMessage",
channel_id = getChatId(channelid).id,
message_id = messageid,
disable_notification = disablenotification
}, dl_cb, nil))
end
function Unpin(channelid)
assert (tdbot_function ({
_ = 'unpinChannelMessage',
channel_id = getChatId(channelid).id
}, dl_cb, nil))
end
---------**KickUser**---------
function KickUser(chat_id, user_id)
tdbot_function ({
_ = "changeChatMemberStatus",
chat_id = chat_id,
user_id = user_id,
status = {
_ = "chatMemberStatusBanned"
},
}, dl_cb, nil)
end
---------**reportChannelSpam**---------
function reportChannelSpam(channelid, userid, messageids)
assert (tdbot_function ({
_ = 'reportChannelSpam',
channel_id = getChatId(channelid).id,
user_id = userid,
message_ids = getVector(messageids)
}, callback or dl_cb, data))
end
---------**GetFile**--------
function getFile(fileid,cb)
assert (tdbot_function ({
_ = 'getFile',
file_id = fileid
}, cb, nil))
end
---------**Left**----------
function Left(chat_id, user_id, s)
assert (tdbot_function ({
_ = "changeChatMemberStatus",
chat_id = chat_id,
user_id = user_id,
status = {
_ = "chatMemberStatus" ..s
},
}, dl_cb, nil))
end
function Leave_api(chat_id)
local Rep = Bot_Api.. '/LeaveChat?chat_id=' .. chat_id
return https.request(Rep)
end
function vardump(value)
--print(serpent.block(value, {comment=true}))
end
---------**ChangeDes**----------
function changeDes(BlaCk,ALPHA)
assert (tdbot_function ({
_ = 'changeChannelDescription',
channel_id = getChatId(BlaCk).id,
description = ALPHA
}, dl_cb, nil))
end
--------**ChangeChatTitle**---------
function changeChatTitle(chat_id,title)
assert (tdbot_function ({
_ = "changeChatTitle",
chat_id = chat_id,
title = title
}, dl_cb, nil))
end

function deleteProfilePhoto(profilephotoid)
assert (tdbot_function ({
_ = 'deleteProfilePhoto',
profile_photo_id = profilephotoid
},dl_cb, nil))
end

function changeName(firstname)
assert (tdbot_function ({
_ = 'changeName',
first_name = tostring(firstname),
last_name = ''
},dl_cb, nil))
end
---------**Change bot Ab**----------
function changeAbout(abo)
assert (tdbot_function ({
_ = 'changeAbout',
about = tostring(abo)
},dl_cb, nil))
end

function changeUsername(uname)
assert (tdbot_function ({
_ = 'changeUsername',
username = tostring(uname)
},dl_cb, nil))
end




---------**Mute**----------
function changeChatDescription(chat_id, des)
local bot = Config.JoinToken
local url = 'https://api.telegram.org/bot'..bot
local t = url..'/setChatDescription?chat_id='..chat_id..'&description='..des
return https.request(t)
end
function MuteUser(chat_id,user_id,time)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=false&until_date='..time
return https.request(Rep)
end

function kickChatMemberTime(chat_id,user_id,time)
local Rep = Bot_Api.. '/kickChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&until_date='..time
return https.request(Rep)
end

function MuteUser2(chat_id,user_id,time)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_send_media_messages=false&until_date='..time
return https.request(Rep)
end
function UnRes(chat_id,user_id)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=true&can_send_media_messages=true'
return https.request(Rep)
end
function MuteMedia(chat_id,user_id)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=false&can_send_media_messages=false'
return https.request(Rep)
end
function MuteMediaTime(chat_id,user_id,time)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=false&can_send_media_messages=false&until_date='..time
return https.request(Rep)
end
function SetAdmins(chat_id, user_id)
local Rep  = Bot_Api .. '/promoteChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_change_info=true&can_pin_messages=true&can_restrict_members=true&can_invite_users=true&can_delete_messages=true'
return https.request(Rep)
end

function membersCount(chat_id)
local Rep = Bot_Api..'/getChatMembersCount?chat_id='.. chat_id
return https.request(Rep)
end


function resolve_username(username,cb)
tdbot_function ({
_ = "searchPublicChat",
username = username
}, cb, nil)
end
function remadmins(chat_id, user_id)
local Rep  = Bot_Api .. '/promoteChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_change_info=false&can_pin_messages=false&can_restrict_members=false&can_invite_users=false&can_delete_messages=false'
return https.request(Rep)
end




function cleanmsgs(chatid, frommessageid, off, lim, onlylocal, callback, data)
assert (tdbot_function ({
_ = 'getChatHistory',
chat_id = chatid,
from_message_id = frommessageid,
offset = off,
limit = lim,
only_local = onlylocal
}, callback or dl_cb, data))
end
function getChatHistory(chat_id, from_message_id, offset, limit,cb)
tdbot_function ({
_ = "getChatHistory",
chat_id = chat_id,
from_message_id = from_message_id,
offset = offset,
limit = limit
}, cb, nil)
end
function deleteMessagesFromUser(chat_id, user_id)
tdbot_function ({
_ = "deleteMessagesFromUser",
chat_id = chat_id,
user_id = user_id
}, dl_cb, nil)
end
local function getMessage(chat_id, message_id,cb)
tdbot_function ({
_ = "getMessage",
chat_id = chat_id,
message_id = message_id
}, cb, nil)
end
function GetChat(chat_id,cb)
assert (tdbot_function ({
_ = 'getChat',
chat_id = chat_id
}, cb, nil))
end
function sendInline(chat_id, replytomessageid, disablenotification, frombackground, queryid, result_id)
assert (tdbot_function ({
_ = 'sendInlineQueryResultMessage',
chat_id = chat_id,
reply_to_message_id = replytomessageid,
disable_notification = disablenotification,
from_background = frombackground,
query_id = queryid,
result_id = tostring(result_id)
}, dl_cb,nil))
end
function editMessageText(chat_id,message_id,text,keyboard,markdown,preview)
BASSE = "https://api.telegram.org/bot"..Config.JoinToken.."/"
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

function EdiT(msg,text,keyboard,markd)
return editMessageText(chat_id,message_id,text,keyboard,markd,preview)
end

function sendMessageApi(chat_id, text, reply_to_message_id, markdown)
local bot = Config.JoinToken
local url = 'https://api.telegram.org/bot'..bot
local url = url .. '/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text)

if reply_to_message_id then
url = url .. '&reply_to_message_id=' .. reply_to_message_id
end

if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end

return https.request(url)
end

function sendinlinep(chat_id_,reply_to_message_id,photo,keyboard)
local bot = Config.JoinToken
local url = 'https://api.telegram.org/bot'..bot
tokens = url .. '//sendPhoto?chat_id=' ..chat_id_.. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 ..'&photo='..photo..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
https.request(tokens)
end

function editt(chat_id, message_id, text,parse)
assert (tdbot_function ({
_ = 'editMessageText',chat_id = chat_id,
message_id = message_id,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageText',
text = text,
disable_web_page_preview = 0,
clear_draft = 0,
entities = {},
parse_mode = getParse(parse)
},
}, dl_cb,nil))
end

function editMessageCaption(chat_id, message_id,reply_markup,capt,callback,data)
assert (tdbot_function ({
_ = 'editMessageCaption',
chat_id = chatid,
message_id = messageid,
reply_markup = replymarkup,
caption = tostring(capt)
}, callback or dl_cb, data))
end

function getTextEntities(text, callback, data)
assert (tdbot_function ({
_ = 'getTextEntities',
text = tostring(text)
}, callback or dl_cb, data))
end
function openChat(chatid)
assert (tdbot_function ({
_ = 'openChat',
chat_id = chatid
}, dl_cb, nil))
end
function get(bot_user_id, chat_id, latitude, longitude, query,offset, cb)
assert (tdbot_function ({
_ = 'getInlineQueryResults',
bot_user_id = bot_user_id,
chat_id = chat_id,
user_location = {
_ = 'location',
latitude = latitude,
longitude = longitude
},
query = tostring(query),
offset = tostring(off)
}, cb, nil))
end
function sendBotStartMessage(bot_user_id, chat_id, parameter)
assert (tdbot_function ({_ = 'sendBotStartMessage',bot_user_id = bot_user_id,chat_id = chat_id,parameter = tostring(parameter)},dl_cb,nil))
end

function  viewMessages(chat_id, message_ids)
tdbot_function ({
_ = "viewMessages",
chat_id = chat_id,
message_ids = message_ids
}, dl_cb, nil)
end

function getInputFile(file, conversion_str, expectedsize)
local input = tostring(file)
local infile = {}
if (conversion_str and expectedsize) then
infile = {_ = 'inputFileGenerated',original_path = tostring(file),conversion = tostring(conversion_str),expected_size = expectedsize}
else
if input:match('/') then
infile = {_ = 'inputFileLocal', path = file}
elseif input:match('^%d+$') then
infile = {_ = 'inputFileId', id = file}
else
infile = {_ = 'inputFilePersistentId', persistent_id = file}
end
end
return infile
end


function setProfilePhoto(photo_path)
assert (tdbot_function ({
_ = 'setProfilePhoto',
photo = getInputFile(photo_path)
}, callback or dl_cb, data))
end

function addChatMembers(chatid, userids)
assert (tdbot_function ({
_ = 'addChatMembers',
chat_id = chatid,
user_ids = userids,
},  dl_cb, nil))
end
function GetChannelFull(channelid)
assert (tdbot_function ({
_ = 'getChannelFull',
channel_id = getChatId(channelid).id
}, cb, nil))
end
function load_data(filename)
local f = io.open(filename)
if not f then
return {}
end
local s = f:read('*all')
f:close()
local data = JSON.decode(s)
return data
end
function Alpha(num)
list={'０','１','２','３','４','５','６','７','８','９'}
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
function Alphar(num)
list={'{ندارد}','۱','۲','۳','۴','۵','۶','۷','۸','۹'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end

function Alphaee(num)
list={'0️⃣','1️⃣','2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end

function save_data(filename, data)
local s = JSON.encode(data)
local f = io.open(filename, 'w')
f:write(s)
f:close()
end
function changeChatPhoto(chat_id,photo)
assert (tdbot_function ({
_ = 'changeChatPhoto',
chat_id = chat_id,
photo = getInputFile(photo)
}, dl_cb, nil))
end

function getFile(fileid)
assert (tdbot_function ({
_ = 'getFile',
file_id = fileid
},dl_cb,nil))
end
function GetWeb(messagetext,cb)
assert (tdbot_function ({
_ = 'getWebPagePreview',
message_text = tostring(messagetext)
}, cb, nil))
end

function DWN(fileid)
assert (tdbot_function ({_ = 'downloadFile',file_id = fileid,priority = 32},  dl_cb, nil))
end



function downloadFile(fileid, priorities)
assert (tdbot_function ({
_ = 'downloadFile',
file_id = fileid,
priority = priorities
}, callback or dl_cb, nil))
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
function GetUser(user_id, cb)
assert (tdbot_function ({
_ = 'getUser',
user_id = user_id
}, cb, nil))
end
local function GetUserFull(user_id,cb)
assert (tdbot_function ({
_ = "getUserFull",
user_id = user_id
}, cb, nil))
end
function file_exists(name)
local f = io.open(name,"r")
if f ~= nil then
io.close(f)
return true
else
return false
end
end

function MentionNameFixer(FName,Lname,UserName,ID)
local FName = FName or ""
local Lname = Lname or ""
local FullName = FName.. ' '..Lname
if string.len(FullName) > 20 then
if string.len(UserName) > 4 then
result = UserName
else
result = ID
end
else
result = FullName
end
if not result then
result = ID
end
return result
end

function whoami()
local usr = io.popen("whoami"):read('*a')
usr = string.gsub(usr, '^%s+', '')
usr = string.gsub(usr, '%s+$', '')
usr = string.gsub(usr, '[\n\r]+', ' ')
if usr:match("^root$") then
tcpath = '/root/.telegram-bot'
elseif not usr:match("^root$") then
tcpath = '/home/'..usr..'/.telegram-bot/AlphaApi'
end
end

function sendStickerr(chat_id, reply_to_message_id, sticker_file)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = 0,
from_background = true,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageSticker',
sticker = getInputFile(sticker_file),
thumb = sticker_thumb, -- inputThumb
width = sticker_width,
height = sticker_height
},
}, dl_cb, nil))
end
function sendSticker(chat_id, reply_to_message_id, sticker_file)
assert (tdbot_function ({_= "sendMessage",chat_id = chat_id,reply_to_message_id = reply_to_message_id,disable_notification = 0,from_background = true,reply_markup = nil,input_message_content = {_ = 'inputMessageSticker',sticker = getInputFile(sticker_file),width = 0,height = 0},}, dl_cb, nil))
end

function sendStickerRamin(chat_id, reply_to_message_id, sticker_file)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = 0,
from_background = true,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageSticker',
sticker = getInputFile(sticker_file),
width = 1280,
height = 1280
},
}, dl_cb, nil))
end


function getStickerSet(setid, callback)
assert (tdbot_function ({
_ = 'getStickerSet',
set_id = setid
}, callback or dl_cb, nil))
end
function getChannelFull(BlaCk,ALPHA)
assert (tdbot_function ({
_ = 'getChannelFull',
channel_id = getChatId(BlaCk).id
}, ALPHA, nil))
end

function Block(user_id)
assert (tdbot_function ({
_ = 'blockUser',
user_id = user_id
},dl_cb,nil))
end
function Unblock(userid)
assert (tdbot_function ({
_ = 'unblockUser',
user_id = userid
}, dl_cb,nil))
end
function getBlockedUsers(off, lim, callback, data)
assert (tdbot_function ({
_ = 'getBlockedUsers',
offset = off,
limit = lim
}, callback or dl_cb, data))
end
function ForWard(chat_id,from_id,Msg_Id)
local Rep = Bot_Api.. '/forwardMessage?chat_id=' .. chat_id .. '&from_chat_id=' .. from_id ..'&message_id='.. Msg_Id
return https.request(Rep)
end
function ForMsg(chat_id, from_chat_id, message_id,from_background)
assert (tdbot_function ({
_ = "forwardMessages",
chat_id = chat_id,
from_chat_id = from_chat_id,
message_ids = message_id,
disable_notification = 0,
from_background = from_background
}, dl_cb, nil))
end
function RemoveFromBanList(chat_id, user_id)
assert (tdbot_function ({_ = "changeChatMemberStatus",chat_id = chat_id,user_id = user_id,status = {_ = "chatMemberStatus" .."Left"},}, dl_cb, nil))
end




function Admin(chat_id, user_id, Administrator, right)
local chat_member_status = {}
if Administrator == 'Administrator' then
chat_member_status = {
can_be_edited = right and right[1] or 1,
can_change_info = right and right[2] or 1,
can_post_messages = right and right[3] or 1,
can_edit_messages = right and right[4] or 1,
can_delete_messages = right and right[5] or 1,
can_invite_users = right and right[6] or 1,
can_restrict_members = right and right[7] or 1,
can_pin_messages = right and right[8] or 1,
can_promote_members = right and right[9] or 1
}
chat_member_status._ = 'chatMemberStatus' .. Administrator
assert (tdbot_function ({_ = 'changeChatMemberStatus',chat_id = chat_id,user_id = user_id,status = chat_member_status}, dl_cb, nil))
end
end

function getChannelMembers(channelid,mbrfilter,off, limit,cb)
if not limit or limit > 2000000000 then
limit = 2000000000
end
assert (tdbot_function ({
_ = 'getChannelMembers',
channel_id = getChatId(channelid).id,
filter = {
_ = 'channelMembersFilter' .. mbrfilter,
},
offset = off,
limit = limit
}, cb, nil))
end
function download(fileid, priorities)
assert (tdbot_function ({
_ = 'downloadFile',
file_id = fileid,
priority = priorities
}, dl_cb, nil))
end





function DWN(fileid)
assert (tdbot_function ({_ = 'downloadFile',file_id = fileid,priority = 32},  dl_cb, nil))
end

function downloadFile(fileid, priorities)
assert (tdbot_function ({
_ = 'downloadFile',
file_id = fileid,
priority = priorities
}, callback or dl_cb, nil))
end
function exportChatInviteLink(chatid,cb)
assert (tdbot_function ({
_ = 'exportChatInviteLink',
chat_id = chatid
}, cb, nil))
end

function is_supergroup(msg)
chat_id = tostring(msg.chat_id)
if chat_id:match('^-100') then
if not msg.is_post then
return true
end
else
return false
end
end
function importChatInviteLink(invitelink)
assert (tdbot_function ({
_ = 'importChatInviteLink',
invite_link = tostring(invitelink)
},dl_cb, nil))
end
function deleteMessages(chat_id, message_ids)
tdbot_function ({
_= "deleteMessages",
chat_id = chat_id,
message_ids = message_ids -- vector {[0] = id} or {id1, id2, id3, [0] = id}
}, dl_cb, nil)
end
function getChatMember(chatid,userid, callback,data)
assert (tdbot_function ({
_ = 'getChatMember',
chat_id = chatid,
user_id = userid
}, callback or dl_cb, data))
end
--------**Send**--------
function send(chat_id, msg, text, parse)
assert(tdbot_function ({_ = "sendMessage",chat_id = chat_id,reply_to_message_id = msg,disable_notification = 0,from_background = 1,reply_markup = nil,input_message_content = {_ = "inputMessageText",text = text, disable_web_page_preview = 1, clear_draft = 0,parse_mode = getParse(parse),entities = {}}}, dl_cb, nil))
end




function sendPhoto2(chat_id, reply_to_message_id, photo, caption)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = 0,
from_background = true,
reply_markup = nil,
input_message_content = {
_ = "inputMessagePhoto",
photo = getInputFile(photo), 
added_sticker_file_ids = {},
width = 0,
height = 0,
caption = caption
},
}, dl_cb, nil))
end


local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = disable_notification,
from_background = from_background,
reply_markup = reply_markup,
input_message_content = {
_ = "inputMessagePhoto",
photo = getInputFile(photo),
added_sticker_file_ids = {},
width = 0,
height = 0,
caption = caption,
},
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = reply_to_message_id})
end
end

function sendAudio(chat_id, msg_id, audio,title,caption)
assert( tdbot_function ({
_ = "sendMessage",chat_id = chat_id,
reply_to_message_id = msg_id,
disable_notification = 0,
from_background = 1,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageAudio',
audio = getInputFile(audio),
duration = duration or 0,
title = tostring(title) or 0,
caption = tostring(caption)
}
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = msg_id})
end
end

function sendDocument(chat_id, reply_to_message_id,disable_notification,from_background ,reply_markup,document)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = disable_notification,
from_background = from_background,
reply_markup = reply_markup,
input_message_content = {
_ = 'inputMessageDocument',
document = getInputFile(document),
},
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = reply_to_message_id})
end
end
function sendVoice(chat_id, reply_to_message_id, voice_file,duration2, voi_waveform, voi_caption)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = 0,
from_background = 1,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageVoice',
voice = getInputFile(voice_file),
duration = duration2,
waveform = voi_waveform,
caption = tostring(voi_caption)
},
}, dl_cb, nil))
end
function scandir(directory)
local i, t, popen = 0, {}, io.popen
for filename in popen('ls -a "'..directory..'"'):lines() do
i = i + 1
t[i] = filename
end
return t
end
function exi_filef(path, suffix)
local files = {}
local pth = tostring(path)
local psv = tostring(suffix)
for k, v in pairs(scandir(pth)) do
if (v:match('.'..psv..'$')) then
table.insert(files, v)
end
end
return files
end

function file_exif(name, path, suffix)
local fname = tostring(name)
local pth = tostring(path)
local psv = tostring(suffix)
for k,v in pairs(exi_filef(pth, psv)) do
if fname == v then
return true
end
end
return false
end
function sendVideo(chat_id, reply_to_message_id, video_file, vid_caption)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = 0,
from_background = 1,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageVoice',
video = getInputFile(video_file),
thumb = vid_thumb, -- inputThumb
added_sticker_file_ids =  {},
duration = vid_duration or 0,
width = vid_width or 0,
height = vid_height or 0,
caption = tostring(vid_caption),
ttl = 0
},
}, dl_cb, nil))
end

function sendVideoNote(chat_id, reply_to_message_id,disable_notification,from_background ,reply_markup,videonote, vnote_thumb, vnote_duration, vnote_length)
assert (tdbot_function ({
_= "sendMessage",
chat_id = chat_id,
reply_to_message_id = reply_to_message_id,
disable_notification = disable_notification,
from_background = from_background,
reply_markup = reply_markup,
input_message_content = {
_ = 'inputMessageVideoNote',
video_note = getInputFile(videonote),
},
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = reply_to_message_id})
end
end
local function getParseMode(parse_mode)
local P = {}
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P._ = 'textParseModeMarkdown'
elseif mode == 'html' then
P._ = 'textParseModeHTML'
end
end
return P
end

function searchPublicChat(username,cb)
assert (tdbot_function ({_ = "searchPublicChat",username = username}, cb, nil))
end



function Block(user_id)
assert (tdbot_function ({
_ = 'blockUser',
user_id = user_id
},dl_cb,nil))
end
function Unblock(userid)
assert (tdbot_function ({
_ = 'unblockUser',
user_id = userid
}, dl_cb,nil))
end
function getBlockedUsers(off, lim, callback, data)
assert (tdbot_function ({
_ = 'getBlockedUsers',
offset = off,
limit = lim
}, callback or dl_cb, data))
end
----------
-----------
local function get_weather(location)
local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
local url = BASE_URL
url = url..'?q='..location..'&APPID=eedbc05ba060c787ab0614cad1f2e12b'
url = url..'&units=metric'
local b, c, h = http.request(url)
if c ~= 200 then return nil end
local weather = jsons:decode(b)
local city = weather.name
local country = weather.sys.country
local temp = 'دمای شهر '..city..' هم اکنون '..weather.main.temp..' درجه سانتی گراد می باشد\n____________________'
local conditions = 'شرایط فعلی آب و هوا : '
if weather.weather[1].main == 'Clear' then
conditions = conditions .. 'آفتابی☀'
elseif weather.weather[1].main == 'Clouds' then
conditions = conditions .. 'ابری ☁☁'
elseif weather.weather[1].main == 'Rain' then
conditions = conditions .. 'بارانی ☔'
elseif weather.weather[1].main == 'Thunderstorm' then
conditions = conditions .. 'طوفانی ☔☔☔☔'
elseif weather.weather[1].main == 'Mist' then
conditions = conditions .. 'مه 💨'
end
return temp .. '\n' .. conditions
end

function sendMessage(chatid, replytomessageid, disablenotification,text,frombackground,parse_mode)
assert (tdbot_function ({
_ = 'sendMessage',
chat_id = chatid,
reply_to_message_id = replytomessageid,
disable_notification = disablenotification or 0,
from_background = frombackground or 1,
reply_markup = nil,
input_message_content = {
_ = "inputMessageText",
text = text,
disable_web_page_preview = 1,
clear_draft = 0,
parse_mode = getParseMode(parse_mode),
entities = {}
}
}, callback or dl_cb, nil))
end
function sendM(chat_id, user_id, msg_id, text, offset, length)
assert (tdbot_function ({
_ = "sendMessage",
chat_id = chat_id,
reply_to_message_id = msg_id,
disable_notification = 0,
from_background = true,
reply_markup = nil,
input_message_content = {
_ = "inputMessageText",
text = text,
disable_web_page_preview = 1,
clear_draft = false,
entities = {[0] = {
offset =  offset,
length = length,
_ = "textEntity",
type = {user_id = user_id, _ = "textEntityTypeMentionName"}}}
}
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = msg_id})
end
end




function sendGif(chat_id, msg_id, animation_file,Cap)
assert( tdbot_function ({
_ = "sendMessage",chat_id = chat_id,
reply_to_message_id = msg_id,
disable_notification = 0,
from_background = 1,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageAnimation',
animation = getInputFile(animation_file),
caption = tostring(Cap)
}
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = msg_id})
end
end
function kick_user(user_id, chat_id)
if not tonumber(user_id) then return false end
tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {0}, dl_cb, nil)
end
function unsilent_user(chat_id, user_id)
tdbot.changeChatMemberStatus(chat_id, user_id, 'Restricted', {1, 0, 1, 1, 1, 1}, dl_cb, nil)
end

function channel_unblock(chat_id, user_id)
tdbot.changeChatMemberStatus(chat_id, user_id, 'Left', dl_cb, nil)
end
function sendContact(chat_id,msg_id,phone,first,last,user_id)
assert( tdbot_function ({
_ = "sendMessage",chat_id = chat_id,
reply_to_message_id = msg_id,
disable_notification = 0,
from_background = 1,
reply_markup = nil,
input_message_content = {
_ = 'inputMessageContact',
contact = {
_ = 'contact',
phone_number = tostring(phone),
first_name = tostring(first),
last_name = tostring(last),
user_id = user_id
}}
}, dl_cb, nil))
end
----------------------------------------------
function alarm(sec, callback, data)
assert (tdbot_function ({
_ = 'setAlarm',
seconds = sec
}, callback or dl_cb, data))
end

function RemoveFromBanList(chat_id, user_id)
tdbot_function ({
_ = "changeChatMemberStatus",
chat_id = chat_id,
user_id = user_id,
status = {
_ = "chatMemberStatusLeft"
},
}, dl_cb, nil)
end
------function Api_Sender------


function Setcust(chatid, userid, CustomTitle)
local Rep = Bot_Api .. "/setchatadministratorcustomtitle?chat_id=" .. chatid .. "&user_id=" .. userid .. "&custom_title=" .. CustomTitle
return json:decode(https.request(Rep))
end

function sendPhotokey(chat_id, file_id, reply_to_message_id, caption,reply_markup ,markdown)
url = Bot_Api .. "/sendPhoto?chat_id=" .. chat_id .. "&reply_to_message_id=" .. reply_to_message_id .. "&photo=" .. file_id
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



function Remcust(chat_id,user,title)
local url = Bot_Api..'/setChatAdministratorCustomTitle?chat_id='..chat_id..'&user_id='..user..'&custom_title='
return https.request(url)
end

function sendApi(chat_id, text, reply_to_message_id,markdown)
local url = Bot_Api .. '/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text)
if reply_to_message_id then
url = url .. '&reply_to_message_id=' .. reply_to_message_id
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end
----------------------------------------------
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
return https.request(url)
end
----------------------------------------------
function edit_msg(chat_id,message_id,text, keyboard, markdown)
local url = Bot_Api .. '/editMessageText?chat_id=' .. chat_id .. '&message_id='..message_id..'&text=' .. URL.escape(text)
if markdown then
url = url .. '&parse_mode=Markdown'
end
url = url .. '&disable_web_page_preview=true'
if keyboard then
url = url..'&reply_markup='..json.encode(keyboard)
end
return https.request(url)
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



function print_msg(msg)
--text = color.green[1].."[From: "..(msg.from.first_name or msg.to.title).."]\n"..color.yellow[1].."["..os.date("%H:%M:%S").."]"..color.red[1].."[Type :"
if msg.forwarded then
--text = color.magenta[1].."[Forwarded from:"..(msg.forwarded_from_user or msg.forwarded_from_chat).."]"..text
end
if msg.edited then
--text = color.magenta[1].."[Edited]"..text
end
if msg.text then
--text = text.."Text]\n"..color.default..msg.text
else
if msg.media.caption and msg.media.caption ~= "" then
if msg.photo then

--text = text.."Photo]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.video then
--text = text.."Video]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.videonote then
--text = text.."Videonote]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.voice then
--text = text.."Voice]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.audio then
--text = text.."Audio]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.animation then
--text = text.."Gif]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.sticker then
--text = text.."Sticker]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.contact then
--text = text.."Contact]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.document then
--text = text.."File]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
elseif msg.location then
--text = text.."Location]\n"..color.cyan[1].."Caption: "..color.default..msg.media.caption
end
else
if msg.photo then
--text = text.."Photo] "..color.default
elseif msg.video then
--text = text.."Video] "..color.default
elseif msg.videonote then
--text = text.."Videonote] "..color.default
elseif msg.voice then
--text = text.."Voice] "..color.default
elseif msg.audio then
--text = text.."Audio] "..color.default
elseif msg.animation then
--text = text.."Gif] "..color.default
elseif msg.sticker then
--text = text.."Sticker] "..color.default
elseif msg.contact then
--text = text.."Contact] "..color.default
elseif msg.document then
--text = text.."File] "..color.default
elseif msg.location then
--text = text.."Location] "..color.default
end
end
end
if msg.pinned then
--text = color.green[1].."[From: "..(msg.from.first_name or msg.to.title).."]\n"..color.yellow[1].."["..os.date("%H:%M:%S").."]\n"..color.red[1].."Pinned a message in chat: "..color.default..msg.to.title
end
if msg.game then
--text = text.."Game] "..color.default
end
if msg.adduser then
--text = text.."AddUser]"..color.default
end
if msg.deluser then
text = ""
end
if msg.joinuser then
--text = text.."JoinGroup]"..color.default
end
--print(text)
end

function AlphaMantion(FName,Lname,UserName,ID)
local FName = FName or ""
local Lname = Lname or ""
local FullName = FName.. ' '..Lname
if string.len(FullName) > 20 then
if string.len(UserName) > 4 then
result = UserName
else
result = ID
end
else
result = FullName
end
if not result then
result = ID
end
return result
end


function var_cb(msg, data)
bot = {}
msg.to = {}
msg.from = {}
msg.media = {}
msg.id = msg.id
msg.to.type = gp_type(data.chat_id)
if data.content and data.content.caption then
msg.media.caption = data.content.caption
end

if data.reply_to_message_id ~= 0 then
msg.reply_id = data.reply_to_message_id
else
msg.reply_id = false
end
function get_gp(arg, data)
if gp_type(msg.chat_id) == "channel" or gp_type(msg.chat_id) == "chat" then
msg.to.id = msg.chat_id or 0
msg.to.title = data.title
else
msg.to.id = msg.chat_id or 0
msg.to.title = false
end
end
assert (tdbot_function ({ _ = "getChat", chat_id = data.chat_id }, get_gp, nil))
function botifo_cb(arg, data)
bot.id = data.id
our_id = data.id
if data.username then
bot.username = data.username
else
bot.username = false
end
if data.first_name then
bot.first_name = data.first_name
end
if data.last_name then
bot.last_name = data.last_name
else
bot.last_name = false
end
if data.first_name and data.last_name then
bot.print_name = data.first_name..' '..data.last_name
else
bot.print_name = data.first_name
end
if data.phone_number then
bot.phone = data.phone_number
else
bot.phone = false
end

end
assert (tdbot_function({ _ = 'getMe'}, botifo_cb, {chat_id=msg.chat_id}))
function get_user(arg, data)
if data.id then
msg.from.id = data.id
else
msg.from.id = 0
end
if data.username then
msg.from.username = data.username
else
msg.from.username = false
end
if data.first_name then
msg.from.first_name = data.first_name
end
if data.last_name then
msg.from.last_name = data.last_name
else
msg.from.last_name = false
end
if data.first_name and data.last_name then
msg.from.print_name = data.first_name..' '..data.last_name
else
msg.from.print_name = data.first_name
end
if data.phone_number then
msg.from.phone = data.phone_number
else
msg.from.phone = false
end
print_msg(msg)

function Alarm()
assert (tdbot_function ({_="getChats",offset_order="9223372036854775807",offset_chat_id=0,limit=999999}, dl_cb, nil))
local groups = base:smembers(TD_ID..'group')
i = 0
if #groups ~= 0 then
for k,v in pairs(groups) do
tdbot.openChat(v)

i = i + 1
if not base:get(TD_ID.."Typing:Main") then
base:setex(TD_ID.."Typing:Main",10, true)
end
end
end
TextOpenChat = "< Gaurd Pro Check Gp Lock Auto "..i.." @MRGuard"
print(color.cyan[1]..TextOpenChat)
function vardump(value)
print(clr.yellow.."=================== START Vardump ==================="..clr.reset)
print(serpent.block(value, {comment=false}))
print(clr.yellow.."=================== END Vardump ==================="..clr.reset)
local Text = ""
.."\n"..serpent.block(value,{comment=false})
.."\n"
end
--sendChatAction(-1001428100426, 'Typing', 100)
tdbot.openChat(msg.chat_id)
viewMessages(msg.chat_id, {[0] = msg.id})
if not base:sismember(TD_ID.."CheckEnabelauto", msg.chat_id) then
base:sadd(TD_ID.."CheckEnabelauto", msg.chat_id)
end
for k,b in pairs(base:smembers(TD_ID.."CheckEnabelauto")) do
vardump(b)
if base:get(TD_ID.."Autopin1"..b) or base:get(TD_ID.."Autopin2"..b) then
local time = os.date("%H%M")
local time2 = base:get(TD_ID.."Autopin1"..b)
time2 = time2.gsub(time2,":","")
local time3 = base:get(TD_ID.."Autopin2"..b)
time3 = time3.gsub(time3,":","")
TextPin = base:get(TD_ID.."MsgPin"..b)
if tonumber(time3) < tonumber(time2) then
if tonumber(time) <= 2359 and tonumber(time) >= tonumber(time2) then
if not base:get(TD_ID.."PinMsgCheckGp:"..b) then
base:set(TD_ID.."PinMsgCheckGp:"..b,true)
base:set(TD_ID.."PINMSGID:"..b,true)
tdbot.sendMessage(b, 0, 1, ''..TextPin..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ پیام توسط ربات به صورت خودکار سنجاق شده است.\n ◈ ساعت برداشتن پیام سنجاق شده : *'..base:get(TD_ID.."Autopin2"..b)..'*', 1, 'md')
end
elseif tonumber(time) >= 0000 and tonumber(time) < tonumber(time3) then
if not base:get(TD_ID.."PinMsgCheckGp:"..b) then
tdbot.sendMessage(b, 0, 1, ''..TextPin..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ پیام توسط ربات به صورت خودکار سنجاق شده است.\n ◈ ساعت برداشتن پیام سنجاق شده : *'..base:get(TD_ID.."Autopin2"..b)..'*', 1, 'md')
base:set(TD_ID.."PINMSGID:"..b,true)
base:set(TD_ID.."PinMsgCheckGp:"..b,true)
end
else
if base:get(TD_ID.."PinMsgCheckGp:"..b) then
base:del(TD_ID.."PinMsgCheckGp:"..b, true)
tdbot.unpinChannelMessage(b, dl_cb, nil)
tdbot.sendMessage(b, 0, 1, '◈ پیام سنجاق شده در ساعت : *'..base:get(TD_ID.."Autopin2"..b)..'* توسط  ربات برداشته شد!', 1, 'md')

end
end
elseif tonumber(time3) > tonumber(time2) then
if tonumber(time) >= tonumber(time2) and tonumber(time) < tonumber(time3) then
if not base:get(TD_ID.."PinMsgCheckGp:"..b) then
tdbot.sendMessage(b, 0, 1, ''..TextPin..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ پیام توسط ربات به صورت خودکار سنجاق شده است.\n ◈ ساعت برداشتن پیام سنجاق شده : *'..base:get(TD_ID.."Autopin2"..b)..'*', 1, 'md')
base:set(TD_ID.."PINMSGID:"..b,true)
base:set(TD_ID.."PinMsgCheckGp:"..b,true)
end
else
if base:get(TD_ID.."PinMsgCheckGp:"..b) then
base:del(TD_ID.."PinMsgCheckGp:"..b, true)
tdbot.unpinChannelMessage(b, dl_cb, nil)
tdbot.sendMessage(b, 0, 1, '◈ پیام سنجاق شده در ساعت : *'..base:get(TD_ID.."Autopin2"..b)..'* توسط  ربات برداشته شد!', 1, 'md')
end
end
end
end


function Alphaee(num)
list={'۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end
biobot = base:get(TD_ID..'aboutBio'..b) or 0
bio = base:get(TD_ID..'abcli:'..b) or '➊ ارسال لینک🚫➋ارسال اسپم🚫➌رعایت ادب 🌹'
if os.date("%M") ~= biobot and base:get(TD_ID..'abouttime:on'..b) then
dofile('./Alpha/time.lua')
local irantime = os.date('%X', os.time()+2.5*60*60)
local shamsidate = os.date("%Y/%m/%d",os.time()+2.5*60*60)
local daysweek = os.date('%A',os.time()+2.5*60*60)
local monthiran = os.date('%B',os.time()+2.5*60*60)
local daysweek = daysweek:gsub("Saturday", " شنبه ")
local daysweek = daysweek:gsub("Sunday", " یکشنبه ")
local daysweek = daysweek:gsub("Monday", " دوشنبه")
local daysweek = daysweek:gsub("Tuesday", " سه شنبه ")
local daysweek = daysweek:gsub("Wednesday", " چهارشنبه ")
local daysweek = daysweek:gsub("Thursday", " پنچ شنبه ")
local daysweek = daysweek:gsub(" Friday", " جمعه ")
local limitmsg1 = limitmsg1:gsub("1", "فروردين")
local limitmsg1 = limitmsg1:gsub("2", "ارديبهشت")
local limitmsg1 = limitmsg1:gsub("3", "خرداد")
local limitmsg1 = limitmsg1:gsub("4", "تیر")
local limitmsg1 = limitmsg1:gsub("5", "مرداد")
local limitmsg1 = limitmsg1:gsub("6", "شهریور")
local limitmsg1 = limitmsg1:gsub("7", "مهر")
local limitmsg1 = limitmsg1:gsub("8", "آبان")
local limitmsg1 = limitmsg1:gsub("9", "آذر")
local limitmsg1 = limitmsg1:gsub("10", "دی")
local limitmsg1 = limitmsg1:gsub("11", "بهمن")
local limitmsg1 = limitmsg1:gsub("12", "اسفند")
txt = '                                                            📆تاریخ  : '..Alphaee(limitmsg2)..' '..limitmsg1..' '..Alphaee(limitmsg)..' |'..daysweek..'|'..Alphaee(hor)..':'..Alphaee(dag)..''
base:set(TD_ID..'abouttime'..b,txt)
abouttime = base:get(TD_ID..'abouttime'..b) or "no time"
changeChatDescription(b, ''..bio..''..abouttime..'')
base:set(TD_ID..'aboutBio'..b,os.date("%M"))
end






if tonumber(os.date("%H%M")) > 2350 and not base:get(TD_ID..'delincr'..b)  then
allusers = base:smembers(TD_ID..'AllUsers:'..b)
for k, v in pairs(allusers) do
base:del(TD_ID..'Total:messages:'..b..':'..os.date("%Y/%m/%d")..':'..v)
base:del(TD_ID..'limituser:'..b)
end
allusers = base:smembers(TD_ID..'limituser:'..b)
for k, v in pairs(allusers) do
base:del(TD_ID..'limituser:'..b)
UnRes(b,v)
end
base:setex(TD_ID..'delincr'..b,60,true)
end


if not base:get(TD_ID..'limitime:'..b) and base:sismember(TD_ID..'Gp2:'..b,'limitpm:on')  then
base:setex(TD_ID..'limitime:'..b,20,true)
allusers = base:smembers(TD_ID..'limituser:'..b)
if #allusers == 0 then
else
for k, v in pairs(allusers) do
base:del(TD_ID..'limituser:'..b)
UnRes(b,v)
end
end
end

if not base:get(TD_ID..'scanKheauto:'..b) and base:sismember(TD_ID..'Gp2:'..b,'Kheyanat:on') then
local timecgm = 3600
base:setex(TD_ID..'scanKheauto:'..b,120,true)
--send(b,0,'◈ انجام شد!','html') 
base:zremrangebyscore(TD_ID..'bot:delusr:'..b..':', 0, 2000000) 
end 

if not base:get(TD_ID..'scantabauto:'..b) and base:sismember(TD_ID..'Gp2:'..b,'scantabautoon') then
local timecgm = base:get(TD_ID..'scantabchiautotime:'..b)
base:setex(TD_ID..'scantabauto:'..b,timecgm,true)
local timecgmbaghi = base:ttl(TD_ID..'scantabauto:'..b)
local Time_ = getTimeUptime(timecgmbaghi)
local list = base:smembers(TD_ID..'AGTMute:'..chat_id)
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if #list == 0  then
send(b,0,'◈ عملیات شناسایی ربات های تبچی در گروه انجام شد خوشبختانه هیچ تبلیغگری در گروه مشاهده نشد!\n'..txt..'\n','html')
else
for k,v in pairs(list) do
ram = k
end
send(b,0,'◈ عملیات شناسایی ربات های تبچی در گروه انجام شد در گروه شما به تعداد <b>'..ram..'</b> ربات مخرب از گروه پاکسازی شد.\n ◇ زمان باقی جهت عملیات بعدی :\n '..Time_..' ','html')
base:del(TD_ID..'AGTMute:'..b)
end
end











if not base:get(TD_ID..'cgmauto:'..b) and base:sismember(TD_ID..'Gp2:'..b,'cgmautoon') then
local timecgm = base:get(TD_ID..'cgmautotime:'..b)
base:setex(TD_ID..'cgmauto:'..b,timecgm,true)
send(b,0,"پاکسازی",'html')
end
if base:sismember(TD_ID..'Gp2:'..b,'cgmautoalarm') then
if not base:get(TD_ID..'cgmauto1:'..b) and base:sismember(TD_ID..'Gp2:'..b,'cgmautoon') then
local timecgm = base:get(TD_ID..'cgmautotime1:'..b)
base:setex(TD_ID..'cgmauto1:'..b,timecgm,true)
local timecgmbaghi = base:ttl(TD_ID..'cgmauto:'..b)
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "◂ قابل توجه اعضای محترم گروه ! \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n[ " .. Time_ .. " ] دیگر عملیات پاکسازی کلی پیام انجام خواهد شد."
base:set(TD_ID.."PIN:"..b,true)
send(b,0,Time_S,'html')
end

if not base:get(TD_ID..'cgmauto2:'..b) and base:sismember(TD_ID..'Gp2:'..b,'cgmautoon') then
local timecgm = base:get(TD_ID..'cgmautotime2:'..b)
base:setex(TD_ID..'cgmauto2:'..b,timecgm,true)
local timecgmbaghi = base:ttl(TD_ID..'cgmauto:'..b)
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "◂ قابل توجه اعضای محترم گروه ! \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n[ " .. Time_ .. " ] دیگر عملیات پاکسازی کلی پیام انجام خواهد شد."
base:set(TD_ID.."PIN:"..b,true)
send(b,0,Time_S,'html')
end
if not base:get(TD_ID..'cgmauto3:'..b) and base:sismember(TD_ID..'Gp2:'..b,'cgmautoon') then
local timecgm = base:get(TD_ID..'cgmautotime3:'..b)
base:setex(TD_ID..'cgmauto3:'..b,timecgm,true)
local timecgmbaghi = base:ttl(TD_ID..'cgmauto:'..b)
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "◂ قابل توجه اعضای محترم گروه ! \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n[ " .. Time_ .. " ] دیگر عملیات پاکسازی کلی پیام انجام خواهد شد."
base:set(TD_ID.."PIN:"..b,true)
send(b,0,Time_S,'html')
end
if not base:get(TD_ID..'cgmauto4:'..b) and base:sismember(TD_ID..'Gp2:'..b,'cgmautoon') then
local timecgm = base:get(TD_ID..'cgmautotime4:'..b)
base:setex(TD_ID..'cgmauto4:'..b,timecgm,true)
local timecgmbaghi = base:ttl(TD_ID..'cgmauto:'..b)
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "◂ قابل توجه اعضای محترم گروه ! \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n[ " .. Time_ .. " ] دیگر عملیات پاکسازی کلی پیام انجام خواهد شد."
base:set(TD_ID.."PIN:"..b,true)
send(b,0,Time_S,'html')
end
end


if base:get(TD_ID.."DelaUtO"..b) or base:get(TD_ID.."DelaUtO2"..b) then
local time = os.date("%H%M")
local time2 = base:get(TD_ID.."DelaUtO"..b)
time2 = time2.gsub(time2,":","")
local time3 = base:get(TD_ID.."DelaUtO2"..b)
time3 = time3.gsub(time3,":","")
if tonumber(time3) < tonumber(time2) then
if tonumber(time) <= 2359 and tonumber(time) >= tonumber(time2) then
if not base:get(TD_ID.."DelMsgCheckGp:"..b) then
base:set(TD_ID.."DelMsgCheckGp:"..b,true)
send(b,0,"پاکسازی گروه",'html')
end
elseif tonumber(time) >= 0000 and tonumber(time) < tonumber(time3) then
if not base:get(TD_ID.."DelMsgCheckGp:"..b) then
base:set(TD_ID.."DelMsgCheckGp:"..b,true)
send(b,0,"پاکسازی گروه",'html')
end
else
if base:get(TD_ID.."DelMsgCheckGp:"..b) then
base:del(TD_ID.."DelMsgCheckGp:"..b, true)
end
end
elseif tonumber(time3) > tonumber(time2) then
if tonumber(time) >= tonumber(time2) and tonumber(time) < tonumber(time3) then
if not base:get(TD_ID.."DelMsgCheckGp:"..b) then
base:set(TD_ID.."DelMsgCheckGp:"..b,true)
send(b,0,"پاکسازی",'html')
end
else
if base:get(TD_ID.."DelMsgCheckGp:"..b) then
base:del(TD_ID.."DelMsgCheckGp:"..b, true)
end
end
end
end




if base:get(TD_ID.."atolct2"..b) or base:get(TD_ID.."atolct2"..b) then
Start_ = base:get(TD_ID.."atolct1"..b)
Start = Start_:gsub(':','')
Start = tonumber(Start)
End_ = base:get(TD_ID.."atolct2"..b)
End = End_:gsub(':','')
End = tonumber(End)
Time = os.date("%H%M")
Time = tonumber(Time)
if (Time == Start) or (Time >= Start and Time < End) or (Start > End and ((Time >= Start and Time <= 2359) or (Time < End and Time >= 0))) then
if not base:sismember(TD_ID..'Gp2:'..b,'Mute_All')then
base:sadd(TD_ID..'Gp2:'..b,'Mute_All')
if base:sismember(TD_ID..'Gp2:'..b,'Tele_Mute')  then
hallat = '📵 سکوت '
else
hallat = '❌ حذف پیام'
end
send(b,0, '❌ قفل خودکار گروه فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ ارسال پیام در گروه تا ساعت [ <code>'..End_..'</code> ] ممنوع میباشد .\n 💢 حالت قفل خودکار :'..hallat..' ', 'html')
base:set(TD_ID.."PIN:"..b,true)
base:set(TD_ID.."bot:muteall:Run" .. b, true)
end
elseif tonumber(Time) >= tonumber(End)  then
if base:get(TD_ID.."bot:muteall:Run"..b) then
send(b, 0, ' قفل خودکار گروه غیرفعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ ارسال پیام و رسانه در گروہ آزاد شد و کاربران میتوانند به فعالیت خود ادامه دهند.\n ⚡️ساعت : '..os.date("%H:%M")..'', 'html')
base:set(TD_ID.."PIN:"..b,true)
base:srem(TD_ID..'Gp2:'..b,'Mute_All')
base:del(TD_ID.."bot:muteall:Run" .. b)
end
end
end
end










--[[if base:get(TD_ID.."atolct2"..b) or base:get(TD_ID.."atolct2"..b) then
local time = os.date("%H%M")
local time2 = base:get(TD_ID.."atolct1"..b)
time2 = time2.gsub(time2,":","")
local time3 = base:get(TD_ID.."atolct2"..b)
time3 = time3.gsub(time3,":","")
if tonumber(time3) < tonumber(time2) then
if tonumber(time) <= 2359 and tonumber(time) >= tonumber(time2) then
if not base:sismember(TD_ID..'Gp2:'..b,'Mute_All') then
base:sadd(TD_ID..'Gp2:'..b,'Mute_All')
sendPhoto(b,0,0,1,nil,'./Alpha/lockauto.jpg', '◂ قفل خودکار گروه فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ ارسال هرگونه پیام و رسانه توسط ربات هوشمند تا ساعت ['..base:get(TD_ID.."atolct2"..b)..'] پاک خواهد شد.❌',dl_cb, nil)
base:set(TD_ID.."bot:muteall:Run" .. b, true)
end
elseif tonumber(time) >= 0000 and tonumber(time) < tonumber(time3) then
if not base:sismember(TD_ID..'Gp2:'..b,'Mute_All') then
sendPhoto(b,0,0,1,nil,'./Alpha/lockauto.jpg', '◂ قفل خودکار گروه فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ ارسال هرگونه پیام و رسانه توسط ربات هوشمند تا ساعت ['..base:get(TD_ID.."atolct2"..b)..'] پاک خواهد شد.❌',dl_cb, nil)
base:sadd(TD_ID..'Gp2:'..b,'Mute_All')
base:set(TD_ID.."bot:muteall:Run" .. b, true)
end
else
if base:sismember(TD_ID..'Gp2:'..b,'Mute_All') then
base:srem(TD_ID..'Gp2:'..b,'Mute_All')
base:srem(TD_ID.."CheckEnabelauto", b)
sendPhoto(b,0,0,1,nil,'./Alpha/unlockauto.jpg', '◂ قفل خودکار گروه غیرفعال شد.\n◂ ارسال پیام و رسانه در گروہ آزاد شد و کاربران میتوانند به فعالیت خود ادامه دهند.\nساعت : '..os.date("%H:%M")..'',dl_cb, nil)
base:del(TD_ID.."bot:muteall:Run" .. b)
end
end
elseif tonumber(time3) > tonumber(time2) then
if tonumber(time) >= tonumber(time2) and tonumber(time) < tonumber(time3) then
if not base:sismember(TD_ID..'Gp2:'..b,'Mute_All') then
sendPhoto(b,0,0,1,nil,'./Alpha/lockauto.jpg', '◂ قفل خودکار گروه فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ ارسال هرگونه پیام و رسانه توسط ربات هوشمند تا ساعت ['..base:get(TD_ID.."atolct2"..b)..'] پاک خواهد شد.❌',dl_cb, nil)
base:sadd(TD_ID..'Gp2:'..b,'Mute_All')
base:set(TD_ID.."bot:muteall:Run" .. b, true)
end
else
if base:sismember(TD_ID..'Gp2:'..b,'Mute_All') then
base:srem(TD_ID..'Gp2:'..b,'Mute_All')
base:srem(TD_ID.."CheckEnabelauto", b)
sendPhoto(b,0,0,1,nil,'./Alpha/unlockauto.jpg', '◂ قفل خودکار گروه غیرفعال شد.\n◂ ارسال پیام و رسانه در گروہ آزاد شد و کاربران میتوانند به فعالیت خود ادامه دهند.\nساعت : '..os.date("%H:%M")..'',dl_cb, nil)
base:del(TD_ID.."bot:muteall:Run" .. b)
end
end
end
end
end--]]

--send(-1001398987758, 0,'done', 'html')
--print(color.green[1]..TextOpenChat)
if base:get(TD_ID.."RunAlarmPro") then
tdbot.setAlarm(5,Alarm,nil)
base:setex(TD_ID.."CheckAlarm", 30, true)
end
end
if not base:get(TD_ID.."CheckAlarm") then
base:del(TD_ID.."RunAlarmPro")
base:setex(TD_ID.."CheckAlarm", 10, true)
end
if not base:get(TD_ID.."RunAlarmPro") then
base:set(TD_ID.."RunAlarmPro", true)
base:setex(TD_ID.."CheckAlarm", 10, true)
Alarm()
end
end
assert (tdbot_function ({ _ = "getUser", user_id = (data.sender_user_id or 0)}, get_user, nil))
end

----------------------------------------------


function is_JoinChannel(msg)
if base:get(TD_ID..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not base:get(TD_ID..'joinchnl') then
function name(arg,data)
if is_Owner(msg,msg.sender_user_id) then
rank = ' 👨🏻‍🔧 مالک گروه '
elseif is_Mod(msg,msg.sender_user_id) then
rank = ' 🤴 ادمین گروه'
elseif is_Nazem(msg,msg.sender_user_id) then
rank = ' 👮🏻‍♂️ معاون گروه '
elseif not  is_Vip(msg,msg.sender_user_id) then
rank = '◈ کاربر '
end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..data.first_name..' </a>'
bd = '◂  <b>'..rank..'</b> '..username..' <b>برای ارسال دستورات ربات خواهشمند است به کانال ما عضو شوید.</b> '
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ عضویت در تیم گاردین ◈',url='https://telegram.me/'..Config.Channel}
}
}
send_inline(msg.chat_id,bd,keyboard,'html')
end
GetUser(msg.sender_user_id,name)
else
return true
end
else
return true
end
end



function is_channel(msg)
chat_id = tostring(msg.chat_id)
if chat_id:match('^-100') then
if msg.is_post then
return true
else
return false
end
end
end

function getindex(t,id)
for i,v in pairs(t) do
if v == id then
return i
end
end
return nil
end
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
function is_channel(msg)
chat_id = tostring(msg.chat_id)
if chat_id:match('^-100') then
if msg.is_post then
return true
else
return false
end
end
end
function is_group(msg)
chat_id= tostring(msg.chat_id)
if chat_id:match('^-100') then
return false
elseif chat_id:match('^-') then
return true
else
return false
end
end
function is_private(msg)
chat_id = tostring(msg.chat_id)
if chat_id:match('^(%d+)') then
return false
else
return true
end
end
function gp_type(chat_id)
local gp_type = "pv"
local id = tostring(chat_id)
if id:match("^-100") then
gp_type = "channel"
elseif id:match("-") then
gp_type = "chat"
end
return gp_type
end
local function run_bash(str)
local cmd = io.popen(str)
local result = cmd:read('*all')
return result
end




local function MBD(mmd,rza)
if mmd and rza then
mmdreza = '['..mmd..'](tg://user?id='..rza..')'
return mmdreza
end
end
base:set(TD_ID.."bot:Uptime", os.time())



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

function msg_valid(msg)
if msg.date and msg.date < os.time() - 60 then
--print('\027[» OLD MESSAGE « \027[00m')
return false
end
return true
end









-----------------------------------------Sudo Cmd
function Setsudo(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'SUDO',user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..'  در لیست سودو موجود است!','html')
else
send(msg.chat_id, msg.id, '◂ کاربر  '..username..'  به لیست سودو اضافه شد!','html')
base:sadd(TD_ID..'SUDO',user)
end
end
GetUser(user, name, nil)
end

function Remsudo(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'SUDO',user) then
send(msg.chat_id, msg.id, '◂ کاربر  '..username..'  در لیست سودو موجود نمی باشد!','html')
else
send(msg.chat_id, msg.id, '◂ کاربر  '..username..'  از لیست سودو خارج شد!','html')
base:srem(TD_ID..'SUDO',user)
end
end
GetUser(user, name, nil)
end
----------------------Addtabchi function--------------------
function Banall(msg,chat,user)
if tonumber(user) == tonumber(BotJoiner) then
send(msg.chat_id, msg.id,  '◂ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif  tonumber(user) == tonumber(BotJoiner)   then 
send(chat,msg.id,"◂ کاربر سودو ربات می باشد دسترسی به بن ال کردن این کاربر را ندارید!","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◂ کاربر مالک گروه می باشد دسترسی به بن ال کردن این کاربر را ندارید !","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◂ کاربر معاون گروه می باشد دسترسی به بن ال کردن این کاربر را ندارید !","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◂ کاربرادمین گروه می باشد دسترسی به بن ال کردن این کاربر را ندارید !","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◂ کاربر ادمین افتخاری گروه می باشد دسترسی به بن ال کردن این کاربر را ندارید !","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◂ کاربر عضو ویژه گروه می باشد دسترسی به بن ال کردن این کاربر را ندارید !","md")
else
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if tonumber(user) == tonumber(Leader) then
else
if base:sismember(TD_ID..'GlobalyBanned:',user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست مسدودین کلی وجود دارد !','html')
else
sendText(msg.chat_id, msg.id, '◂ کاربر '..username..' به لیست مسدودین کلی اضافه شد !','html')
base:sadd(TD_ID..'GlobalyBanned:',user)
local bgps = base:smembers(TD_ID..'SuperGp') or 0
for i=1, #bgps do 
KickUser(bgps[i], user)
end
end
end 
end
GetUser(user, name, nil)
end
end

function Unbanall(msg,chat,user)
if tonumber(user) == tonumber(our_id) then
return false
end
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'GlobalyBanned:',user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست مسدودین کلی وجود ندارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست مسدودین کلی حذف شد !','html')
base:srem(TD_ID..'GlobalyBanned:',user)
local bgps = base:smembers(TD_ID..'SuperGp') or 0
for i=1, #bgps do
RemoveFromBanList(bgps[i], user)
end
end
end
GetUser(user, name, nil)
end












function Addtabchi(msg,chat,user)
if tonumber(user) == tonumber(BotJoiner) then
send(msg.chat_id, msg.id,  '◂ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif  tonumber(user) == tonumber(BotJoiner)   then 
send(chat,msg.id,"◂ کاربر سودو ربات می باشد دسترسی به تبچی کردن این کاربر را ندارید!","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◂ کاربر مالک گروه می باشد دسترسی به تبچی کردن این کاربر را ندارید !","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◂ کاربر معاون گروه می باشد دسترسی به تبچی کردن این کاربر را ندارید !","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◂ کاربرادمین گروه می باشد دسترسی به تبچی کردن این کاربر را ندارید !","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◂ کاربر ادمین افتخاری گروه می باشد دسترسی به تبچی کردن این کاربر را ندارید !","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◂ کاربر عضو ویژه گروه می باشد دسترسی به تبچی کردن این کاربر را ندارید !","md")
else
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'AGTMute:',user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست تبچی ها وجود دارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر  '..username..' به لیست تبچی ها اضافه شد !','html')
base:sadd(TD_ID..'AGTMute:'..msg.chat_id,user)
base:sadd(TD_ID..'AGTMute:',user)
base:zincrby(TD_ID..'bot:Tab:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:TabUser:'..msg.chat_id)
base:srem(TD_ID..'TabAdd:'..msg.chat_id,user)
KickUser(msg.chat_id,user)
base:incr(TD_ID..'Total:AGTMute:'..msg.chat_id..':'..msg.sender_user_id)
end
local bgps = base:smembers(TD_ID..'SuperGp') or 0
for i=1, #bgps do
KickUser(bgps[i], user)
end
end
GetUser(user, name, nil)
end
end
function Remtabchi(msg,chat,user)
if tonumber(user) == tonumber(BotCliId) then
return false
end
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'AGTMute:',user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست تبچی ها وجود ندارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست تبچی ها حذف شد !','html')
base:srem(TD_ID..'AGTMute',user)
end
local bgps = base:smembers(TD_ID..'SuperGp') or 0
for i=1, #bgps do
RemoveFromBanList(bgps[i], user)
end
end
GetUser(user, name, nil)
end


----------------------AddAdminBot function--------------------
function Setadmin(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'ModList:'..msg.chat_id,user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست ادمین ها وجود دارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' به لیست ادمین ها اضافه شد !','html') 
base:sadd(TD_ID..'ModList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModCleanList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModBanList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModMuteList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModWarnList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModLockList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModpanelList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModVipList:'..msg.chat_id,user)
base:sadd(TD_ID..'ModLockOption:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end

function Remadmin(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'ModList:'..msg.chat_id,user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست ادمین ها وجود ندارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست ادمین ها حذف شد !','html')
base:srem(TD_ID..'ModListtest:'..msg.chat_id,user)
base:srem(TD_ID..'ModList:'..msg.chat_id,user)
base:srem(TD_ID..'ModCleanList:'..msg.chat_id,user)
base:srem(TD_ID..'ModBanList:'..msg.chat_id,user)
base:srem(TD_ID..'ModMuteList:'..msg.chat_id,user)
base:srem(TD_ID..'ModWarnList:'..msg.chat_id,user)
base:srem(TD_ID..'ModLockList:'..msg.chat_id,user)
base:srem(TD_ID..'ModpanelList:'..msg.chat_id,user)
base:srem(TD_ID..'ModVipList:'..msg.chat_id,user)
base:srem(TD_ID..'ModLockOption:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end


function SetNazem(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'NazemList:'..msg.chat_id,user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست معاون ها وجود دارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' به لیست معاون ها اضافه شد !','html')
base:sadd(TD_ID..'NazemList:'..msg.chat_id,user) 
end
end
GetUser(user, name, nil)
end

function RemNazem(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'NazemList:'..msg.chat_id,user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست معاون ها وجود ندارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست معاون ها حذف شد !','html')
base:srem(TD_ID..'NazemList:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end

function SetAdd(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'VipAdd:'..msg.chat_id,Ramin) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست معاف اجباری ها وجود دارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' به لیست معاف اجباری اضافه شد !','html') 
base:sadd(TD_ID..'VipAdd:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end

function RemAdd(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'VipAdd:'..msg.chat_id,user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست معاون ها وجود ندارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست معاون ها حذف شد !','html')
base:srem(TD_ID..'VipAdd:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end


function SetVip(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'Vip:'..msg.chat_id,Ramin) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست کاربران ویژه وجود دارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' به لیست کاربران ویژه اضافه شد !','html') 
base:zincrby(TD_ID..'bot:vip:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:VipUser:'..msg.chat_id)
base:sadd(TD_ID..'Vip:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end

function RemVip(msg,chat,user)
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'Vip:'..msg.chat_id,user) then
send(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست کاربران ویژه وجود ندارد !','html')
else
send(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست کاربران ویژه حذف شد !','html')
base:srem(TD_ID..'Vip:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end

function SetOwner(msg,chat,user)
if tonumber(user) == tonumber(our_id) then
return false
end
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then
username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if base:sismember(TD_ID..'OwnerList:'..msg.chat_id,user) then
sendText(msg.chat_id, msg.id, '◂ کاربر  '..username..' در لیست مالکین گروه وجود دارد !','html')
else
sendText(msg.chat_id, msg.id, '◂ کاربر '..username..' به لیست مالکین گروه اضافه شد !','html')
base:sadd(TD_ID..'OwnerList:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end

function RemOwner(msg,chat,user)
if tonumber(user) == tonumber(our_id) then
return false
end
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
if not base:sismember(TD_ID..'OwnerList:'..msg.chat_id,user) then
sendText(msg.chat_id, msg.id, '◂ کاربر '..username..' در لیست مالکین گروه وجود ندارد !','html')
else
sendText(msg.chat_id, msg.id, '◂ کاربر '..username..' از لیست مالکین گروه حذف شد !','html')
base:srem(TD_ID..'OwnerList:'..msg.chat_id,user)
end
end
GetUser(user, name, nil)
end




function AddAdmin(msg,chat,user)
if tonumber(user) == tonumber(our_id) then
return false
end
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
sendText(msg.chat_id,msg.id, '◂ کاربر '..username..' با موفقیت به مدیریت گروه ترفیع یافت !','html')
Admin(chat, user, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
GetUser(user, name, nil)
end

function DelAdmin(msg,chat,user)
if tonumber(user) == tonumber(our_id) then
return false
end
local function name(extra, result, success)
if not result.first_name then
username = '<a href="tg://user?id='..user..'">'..user..'</a>'
elseif result.first_name ~= '' then

username = '<a href="tg://user?id='..user..'">'..check_html(result.first_name)..'</a>'
else
username = ''..user..''
end 
sendText(msg.chat_id,msg.id, '◂ کاربر '..username..' با موفقیت از مدیریت گروه عزل شد !','html')
Admin(chat, user, 'Administrator', {0, 0, 0, 0, 0, 0, 0, 0, 0})
end
GetUser(user, name, nil)
end














---------------------------------------------
----------- >>Function BD_Locks<< -----------
local function lock_del(msg)
deleteMessages(msg.chat_id,{[0] = msg.id})
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
local function lock_kick(msg,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
send(msg.chat_id,msg.id,"◂ [کاربر](tg://user?id="..msg.sender_user_id..") از گروه اخراج شد. \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ دلیل اخراج : "..fa.." ",'md')
end
KickUser(msg.chat_id,msg.sender_user_id)
UnRes(msg.chat_id,msg.sender_user_id)
else
send(msg.chat_id,msg.id,"◂ [کاربر](tg://user?id="..msg.sender_user_id..") \n◂ *تخلف* *"..fa.."* *را انجام دادہ است ولی ربات دسترسی برای اخراج وی را ندارد* !",'md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<>
local function lock_mute(msg,fa)
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
if not base:get(TD_ID..'mutetime:'..msg.chat_id) then
t = "3600"
else
t = base:get(TD_ID..'mutetime:'..msg.chat_id)
end
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,msg.sender_user_id)
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local ex = base:get(TD_ID..'mutetime:'..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• رفع سکوت !',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = "◈ کاربر "..username.." توانایی ارسال پیام در گروه را ازدست داد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ علت : "..fa..""
send_inline(msg.chat_id,text,keyboard,'html')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)

--send(msg.chat_id,msg.id,"","md")
end
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+timemutemsg)
else
send(msg.chat_id,msg.id,"◈ [کاربر](tg://user?id="..msg.sender_user_id..")  \n◂ تخلف "..fa.." را انجام دادہ است ولی ربات دسترسی برای محدود کردن وی را ندارد !",'md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<>
local function lock_silent(msg,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if not base:sismember(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id) then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
send(msg.chat_id,msg.id,'◈ [کاربر](tg://user?id='..msg.sender_user_id..') *میوت شد.*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ *دلیل میوت* :  '..fa..'','md')
end
base:sadd(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id or 00000000)
end
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<><>
local function lock_warn(msg,fa)
local hashwarnbd = TD_ID..msg.sender_user_id..':warn'
local warnhashbd = base:hget(hashwarnbd, msg.chat_id) or 1
local max_warn = tonumber(base:get(TD_ID..'Warn:Max:'..msg.chat_id) or 3)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(warnhashbd) == tonumber(max_warn) then
local function checkadmin(BlaCk,ALPHA)
if base:get(TD_ID.."warn_stats"..msg.chat_id) == "kick" then
if ALPHA.status.can_restrict_members  then
KickUser(msg.chat_id,msg.sender_user_id)
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = "◈<b>کاربر</b>  "..username.." \n <b>به علت حداکثر اخطار دریافتی از سمت ربات اخراج شد.</b>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ <b>دلیل اخراج</b> : "..fa..""
send(msg.chat_id,msg.id,text,'html')
end
base:hdel(hashwarnbd,msg.chat_id,max_warn)
else
send(msg.chat_id,msg.id,"◈ [کاربر](tg://user?id="..msg.sender_user_id..") \n◂ تخلف "..fa.." را انجام دادہ است و به حداکثر اخطار خود رسیدہ است ولی ربات دسترسی به اخراج کاربران ندارد !",'md')
end
end
if base:get(TD_ID.."warn_stats"..msg.chat_id) == "silenttime" then
if ALPHA.status.can_restrict_members then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+timemutemsg)
local Time_ = getTimeUptime(timemutemsg)
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,msg.sender_user_id)
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• رفع سکوت !',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = "◈<b>کاربر</b> ⊰"..username.."  \n <b>به علت حداکثر اخطار دریافتی از سمت ربات به مدت</b> "..Time_.." <b>سکوت شد.</b>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ <b>دلیل سکوت زمانی</b> : "..fa..""
send_inline(msg.chat_id,text,keyboard,'html')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
end
base:hdel(hashwarnbd,msg.chat_id,max_warn)
else
send(msg.chat_id,msg.id,"◈ [کاربر](tg://user?id="..msg.sender_user_id..") \n◂ تخلف "..fa.." را انجام دادہ است و به حداکثر اخطار خود رسیدہ است ولی ربات دسترسی به محدود کردن کاربران ندارد !",'md')
end
end

if base:get(TD_ID.."warn_stats"..msg.chat_id) == "silent" then
if ALPHA.status.can_restrict_members then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,msg.sender_user_id)
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• رفع سکوت !',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = "◈<b>کاربر</b>  "..username.."  \n <b>به علت حداکثر اخطار دریافتی از سمت ربات برای همیشه سکوت شد.</b>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ <b>دلیل سکوت</b> : "..fa..""
MuteUser(msg.chat_id,msg.sender_user_id,0)
send_inline(msg.chat_id,text,keyboard,'html')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
end
base:hdel(hashwarnbd,msg.chat_id,max_warn)
else
send(msg.chat_id,msg.id,"◈ [کاربر](tg://user?id="..msg.sender_user_id..") \n◂ تخلف "..fa.." را انجام دادہ است و به حداکثر اخطار خود رسیدہ است ولی ربات دسترسی به محدود کردن کاربران ندارد !",'md')
end
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else
base:hset(hashwarnbd,msg.chat_id, tonumber(warnhashbd + 1))
if base:get(TD_ID.."warn_stats"..msg.chat_id) == "silent" then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = '◈<b>کاربر</b> '..username..'  \n <b>به علت ارسال پیام ممنوعه ازطرف ربات#یک اخطار دریافت کرد!</b>\n◂ • تعداد اخطار : '..Alpha(warnhashbd)..'/'..Alpha(warn)..'\n⚠️ <b>دلیل اخطار</b> : #'..fa..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های کاربر به حداکثر خود برسد درگروه #سکوت خواهد شد.'
send(msg.chat_id,msg.id,text,'html')
end
end
if base:get(TD_ID.."warn_stats"..msg.chat_id) == "silenttime" then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(timemutemsg)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = '◈<b>کاربر</b>  '..username..'  \n <b>به علت ارسال پیام ممنوعه ازطرف ربات#یک اخطار دریافت کرد!</b>\n◂ تعداد اخطار : '..Alpha(warnhashbd)..'/'..Alpha(warn)..'\n⚠️ <b>دلیل اخطار</b> : #'..fa..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های کاربر به حداکثر خود برسد درگروه به مدت '..Time_..' سکوت خواهد شد.'
send(msg.chat_id,msg.id,text,'html')
end
end
if base:get(TD_ID.."warn_stats"..msg.chat_id) == "kick" then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a> '
text = '◈<b>کاربر</b>  '..username..'  \n <b>به علت ارسال پیام ممنوعه ازطرف ربات#یک اخطار دریافت کرد!</b>\n◂ • تعداد اخطار : '..Alpha(warnhashbd)..'/'..Alpha(warn)..'\n⚠️ <b>دلیل اخطار</b> : #'..fa..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n❌ وضعیت اخطار های کاربر به حداکثر خود برسد درگروه #اخراج خواهد شد.'
send(msg.chat_id,msg.id,text,'html')
end
end
end
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<><>
local function lock_ban(msg,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
if base:get(TD_ID.."ban_stats"..msg.chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'bantime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'مسدود شد به مدت '..Time_..''
kickChatMemberTime(msg.chat_id,msg.sender_user_id,msg.date+ex)
else
hallatban = 'مسدود شد!'
KickUser(msg.chat_id,msg.sender_user_id)
end
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..")  به علت ارسال پیام ممنوعه از طرف ربات "..hallatban..".\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ دلیل مسدود :  *"..fa.."* ","md")
end
else
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..") \n◂ تخلف "..fa.." را انجام دادہ است ولی ربات دسترسی برای مسدود کردن وی را ندارد !",'md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(msg.sender_user_id,name)
end






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

--<><>Msg Check >> @MrRamin<><>--
local function MsgCheck(msg,fa,Redis,Redis2)
if base:sismember(TD_ID..'Gp3:'..msg.chat_id,msg.sender_user_id..' حذف '..Redis2) or base:sismember(TD_ID..'Gp:'..msg.chat_id,'Del:'..Redis) then
lock_del(msg)
end
if base:sismember(TD_ID..'Gp4:'..msg.chat_id,msg.sender_user_id..' حذف '..Redis2) and not is_Owner(msg) and not  is_Nazem(msg) then
lock_del(msg)
end
if not(base:sismember(TD_ID..'Gp:'..msg.chat_id,'Ban:'..Redis) or base:sismember(TD_ID..'Gp:'..msg.chat_id,'Kick:'..Redis)) then
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Mute:'..Redis) then
lock_mute(msg,fa)
end
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Silent:'..Redis) then
lock_silent(msg,fa)
end
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Warn:'..Redis) then
lock_warn(msg,fa)
end
end
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Kick:'..Redis) then
lock_kick(msg,fa)
end
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Ban:'..Redis) then
lock_ban(msg,fa)
end
end
function escape_markdown(str)
return tostring(str):gsub('%_', '\\_'):gsub('%[', '\\['):gsub('%*', '\\*'):gsub('%*', '\\*')
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
function AnswerInline(inline_query_id, query_id , title , description , text,parse_mode, keyboard)
local results = {{}}
results[1].id = query_id
results[1].type = 'article'
results[1].description = description
results[1].title = title
results[1].message_text = text
results[1].parse_mode = parse_mode
Rep= Bot_Api .. '/answerInlineQuery?inline_query_id=' .. inline_query_id ..'&results=' .. URL.escape(json:encode(results))..'&parse_mode=&cache_time=' .. 1
if keyboard then
results[1].reply_markup = keyboard
Rep = Bot_Api.. '/answerInlineQuery?inline_query_id=' .. inline_query_id ..'&results=' .. URL.escape(json:encode(results))..'&parse_mode=Markdown&cache_time=' .. 1
end
https.request(Rep)
end
local function BDStartQuery(data)
if data.query:match('(.*)@(.*)') then
Split = data.query:split('@')
if Split[1] and Split[2] then
user = '@'..Split[2]
username = Split[2]
if tonumber(utf8.len(Split[1])) < 200 then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function getusername(Ramin,ALPHA)
if tonumber(utf8.len(data.query)) > 50 then
Ramin = tonumber(50) - tonumber(utf8.len(user))
text = string.sub(Split[1],0,Ramin)..'..'
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'نمایش پیام 🔓',callback_data = 'Najva::'..username..'::BDMrr'..string.sub(Split[1],0,Ramin)}
}
}
base:setex(string.sub(Split[1],0,Ramin),tonumber(day),string.sub(Split[1],Ramin+1,99999))
if ALPHA.id then
AnswerInline(data.id,'MrRamin','نجوا برای : '..user,'پیام شما : '..text..'\nبرای ارسال نجوا کلیک کنید !','• کاربر : <a href="tg://user?id='..ALPHA.id..'">'..username..'</a>\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
else
AnswerInline(data.id,'MrRamin','نجوا برای : '..user..' (کاربر مورد نظر یافت نشد)','پیام شما : '..text..'\nبرای ارسال نجوا کلیک کنید !','• کاربر : '..user..'\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
end
else
text = Split[1]
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'نمایش پیام 🔓',callback_data = 'Najva::'..username..'::'..text}
}
}
if ALPHA.id then
AnswerInline(data.id,'MrRamin','نجوا برای : '..user,'پیام شما : '..text..'\nبرای ارسال نجوا کلیک کنید !','• کاربر : <a href="tg://user?id='..ALPHA.id..'">'..username..'</a>\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
else
AnswerInline(data.id,'MrRamin','نجوا برای : '..user..' (کاربر مورد نظر یافت نشد)','پیام شما : '..text..'\nبرای ارسال نجوا کلیک کنید !','• کاربر : '..user..'\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
end

end
end
resolve_username(username,getusername)
end
GetUser(data.sender_user_id,name)
else
AnswerInline(data.id,'MrRamin','تعداد کارکترهای پیام شما بیش از حد مجاز است !','تعداد کارکترهای پیام شما : '..tonumber(utf8.len(Split[1])),'html',nil)
end
end
end
if data.query:match('(.*)(%d+)(%d+)(%d+)(%d+)(%d+)(%d+)(%d+)$') then
finduser = string.find(data.query,'(%d+)(%d+)(%d+)(%d+)(%d+)(%d+)(%d+)')
user = string.sub(data.query,finduser,9999)
text2 = data.query:gsub('(%d+)(%d+)(%d+)(%d+)(%d+)(%d+)(%d+)','')
if tonumber(utf8.len(text2)) < 200 then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function getusername(Ramin,ALPHA)
if ALPHA.username == '' then nameuser = ec_name(ALPHA.first_name) else nameuser = ALPHA.username end
if tonumber(utf8.len(data.query)) > 50 then
Ramin = tonumber(50) - tonumber(utf8.len(user))
text = string.sub(text2,0,Ramin)
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'نمایش پیام 🔓',callback_data = 'Najva::'..user..'::BDMrr'..text}
}
}
base:setex(text,tonumber(day),string.sub(text2,Ramin+1,99999))
if nameuser then
AnswerInline(data.id,'MrRamin','نجوا برای : '..nameuser,'پیام شما : '..text..'..\nبرای ارسال نجوا کلیک کنید !','• کاربر : <a href="tg://user?id='..user..'">'..nameuser..'</a>\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
else
AnswerInline(data.id,'MrRamin','نجوا برای : '..user..' (کاربر مورد نظر یافت نشد)','پیام شما : '..text..'..\nبرای ارسال نجوا کلیک کنید !','• کاربر : '..user..'\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
end

else
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'نمایش پیام 🔓',callback_data = 'Najva::'..user..'::'..text2}
}
}
if nameuser then
AnswerInline(data.id,'MrRamin','نجوا برای : '..nameuser,'پیام شما : '..text..'\nبرای ارسال نجوا کلیک کنید !','• کاربر : <a href="tg://user?id='..user..'">'..nameuser..'</a>\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
else
AnswerInline(data.id,'MrRamin','نجوا برای : '..user..' (کاربر مورد نظر یافت نشد)','پیام شما : '..text..'\nبرای ارسال نجوا کلیک کنید !','• کاربر : '..user..'\n🔐شما از طرف <a href="tg://user?id='..data.sender_user_id..'">'..name..'</a> یک پیام مخفی دارید!\nبرای دیدن پیام کلیک کنید !','html',keyboard)
end

end
end
GetUser(user,getusername)
end
GetUser(data.sender_user_id,name)
else
AnswerInline(data.id,'MrRamin','تعداد کارکترهای پیام شما بیش از حد مجاز است !','تعداد کارکترهای پیام شما : '..tonumber(utf8.len(text2)),'html',nil)
end
end
end
--<><>Bot Msg<><>--
function BotMessage(chat_id,msg_id,data)
local Ramin = data.top_message.content.text
if base:sismember(TD_ID..'Gp2:'..chat_id,'cbmon') then
function BDClearCmd()
deleteMessages(chat_id,{[0] = msg_id})
end
local timecgms = tonumber(base:get(TD_ID..'cbmtime:'..chat_id)) or 20
alarm(timecgms,BDClearCmd)
end



if data.top_message.content._ == "messageText" then
sgpsfree = base:scard(TD_ID..'AGTMute:')
logo ={
'⋘ پردازش تمامی ممبرهای گروه …⋙\n>> تعداد تبچی در لیست ربات : '..sgpsfree..'\n(➋⓿%)\n■■■□□□□□□□□□□',
'⋘ پردازش تمامی ممبرهای گروه …⋙\n>> تعداد تبچی در لیست ربات : '..sgpsfree..'\n(➎⓿%)\n■■■■■□□□□□□□□',
'⋘ پردازش تمامی ممبرهای گروه …⋙\n>> تعداد تبچی در لیست ربات : '..sgpsfree..'\n(➐⓿%)\n■■■■■■■■□□□□□□',
'⋘ پردازش تمامی ممبرهای گروه …⋙\n>> تعداد تبچی در لیست ربات : '..sgpsfree..'\n(➊⓿⓿%)\n■■■■■■■■■■■■■■■'
}

if Ramin:match('به گروه خوش آمدی مالکین این گروه برای جلوگیری') or Ramin:match('این اخرین تلاش شما جهت پاسخگویی در صورت اشتباه مجدد')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
alarm(300,BDClearPm)
end


if base:sismember(TD_ID..'Gp2:'..chat_id,'Welcomeon') then
if Ramin:match('^👤کاربر  ') or Ramin:match('^🌟 سلام') then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
timecgms = base:get(TD_ID..'cleanwelcometime:'..chat_id) or 20
alarm(20,BDClearPm)
end
end


if Ramin:match('^◆ مدیران گروه توجه یک کاربر')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
alarm(119,BDClearPm)
end



if Ramin:match('^◆ ارسال پیام مخفی به کاربر') or Ramin:match('^به خاطر امنیت گروه شما') or Ramin:match('^👤کاربر') or Ramin:match('^◂ قابل توجه مدیران گروه ')  or Ramin:match('^◈ عملیات خودکار پاکسازی تبچی با موفقیت انجام شد.')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
base:del(TD_ID..'Fozolgp:')
alarm(20,BDClearPm)
end

if Ramin:match('^◆ بخش مورد نظر را انتخاب کنید :')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
alarm(299,BDClearPm)
end
if Ramin:match('^◂ قابل توجه مدیران گروه')  or Ramin:match('^◈ کاربر')  or Ramin:match('^◈ عملیات شناسایی ربات ') or Ramin:match('^پنل مدیریتی به صورت خودکار بسته شد!')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
alarm(20,BDClearPm)
end

if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmute')  then
if  Ramin:match('^⇜ احراز هویت جوین اجباری کانال') or Ramin:match('^◆ کاربر')  or Ramin:match('^◆کاربر عزیز') or  Ramin:match('^◈کاربر عزیز') then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id)) or 15
alarm(JoinMSG,BDClearPm)
end
end

if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoin') and base:sismember(TD_ID..'Gp:'..chat_id,'Join:Emoji') then
if Ramin:match('^◈کاربر عزیز') or Ramin:match('^▪️ دوست عزیز') or Ramin:match('^👤کاربر عزیز')  or Ramin:match('^عضو شو تا پیامت پاک نشه')   then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id)) or 15
alarm(JoinMSG,BDClearPm)
end
end
if base:sismember(TD_ID..'Gp:'..chat_id,'Join:Emoji') then
if Ramin:match('^◈کاربر عزیز') or Ramin:match('^▪️ دوست عزیز') or Ramin:match('^👤کاربر عزیز')  or Ramin:match('^👥لیست افرادی که هنوز عضو نشده اند')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id)) or 15
alarm(JoinMSG,BDClearPm)
end
end

if base:sismember(TD_ID..'Gp:'..chat_id,'Join:Filter') then
if Ramin:match('^◈کاربر عزیز') or Ramin:match('^▪️ دوست عزیز') or Ramin:match('^👤کاربر عزیز')  or Ramin:match('^👥لیست افرادی که هنوز عضو نشده اند')  then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
JoinMSG = tonumber(base:get(TD_ID..'JoinMSG:Time:'..chat_id)) or 15
alarm(JoinMSG,BDClearPm)
end
end



if Ramin:match('ربات درحال انجام عملیات شناسایی تبچی ها...\n\n ▎')   then
function edit_text(data,org)
if data.i > 4 then
local list = base:smembers(TD_ID..'AGTMute:'..chat_id)
if #list == 0  then
editt(chat_id,msg_id,'◈ عملیات با موفقیت انجام شد!','html')
else
for k,v in pairs(list) do
ram = k
end
editt(chat_id,msg_id,'◈ به تعداد <b>'..ram..'</b> تبچی از گروه پاکسازی شد.','html')
end
else
editt(chat_id,msg_id,Ramin..logo[data.i],'html')
alarm(0.2,edit_text,{i=data.i+1})
end
end
alarm(0.2,edit_text,{i=1})
end


end
end


local function BDStartPro(msg,data)
----------------------------------------------

---OpenChat
BDChatId = tostring(data.chat_id)
if BDChatId:match('^-100') then
openChat(BDChatId)
end
assert (tdbot_function ({ _ = 'openMessageContent',chat_id = data.chat_id,message_id = data.message_id}, dl_cb, nil))
----Start
if not base:get(TD_ID.."OpenChats") or base:ttl(TD_ID.."OpenChats") == -2 then
local open = base:smembers(TD_ID.."SuperGp")
for k,v in pairs(open) do
openChat(v)
assert (tdbot_function ({_ = "openChat",chat_id = v.chat_id}, dl_cb, nil) )
base:setex(TD_ID.."OpenChats", 1, true)
end
end

if msg then
local TD_B0T = msg.content.text
if TD_B0T then
TD_B0T = TD_B0T:lower()
end
if MsgType == 'text' and TD_B0T then
if TD_B0T:match('^[/#!]') then
TD_B0T = TD_B0T:gsub('^[/#!]','')
end
end

local chat_id = tostring(msg.chat_id)
local user_id = msg.sender_user_id
local msg_id = msg.id
local reply_id = msg.reply_to_message_id
local caption = msg.content.caption
if msg.content.text then
--vardump(value)
function dl_user(a, b)
function dl_gp(c, d)
name = b.first_name or '----'
gname = d.title or '----'
--print("["..os.date("%X").."] \027[34m"..gname.."\027[39m >> \027[31m"..name.."\027[39m >> "..msg.content.text.." \27[0;39m")
end
GetChat(chat_id,dl_gp)
end
GetUser(user_id,dl_user)
end


if msg.date < tonumber(MsgTime) then
return false
end

if not base:get(TD_ID.."gpstats:" .. msg.chat_id) then
base:zremrangebyscore(TD_ID..'bot:msgusr2:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Unsupported:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:VideoNote:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Sticker:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Audio:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Voice:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Photo:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:addusr2:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Gif:'..msg.chat_id..':', 0, 2000000)
t =  base:get(TD_ID.."timestats:" .. msg.chat_id) or 86400
base:setex(TD_ID.."gpstats:" .. msg.chat_id, t , true)
end
base:zincrby(TD_ID..'bot:msgusr2:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:messagesDay:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..msg.sender_user_id)


----set sudo----
if #base:smembers(TD_ID..'SUDO') == 0 then
for k,mohammadrezarosta in pairs(SUDO) do
base:sadd(TD_ID..'SUDO',mohammadrezarosta)
end
for m,alpha in pairs(Full_Sudo) do
base:sadd(TD_ID..'SUDO',alpha)
end
base:sadd(TD_ID..'SUDO',BotJoiner)
end
if is_supergroup(msg) then
if base:get(TD_ID.."cleanmsgs") then
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..msg.chat_id..v)
base:del(TD_ID..'Total:AddUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat_id)
base:del(TD_ID..'Total:BanUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:KickUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..v)
end
end
end
---- Gps Pvs ----
if msg.chat_id then
local id = tostring(msg.chat_id)
if is_supergroup(msg) then
if not base:sismember(TD_ID.."SuperGp",msg.chat_id) then
base:sadd(TD_ID.."SuperGp",msg.chat_id)
end
elseif id:match('^-(%d+)') then
if not base:sismember(TD_ID.."Chat:Normal",msg.chat_id) then
base:sadd(TD_ID.."Chat:Normal",msg.chat_id)
end
elseif id:match('(%d+)') then
if not base:sismember(TD_ID.."ChatPrivite",msg.chat_id) then
base:sadd(TD_ID.."ChatPrivite",msg.chat_id)
end
end
end

---------- locals
local lang = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'alphalang')
local reportpv = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'reportpv')
local reportpvall = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'reportpvall')
local ownerslist = base:smembers(TD_ID..'OwnerList:'..msg.chat_id)
local ModList = base:smembers(TD_ID..'ModList:'..msg.chat_id)
function reportowner(text)
if reportpv then
for k,v in pairs(ownerslist) do
send(v,0,text,'md')
end
end
end
function reportall(text)
if reportpvall then
for k,v in pairs(ModList) do
send(v,0,text,'md')
end
end
end
--reporttext = '\nدقت کنید تنظیم در خصوصی برای شما فعال باشد و در صورتی که فعال نیست با دستور (ثبت گروه) یا (setgp) در همین خصوصی ربات این قابلیت را فعال کنید.'
------- Start ------
if is_supergroup(msg) then
----check charge
if (msg.content._ == "messageChatJoinByLink" and msg.sender_user_id == Config.BotCliId) or (msg.add and msg.add == BotCliId and is_Sudo(msg)) and not base:get(TD_ID..'ExpireData:'..msg.chat_id)  and not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then
base:set(TD_ID.."ExpireData:"..msg.chat_id,'RaminALPHA')
end
end


function forward_get(extra, result)
if result.forward_info and base:get(TD_ID.."banallforward"..msg.chat_id)  then
if OwnUser(msg.chat_id, result.forward_info.sender_user_id) then
send(msg.chat_id, msg.id, '◂ کاربر مالک گروه می باشد دسترسی به بن ال کردن این کاربر را ندارید !', 'html')
base:del(TD_ID.."banallforward"..msg.chat_id)
return false
end
if not result.forward_info.sender_user_id then 
else
Banall(msg, msg.chat_id, result.forward_info.sender_user_id)
end
base:del(TD_ID.."banallforward"..msg.chat_id)
end
end 
getMessage(msg.chat_id, msg.id, forward_get)



function JoinChannelduc(msg)
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then end
local warn = base:get(TD_ID..'joinwarn:'..msg.chat_id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not  is_Nazem(msg) and not is_VipJoin(msg) then
deleteMessages(msg.chat_id,{[0] = msg.id})
local function gifch(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(endwarn) > tonumber(warn) then
else
base:set(TD_ID.."ToshFormid"..msg.chat_id ,msg.sender_user_id)
local formid = base:get(TD_ID.."ToshFormid"..msg.chat_id)
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat_id) or ' عضویت درکانال  '
local bd = base:get(TD_ID..'Text:Chjoin:'..msg.chat_id) or '  ◈<b>کاربر عزیز </b>  '..username..' \n◈ <b>ارسال </b> #'..MsgType1..' <b> قفل می باشد</b>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n<b>برای ارسال</b> #'..MsgType1..' <b>باید عضو کانال ما شوید.</b>'
local bd = replace(bd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>')
local bd = replace(bd,'FIRSTNAME',ec_name(alpha.first_name))
local bd = replace(bd,'LASTNAME',alpha.last_name or '')
local bd = replace(bd,'USERNAME','@'..check_markdown(alpha.username)) or 'بدون@'
local bd = replace(bd,'ENDWARN',''..endwarn) or ''
local bd = replace(bd,'WARN',''..warn) or ''
local bd = replace(bd,'NameCH',''..chname) or ''
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = chname,url='https://telegram.me/'..Ch},
},{
{text = '◈ کاربر ربات می باشد.(مخصوص مدیران) ◈',callback_data = 'TTBan:'..chat_id..':'..formid..''}
}
}
send_inline(msg.chat_id,''..bd..'',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
end
end
GetUser(msg.sender_user_id,gifch)
else
return true
end
end
if is_Owner(msg)  or is_Nazem(msg) then
if msg.content._ == 'messagePinMessage' then
base:set(TD_ID..'Pin_id'..msg.chat_id,msg.content.message_id)
end
end
-------------Flood Check------------
local cleantime = tonumber(base:get(TD_ID..'clean:time:'..msg.chat_id) or 120)
local Forcetime = tonumber(base:get(TD_ID..'Force:Time:'..msg.chat_id) or 240)
local Forcepm = tonumber(base:get(TD_ID..'Force:Pm:'..msg.chat_id) or 2)
local Forcmsg = tonumber(base:get(TD_ID..'Force:Pmmsg:'..msg.chat_id) or 5)
local Forcst = tonumber(base:get(TD_ID..'Force:Pmst:'..msg.chat_id) or 5)
local Forcgif = tonumber(base:get(TD_ID..'Force:Pmgif:'..msg.chat_id) or 5)
local Forcvoice = tonumber(base:get(TD_ID..'Force:Pmvoice:'..msg.chat_id) or 5)
local Forcmusic = tonumber(base:get(TD_ID..'Force:Pmmusic:'..msg.chat_id) or 5)
local Forcself = tonumber(base:get(TD_ID..'Force:Pmself:'..msg.chat_id) or 5)
local Forcfile = tonumber(base:get(TD_ID..'Force:Pmfile:'..msg.chat_id) or 5)
local NUM_MSG_MAX = tonumber(base:get(TD_ID..'Flood:Max:'..msg.chat_id) or 6)
local NUM_CH_MAX =  tonumber(base:get(TD_ID..'NUM_CH_MAX:'..msg.chat_id) or 2000)
local TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Time:'..msg.chat_id) or 5)
local warn = tonumber(base:get(TD_ID..'Warn:Max:'..msg.chat_id) or 3)
local Forcemax = tonumber(base:get(TD_ID..'Force:Max:'..msg.chat_id) or 10)
local added = base:get(TD_ID..'addeduser'..msg.chat_id..''..msg.sender_user_id) or 0
local newuser = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'force_NewUser')
-------------MSG BlaCk ------------
local Ramin = msg.content.text
local Ramin1 = msg.content.text
local ALPHAent = Ramin and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName"
if Ramin then
Ramin = Ramin:lower()
end
if MsgType == 'text' and Ramin then
if Ramin:match('^[/#!]') then
Ramin = Ramin:gsub('^[/#!]','')
end
end

if Ramin then
if base:sismember(TD_ID..'CmDlist:'..msg.chat_id,Ramin) then
mmdi = base:hget(TD_ID..'CmD:'..msg.chat_id,Ramin)
Ramin = Ramin:gsub(Ramin,mmdi)
end
end
BaseCmd = 'MohammadRezaRostaNavi'
if Ramin and Ramin:match(' ') then
CmdMmD = Ramin:split(' ')
BaseCmd = CmdMmD[1]
end
--------------MSG TYPE----------------




if msg.content._== "messageText" then
base:sadd('ID:',msg.sender_user_id)
base:sadd('ID:',msg.sender_user_id)
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'automuteall') then
MsgType = 'text'
--base:sadd(TD_ID..'Tagmem:'..msg.chat_id,msg.sender_user_id)
end
end


if msg.content._ == "messageChatDeleteMember" then
base:sadd('ID:',msg.sender_user_id)
base:incr(TD_ID..'Total:DelUser:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..msg.sender_user_id)
base:incr(TD_ID..'Total:DelUser:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'Total:DelUser:'..msg.chat_id)
base:zincrby(TD_ID..'bot:delusr:'..msg.chat_id..':', 1, msg.sender_user_id)
msg.deluser = true
MsgType = 'DelUser' 
end
if msg.content._ == "messageChatAddMembers" then
base:sadd('ID:',msg.sender_user_id)
base:incr(TD_ID..'Total:AddUser:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'Total:AddUser:'..msg.chat_id)
base:zincrby(TD_ID..'bot:addusr2:'..msg.chat_id..':', 1, msg.sender_user_id)
for i=0,#msg.content.member_user_ids do
msg.add = msg.content.member_user_ids[i]
MsgType = 'AddUser'
end
end
if msg.content._ == "messageChatJoinByLink" then
base:sadd('ID:',msg.sender_user_id)
base:incr(TD_ID..'Total:JoinedByLink:'..msg.chat_id)
MsgType = 'JoinedByLink'
end
if msg.content._ == "messageDocument" then
base:zincrby(TD_ID..'bot:Document:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Document'
MsgType1 = 'فایل'
end
if msg.content._ == "messageSticker" then
base:sadd('ID:',msg.sender_user_id)
base:zincrby(TD_ID..'bot:Sticker:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Sticker'
MsgType1 = 'استیکر'
stk = msg.content.sticker.sticker.id
end
if msg.content._ == "messageAudio" then
base:zincrby(TD_ID..'bot:Audio:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Audio'
MsgType1 = 'آهنگ'
end
if msg.content._ == "messageVoice" then
base:zincrby(TD_ID..'bot:Voice:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Voice'
MsgType1 = 'ویس'
end
if msg.content._ == "messageVideo" then
base:sadd('ID:',msg.sender_user_id)
base:zincrby(TD_ID..'bot:Video:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Video'
MsgType1 = 'فیلم'
end


if msg.content._ == "messageAnimation" or msg.content._ == "messageDocument" and msg.content.document and msg.content.document.mime_type == "image/gif" then
base:zincrby(TD_ID..'bot:Gif:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Gif'
MsgType1 = 'گیف'
end
if msg.content._ == "messageLocation" then
MsgType = 'Location'
end

if msg.content._ == "messageForwardedFromUser" then
MsgType = 'messageForwardedFromUser'
MsgType1 = 'فوروارد کاربر'
end
if msg.content._ == "messageContact" then
MsgType = 'Contact'
end
if not msg.reply_markup and msg.via_bot_user_id ~= 0 then
--print(serpent.block(data))
MsgType = 'MarkDown'
end
if msg.content.game then
MsgType = 'Game'
MsgType1 = 'بازی'
end

if msg.content._ == "messageSticker" then
sticker_id = ''
local function get_cb(extra, TDBot)
if TDBot.content then
sticker_id = TDBot.content.sticker.sticker.id
downloadFile(sticker_id, 32)
end
end
getMessage(msg.chat_id, msg.id, get_cb)
end
















if msg.content._ == "messagePhoto" then
photo_id = ''
base:zincrby(TD_ID..'bot:Photo:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgType = 'Photo'
MsgType1 = 'عکس'
local function get_cb(extra, TDBot)
if TDBot.content then
if TDBot.content.photo.sizes[2] then
photo_id = TDBot.content.photo.sizes[2].photo.id
else
--photo_id = TDBot.content.photo.sizes[1].photo.id
end
DWN(photo_id, 32)
end
end
getMessage(msg.chat_id, msg.id, get_cb)
end




if msg.content._== "messageText" then
MsgType = 'text'
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejointext')   then
JoinChanneltext(msg)
end
end
if msg.content.caption then
end


if msg.content._ == "messageChatAddMembers" then
base:sadd('ID:',msg.sender_user_id)
base:incr(TD_ID..'Total:AddUser:'..msg.chat_id..':'..msg.sender_user_id)
for i=0,#msg.content.member_user_ids do
msg.add = msg.content.member_user_ids[i]
MsgType = 'AddUser'
end
end
if msg.content._ == "messageChatJoinByLink" then
base:sadd('ID:',msg.sender_user_id)
base:incr(TD_ID..'Total:JoinedByLink:'..msg.chat_id)
MsgType = 'JoinedByLink'
end




if msg.content._ == "messageDocument" then
base:sadd('ID:',msg.sender_user_id)
MsgType = 'Document'
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinducfgffhghgh')   then
JoinChannelduc(msg)
end
end
if msg.content._ == "messageSticker" then
sd = msg.content.sticker.sticker.id
DWN(sd)
end

if msg.content._ == "messageSticker"   then
base:sadd('ID:',msg.sender_user_id)
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinducfgffhghgh')   then
JoinChannelduc(msg)
MsgType = 'Sticker'
MsgType1 = 'استیکر'
stk = msg.content.sticker.sticker.id
end
end

if msg.content._ == "messageAudio" then
base:sadd('ID:',msg.sender_user_id)
MsgType = 'Audio'
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinducfgffhghgh')   then
JoinChannelduc(msg)
end
end
if msg.content._ == 'messageSticker' and not is_Vip(msg) then
local filterpack = base:smembers(TD_ID.."filterpack"..msg.chat_id)
local warn = base:get(TD_ID..'joinwarn:'..msg.chat_id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
local function messageStickerfilter(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>'
for k,v in pairs(filterpack) do
if v == msg.content.sticker.set_id then
deleteMessages(msg.chat_id, {[0] = msg.id})
if tonumber(endwarn) > tonumber(warn) then
else
sendMessage(msg.chat_id, 0, 1, "◈کاربر   "..username.."  <code>باعرض پوزش ارسال این استیکر رو ندارید!</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ اخطار پیامی:<b>"..endwarn.."</b>از<b>"..warn.."</b>", 1, "html")
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
end
end
end
end
GetUser(msg.sender_user_id,messageStickerfilter)
end


if Ramin and  not is_ModLockOptionLink(msg) then
if Ramin:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or Ramin:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or Ramin:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or Ramin:match("[Tt].[Mm][Ee]/") and  not is_ModLockOptionLink(msg)  then
if base:get(TD_ID.."sg:permissions"..msg.chat_id) == "lock"  then
local function Alphast(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>'
deleteMessages(msg.chat_id,{[0] = msg.id})
--sendMessage(msg.chat_id, 0, 1, "◈<code>ادمین عزیز</code>   "..username.."  <code>شما اجازه ارسال کردن لینک در گروه رو ندارید!</code>\n <code>◂با عرض پوزش مالک گروه مجوز ارسال کردن لینک به شما نداده است.</code>", 1, "html")
end
GetUser(msg.sender_user_id,Alphast)
end
end
end

if msg.content.caption and  not is_ModLockOptionLink(msg) then
local Ramin = msg.content.caption
if Ramin:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or Ramin:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or Ramin:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or Ramin:match("[Tt].[Mm][Ee]/") and  not is_ModLockOptionLink(msg)   then
if base:get(TD_ID.."sg:permissions"..msg.chat_id) == "lock"  then
local function Alphast(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>'
deleteMessages(msg.chat_id,{[0] = msg.id})
--sendMessage(msg.chat_id, 0, 1, "◈<code>ادمین عزیز</code>   "..username.."  <code>شما اجازه ارسال کردن لینک در گروه رو ندارید!</code>\n <code>◂با عرض پوزش مالک گروه مجوز ارسال کردن لینک به شما نداده است.</code>", 1, "html")
end
GetUser(msg.sender_user_id,Alphast)
end
end
end

if msg.add and not is_ModLockOptionBot(msg) then
if base:get(TD_ID.."sg:permissions"..msg.chat_id) == "lock"  then
local function Alphast(ramin,alpha)
function add(BlaCk,ALPHA)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if ALPHA.type._ == "userTypeBot" then
KickUser(msg.chat_id,ALPHA.id)
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>'
deleteMessages(msg.chat_id,{[0] = msg.id})
--sendMessage(msg.chat_id, 0, 1, "◈<code>ادمین عزیز</code>   "..username.."  <code>شما اجازه ادکردن ربات دیگر در گروه رو ندارید!</code>\n <code>◂با عرض پوزش مالک گروه مجوز ادکردن ربات به شما نداده است.</code>", 1, "html")
end
end
GetUser(msg.add,add)
end
GetUser(msg.sender_user_id,Alphast)
end
end
---------------------------------------

if msg.content._ == 'messagePinMessage'  and  not is_ModPin(msg)  then
if base:get(TD_ID.."sg:pin"..msg.chat_id) == "lock"  then
local function pinRam(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>'
Unpin(msg.chat_id)
sendMessage(msg.chat_id, 0, 1, "◈<code>کاربر</code>   "..username.."  <code>شما اجازہ سنجاق کردن درگروہ را ندارید!</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n <code>◂ با عرض پوزش سنجاق کردن پیام توسط مالک گروہ بسته شدہ است.</code>", 1, "html")
end
GetUser(msg.sender_user_id,pinRam)
end
end


if msg.content._ == "messageVoice" then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
MsgType = 'Voice'
MsgType1 = 'ویس'
base:incr(TD_ID..'babak:Voice:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'babak:Voice:'..msg.chat_id)
end
end

if msg.content._ == "messageVideo" then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
MsgType = 'Video'
MsgType1 = 'فیلم'
base:incr(TD_ID..'babak:Video:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'babak:Video:'..msg.chat_id)
end
end

if msg.content._ == "messageAnimation" or msg.content._ == "messageDocument" and msg.content.document and msg.content.document.mime_type == "image/gif" then

if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
MsgType = 'Gif'
MsgType1 = 'گیف'
base:incr(TD_ID..'babak:Animation:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'babak:Animation:'..msg.chat_id)
end
end

if msg.content._ == "messageLocation" then
MsgType = 'Location'
end

if msg.content._ == "messageForwardedFromUser" then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
--base:sadd(TD_ID..'Tabchi:'..msg.chat_id,msg.sender_user_id)
base:incr(TD_ID..'Tabchi:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'Tabchi:'..msg.chat_id)
MsgType = 'messageForwardedFromUser'
end
end

if msg.content._ == "messageContact" then
MsgType = 'Contact'
end

if not msg.reply_markup and msg.via_bot_user_id ~= 0 then
--print(serpent.block(data))
MsgType = 'MarkDown'
end

if msg.content.game then
MsgType = 'Game'
end

if msg.content._ == "messagePhoto" then
MsgType = 'Photo'
MsgType1 = 'عکس'
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
end
end

if msg.content._ == 'messageVideoNote' then
MsgType = 'VideoNote'
MsgType1 = 'فیلم سلفی'
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
base:zincrby(TD_ID..'bot:VideoNote:'..msg.chat_id..':', 1, msg.sender_user_id)
end
end

if msg.content._ == 'messageUnsupported' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinduc')   then
JoinChannelduc(msg)
MsgType = 'Unsupported'
MsgType1 = 'استیکر متحرک'
end
end

------------------



-------------------------
if base:get(TD_ID..'freeinstall') then
if msg.add and msg.add == BotJoiner then
base:sadd(TD_ID.."SuperGpFree",msg.chat_id)
if not base:get(TD_ID..'ExpireDatafree:') then
num = "31"
else
num = base:get(TD_ID..'ExpireDatafree:')
end
base:setex(TD_ID..'ExpireData:'..msg.chat_id,day*num,true)
--base:sadd(TD_ID..'Gp2:'..msg.chat_id,'added')
local function GetCreator(extra, result, success)
for k,v in pairs(result.members) do
if v.status._ == "chatMemberStatusCreator" then
local addmins = tonumber(result.total_count) -1
local function name(arg, data, success)
if data.username ~= '' then
username = '<code>'..v.user_id..'</code> - @'..data.username..''
else
username = ''
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = ' ارتباط مستقیم با پشتیبانی •  ',url='https://telegram.me/'..Config.Channel}
}
}
local function GetName(BlaCk, ALPHA)
base:sadd(TD_ID..'OwnerList:'..msg.chat_id,v.user_id)
send_inline(msg.chat_id,'<a href="tg://user?id='..v.user_id..'">• مدیر گرامی </a> از انتخاب شما متشکرم!\n\n◂ برای راه اندازی ربات به صورت رایگان 30 روزه لطفا به صورت دقیق مراتب زیر را انجام دهید:\n\n1️⃣ ربات را ادمین کنید و دستور ( نصب رایگان) را در گروه ارسال کنید.\n\n2️⃣ بعد از ارسال دستور (نصب رایگان) ربات مکمل کمکی(پاکسازی) به صورت خودکار داخل گروه اضافه می شود اگر احیانا ربات پاکسازی داخل گروه اضافه نشده است به واحد پشتیبانی مراجعه کنید!\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈\nارتباط با پشتیبانی : \n ◇ @'..Config.Sudo1..'\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈',keyboard,'html')
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send(Sudoid,msg.id,'📝 گزارش اضافه شدن ربات دریک گروه به صورت رایگان\n\n➕ رئیس یک کاربر با مشخصات زیر من رو به یک گروه اضافه کرد.\n👤 مالک گروه  : '..username..'\n⚡️ <a href="tg://user?id='..msg.sender_user_id..'">فرد نصب کننده ربات </a>\n'..txt..'\n ♨️ نام گروه :'..ALPHA.title..'\n💬 شناسه گروه : '..msg.chat_id..' ','html')
send(-1001472763096,msg.id,'📝 گزارش اضافه شدن ربات دریک گروه به صورت رایگان\n\n➕ رئیس یک کاربر با مشخصات زیر من رو به یک گروه اضافه کرد.\n👤 مالک گروه  : '..username..'\n ⚡️ <a href="tg://user?id='..msg.sender_user_id..'">فرد نصب کننده ربات </a>\n'..txt..'\n ♨️ نام گروه :'..ALPHA.title..'\n💬 شناسه گروه : '..msg.chat_id..' ','html')
--Left(msg.chat_id,BotCliId,'Left')
end
base:sadd(TD_ID..'OwnerList:'..msg.chat_id,v.user_id)
GetChat(msg.chat_id,GetName)
end
GetUser(v.user_id, name, nil)
end
end
for p,t in pairs(result.members) do
if t.status._== "chatMemberStatusAdministrator" then
base:sadd(TD_ID..'ModList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModCleanList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModBanList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModMuteList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModWarnList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModLockList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModpanelList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModVipList:'..msg.chat_id,t.user_id)
end
end
end
getChannelMembers(msg.chat_id, 'Administrators' , 0, 200, GetCreator)
end--]]
else
if msg.add and msg.add == BotJoiner and not is_Sudo(msg) then
local function GetCreator(extra, result, success)
for k,v in pairs(result.members) do
if v.status._ == "chatMemberStatusCreator" then
local addmins = tonumber(result.total_count) -1
local function name(arg, data, success)
if data.username ~= '' then
username = '<code>'..v.user_id..'</code> - @'..data.username..''
else
username = ''
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = ' ارتباط مستقیم با پشتیبانی •  ',url='https://telegram.me/'..Config.Channel}
}
}
local function GetName(BlaCk, ALPHA)
base:sadd(TD_ID..'OwnerList:'..msg.chat_id,v.user_id)
send_inline(msg.chat_id,'<a href="tg://user?id='..v.user_id..'">• مدیر گرامی </a> از انتخاب شما متشکرم!\n\n⚡️ با عرض پوزش ربات در گروه شما نصب نشد، علت به دلیل با کیفیت بودن امکانات ربات و هزینه بالای سرور ها می باشد.نگران هیچی نباشید شما می توانید به واحد پشتیبانی ربات مراجعه کرده و بعد از خرید ربات می توانید از امکانات فوق پیشرفته ربات بهرمند شوید.\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈\nارتباط با پشتیبانی : \n ◇ @'..Config.Sudo1..'\n┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈',keyboard,'html')
dofile('./Alpha/time.lua')
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send(Sudoid,msg.id,'📝 گزارش اضافه شدن ربات دریک گروه به صورت رایگان\n\n➕ رئیس یک کاربر با مشخصات زیر من رو به یک گروه اضافه کرد.\n👤 مالک گروه  : '..username..'\n⚡️ <a href="tg://user?id='..msg.sender_user_id..'">فرد نصب کننده ربات </a>\n'..txt..'\n ♨️ نام گروه :'..ALPHA.title..'\n💬 شناسه گروه : '..msg.chat_id..' ','html')
send(-1001472763096,msg.id,'📝 گزارش اضافه شدن ربات دریک گروه به صورت رایگان\n\n➕ رئیس یک کاربر با مشخصات زیر من رو به یک گروه اضافه کرد.\n👤 مالک گروه  : '..username..'\n ⚡️ <a href="tg://user?id='..msg.sender_user_id..'">فرد نصب کننده ربات </a>\n'..txt..'\n ♨️ نام گروه :'..ALPHA.title..'\n💬 شناسه گروه : '..msg.chat_id..' ','html')
Left(msg.chat_id,BotCliId,'Left')
end
base:sadd(TD_ID..'OwnerList:'..msg.chat_id,v.user_id)
GetChat(msg.chat_id,GetName)
end
GetUser(v.user_id, name, nil)
end
end
for p,t in pairs(result.members) do
if t.status._== "chatMemberStatusAdministrator" then
base:sadd(TD_ID..'ModList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModCleanList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModBanList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModMuteList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModWarnList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModLockList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModpanelList:'..msg.chat_id,t.user_id)
base:sadd(TD_ID..'ModVipList:'..msg.chat_id,t.user_id)
end
end
end
getChannelMembers(msg.chat_id, 'Administrators' , 0, 200, GetCreator)
end--]]
end
----------- >>GlobalyBan<< ---------------
if msg.sender_user_id and is_GlobalyBan(msg.sender_user_id) or is_Banned(msg.chat_id,msg.sender_user_id) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
KickUser(msg.chat_id,msg.sender_user_id)
--local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..msg.sender_user_id..'</a>'
if msg.id then
username = "["..base:get(TD_ID..'FirstName:'..msg.sender_user_id).."](tg://user?id="..msg.sender_user_id..")"
else
username = "["..base:get(TD_ID..'UserName:'..msg.sender_user_id).."](tg://user?id="..msg.sender_user_id..")"
end
send(msg.chat_id,msg.id,'◈ کاربر  '..username..' درلیست مسدود سراسری ربات می باشد.','md')
else
end
end)
end
if msg.add then
if is_GlobalyBan(msg.add) or is_Banned(msg.chat_id,msg.add) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
KickUser(msg.chat_id,msg.add)
--local username = '<a href="tg://user?id='..msg.id..'"> '..msg.id..'</a>'
if msg.id then
username = "["..base:get(TD_ID..'FirstName:'..msg.id).."](tg://user?id="..msg.id..")"
else
username = "["..base:get(TD_ID..'UserName:'..msg.id).."](tg://user?id="..msg.id..")"
end
send(msg.chat_id,msg.id,'◈ کاربر '..username..' درلیست مسدود سراسری ربات می باشد.','md')
else
end
end)
end
end

if msg.sender_user_id and is_GlobalyBanBot(msg.sender_user_id) or is_Banned(msg.chat_id,msg.sender_user_id) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
KickUser(msg.chat_id,msg.sender_user_id)
--local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..msg.sender_user_id..'</a>'
if msg.id then
username = "["..base:get(TD_ID..'FirstName:'..msg.sender_user_id).."](tg://user?id="..msg.sender_user_id..")"
else
username = "["..base:get(TD_ID..'UserName:'..msg.sender_user_id).."](tg://user?id="..msg.sender_user_id..")"
end
send(msg.chat_id,msg.id,'◈ کاربر  '..username..' یک ربات ضد لینک رایگان تبلبغگر می باشد مجوز نصب کردن در این گروه رو ندارید!','md')
else
end
end)
end
if msg.add then
if is_GlobalyBanBot(msg.add) or is_Banned(msg.chat_id,msg.add) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
KickUser(msg.chat_id,msg.add)
--local username = '<a href="tg://user?id='..msg.id..'"> '..msg.id..'</a>'
if msg.id then
username = "["..base:get(TD_ID..'FirstName:'..msg.id).."](tg://user?id="..msg.id..")"
else
username = "["..base:get(TD_ID..'UserName:'..msg.id).."](tg://user?id="..msg.id..")"
end
send(msg.chat_id,msg.id,'◈ کاربر '..username..' یک ربات ضد لینک رایگان تبلبغگر می باشد مجوز نصب کردن در این گروه رو ندارید!','md')
else
end
end)
end
end

------------------انتی دزد-------------------
if msg.sender_user_id and is_GlobalyMute(msg.sender_user_id) or is_MuteUser(msg.chat_id,msg.sender_user_id)  then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
KickUser(msg.chat_id,msg.sender_user_id)
--local username = '<a href="tg://user?id='..msg.sender_user_id..'">کاربر</a>'
deleteMessages(msg.chat_id,{[0] = msg.id})
if msg.sender_user_id then
username = "["..base:get(TD_ID..'FirstName:'..msg.sender_user_id).."](tg://user?id="..msg.sender_user_id..")"
else
username = "["..msg.sender_user_id.."](tg://user?id="..msg.sender_user_id..")"
end
send(msg.chat_id,msg.id,'◈ کاربر '..username..' یک ربات تبچی می باشد و ازگروه مسدود شد.','md')
else
end
end)
end
if msg.add then
if is_GlobalyMute(msg.add) or is_MuteUser(msg.chat_id,msg.add) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
KickUser(msg.chat_id,msg.add)
--local username = '<a href="tg://user?id='..msg.id..'">کاربر</a>'
deleteMessages(msg.chat_id,{[0] = msg.id})
if msg.id then
username = "["..base:get(TD_ID..'FirstName:'..msg.id).."](tg://user?id="..msg.id..")"
else
username = "["..msg.id.."](tg://user?id="..msg.id..")"
end
send(msg.chat_id,msg.id,'◈ کاربر '..username..' یک ربات تبچی می باشد و ازگروه مسدود شد.','md')
else
end
end)
end
end


if is_supergroup(msg) then
base:incr(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..msg.sender_user_id)
base:incr(TD_ID..'Total:messagescleaner:'..msg.chat_id..':'..os.date("%Y/%m/%d"))
base:incr(TD_ID..'babak:Sticker:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..msg.sender_user_id)
base:incr(TD_ID..'babak:Animation:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..msg.sender_user_id)
base:incr(TD_ID..'Total:messages:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'Total:messagescleaner:'..msg.chat_id)
base:incr(TD_ID..'Total:messages:'..msg.chat_id)
base:sadd(TD_ID..'AllUsers:'..msg.chat_id,msg.sender_user_id)
end

if is_supergroup(msg) then
base:incr(TD_ID..'babak:messages:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'babak:messages:'..msg.chat_id)
base:sadd(TD_ID..'babak:users:'..msg.chat_id,msg.sender_user_id)
local function Rami(arg,data)
if data.username == '' then name = ''..ec_name(data.first_name)..'' else name = ''..data.username..'' end
if not base:get(TD_ID..'UserName:'..msg.sender_user_id) or base:get(TD_ID..'UserName:'..msg.sender_user_id)~=name then
base:set(TD_ID..'UserName:'..msg.sender_user_id,name)
base:set(TD_ID..'FirstName:'..msg.sender_user_id,data.first_name)
base:set(TD_ID..'UserID:'..msg.sender_user_id,msg.sender_user_id)
base:set(TD_ID.."CloudUsers:".."@"..data.username,msg.sender_user_id)
base:set(TD_ID..'FirstUser:'..data.first_name,msg.sender_user_id)
base:sadd('ID:',msg.sender_user_id)
end
end
GetUser(msg.sender_user_id,Rami)
if msg.add then
base:incr(TD_ID..'babak:adds:'..msg.chat_id..':'..msg.sender_user_id)
base:incr(TD_ID..'babak:adds:'..msg.chat_id)
end
end
if msg.send_state._ == "messageIsSuccessfullySent" then
return false
end
----------Msg Checks-------------
local chat = msg.chat_id
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then
if not is_Owner(msg) or is_Nazem(msg) then
if base:get(TD_ID..'Lock:Pin:'..chat) then
if msg.content._ == 'messagePinMessage' then
send(chat,msg.id,'فقط مالکان\n','md')
Unpin(chat)
local PIN_ID = base:get(TD_ID..'Pin_id'..chat)
if Pin_id then
Pin(chat, tonumber(PIN_ID), 0)
end
end
end
end
if not is_Vip(msg) then
local chat = msg.chat_id
local user = msg.sender_user_id
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local timemutejoin = tonumber(base:get(TD_ID..'mutetimejoin:'..msg.chat_id) or 3600)
local hashwarnbd = TD_ID..''..user..':warn'
local warnhashbd = base:hget(hashwarnbd, chat) or 1
local max_warn = tonumber(base:get(TD_ID..'max_warn:'..chat) or 5)
local DIAMOND = msg.content.caption or msg.content.text
--_____________Text Msg Checks_________________
if DIAMOND then
local link = DIAMOND:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or DIAMOND:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or DIAMOND:match("[Tt].[Mm][Ee]/") or DIAMOND:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or DIAMOND:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Pp][Hh]/") or DIAMOND:match("[Hh][Tt][Tt][Pp]://") or DIAMOND:match("[Hh][Tt][Tt][Pp][Ss]://") or DIAMOND:match("[Hh]ttps://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or DIAMOND:match("[Hh]ttps://[Tt].[Mm][Ee]/")
local username = DIAMOND:match("@(.*)") or DIAMOND:match("@")
local tag = DIAMOND:match("#(.*)") or DIAMOND:match("#")
local persian = DIAMOND:match("[\216-\219][\128-\191]")
local english = DIAMOND:match("[A-Z]") or DIAMOND:match("[a-z]")
local emoji = DIAMOND:match("😐") or DIAMOND:match("🤨") or DIAMOND:match("کیر") or DIAMOND:match("جنده") or DIAMOND:match("کوص") or DIAMOND:match("کون") or DIAMOND:match("قهبه")  or DIAMOND:match("خاله")

--<><>Hyper<><>--
if Ramin and msg.content.entities and msg.content.entities[0] and not (msg.content.entities[0].type._ == "textEntityTypeMentionName") then
MsgCheck(msg,'ارسال #هایپرلینک','Hyper','هایپرلینک')
end
if Ramin and msg.content.entities and msg.content.entities[0] and not (msg.content.entities[0].type._ == "textEntityTypeUrl") then
MsgCheck(msg,'ارسال #وب لینک','Weblink','وب لینک')
end
if Ramin and msg.content.entities and msg.content.entities[0] and not (msg.content.entities[0].type._ == "textEntityTypeBold") then
MsgCheck(msg,'ارسال #فونت','Font','فونت')
end

--<><>Mention<><>--
if Ramin and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" then
MsgCheck(msg,'ارسال #فراخانی','Mention','فراخانی')
end
--<><>Link<><>--
if link then
MsgCheck(msg,'ارسال #لینک','Link','لینک')
end
--<><>Fosh<><>--

if emoji then
MsgCheck(msg,'ارسال #ایموجی','Emoji','ایموجی')
end
--<><>Username<><>--
if username then
MsgCheck(msg,'ارسال #نام کاربری','Username','یوزرنیم')
end
--<><>Tag<><>--
if tag then
MsgCheck(msg,'ارسال هَشتَگ','Tag','هشتگ')
end
--<><>Persian<><>--
if persian then
MsgCheck(msg,'ارسال #فارسی','Persian','فارسی')
end
--<><>English<><>--
if english then
MsgCheck(msg,'ارسال #انگلیسی','English','انگلیسی')
end
---end alpha
end
--<><>Caption<><>--
if msg.content.caption then
MsgCheck(msg,'ارسال #کَپشِن','Caption','کپشن')
end
--<><>Text<><>--
if MsgType == 'text' then
MsgCheck(msg,'ارسال #متن','Text','متن')
end
--<><>Edit<><>--

if msg.edit_date > 0 then
MsgCheck(msg,'ارسال #ویرایش پیام','Edit','ویرایش')
end
--<><>Inline<><>--
if msg.content then
if msg.reply_markup and msg.reply_markup._ == "replyMarkupInlineKeyboard" then
MsgCheck(msg,'ارسال #دکمه شیشه ای','Inline','دکمه شیشه ای')
end
end
--<><>Photo<><>--
if MsgType == 'Photo' then
MsgCheck(msg,'ارسال #عکس','Photo','عکس')
end
--<><>Fwd<><>--
if msg.forward_info then
MsgCheck(msg,'ارسال #فوروارد','Forward','فوروارد')
--base:sadd(TD_ID..'Tabchi:'..msg.chat_id,msg.sender_user_id or 00000000)
end
--<><>Videomsg<><>--
if msg.content._ == 'messageVideoNote' then
base:incr(TD_ID..'messageVideoNote:'..msg.chat_id..':'..msg.sender_user_id)
base:zincrby(TD_ID..'bot:VideoNote:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgCheck(msg,'ارسال #ویدیومسیج','Videomsg','ویدیومسیج')
end
--<><>File<><>--
if MsgType == 'Document' then
if msg.content.document.file_name:match("[\216-\219][\128-\191]") or msg.content.caption:match("ضدفیلتر") or msg.content.caption:match("ضد فیلتر") and msg.content.document.file_name:match(".[Aa][Pp][Kk]") then
MsgCheck(msg,'ارسال #بدافزار','Malware','بدافزار')
end
MsgCheck(msg,'ارسال #فایل','Document','فایل')
end
--<><>Location<><>--
if MsgType == 'Location' then
MsgCheck(msg,'ارسال #موقعیت مکانی','Location','موقعیت مکانی')
end
--<><>Voice<><>--
if MsgType == 'Voice' then
MsgCheck(msg,'ارسال #ویس','Voice','ویس')
end
--<><>Contact<><>--
if MsgType == 'Contact' then
MsgCheck(msg,'ارسال #مخاطب','Contact','مخاطب')
end
--<><>Game<><>--
if MsgType == 'Game' then
MsgCheck(msg,'ارسال #بازی','Game','بازی')
end
--<><>Video<><>--
if MsgType == 'Video' then
base:zincrby(TD_ID..'bot:Video:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgCheck(msg,'ارسال #فیلم','Video','فیلم')
end
--<><>Audio<><>--
if MsgType == 'Audio' then
base:zincrby(TD_ID..'bot:Audio:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgCheck(msg,'ارسال #موزیک','Music','آهنگ')
end
--<><>Gif<><>--
if MsgType == 'Gif' then
MsgCheck(msg,'ارسال #گیف','Gif','گیف')
end
--<><>Sticker<><>--
if msg.content._ == "messageSticker" then
base:zincrby(TD_ID..'bot:Sticker:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgCheck(msg,'ارسال #استیکر','Sticker','استیکر')
end
--<><>Sticker2<><>--
if msg.content._ == 'messageUnsupported' then
base:zincrby(TD_ID..'bot:Unsupported:'..msg.chat_id..':', 1, msg.sender_user_id)
MsgCheck(msg,'ارسال #استیکر متحرک','Stickers','استیکر متحرک')
end
--<><>ChannelPost<><>--
if msg.views ~= 0 then
MsgCheck(msg,'ارسال #پست‌کانال','Channelpost','پست کانال')
end

--<><>Flood<><>--


if base:sismember(TD_ID..'Gp:'..chat,'Del:Flood') or base:sismember(TD_ID..'Gp:'..chat,'Kick:Flood') or base:sismember(TD_ID..'Gp:'..chat,'Ban:Flood') or base:sismember(TD_ID..'Gp:'..chat,'Mute:Flood') or base:sismember(TD_ID..'Gp:'..chat,'Warn:Flood') or base:sismember(TD_ID..'Gp:'..chat,'Silent:Flood') then
floodtime = tonumber(base:get(TD_ID..'Flood:Max:'..msg.chat_id)) or 5
floodmax = tonumber(base:get(TD_ID..'Flood:Time:'..msg.chat_id)) or 10
flooduser = tonumber(base:get(TD_ID..'flooduser'..user..msg.chat_id)) or 0
if flooduser > floodmax then
base:del(TD_ID..'flooduser'..user..msg.chat_id)
if base:sismember(TD_ID..'Gp3:'..chat,user..' حذف پیام‌مکرر') or base:sismember(TD_ID..'Gp:'..chat,'Del:Flood') then
deleteMessagesFromUser(msg.chat_id,msg.sender_user_id)
end
else
base:setex(TD_ID..'flooduser'..user..msg.chat_id,floodtime,flooduser+1)
end
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Flood')  then
floodtime = tonumber(base:get(TD_ID..'Flood:Max:'..msg.chat_id)) or 5
floodmax = tonumber(base:get(TD_ID..'Flood:Time:'..msg.chat_id)) or 10
flooduser = tonumber(base:get(TD_ID..'flooduser'..user..msg.chat_id)) or 0
if flooduser > floodmax then
base:del(TD_ID..'flooduser'..user..msg.chat_id)
if base:sismember(TD_ID..'Gp3:'..chat,user..' حذف پیام‌مکرر') or base:sismember(TD_ID..'Gp:'..chat,'Ban:Flood') then
lock_ban(msg,'ارسال #پیام‌مکرر')
deleteMessagesFromUser(msg.chat_id,msg.sender_user_id)
end
else
base:setex(TD_ID..'flooduser'..user..msg.chat_id,floodtime,flooduser+1)
end
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Flood')  then
floodtime = tonumber(base:get(TD_ID..'Flood:Max:'..msg.chat_id)) or 5
floodmax = tonumber(base:get(TD_ID..'Flood:Time:'..msg.chat_id)) or 10
flooduser = tonumber(base:get(TD_ID..'flooduser'..user..msg.chat_id)) or 0
if flooduser > floodmax then
base:del(TD_ID..'flooduser'..user..msg.chat_id)
if base:sismember(TD_ID..'Gp3:'..chat,user..' حذف پیام‌مکرر') or base:sismember(TD_ID..'Gp:'..chat,'Mute:Flood') then
lock_mute(msg,'ارسال #پیام‌مکرر')
deleteMessagesFromUser(msg.chat_id,msg.sender_user_id)
end
else
base:setex(TD_ID..'flooduser'..user..msg.chat_id,floodtime,flooduser+1)
end
end

if base:sismember(TD_ID..'Gp:'..chat,'Warn:Flood')  then
floodtime = tonumber(base:get(TD_ID..'Flood:Max:'..msg.chat_id)) or 5
floodmax = tonumber(base:get(TD_ID..'Flood:Time:'..msg.chat_id)) or 10
flooduser = tonumber(base:get(TD_ID..'flooduser'..user..msg.chat_id)) or 0
if flooduser > floodmax then
base:del(TD_ID..'flooduser'..user..msg.chat_id)
if base:sismember(TD_ID..'Gp3:'..chat,user..' حذف پیام‌مکرر') or base:sismember(TD_ID..'Gp:'..chat,'Warn:Flood') then
lock_warn(msg,'ارسال #پیام‌مکرر')
deleteMessagesFromUser(msg.chat_id,msg.sender_user_id)
end
else
base:setex(TD_ID..'flooduser'..user..msg.chat_id,floodtime,flooduser+1)
end
end


--<><>Spam<><>--
if msg.content.text then
num = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..msg.chat_id)) or 3600
chars = utf8.len(msg.content.text)
if chars > num then
MsgCheck(msg,'ارسال #هرزنامه','Spam','هرزنامه')
end
end


Msgsday = tonumber(base:get(TD_ID..'Total:messagescleaner:'..msg.chat_id..'')) or 0
local limitmsg = tonumber(base:get(TD_ID..'cleanpm:'..msg.chat_id) or 2000)
if Msgsday >= limitmsg  and  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'cleanpm:on')  then
send(msg.chat_id,msg.id,'پاکسازی','md')
end

---Kheyanat
if is_Mod(msg) then
-- local delstats = tonumber(base:get(TD_ID..'Total:DelUser:'..msg.chat_id..':'..msg.sender_user_id) or 0)
local delstats = base:zrevrange(TD_ID..'bot:delusr:'..msg.chat_id..':', 0, 0, 'withscores')
for k, v in pairs(delstats) do
if k == 1 then 
end
stattextss = tonumber(v[2]) 
local KheyanatDel = tonumber(base:get(TD_ID..'KheyanatDel:'..msg.chat_id) or 10)
if stattextss >= KheyanatDel  and  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Kheyanat:on')  then
local function name(black,alpha) 
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local Time_ = getTimeUptime(timemutemsg) 
base:set(TD_ID.."ToshLimitFormid3"..msg.chat_id ,msg.sender_user_id)
local formidw = base:get(TD_ID.."ToshLimitFormid3"..msg.chat_id) 
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a> '
text = "◈ کاربر "..username.." به علت اخراج کردن بی مورد"..stattextss.." کاربر از ادمینی گروه خارج و در گروه به مدت "..Time_.." سکوت شد!"
send(msg.chat_id,msg.id,text,'html') 
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:srem(TD_ID..'ModListtest:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModList:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModCleanList:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModBanList:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModMuteList:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModWarnList:'..msg.chat_id,msg.sender_user_id)  
base:srem(TD_ID..'ModLockList:'..msg.chat_id,msg.sender_user_id) 
base:srem(TD_ID..'ModpanelList:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModVipList:'..msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'ModLockOption:'..msg.chat_id,msg.sender_user_id)
remadmins(msg.chat_id,msg.sender_user_id)
MuteUser(chat,msg.sender_user_id,msg.date+timemutemsg)
base:sadd(TD_ID..'Kheyanatuser:'..msg.chat_id,msg.sender_user_id) 
end 
GetUser(msg.sender_user_id,name)
end 
end 
end



Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..user or 00000000)) or 0
local limitmsg = tonumber(base:get(TD_ID..'limitpm:'..msg.chat_id) or 100)
if Msgsday >= limitmsg  and  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'limitpm:on')  then
local function name(black,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local Time_ = getTimeUptime(timemutemsg) 
base:set(TD_ID.."ToshLimitFormid3"..msg.chat_id ,user)
local formidw = base:get(TD_ID.."ToshLimitFormid3"..msg.chat_id)
local username = '<a href="tg://user?id='..user..'"> '..ec_name(alpha.first_name)..'</a> '
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '♻️ رفع لیمیت پیام(حالت سکوت زمانی) ♻️ ',callback_data = 'AlphL:'..chat_id..':'..formidw..''},
},}
text = "◈<b>کاربر</b>  "..username.."  \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n <b>به دلیل رسیدن به محدودیت حداکثر لیمیت پیام به مدت </b> "..Time_.." <b> محدود شد!</b>"
send_inline(msg.chat_id,text,keyboard,'html')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..user,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
MuteUser(chat,user,msg.date+timemutemsg)
base:sadd(TD_ID..'limituser:'..msg.chat_id,user)
end
GetUser(user,name)
end


Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..user or 00000000)) or 0
local limitmsg = tonumber(base:get(TD_ID..'Adminpm:'..msg.chat_id) or 100)
local warn = 2
local startwarn = TD_ID..':warnad2'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1

if base:get(TD_ID..'StatsGpByName'..msg.chat_id) then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id)
else
gp = msg.chat_id
end
if base:get(TD_ID.."Adminsendpm"..msg.chat_id) == "AdminGp" then
if Msgsday >= limitmsg  and  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Adminpm:on') and not is_Mod(msg)  then
local function name(black,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(endwarn) > tonumber(warn) then
else
base:set(TD_ID.."ToshLimitFormid3"..msg.chat_id ,user)
local formidw = base:get(TD_ID.."ToshLimitFormid3"..msg.chat_id)
local username = '<a href="tg://user?id='..user..'"> '..ec_name(alpha.first_name)..'</a> '
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🥇 ارتقا به ادمین گروه و ربات 🥇 ',callback_data = 'AlphD:'..chat_id..':'..formidw..''},
},{
{text = '❌ کاربر عادی بماند ❌',callback_data = 'AlphA:'..chat_id..':'..formidw..''},
},}
text = "◈<b>مالک عزیز کاربر </b>  "..username.."  \n<b>در گروه</b> (<code>"..gp.."</code>) <b>بافعالیت تعداد پیام</b> ("..Alphafa(Msgsday).." پیام) <b>می تواند صاحب یک مقام در گروه باشد.</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n <b> 👮🏻‍♂️مالک عزیز این پیام صرفا جهت پیشنهادی از طرف ربات با توجه به فعالیت کاربر می باشد اگر مایلید برای مقام دادن به کاربر از دکمه زیر استفاده کنید. </b>"
local users = base:smembers(TD_ID..'ModList:'..msg.chat_id)
for y,u in pairs(users) do
send_inline(u,text,keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..user,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'Adminuser:'..msg.chat_id,user)
end
end
end
GetUser(user,name)
end
end
Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..user or 00000000)) or 0
local limitmsg = tonumber(base:get(TD_ID..'Adminpm:'..msg.chat_id) or 100)
local warn = 2
local startwarn = TD_ID..':warnad2'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1

if base:get(TD_ID..'StatsGpByName'..msg.chat_id) then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id)
else
gp = msg.chat_id
end
if base:get(TD_ID.."Adminsendpm"..msg.chat_id) == "OwnerAllGp" then
if Msgsday >= limitmsg  and  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Adminpm:on') and not is_Mod(msg)  then
local function name(black,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(endwarn) > tonumber(warn) then
else
base:set(TD_ID.."ToshLimitFormid3"..msg.chat_id ,user)
local formidw = base:get(TD_ID.."ToshLimitFormid3"..msg.chat_id)
local username = '<a href="tg://user?id='..user..'"> '..ec_name(alpha.first_name)..'</a> '
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🥇 ارتقا به ادمین گروه و ربات 🥇 ',callback_data = 'AlphD:'..chat_id..':'..formidw..''},
},{
{text = '❌ کاربر عادی بماند ❌',callback_data = 'AlphA:'..chat_id..':'..formidw..''},
},}
text = "◈<b>مالک عزیز کاربر </b>  "..username.."  \n<b>در گروه</b> (<code>"..gp.."</code>) <b>بافعالیت تعداد پیام</b> ("..Alphafa(Msgsday).." پیام) <b>می تواند صاحب یک مقام در گروه باشد.</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n <b> 👮🏻‍♂️مالک عزیز این پیام صرفا جهت پیشنهادی از طرف ربات با توجه به فعالیت کاربر می باشد اگر مایلید برای مقام دادن به کاربر از دکمه زیر استفاده کنید. </b>"
local users = base:smembers(TD_ID..'OwnerList:'..msg.chat_id)
for y,u in pairs(users) do
local ModList = base:smembers(TD_ID..'ModList:'..msg.chat_id)
for x,m in pairs(ModList) do
send_inline(u,text,keyboard,'html')
send_inline(x,text,keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..user,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'Adminuser:'..msg.chat_id,user)
end
end
end
end
GetUser(user,name)
end
end

Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..user or 00000000)) or 0
local limitmsg = tonumber(base:get(TD_ID..'Adminpm:'..msg.chat_id) or 100)
local warn = 2
local startwarn = TD_ID..':warnad2'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
if base:get(TD_ID..'StatsGpByName'..msg.chat_id) then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id)
else
gp = msg.chat_id
end
if base:get(TD_ID.."Adminsendpm"..msg.chat_id) == "OwnerGp" then
if Msgsday >= limitmsg  and  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Adminpm:on') and not is_Mod(msg)  then
local function name(black,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(endwarn) > tonumber(warn) then
else
base:set(TD_ID.."ToshLimitFormid3"..msg.chat_id ,user)
local formidw = base:get(TD_ID.."ToshLimitFormid3"..msg.chat_id)
local username = '<a href="tg://user?id='..user..'"> '..ec_name(alpha.first_name)..'</a> '
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '🥇 ارتقا به ادمین گروه و ربات 🥇 ',callback_data = 'AlphD:'..chat_id..':'..formidw..''},
},{
{text = '❌ کاربر عادی بماند ❌',callback_data = 'AlphA:'..chat_id..':'..formidw..''},
},}
text = "◈<b>مالک عزیز کاربر </b>  "..username.."  \n<b>در گروه</b> (<code>"..gp.."</code>) <b>بافعالیت تعداد پیام</b> ("..Alphafa(Msgsday).." پیام) <b>می تواند صاحب یک مقام در گروه باشد.</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n <b> 👮🏻‍♂️مالک عزیز این پیام صرفا جهت پیشنهادی از طرف ربات با توجه به فعالیت کاربر می باشد اگر مایلید برای مقام دادن به کاربر از دکمه زیر استفاده کنید. </b>"
local users = base:smembers(TD_ID..'OwnerList:'..msg.chat_id)
for y,u in pairs(users) do
send_inline(u,text,keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..user,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'Adminuser:'..msg.chat_id,user)
end
end
end
GetUser(user,name)
end
end

------------------------------


if msg.sender_user_id  and not base:sismember(TD_ID..'TabAdd:'..msg.chat_id,msg.sender_user_id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'ScanAntiTabchi')  then
users = base:smembers(TD_ID..'FilterTab:'..msg.chat_id)
if #users > 0 then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'">تبچی</a> - <b>'..msg.sender_user_id..'</b> '
base:set(TD_ID.."ToshFormid5"..msg.chat_id ,msg.sender_user_id)
local formidw = base:get(TD_ID.."ToshFormid5"..msg.chat_id)
for k,v in pairs(users) do
mMd = alpha.first_name:lower()
if mMd:match(v) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MuteAntiTab') then
MuteUser(msg.chat_id,msg.sender_user_id,0)
end
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm')  then
deleteMessages(msg.chat_id,{[0] = msg.id})
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '✅ربات تبچی می باشد',callback_data = 'ScanAlphaMute:'..chat_id..':'..formidw..''},
},{
{text = '❌ربات تبچی نمی باشد',callback_data = 'ScanAlphaNot:'..chat_id..':'..formidw..''},
},}
text = '◆ مدیران گروه توجه یک کاربر  ('..username..') داخل گروه به عنوان ربات تبچی شناسایی کردم 〠\n\n◂ خواهشمند است به صورت رسمی اعلام کنید این کاربر که ازطرف امنیت گروه به عنوان ربات تبچی می باشد یا نه؟\n\n⚡⚡️ در صورت عدم پاسخگویی به پیام ربات بعد از 2دقیقه دیگر ربات به صورت اتوماتیک کاربر رو ربات تبچی شناسایی خواهد شد.'
send_inline(msg.chat_id,text,keyboard,'html')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
end
end
end
end
GetUser(msg.sender_user_id,name)
end
end
end


----------FilterName-----------



--------------------------------
if msg.sender_user_id then
if base:sismember(TD_ID..'Gp2:'..chat_id,'BioAntiTabchi') then
users = base:smembers(TD_ID..'FilterName:'..msg.chat_id)
if #users > 0 then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
for k,v in pairs(users) do
mMd = alpha.first_name:lower()
if mMd:match(v) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
if base:get(TD_ID.."ban_stats"..msg.chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'سکوت شد به مدت '..Time_..'!'
kickChatMemberTime(msg.chat_id,msg.sender_user_id,msg.date+ex)
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+ex)
else
hallatban = 'سکوت شد!'
MuteUser(msg.chat_id,msg.sender_user_id,0)
end
mm = 'محدود'
else
if base:get(TD_ID.."ban_stats"..msg.chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'bantime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'مسدود شد به مدت '..Time_..''
kickChatMemberTime(msg.chat_id,msg.sender_user_id,msg.date+ex)
else
hallatban = 'مسدود شد!'
KickUser(msg.chat_id,msg.sender_user_id)
mm = 'مسدود'
end
end
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
deleteMessages(msg.chat_id,{[0] = msg.id})
send(msg.chat_id,msg.id,'◈*کاربر* '..MBD(name,msg.sender_user_id)..' *'..hallatban..'* \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ دلیل '..mm..' :  *اسم غیرمجاز*  ','md')
end
end
end
end
GetUser(user,name)
end
end
end
----------BioLink and FilterBio-----------
if msg.sender_user_id then
function BioLink(extra, result, success)
if result.about == '' then
ALPHAAbout = 'Nil'
else
ALPHAAbout = result.about
end
if ALPHAAbout:match("[Tt].[Mm][Ee]/") or ALPHAAbout:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") then
MsgCheck(msg,'#داشتن لینک در بیو','Biolink','لینک بیو')
--base:sadd(TD_ID..'Tabchi:'..msg.chat_id,msg.sender_user_id or 00000000)
--base:sadd(TD_ID..'AGTMute:'..msg.chat_id,msg.sender_user_id)
--base:sadd(TD_ID..'AGTMute:',msg.sender_user_id)
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'NameAntiTabchi') then
users = base:smembers(TD_ID..'FilterBio:'..msg.chat_id)
if #users > 0 then
for k,v in pairs(users) do
mMd = ALPHAAbout:lower()
if mMd:match(v) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
deleteMessages(msg.chat_id,{[0] = msg.id})
if base:get(TD_ID.."ban_stats"..msg.chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'سکوت شد به مدت '..Time_..'!'
kickChatMemberTime(msg.chat_id,msg.sender_user_id,msg.date+ex)
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+ex)
else
hallatban = 'سکوت شد!'
MuteUser(msg.chat_id,msg.sender_user_id,0)
end
mm = 'محدود'
else
if base:get(TD_ID.."ban_stats"..msg.chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'bantime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'مسدود شد به مدت '..Time_..''
kickChatMemberTime(msg.chat_id,msg.sender_user_id,msg.date+ex)
else
hallatban = 'مسدود شد!'
KickUser(msg.chat_id,msg.sender_user_id)
mm = 'مسدود'
end
deleteMessages(msg.chat_id,{[0] = msg.id})
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
send(msg.chat_id,msg.id,'◈*کاربر* '..MBD(name,msg.sender_user_id)..' *'..hallatban..'* \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ دلیل '..mm..' :  *بیوگرافی غیرمجاز*  ','md')

--send(msg.chat_id,msg.id,'• کاربر '..MBD(name,msg.sender_user_id)..' به دلیل داشتن بیوگرافی غیرمجاز از گروہ '..mm..' شد !','md')
end
end
GetUser(user,name)
end
end
end
end
end
GetUserFull(msg.sender_user_id,BioLink)
end




if Ramin then
local post = msg.content.text
if base:get(TD_ID.."bot:duplipost:mute" .. msg.chat_id) then
if base:sismember(TD_ID.."Gp:Post" .. msg.chat_id, post) then
deleteMessages(msg.chat_id,{[0] = msg.id})
else
base:sadd(TD_ID.."Gp:Post" .. msg.chat_id, post)
end
end
end


if msg.sender_user_id  and base:get(TD_ID..'locktimelink:'..msg.chat_id) and not is_Mod(msg)  then
if Ramin then
local is_link = Ramin:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or Ramin:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or Ramin:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or Ramin:match("[Tt].[Mm][Ee]/")
if is_link then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
end
if msg.content.caption then
local Ramin = msg.content.caption
local is_link = Ramin:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or Ramin:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or Ramin:match("[Tt].[Mm][Ee]/")
if is_link then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimesticker:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageSticker' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimestickers:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageUnsupported' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimephoto:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == "messagePhoto" then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end

if msg.sender_user_id  and base:get(TD_ID..'MuteAlllimit:'..msg.chat_id) and not is_Mod(msg) then
deleteMessages(msg.chat_id, {[0] = msg.id})
end

---------------------------------------

if msg.sender_user_id  and base:get(TD_ID..'locktimeself:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageVideoNote' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
if msg.content.caption then
if msg.content._ == 'messageVideoNote' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
end
---------------------------------------
if msg.sender_user_id  and base:get(TD_ID..'locktimeusername:'..msg.chat_id) and not is_Mod(msg)  then
if Ramin then
local is_username = Ramin:match("@[%a%d]")
if is_username then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.content.caption then
local Ramin = msg.content.caption
local is_username = Ramin:match("@[%a%d]")
if is_username then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
end
--------------------------
if msg.sender_user_id  and base:get(TD_ID..'locktimetag:'..msg.chat_id) and not is_Mod(msg)  then
if Ramin then
local is_username = Ramin:match("#[%a%d]")
if is_username then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.content.caption then
local Ramin = msg.content.caption
local is_username = Ramin:match("#[%a%d]")
if is_username then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
end
---------------------------------------
if msg.sender_user_id  and base:get(TD_ID..'locktimefarsi:'..msg.chat_id) and not is_Mod(msg)  then
local Ramin = msg.content.text
if Ramin and Ramin:match("[\216-\219][\128-\191]") then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
if msg.content.caption then
local Ramin = msg.content.caption
if Ramin and Ramin:match("[\216-\219][\128-\191]") then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimeenglish:'..msg.chat_id) and not is_Mod(msg)  then
local Ramin = msg.content.text
if Ramin and (Ramin:match("[A-Z]") or Ramin:match("[a-z]")) then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
if msg.content.caption then
local Ramin = msg.content.caption
if Ramin and (Ramin:match("[A-Z]") or Ramin:match("[a-z]")) then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
end

if msg.sender_user_id  and base:get(TD_ID..'locktimemention:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
----------------------------------------------------------

if msg.sender_user_id  and base:get(TD_ID..'locktimedoc:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageDocument' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimemusic:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageAudio' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimevoice:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == "messageVoice" then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimegif:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == "messageAnimation" then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimecontact:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageContact' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimevideo:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageVideo' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimetext:'..msg.chat_id) and not is_Mod(msg)  then
if msg.content._ == 'messageText' then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
if msg.sender_user_id  and base:get(TD_ID..'locktimeforward:'..msg.chat_id) and not is_Mod(msg)  then
if msg.forward_info then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end






if is_supergroup(msg) then
if msg.sender_user_id and base:get(TD_ID.."sg:locktabalpha"..msg.chat_id) == "lock" and not base:sismember(TD_ID..'VipAdd:'..msg.chat_id,msg.sender_user_id)  then
users = base:smembers(TD_ID..'FilterName:'..msg.chat_id)
if #users > 0 then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
for k,v in pairs(users) do
mMd = alpha.first_name:lower()
if mMd:match(v) then
base:sadd(TD_ID..'AGTMute:',msg.sender_user_id)
--base:sadd(TD_ID..'AGTMute:'..msg.chat_id,msg.sender_user_id)
deleteMessages(msg.chat_id,{[0] = msg.id})
end
end
end
GetUser(user,name)
end
end


if msg.sender_user_id and base:get(TD_ID.."sg:locktabalpha"..msg.chat_id) == "lock" and not base:sismember(TD_ID..'VipAdd:'..msg.chat_id,msg.sender_user_id)  then
function BioLink(extra, result, success)
if result.about == '' then
ALPHAAbout = 'Nil'
else
ALPHAAbout = result.about
end
if Ramin  or ALPHAAbout:match("[Tt].[Mm][Ee]/") or ALPHAAbout:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or ALPHAAbout:match("خاله") or ALPHAAbout:match("صیغه") or ALPHAAbout:match("پیوی") or ALPHAAbout:match("09") or ALPHAAbout:match("۰۹") or ALPHAAbout:match("+98") or ALPHAAbout:match("+۹") or ALPHAAbout:match("حالمو") or ALPHAAbout:match("سکس") or ALPHAAbout:match("شبا") then
local is_link = Ramin:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or Ramin:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or Ramin:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or Ramin:match("[Tt].[Mm][Ee]/")
if is_link or  ALPHAAbout:match("[Tt].[Mm][Ee]/") or ALPHAAbout:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or ALPHAAbout:match("خاله") or ALPHAAbout:match("صیغه") or ALPHAAbout:match("پیوی") or ALPHAAbout:match("09") or ALPHAAbout:match("۰۹") or ALPHAAbout:match("+98") or ALPHAAbout:match("+۹") or ALPHAAbout:match("حالمو") or ALPHAAbout:match("سکس") or ALPHAAbout:match("شبا") then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a> - <b>'..msg.sender_user_id..'</b> '
deleteMessages(msg.chat_id,{[0] = msg.id})
--MuteUser(msg.chat_id,msg.sender_user_id,0) 
base:set(TD_ID.."ToshFormid5"..msg.chat_id ,msg.sender_user_id)
local formidw = base:get(TD_ID.."ToshFormid5"..msg.chat_id)
local warn = base:get(TD_ID..'joinwarn2:'..msg.chat_id) or 2
--base:sadd(TD_ID..'AGTMute:',msg.sender_user_id)
--base:sadd(TD_ID..'AGTMute:'..msg.chat_id,msg.sender_user_id)
--base:incr(TD_ID..'Total:AGTMute:'..msg.chat_id..':'..msg.sender_user_id)
local startwarn = TD_ID..':join2'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '📵 تایید می شود ربات می باشد(محدود) 📵',callback_data = 'TabAlphaMute:'..chat_id..':'..formidw..''},
},{
{text = '🚫 تایید می شود ربات می باشد(مسدود) 🚫',callback_data = 'TAlphaBan:'..chat_id..':'..formidw..''},
},{
{text = '✅ تایید می شود کاربر ربات نمی باشد ✅',callback_data = 'TabAlphaNot:'..chat_id..':'..formidw..''},
},}

gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
text = "◈<code>کاربر</code> "..username.."  در گروه :  <b>"..gp.."</b> \nایدی گروه : <code> "..msg.chat_id.." </code>\n به وسیله سیستم AGTربات به عنوان اخلاگر گروه شناخته شده است.\n◂ نکته کاربر شناسایی شده در همان گروه محدود شده است لطفا جهت  مدیریت بیشتر کاربر ها از دکمه های زیر استفاده کنید👇👇"
local users = base:smembers(TD_ID..'OwnerList:'..msg.chat_id)
for y,u in pairs(users) do
send_inline(u,text,keyboard,'html')
--send_inline(-1001403675792,text,keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
--send_inline(-1001441511863,text,keyboard,'html')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
end
end
GetUser(user,name)
end
end
end 
end
GetUserFull(msg.sender_user_id,BioLink)
end




if msg.add then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
function ByAddUser(BlaCk,ALPHA)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local banbotpm = base:sismember(TD_ID..'Gp2:'..chat,'kickbotpm')
if ALPHA.type._ == "userTypeBot" then
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Bots') then
if banbotpm then
send(chat,msg.id,"◈کاربر  ["..name.."](tg://user?id="..msg.sender_user_id..")  *اخراج شد*.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ دلیل  : *افزودن ربات*","md")
end
base:sadd(TD_ID..'AGTMute:'..msg.chat_id,user)
KickUser(chat,user)
UnRes(chat,user)
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Bots') then
if banbotpm then
send(chat,msg.id,"◈کاربر  ["..name.."](tg://user?id="..msg.sender_user_id..")  *مسدود شد*.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ دلیل : *افزودن ربات*","md")
end
KickUser(chat,user)
end
if base:sismember(TD_ID..'Gp3:'..chat,user..' حذف ربات') or base:sismember(TD_ID..'Gp:'..chat,'Del:Bots') then
KickUser(msg.chat_id,ALPHA.id)
local function CleanBot(BlaCk,ALPHA)
for k,v in pairs(ALPHA.members) do
if tonumber(v.user_id) ~= tonumber(BotJoiner) then
KickUser(msg.chat_id,v.user_id)
end
end
end
getChannelMembers(msg.chat_id,"Bots",0, 100000000000,CleanBot)
end
if not(base:sismember(TD_ID..'Gp:'..chat,'Ban:Bots') or base:sismember(TD_ID..'Gp:'..chat,'Kick:Bots')) then
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Bots') then
if banbotpm then
local Time_ = getTimeUptime(timemutemsg)
send(chat,msg.id,"◈کاربر  ["..name.."](tg://user?id="..msg.sender_user_id..")  به مدت *"..Time_.."* سکوت شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ دلیل : *افزودن ربات*","md")
end
KickUser(chat,ALPHA.id)
MuteUser(chat,user,msg.date+timemutemsg)
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Bots') then
if banbotpm then
send(chat,msg.id,"◈کاربر  ["..name.."](tg://user?id="..msg.sender_user_id..")  میوت شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ دلیل : *افزودن ربات*","md")
end
base:sadd(TD_ID..'MuteList:'..chat,user or 00000000)
deleteMessages(chat,{[0] = msg.id})
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Bots') then
if tonumber(warnhashbd) == tonumber(max_warn) then
KickUser(chat,user)
send(chat,msg.id,"◈کاربر  ["..name.."](tg://user?id="..msg.sender_user_id..")  به علت بی توجهی به اخطار ربات از گروہ اخراج شد.\n• دلیل اخراج : *افزودن ربات*\n• حداخطار : *"..warnhashbd.."*از*"..max_warn.."*","md")
base:hdel(hashwarnbd,chat,max_warn)
else
base:hset(hashwarnbd,chat, tonumber(warnhashbd) +1)
send(chat,msg.id,"◈کاربر  ["..name.."](tg://user?id="..msg.sender_user_id..")  اخطار گرفت.\n• دلیل اخطار : *افزودن ربات*\n• حداخطار : *"..warnhashbd.."*از*"..max_warn.."*","md")
KickUser(chat,ALPHA.id)
end
end
---end not kick or ban
end
end
end
GetUser(user,name)
end
GetUser(msg.add,ByAddUser)
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end

if is_supergroup(msg) then
if (msg.sender_user_id or msg.add) and base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forceadd') and not is_Vip(msg) and not base:sismember(TD_ID..'VipAdd:'..msg.chat_id,msg.sender_user_id)  then
if newuser then
if MsgType == 'JoinedByLink' then
base:sadd(TD_ID..'NewUser'..msg.chat_id,msg.sender_user_id)
end
if msg.add then
base:sadd(TD_ID..'NewUser'..msg.chat_id,msg.add)
end
end
if not newuser or newuser and base:sismember(TD_ID..'NewUser'..msg.chat_id,msg.sender_user_id) then
if msg.add then
local function name(ramin,alpha)
function add(BlaCk,ALPHA)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if ALPHA.type._ == "userTypeBot" then
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..")  \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n*شما یک ربات اضافه کردید کاربر عادی اد کنید*.","md")
KickUser(msg.chat_id,ALPHA.id)
else
addkard = tonumber(added) + 1
if tonumber(addkard) == tonumber(Forcemax) then
txt = "◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..")  \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ محدودیت اداجباری برای شما غیرفعال شد شما اکنون میتوانید پیام ارسال کنید ✔"
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,msg.sender_user_id..'AddEnd') then
send(msg.chat_id,msg.id,txt,'md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,msg.sender_user_id..'AddEnd')
end
end
base:set(TD_ID..'addeduser'..msg.chat_id..msg.sender_user_id,addkard)
end
end
GetUser(msg.add,add)
end
GetUser(msg.sender_user_id,name)
end
if tonumber(added) < tonumber(Forcemax) then
if Ramin then
if not (msg.content._ == "messageChatJoinByLink" or msg.content._ == "messageChatAddMembers" or msg.content._ == "messageChatDeleteMember") then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
base:set(TD_ID.."ToshFormid"..msg.chat_id ,msg.sender_user_id)
totalpms = base:get(TD_ID..'pmdadeshode'..msg.chat_id..msg.sender_user_id..os.date("%Y/%m/%d")) or 0
if tonumber(Forcepm) > tonumber(totalpms) then
local totalpmsmrr = tonumber(totalpms) + 1
local mande = tonumber(Forcemax) - tonumber(added)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local formid = base:get(TD_ID.."ToshFormid"..msg.chat_id)
dofile('./Alpha/time.lua')
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ معاف کاربر ◈',callback_data = 'AddMoj:'..chat_id..':'..formid..''},},}
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local bd = base:get(TD_ID..'Text:AddTXT:'..msg.chat_id) or  "◈<code>کاربر عزیز</code>  "..username.."  \n◂ <code>شما باید</code> ("..Alpha(mande)..") <code>نفر رابه گروہ دعوت کنید تا بتوانید در گروہ پیام ارسال کنید</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n » تعداد ادکرده شما : <b>"..Alphafa(added).."</b> "
local bd = replace(bd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>') -- نام منشن
local bd = replace(bd,'FIRSTNAME',ec_name(alpha.first_name)) -- نام کاربر
local bd = replace(bd,'LASTNAME',alpha.last_name or '') -- نام دوم کاربر
local bd = replace(bd,'USERNAME','@'..check_markdown(alpha.username)) or 'بدون@' --- یوزرنیم
local bd = replace(bd,'ENDWARN',''..Forcepm) or '' --- کل اخطار
local bd = replace(bd,'WARN',''..totalpmsmrr) or '' --- اخطار
local bd = replace(bd,'MANDE',''..mande) or ''  --- مانده اداجباری
local bd = replace(bd,'FORCEMAX',''..Forcemax) or '' --- کل اد اجباری
local bd = replace(bd,'ADDED',''..added) or ''  --- اد کرده کاربر
local bd = replace(bd,'DATE',''..Alphafa(limitmsg)..'/'..Alphafa(limitmsg1)..'/'..Alphafa(limitmsg2)..'') or 'nil'
local bd = replace(bd,'TIME',''..Alphafa(hor)..':'..Alphafa(dag)..':'..Alphafa(sec)..'') or 'nil'
send_inline(msg.chat_id,bd,keyboard,'md')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true)
base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
end
GetUser(msg.sender_user_id,name)
base:set(TD_ID..'pmdadeshode'..msg.chat_id..msg.sender_user_id..os.date("%Y/%m/%d"),totalpmsmrr)
end
end
end
end
end
end




-----------------------------

if is_supergroup(msg) then
if Ramin then
if is_filterjoin(msg,Ramin) then
if (msg.sender_user_id or msg.add) and base:sismember(TD_ID..'Gp:'..chat,'Add:Filterdfdfdfdfd') and not is_Vip(msg) and not base:sismember(TD_ID..'VipAdd:'..msg.chat_id,msg.sender_user_id)  then
if newuser then
if MsgType == 'JoinedByLink' then
base:sadd(TD_ID..'NewUser'..msg.chat_id,msg.sender_user_id)
end
if msg.add then
base:sadd(TD_ID..'NewUser'..msg.chat_id,msg.add)
end
end
if not newuser or newuser and base:sismember(TD_ID..'NewUser'..msg.chat_id,msg.sender_user_id) then
if msg.add then
local function name(ramin,alpha)
function add(BlaCk,ALPHA)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if ALPHA.type._ == "userTypeBot" then
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *شما یک ربات اضافه کردید کاربر عادی اد کنید*.","md")
KickUser(msg.chat_id,ALPHA.id)
else
addkard = tonumber(added) + 1
if tonumber(addkard) == tonumber(Forcemax) then
txt = "◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..")  \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ محدودیت اداجباری برای شما غیرفعال شد شما اکنون میتوانید پیام ارسال کنید ✔"
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,msg.sender_user_id..'AddEnd') then
send(msg.chat_id,msg.id,txt,'md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,msg.sender_user_id..'AddEnd')
end
end
base:set(TD_ID..'addeduser'..msg.chat_id..msg.sender_user_id,addkard)
end
end
GetUser(msg.add,add)
end
GetUser(msg.sender_user_id,name)
end
if tonumber(added) < tonumber(Forcemax) then
if Ramin then
if not (msg.content._ == "messageChatJoinByLink" or msg.content._ == "messageChatAddMembers" or msg.content._ == "messageChatDeleteMember") then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
base:set(TD_ID.."ToshFormid"..msg.chat_id ,msg.sender_user_id)
totalpms = base:get(TD_ID..'pmdadeshode'..msg.chat_id..msg.sender_user_id..os.date("%Y/%m/%d")) or 0
if tonumber(Forcepm) > tonumber(totalpms) then
local totalpmsmrr = tonumber(totalpms) + 1
local mande = tonumber(Forcemax) - tonumber(added)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local formid = base:get(TD_ID.."ToshFormid"..msg.chat_id)
dofile('./Alpha/time.lua')
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ معاف کاربر ◈',callback_data = 'AddMoj:'..chat_id..':'..formid..''},},}
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local bd = base:get(TD_ID..'Text:AddTXT:'..msg.chat_id) or  "◈<b>کاربر عزیز</b>  "..username.."  \n◂ <b>شما باید</b> ("..Alpha(mande)..") <b>نفر رابه گروہ دعوت کنید تا بتوانید در گروہ کلمات فیلتر شده را ارسال کنید</b>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n » تعداد اد کرده شما : <b>"..Alphafa(added).."</b>"
local bd = replace(bd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>') -- نام منشن
local bd = replace(bd,'FIRSTNAME',ec_name(alpha.first_name)) -- نام کاربر
local bd = replace(bd,'LASTNAME',alpha.last_name or '') -- نام دوم کاربر
local bd = replace(bd,'USERNAME','@'..check_markdown(alpha.username)) or 'بدون@' --- یوزرنیم
local bd = replace(bd,'ENDWARN',''..Forcepm) or '' --- کل اخطار
local bd = replace(bd,'WARN',''..totalpmsmrr) or '' --- اخطار
local bd = replace(bd,'MANDE',''..mande) or ''  --- مانده اداجباری
local bd = replace(bd,'FORCEMAX',''..Forcemax) or '' --- کل اد اجباری
local bd = replace(bd,'ADDED',''..added) or ''  --- اد کرده کاربر
local bd = replace(bd,'DATE',''..Alphafa(limitmsg)..'/'..Alphafa(limitmsg1)..'/'..Alphafa(limitmsg2)..'') or 'nil'
local bd = replace(bd,'TIME',''..Alphafa(hor)..':'..Alphafa(dag)..':'..Alphafa(sec)..'') or 'nil'
send_inline(msg.chat_id,bd,keyboard,'md')
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true)
base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
end
GetUser(msg.sender_user_id,name)
base:set(TD_ID..'pmdadeshode'..msg.chat_id..msg.sender_user_id..os.date("%Y/%m/%d"),totalpmsmrr)
end
end
end
end
end
end
end
end


----------Filter------------





function JoinChannelfilter(msg)
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then end
local warn = base:get(TD_ID..'joinwarn:'..msg.chat_id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not  is_Nazem(msg) and not is_VipJoin(msg) then
deleteMessages(msg.chat_id,{[0] = msg.id})
local function gifch(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(endwarn) > tonumber(warn) then
else
base:set(TD_ID.."ToshFormid"..msg.chat_id ,msg.sender_user_id)
local formid = base:get(TD_ID.."ToshFormid"..msg.chat_id)
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local bd = ' ◈ <b> کاربر عزیز </b>  '..username..'  پیام ارسالی شما با توجه به پیام ممنوعه قفل می باشد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • برای ارسال پیام قفل شده باید عضو کانال شوید. '
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat_id) or ' عضویت درکانال  '
local bd = replace(bd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>')
local bd = replace(bd,'FIRSTNAME',ec_name(alpha.first_name))
local bd = replace(bd,'LASTNAME',alpha.last_name or '')
local bd = replace(bd,'USERNAME','@'..check_markdown(alpha.username)) or 'بدون@'
local bd = replace(bd,'ENDWARN',''..endwarn) or ''
local bd = replace(bd,'WARN',''..warn) or ''
local bd = replace(bd,'NameCH',''..chname) or ''
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = chname,url='https://telegram.me/'..Ch},
}
}
send_inline(msg.chat_id,''..bd..'',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
end
end
GetUser(msg.sender_user_id,gifch)
else
return true
end
end

function JoinChannelemoji(msg)
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then end
local warn = base:get(TD_ID..'joinwarn:'..msg.chat_id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not  is_Nazem(msg) and not is_VipJoin(msg) then
deleteMessages(msg.chat_id,{[0] = msg.id})
local function gifch(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(endwarn) > tonumber(warn) then
else
base:set(TD_ID.."ToshFormid"..msg.chat_id ,msg.sender_user_id)
local formid = base:get(TD_ID.."ToshFormid"..msg.chat_id)
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local bd =  base:get(TD_ID..'Text:Chjoin:'..msg.chat_id) or ' ◈  کاربر عزیز  '..username..' برای ارسال پیام ایموجی دار باید عضو کانال شوید\n'
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat_id) or ' عضویت درکانال  '
local bd = replace(bd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>')
local bd = replace(bd,'FIRSTNAME',ec_name(alpha.first_name))
local bd = replace(bd,'LASTNAME',alpha.last_name or '')
local bd = replace(bd,'USERNAME','@'..check_markdown(alpha.username)) or 'بدون@'
local bd = replace(bd,'ENDWARN',''..endwarn) or ''
local bd = replace(bd,'WARN',''..warn) or ''
local bd = replace(bd,'NameCH',''..chname) or ''
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = chname,url='https://telegram.me/'..Ch},
}
}
send_inline(msg.chat_id,''..bd..'',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
end
end
GetUser(msg.sender_user_id,gifch)
else
return true
end
end

if Ramin then
if is_badw(msg,Ramin) then
if base:sismember(TD_ID..'Gp:'..chat,'Del:Fosh') then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
deleteMessages(msg.chat_id, {[0] = msg.id})
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,msg.sender_user_id)
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سکوت کاربر ◈',callback_data = 'Alphr:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..user..'"> '..name..'</a> '
text = "◈ ارسال گزارش کلمات رکیک\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..user.."  در گروه "..gp.." از کلمه فحش  "..Ramin.." استفاده کرده است.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه سکوت کاربر به لیست سکوت شده ها اضافه کنید."
send_inline(v,text,keyboard,'html')
end
end
end
GetUser(user,name)
end
end
end

if Ramin then
if is_emoji(msg,Ramin) then
if base:sismember(TD_ID..'Gp:'..chat,'Del:Emoji') then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
end
if Ramin then
if is_emoji(msg,Ramin) then
if base:sismember(TD_ID..'Gp:'..chat,'Join:Emoji') then
JoinChannelemoji(msg)
end
end
end


if Ramin then
if is_filterjoin(msg,Ramin) then
if base:sismember(TD_ID..'Gp:'..chat,'Join:Filter') then
JoinChannelfilter(msg)
end
end
end


if Ramin then
if is_filter(msg,Ramin) then
deleteMessages(msg.chat_id, {[0] = msg.id})
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Filter') then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
send(chat,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..") \n*مسدود شد*.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ *دلیل مسدودیت : ارسال #کلمات فیلترشده*","md")
KickUser(chat,user)
else
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..") \n◂ باید به دلیل ارسال کلمه فیلترینگ از گروہ اخراج شود ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\nلطفا از تنظیمات گروہ این قابلیت را برای ربات فعال کنید !","md")
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(user,name)
end
end
end
if msg.content._ == 'messageSticker' and not is_Vip(msg) then
if base:sismember(TD_ID..'Gp:'..chat,'Ban:FilterSticker')  then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local filterpack = base:smembers(TD_ID.."filterpack"..msg.chat_id)
for k,v in pairs(filterpack) do
if v == msg.content.sticker.set_id then
deleteMessages(msg.chat_id, {[0] = msg.id})
end
end
send(chat,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..")  اخراج شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ *دلیل اخراج : ارسال #استیکر فیلتر شده*","md")
KickUser(chat,user)
else
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..msg.sender_user_id..") \n◂ باید به دلیل ارسال استیکر فیلترینگ از گروہ اخراج شود ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\nلطفا از تنظیمات گروہ این قابلیت را برای ربات فعال کنید !","md")
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(user,name)
end
end

--------Auto Muteall--------


if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'AutoPin') then
pinmsg = base:get(TD_ID..'AutoPinpm:'..msg.chat_id)
local time = os.date("%H%M")
local start = tonumber(base:get(TD_ID.."autoPinstart"..msg.chat_id)) or 0000
local endtime = tonumber(base:get(TD_ID.."autoPinend"..msg.chat_id)) or 800
if tonumber(endtime) < tonumber(start) then
if tonumber(time) <= 2359 and tonumber(time) >= tonumber(start) then
elseif tonumber(time) >= 0000 and tonumber(time) < tonumber(endtime) then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Pinned') then
send(msg.chat_id,msg.id,'> Pinned!','md')
Pin(msg.chat_id,pinmsg, 1)
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Pinned')
end
else
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Pinned') then
send(msg.chat_id,msg.id,'UnPinned!','md')
Unpin(msg.chat_id)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Pinned')
end
end
elseif tonumber(endtime) > tonumber(start) then
if tonumber(time) >= tonumber(start) and tonumber(time) < tonumber(endtime) then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Pinned') then
send(msg.chat_id,msg.id,'> Pinned !' ,'md')
Pin(msg.chat_id,tonumber(pinmsg),0)
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Pinned')
end
else
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Pinned') then
send(msg.chat_id,msg.id,'> UnPinned!','md')
Unpin(msg.chat_id)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Pinned')
end
end
end
end
--------Mute all--------
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Mute_All') then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Tele_Mute') then
base:sadd(TD_ID..'Mutes:'..msg.chat_id,msg.sender_user_id)
deleteMessages(msg.chat_id,{[0] = msg.id})
MuteUser(msg.chat_id,msg.sender_user_id,0)
else
deleteMessages(msg.chat_id,{[0] = msg.id})
end
end
if base:sismember(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id) then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
if base:sismember(TD_ID..'MuteList:'..msg.chat_id,msg.sender_user_id) then
deleteMessages(msg.chat_id,{[0] = msg.id})
MuteUser(msg.chat_id,msg.sender_user_id,0)
end

end
end

--<><>Anti Tabchi Media<><>--
if msg.content._ == "messageChatJoinByLink"  and base:sismember(TD_ID..'Gp2:'..msg.chat_id,'tabchiresmedia') then
base:sadd(TD_ID..'AntiTabchiMediaUser'..msg.chat_id,msg.sender_user_id)
function BDClearTabcihPm()
if base:sismember(TD_ID..'AntiTabchiMediaUser'..msg.chat_id,msg.sender_user_id) then
function name(Ramin,G)
if G.username == '' then name = ec_name(G.first_name) else name = G.username end
if not base:get(TD_ID..'CL:tabchire:'..msg.chat_id) then
ST = 5
else
ST = tonumber(base:get(TD_ID..'CL:tabchire:'..msg.chat_id))
end
local t = ST * 60
tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر ["..name.."](tg://user?id="..msg.sender_user_id..") به خاطر امنیت گروه شما به مدت  "..Alphafa(ST).." دقیقه  از ارسال رسانه ها محدود شدید!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◆ توجه : برای ارسال رسانه ها تا اتمام زمان محدویتی صبور باشید این محدودیت توسط مدیران گروه اجرا شده است! ", 0, "md")
base:srem(TD_ID..'AntiTabchiMediaUser'..msg.chat_id,msg.sender_user_id)
end
GetUser(msg.sender_user_id,name)
end
end
alarm(t,BDClearTabcihPm)
end

--<><>Anti forcejoin<><>--

if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmute')   then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmutejoin') and msg.content._ == "messageChatJoinByLink"  then
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
local warn = base:get(TD_ID..'joinwarn:'..msg.chat_id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not is_Nazem(msg)  then
--deleteMessages(msg.chat_id,{[0] = msg.id})
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'FirstTabchiMute') then
MuteUser(msg.chat_id,msg.sender_user_id,0)
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat') then
mmltxt = 'سکوت خواهید شد!'
else
mmltxt = 'سکوت زمانی خواهید شد!'
end
function name(Ramin,Gaurd)
if Gaurd.username == '' then name = ec_name(Gaurd.first_name) else name = Gaurd.username end
if tonumber(endwarn) > tonumber(warn) then
else
local keyboard = {}
local timeGaurdClearPm = tonumber(base:get(TD_ID..'GaurdClearPm:'..msg.chat_id) or 300)
local Time_ = getTimeUptime(timeGaurdClearPm)
Ram = '◆کاربر عزیز <a href="tg://user?id='..msg.sender_user_id..'">'..name..'</a>\n\n<b>◉ احراز هویت جوین اجباری کانال جهت جلوگیری از ربات های تبلیغگر فعال شده است خواهشمند به کانال ما بپیوندید در صورت عضو نشدن</b> '..mmltxt..''
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat_id) or ' ◈ عضویت در کانال ◈'
local Gaurd = base:get(TD_ID..'Text:Chjoin:'..msg.chat_id) or Ram
local Gaurd = replace(Gaurd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>')
local Gaurd = replace(Gaurd,'NameCH',''..chname) or ''
Ramin = {'Guard','MrRamin'}
MrGuard = {'Guard','MrRamin','Alireza','TmGaurdian'}
BDAntiTabchi = MrGuard[math.random(#MrGuard)]
if Ramin[math.random(#Ramin)] == 'MrRamin' then
MrRamin = {0,1,2,3,4,5,6,7,8,9}
randnum = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
randnum2 = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
randnum3 = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
randnum4 = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
if tonumber(randnum) == tonumber(randnum2) or tonumber(randnum) == tonumber(randnum3) or tonumber(randnum) == tonumber(randnum3) then
randnum = 1000
end
if BDAntiTabchi == 'MrRamin' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Guard' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'TmGaurdian' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Alireza' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
local randnum = randnum:gsub("[0123456789]", {["0"] = "0️⃣", ["1"] = "1️⃣", ["2"] = "2️⃣", ["3"] = "3️⃣", ["4"] = "4️⃣", ["5"] = "5️⃣", ["6"] = "6️⃣", ["7"] = "7️⃣", ["8"] = "8️⃣", ["9"] = "9️⃣"})
send_inline(msg.chat_id,Gaurd..'\n\n 【<b>کاربر شما</b> <code>'..Time_..'</code> <b>فرصت دارید!</b>】',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
else
MrRamin = {'❤️','😍','✅','😭','🍦','🍌','🍉','🍏','🍎','🦆','💰','🔑','🐥','🎀','🎈','🔧','🗡','🤖','💄','💍','🐒','⚽️','0️⃣','1️⃣','2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣','🔟','✔️','⚫️','🔴','🔵','⚪️','🇮🇷'}
randnum = MrRamin[math.random(#MrRamin)]
randnum2 = MrRamin[math.random(#MrRamin)]
randnum3 = MrRamin[math.random(#MrRamin)]
randnum4 = MrRamin[math.random(#MrRamin)]
if tostring(randnum) == tostring(randnum2) or tostring(randnum) == tostring(randnum3) or tostring(randnum) == tostring(randnum3) then
randnum = '😡'
end
if BDAntiTabchi == 'MrRamin' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Guard' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'TmGaurdian' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Alireza' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
local randnum = randnum:gsub(randnum,{["3️⃣"] = "شماره سه", ["4️⃣"] = "شماره چهار", ["5️⃣"] = "شماره پنج", ["6️⃣"] = "شماره شیش", ["7️⃣"] = "شماره هفت", ["8️⃣"] = "شماره هشت", ["9️⃣"] = "شماره نه", ["❤️"] = "قلب",["0️⃣"] = "شماره صفر", ["1️⃣"] = "شماره یک", ["2️⃣"] = "شماره دو",  ["😍"] = "چشم های قلبی", ["✅"] = "تیک سبز", ["🍌"] = "موز",  ["💰"] = "کیسه پول", ["🔑"] = "کلید", ["🐥"] = "جوجه", ["🎀"] = "پاپیون", ["🎈"] = "بادکنک قرمز", ["🔧"] = "اچهار فرانسه", ["🗡"] = "شمشیر", ["🤖"] = "ربات", ["💄"] = "رژ لب", ["💍"] = "انگشتر نگین دار", ["🐒"] = "میمون", ["⚽️"] = "توپ فوتبال", ["✔️"] = "تیک مشکی", ["⚫️"] = "دایره مشکی", ["🔴"] = "دایره قرمز", ["🔵"] = "دایره ابی", ["⚪️"] = "دایره سفید", ["🇮🇷"] = "پرچم ایران",["😡"] = "ادم عصبانی",["🍉"] = "هندوانه", ["🍏"] = "سیب سبز", ["🍎"] = "سیب قرمز", ["🦆"] = "اردک", ["😭"] = "گریه", ["🍦"] = "بستنی"})
send_inline(msg.chat_id,Gaurd..'\n\n 【<b>کاربر شما</b> <code>'..Time_..'</code> <b>فرصت دارید!</b>】',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
end
end
end
GetUser(msg.sender_user_id,name)
base:sadd(TD_ID..'AntiforcejoinUser'..msg.chat_id,msg.sender_user_id)
else
return true
end

function GaurdClearPm()
if base:sismember(TD_ID..'AntiforcejoinUser'..msg.chat_id,msg.sender_user_id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat') then
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not is_Nazem(msg)  then
local timemutejoin = tonumber(base:get(TD_ID..'mutetimejoin:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(timemutejoin)
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+timemutejoin)
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ کاربر ربات می باشد(دکمه  مدیران) ◈',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
send_inline(msg.chat_id,"◆ کاربر "..username.." به علت عضو نشدن درکانال 【@"..Ch.."】 به مدت <b>"..Time_.."</b> توانایی چت کردن را ازدست داد!",keyboard,"html")
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'AntiforceMuteUser'..msg.chat_id,msg.sender_user_id)
else
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
UnRes(msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id)
return tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر "..username.." از عضویت شما به کانال ما متشکریم\n💥 شما از این به بعد می توانید در گروه بدون هیچ محدودیتی به فعالیت خود ادامه بدهید. ", 0, "html")
end
else
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not is_Nazem(msg)  then
--MuteUser(msg.chat_id,msg.sender_user_id,0)

local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ کاربر ربات می باشد(دکمه  مدیران) ◈',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
send_inline(msg.chat_id,"◆ کاربر "..username.." برای چت کردن در این گروه عضو کانال 【@"..Ch.."】 بشوید تا فعالیت برای شما آزاد شود! ",keyboard,"html")
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'AntiforceMuteUser'..msg.chat_id,msg.sender_user_id)
else
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
UnRes(msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id)
return tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر "..username.." از عضویت شما به کانال @"..Ch.." متشکریم \n💥 شما از این به بعد می توانید در گروه بدون هیچ محدودیتی به فعالیت خود ادامه بدهید. ", 0, "html")
end
end
base:srem(TD_ID..'AntiTabchiUser'..msg.chat_id,msg.sender_user_id)
end
end
end
local timeGaurdClearPm = tonumber(base:get(TD_ID..'GaurdClearPm:'..msg.chat_id) or 300)
alarm(timeGaurdClearPm,GaurdClearPm)
end






--<><>Anti Tabchi<><>--
if msg.content._ == "messageChatJoinByLink" and base:sismember(TD_ID..'Gp2:'..msg.chat_id,'AntiTabchi') then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'FirstTabchiMute') then
MuteUser(msg.chat_id,msg.sender_user_id,0)
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
mmltxt = 'محدود خواهید شد!'
else
mmltxt = 'مسدود خواهی شد!'
end
function name(black,guard)
if guard.username == '' then name = ec_name(guard.first_name) else name = guard.username end
local keyboard = {}
TexT = '◈کاربر عزیز <a href="tg://user?id='..msg.sender_user_id..'">'..name..'</a>\n\n⇜ برای جلوگیری از ورود ربات ها قفل  احراز هویت  فعال می باشد. '
Ramin = {'Guard','MrRamin'}
MrGuard = {'Guard','MrRamin','Alireza','TmGaurdian'}
BDAntiTabchi = MrGuard[math.random(#MrGuard)]

MrRamin = {'❤️','😍','🔥','😭',}
MrRamin2 = {"🎭","🥊","🎯","🎲","🎮","🎪","🎹","🎱","🥁","🎨"}
MrRamin3 = {"🚜","🛫","🎡","⌚️","⛱","🐮","👾","🐳","💩","🌈"}
MrRamin4 = {"🍁","💻","💊","🎁","🐬","☃️","🔥","🦍","🎳"}
randnum = MrRamin[math.random(#MrRamin)]
randnum2 = MrRamin2[math.random(#MrRamin2)]
randnum3 = MrRamin3[math.random(#MrRamin3)]
randnum4 = MrRamin4[math.random(#MrRamin4)]
if tostring(randnum) == tostring(randnum2) or tostring(randnum) == tostring(randnum3) or tostring(randnum) == tostring(randnum3) then
randnum = '😡'
end
if BDAntiTabchi == 'MrRamin' then
keyboard.inline_keyboard = {
{{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.sender_user_id..':'..msg.chat_id},{text = randnum2,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..':'..msg.chat_id}},
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>2:'..msg.chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>1:'..msg.chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Guard' then
keyboard.inline_keyboard = {
{{text = randnum2,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..':'..msg.chat_id},{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.sender_user_id..':'..msg.chat_id}},
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>3:'..msg.chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>1:'..msg.chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'TmGaurdian' then
keyboard.inline_keyboard = {
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>2:'..msg.chat_id},{text = randnum2,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..':'..msg.chat_id}},
{{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.sender_user_id..':'..msg.chat_id},{text = randnum4,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>1:'..msg.chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Alireza' then
keyboard.inline_keyboard = {
{{text = randnum3,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>3:'..msg.chat_id},{text = randnum2,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..':'..msg.chat_id}},
{{text = randnum4,callback_data='Gaurd:IsTabchiTrue>'..msg.sender_user_id..'>1:'..msg.chat_id},{text = randnum,callback_data='Gaurd:IsTabchiFalse>'..msg.sender_user_id..':'..msg.chat_id}},
{{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
local randnum = randnum:gsub(randnum,{ ["❤️"] = "قلب", ["😍"] = "چشم های قلبی",["🔥"] = "آتش", ["😭"] = "گریه"})
if randnum == "قلب" then
randnump = base:get("Welcome:Photo1")
elseif randnum == "چشم های قلبی" then
randnump = base:get("Welcome:Photo2")
elseif randnum == "آتش" then
randnump = base:get("Welcome:Photo3")
elseif randnum == "گریه" then
randnump = base:get("Welcome:Photo4")
end
sendPhotokey(msg.chat_id, randnump, 0, ''..TexT..'\nایموجی ارسال شده چی می باشد؟ شما #پنچ دقیقه فرصت دارید درصورت اشتباه '..mmltxt..'\n',keyboard ,'html')
--send_inline(msg.chat_id,TexT..'\n\n> اموجی '..randnum..' را از میان دکمه های زیر پیدا کرده و بر روی آن کلیک کنید !',keyboard,'html')
end
GetUser(msg.sender_user_id,name)
base:sadd(TD_ID..'AntiTabchiUser'..msg.chat_id,msg.sender_user_id)
function BDClearPm()
if base:sismember(TD_ID..'AntiTabchiUser'..msg.chat_id,msg.sender_user_id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'MuteAntiTab') then
MuteUser(msg.chat_id,msg.sender_user_id,0)
base:sadd(TD_ID..'AGTMute:',msg.sender_user_id)
tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر ["..msg.sender_user_id.."](tg://user?id="..msg.sender_user_id..") به علت پاسخگو نبودن به احراز هویت در گروه محدود شد!", 0, "md")
else
KickUser(msg.chat_id,msg.sender_user_id)
tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر ["..msg.sender_user_id.."](tg://user?id="..msg.sender_user_id..") به علت پاسخگو نبودن به احراز هویت در گروه مسدود شد!", 0, "md")
base:sadd(TD_ID..'AGTMute:',msg.sender_user_id)
end
base:srem(TD_ID..'AntiTabchiUser'..msg.chat_id,msg.sender_user_id)
end
end
alarm(300,BDClearPm)
end
-----Tgservice---------------------
if msg.content._ == "messageChatJoinByLink" or msg.content._ == "messageChatAddMembers" or msg.content._ == "messageChatDeleteMember" then
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Lock:TGservice') then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
end
------------Chat Type------------



if is_configure(msg) then

if Ramin and (Ramin:match('^svcharge (%d+)$') or Ramin:match('^شارژ اختصاصی (%d+)$')) then
local input = tonumber(Ramin:match('^svcharge (%d+)$') or Ramin:match('^شارژ اختصاصی (%d+)$'))* day
input2 =  input / 86400
base:setex(TD_ID.."SvExpire",input,true)
send(msg.chat_id,msg.id,"◈ ربات اختصاصی به مدت  "..input2.." روز شارژ شد !","md")
end

if Ramin == 'svexpire' or Ramin == 'اعتبار اختصاصی'  and is_FullSudo(msg) then
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
send(msg.chat_id,msg.id,'📅 '..remained_expire..' !',"md")
end
end





if is_FullSudo(msg) then
if Ramin and (Ramin:match('^افزودن سودو$')  or Ramin:match('^[Ss][Ee][Tt][Ss][Uu][Dd][Oo]$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
if not result.sender_user_id then
else
Setsudo(msg, msg.chat_id, result.sender_user_id)
end
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end

if Ramin and (Ramin:match('^افزودن سودو (.*)$') or Ramin:match('^[Ss][Ee][Tt][Ss][Uu][Dd][Oo] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Setsudo(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^افزودن سودو @(.*)$') or Ramin:match('^[Ss][Ee][Tt][Ss][Uu][Dd][Oo] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^افزودن سودو @(.*)$') or Ramin:match('^[Ss][Ee][Tt][Ss][Uu][Dd][Oo] @(.*)$')
function modusername(extra,result,success)
if result.id then
Setsudo(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end 
searchPublicChat(username, modusername)
end

if Ramin and (Ramin:match('^تنظیم سودو (%d+)$') or Ramin:match('^[Ss][Ee][Tt][Ss][Uu][Dd][Oo] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Setsudo(msg, msg.chat_id, Ramin:match('^تنظیم سودو (%d+)$') or Ramin:match('^[Ss][Ee][Tt][Ss][Uu][Dd][Oo] (%d+)$'))
end 

if Ramin and (Ramin:match('^حذف سودو$')  or Ramin:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo]$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
if not result.sender_user_id then
else
Remsudo(msg, msg.chat_id, result.sender_user_id)
end
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end

if Ramin and (Ramin:match('^حذف سودو (.*)$') or Ramin:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Remsudo(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^حذف سودو @(.*)$') or Ramin:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف سودو @(.*)$') or Ramin:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo] @(.*)$')
function remmodusername(extra,result,success)
if result.id then
Remsudo(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end

if Ramin and (Ramin:match('^حذف سودو (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Remsudo(msg, msg.chat_id, Ramin:match('^حذف سودو (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Ss][Uu][Dd][Oo] (%d+)$'))
end

if Ramin and (Ramin:match('^افزودن تبچی$')  or Ramin:match('^[Aa][Dd][Dd][Tt][Aa][Bb][Cc][Hh][Ii]$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
if not result.sender_user_id then
else
Addtabchi(msg, msg.chat_id, result.sender_user_id)
end
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end

if Ramin and (Ramin:match('^افزودن تبچی (.*)$') or Ramin:match('^[Aa][Dd][Dd][Tt][Aa][Bb][Cc][Hh][Ii] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Addtabchi(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^افزودن تبچی @(.*)$') or Ramin:match('^[Aa][Dd][Dd][Tt][Aa][Bb][Cc][Hh][Ii] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^افزودن تبچی @(.*)$') or Ramin:match('^[Aa][Dd][Dd][Tt][Aa][Bb][Cc][Hh][Ii] @(.*)$')
function remmodusername(extra,result,success)
if result.id then 
Addtabchi(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end

if Ramin and (Ramin:match('^افزودن تبچی (%d+)$') or Ramin:match('^[Aa][Dd][Dd][Tt][Aa][Bb][Cc][Hh][Ii] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Addtabchi(msg, msg.chat_id, Ramin:match('^حذف تبچی (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii] (%d+)$'))
end
if Ramin and (Ramin:match('^حذف تبچی$')  or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii]$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
if not result.sender_user_id then
else
Remtabchi(msg, msg.chat_id, result.sender_user_id) 
end
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end

if Ramin and (Ramin:match('^حذف تبچی (.*)$') or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Remtabchi(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^حذف تبچی @(.*)$') or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف تبچی @(.*)$') or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii] @(.*)$')
function remmodusername(extra,result,success)
if result.id then
Remtabchi(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end

if Ramin and (Ramin:match('^حذف تبچی (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Remtabchi(msg, msg.chat_id, Ramin:match('^حذف تبچی (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Tt][Aa][Bb][Cc][Hh][Ii] (%d+)$'))
end


------------------------------------------------------------------

if Ramin and (Ramin:match('^لیست سودو$') or Ramin:match('^[Ss][Uu][Dd][Oo][Ll][Ii][Ss][Tt]$')) and tonumber(msg.reply_to_message_id) == 0 then
local hash = TD_ID.."SUDO"
local list = base:smembers(hash)
if #list == 0 then
sendText(msg.chat_id, msg.id, '◂ لیست سودو خالی می باشد !', 'md')
else
local txt = '◂ لیست سودو های ربات :\n\n'
for k,v in pairs(list) do
local firstname = base:get(TD_ID..'UserName:'..v)
if firstname then
username = '<a href="tg://user?id='..v..'">'..check_html(firstname)..'</a> - <code>'..v..'</code>'
else
username = '<a href="tg://user?id='..v..'">'..v..'</a>'
end
txt = txt..k..' - [ '..username..' ]\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end 

if (Ramin == 'clean sudolist' or Ramin == 'پاکسازی لیست سودو') then
base:del(TD_ID..'SUDO')
send(msg.chat_id,msg.id,'◈لیست مدیریت سودو ها ازسیستم پاکسازی شد.','md')
end
end

----------------- pv -------------
if msg.chat_id == tonumber(Sudoid) and tonumber(msg.reply_to_message_id) ~= 0 then
local function SendMsg(BlaCk,ALPHA)
if ALPHA.forward_info then
if ALPHA.forward_info._ == 'messageForwardedFromUser' then
local user = ALPHA.forward_info.sender_user_id
if user then
if tonumber(user) == tonumber(BotJoiner) or tonumber(user) == tonumber(Sudoid) then
send(msg.chat_id,msg.id,'Error ! ✗ (⊙▂⊙)','html')
else
if ALPHA.content._ == 'messageText' then
if msg.content._ == 'messageText' then
send(user,0,'◈ پیام شما ► ▎ <code>'..ALPHA.content.text..'</code>\n📩 پاسخ ▎ <b>'..msg.content.text..'</b>','html')
end
if msg.content._ == "messageSticker"   then

sendSticker(user,0,msg.content.sticker.sticker.persistent_id)

end
if msg.content._ == "messageVoice" then
sendVoice(user, 0, msg.content.voice.voice.persistent_id,msg.content.voice.duration, msg.content.voice.waveform, '📩 در پاسخ به ▎ '..ALPHA.content.text)
end
if msg.content._ == 'messageUnsupported' or msg.content._ == "messageVideo" or msg.content._ == "messagePhoto" or msg.content._ == "messageVideoNote" or msg.content._ == "messageDocument" or msg.content._ == "messageAudio" or msg.content._ == "messageContact" or msg.content._ == "messageLocation" then
ForMsg(user, msg.chat_id, {[0] = msg.id}, 1)
end
if msg.content._ == "messageAnimation" then
sendGif(user, 0, msg.content.animation.animation.persistent_id,'📩 در پاسخ به ▎ '..ALPHA.content.text)
end
send(msg.chat_id,msg.id,'✔️Sent !','html')
else
if msg.content._ == 'messageText' then
send(user,0,msg.content.text,'html')
end
if msg.content._ == "messageSticker" then
sendSticker(user,0,msg.content.sticker.sticker.persistent_id)
end
if msg.content._ == "messageVoice" then
sendVoice(user, 0, msg.content.voice.voice.persistent_id,msg.content.voice.duration, msg.content.voice.waveform, '')
end
if msg.content._ == 'messageUnsupported' or msg.content._ == "messageVideo" or msg.content._ == "messagePhoto" or msg.content._ == "messageVideoNote" or msg.content._ == "messageDocument" or msg.content._ == "messageAudio" or msg.content._ == "messageContact" or msg.content._ == "messageLocation" then
ForMsg(user, msg.chat_id, {[0] = msg.id}, 1)
end
if msg.content._ == "messageAnimation" then
sendGif(user, 0, msg.content.animation.animation.persistent_id,'')
end
send(msg.chat_id,msg.id,'✔️Sent !','html')
end
end
end
else
if ALPHA.forward_info.author_signature == '' then
send(msg.chat_id,msg.id,'ارسال پیام ناموفق ... ! ❌\nپیام مورد نظر از کانال ارسال شده است !','html')
else
send(msg.chat_id,msg.id,'ارسال پیام ناموفق ... ! ❌\nکاربر فورارد پیام خود را بسته است !','html')
end
end
end
end
getMessage(msg.chat_id,tonumber(msg.reply_to_message_id),SendMsg)
end
if gp_type(msg.chat_id) == "pv" and not base:sismember(TD_ID..'GlobalyBanned:',msg.sender_user_id) and ( (#base:smembers(TD_ID..'gpuser:'..msg.sender_user_id) ~= 0 and Ramin and not (Ramin:match('chat (.*)$') or Ramin:match('چت (.*)$') or Ramin:match('(.*) on$') or Ramin:match('(.*) روشن$') or Ramin:match('(.*) off$') or Ramin:match('(.*) خاموش$') or Ramin:match('(.*)list$') or Ramin:match('^فیلترکردن +(.*)') or Ramin:match('^حذف فیلتر +(.*)') or Ramin:match('لیست(.*)') or Ramin:match('^filter +(.*)') or Ramin:match('(.*) فعال$') or Ramin:match('(.*) غیرفعال$') or Ramin:match('^قفل (.*)$') or Ramin:match('lock (.*)$') or Ramin:match('del (.*)$') or Ramin:match('warn (.*)$') or Ramin:match('mute (.*)$') or Ramin:match('kick (.*)$')or Ramin:match('ban (.*)$') or Ramin:match('^unlock (.*)$') or Ramin:match('^بازکردن (.*)$') or Ramin:match('cmd (.*)$') or Ramin:match('دستور (.*)$'))) or (Ramin and not Ramin:match('^100(%d+)$') and base:get(TD_ID..'getgp:'..msg.sender_user_id)) or Ramin and not (Ramin:match('^help$') or Ramin:match('^راهنما$') or Ramin:match('^setgp$') or Ramin:match('^ثبت گروه$') or Ramin:match('^delgp$') or Ramin:match('^حذف گروه$') or Ramin:match('^delgps$') or Ramin:match('^حذف گروها$') or Ramin:match('^mygps$') or Ramin:match('^/start$') or Ramin:match('^گروهای من$') or Ramin:match('^delac (.*)') or Ramin:match('^دیلیت اکانت(.*)') or Ramin:match('^psswd (.*)') or Ramin:match('رمز دیلیت اکانت (.*)') or Ramin:match('^نرخ$') or Ramin:match('^nerch$')) or not Ramin) and not is_Sudo(msg) then
if base:get(TD_ID..'MonShi:on') and not base:get(TD_ID..'getgp:'..msg.sender_user_id) then
local text = base:get(TD_ID..'monshi') or '_سلام\nمن رباتی هستم که میتوانم گروه شما رو ضد لینک و ضد تبلیغ کنم\nخب اگه میخوای منو داشته باشی و به من نیاز داری که تو گروهت مدیریت کنم وارد گروه پشتیبانی شو 😝_\n\n*لینک گروه پشتیبانی :*\n'..(LinkSuppoRt)..'\n\n*برای کسب اطلاعات بیشتر میتوانید در کانال ما عضو شوید :*\n'..(Channel)..'\n\n_برای دریافت قیمت ربات دستور_ *"نرخ"* _را ارسال کنید._'
send(msg.chat_id,msg.id,text,'md')
end
if not base:get(TD_ID..'pmresan:on') then
ForMsg(Sudoid, msg.chat_id, {[0] = msg.id}, 1)
end
end
if gp_type(msg.chat_id) == "pv" and Ramin and not base:sismember(TD_ID..'GlobalyBanned:',msg.sender_user_id) then
cmdpv = Ramin:match('^help') or Ramin:match('start$') or Ramin:match('^راهنما') or Ramin:match('^setgp') or Ramin:match('^ثبت گروه') or Ramin:match('^delgp') or Ramin:match('^حذف گروه') or Ramin:match('^delgps') or Ramin:match('^حذف گروها$') or Ramin:match('^mygps') or Ramin:match('^گروهای من') or Ramin:match('^نرخ') or Ramin:match('^nerch')
if Ramin and not (cmdpv) and base:get(TD_ID..'NajVa'..msg.sender_user_id) then
Mrrosta = base:get(TD_ID..'NajVa'..msg.sender_user_id)
Split = Mrrosta:split('>')
user = Split[1]
chat = Split[2]
nameuser = Split[3]
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(utf8.len(Ramin)) > 50 then
text = string.sub(Ramin,0,40)
base:setex(text,tonumber(day),string.sub(Ramin,41,99999))
MamaL = 'BDMrr'..text
else
MamaL = Ramin
end
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
Fozol = base:scard(TD_ID..'FozolList:'..chat) or 0
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '👁 نمایش پیام مخفی 👁',callback_data = 'Najva::'..user..'::'..MamaL}
},{
{text = '😐 تعداد فضول {'..Fozol..'} نفر',callback_data = 'Najva::'..user..'::'..MamaL}
}
}
base:set(TD_ID..'Fozolgp:',chat)
send_inline(chat,'✪ کاربر  <a href="tg://user?id='..user..'">'..nameuser..'</a>\nشما یک  #پیام_مخفی از طرف  <a href="tg://user?id='..msg.sender_user_id..'">'..name..'</a> برای دیدن پیام مخفی دکمه  نمایش پیام مخفی لمس کنید!(فقط <a href="tg://user?id='..user..'">'..nameuser..'</a> دسترسی دارد!)\n\n⏳ پیام ارسالی تا 30 ثانیه دیگر باطل خواهد شد! ',keyboard,'html')
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '👁 نمایش پیام مخفی 👁',callback_data = 'Najva::'..msg.sender_user_id..'::'..MamaL}
}
}
send_inline(msg.sender_user_id,'◈ پیام مخفی تنظیم شده به کاربر  <a href="tg://user?id='..user..'">'..nameuser..'</a> ارسال شد !',keyboard,'html')
base:del(TD_ID..'NajVa'..msg.sender_user_id)
end
GetUser(msg.sender_user_id,name)
end
if not base:get(TD_ID..'block:on') and not is_Sudo(msg) then
if Ramin and (cmdpv) then
local spam = TD_ID..'user:' .. msg.sender_user_id .. ':spamer'
local msgs = tonumber(base:get(spam) or 0)
local autoblock = base:get(TD_ID..'autoblocknumber') or 5
if msgs > tonumber(autoblock) then
base:sadd(TD_ID..'GlobalyBanned:',user)
send(msg.chat_id,msg.id,'به دلیل اسپم شما مسدود جهانی شدید !','md')
end
base:setex(spam,tonumber(5),msgs+1)
end
end
if Ramin:match('^100(%d+)$') then
if base:get(TD_ID..'getgp:'..msg.sender_user_id) then
local DiamonD = tonumber(Ramin:match('^(%d+)$'))
local Mod = base:sismember(TD_ID..'ModList:-'..DiamonD,msg.sender_user_id)
local Owner = base:sismember(TD_ID..'OwnerList:-'..DiamonD,msg.sender_user_id)
if base:sismember(TD_ID..'Gp2:-'..DiamonD,'added') then
if not ( Owner or base:sismember(TD_ID..'SUDO',msg.sender_user_id)) then
send(msg.chat_id,msg.id,'• دسترسی این دستور فقط مالک گروه می باشد!',"md")
base:del(TD_ID..'getgp:'..msg.sender_user_id)
else
if base:sismember(TD_ID..'gpuser:'..msg.sender_user_id,'-'..DiamonD..'') then
send(msg.chat_id, msg.id,'•  تنظیمات شخصی گروه توسط ربات قبلان فعال می باشد!',"md")
base:del(TD_ID..'getgp:'..msg.sender_user_id)
else
base:del(TD_ID..'getgp:'..msg.sender_user_id)
base:sadd(TD_ID..'gpuser:'..msg.sender_user_id,'-'..DiamonD..'')
send(msg.chat_id,msg.id,'•  تنظیمات شخصی گروه توسط ربات فعال شد!',"md")
end
end
else
send(msg.chat_id,msg.id,'•  ایدی این گروه در لیست مدیریت ربات نمی باشد!',"md")
base:del(TD_ID..'getgp:'..msg.sender_user_id)
end
end
if base:get(TD_ID..'delgp:'..msg.sender_user_id) then
local DiamonD = tonumber(Ramin:match('^(%d+)$'))
if base:sismember(TD_ID..'gpuser:'..msg.sender_user_id,'-'..DiamonD..'') then
send(msg.chat_id, msg.id,'•  تنظیم گروه در خصوصی ربات\n-'..DiamonD..'\nبرای شما غیرفعال شد..!',"md")
base:srem(TD_ID..'gpuser:'..msg.sender_user_id,'-'..DiamonD..'')
base:del(TD_ID..'delgp:'..msg.sender_user_id)
else
send(msg.chat_id,msg.id,'• تنظیم گروه در خصوصی ربات\n-'..DiamonD..'\nبرای شما فعال نیست..!',"md")
base:del(TD_ID..'delgp:'..msg.sender_user_id)
end
end
end
if (Ramin == 'setgp' or Ramin == 'مدیریت شخصی') and is_JoinChannel(msg) and is_Owner(msg) then
base:set(TD_ID..'getgp:'..msg.sender_user_id,true)
send(msg.chat_id,msg.id,'• کاربر عزیز  لطفا ایدی گروه خود را بدون (-) ارسال کنید\n\n• در صورتی که ایدی گروه خود را نمی دانید در گروه دستور (gid) یا (ایدی گروه) را ارسال کنید و شناسه گروه خود را در اینجا ارسال کنید.\n\n• برای لغو عملیات کلمه (لغو) یا (cancel) را ارسال کنید.',"html")

elseif (Ramin == 'delgp' or Ramin == 'حذف مدیریت شخصی') and is_JoinChannel(msg) and is_Owner(msg) then
base:set(TD_ID..'delgp:'..msg.sender_user_id,true)
send(msg.chat_id,msg.id,'• کاربر عزیز  لطفا ایدی گروه خود را بدون (-) ارسال کنید\nدر صورتی که ایدی گروه خود را نمیدانید در گروه دستور (id) یا (ایدی گروه) را ارسال کنید و شناسه گروه خود را در اینجا ارسال کنید.\nبرای لفو عملیات کلمه (لغو) یا (cancel) را ارسال کنید.',"md")

elseif (Ramin == 'cancel' or Ramin == 'لغو') and is_Owner(msg) then
if base:get(TD_ID..'getgp:'..msg.sender_user_id) or base:get(TD_ID..'delgp:'..msg.sender_user_id) then
base:del(TD_ID..'getgp:'..msg.sender_user_id)
base:del(TD_ID..'delgp:'..msg.sender_user_id)
send(msg.chat_id,msg.id,'•  عملیات ثبت گروه لغو شد...!',"md")
end

elseif (Ramin == 'delgps' or Ramin == 'حذف لیست مدیریتی') and is_JoinChannel(msg) and is_Owner(msg) then
base:del(TD_ID..'gpuser:'..msg.sender_user_id)
send(msg.chat_id,msg.id,'•  همه گروه ها از حالت تنظیم در خصوصی ربات خارج شدند...!',"md")

elseif Ramin == 'mygps' or Ramin == 'لیست تنظیمات شخصی' and is_JoinChannel(msg) and is_Owner(msg) then
local list = base:smembers(TD_ID..'gpuser:'..msg.sender_user_id)
local tlist = #base:smembers(TD_ID..'gpuser:'..msg.sender_user_id)
local t = '• تعداد گروه های شما : *'..tlist..'*\n• شناسه گروه های شما\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n'
for k,v in pairs(list) do
t = ""..t.."گروه شماره *"..k.."*\nشناسه گروه :"..v.."\n"
end
if #list == 0 then
t = '•  شما گروهی ثبت نکرده اید...!'
send(msg.chat_id,msg.id,t,'md')
end
elseif Ramin == 'nerkh' or Ramin == 'نرخ' then
local bd = base:get(TD_ID..'nerkh') or '💵 نرخ فروش ربات\n\n✳️برای تمام گروه ها‌ :\n\n*➰1  ماهه 15 هزار تومان*\n\n*➰2  ماهه 25 هزار تومان*\n\n*➰دائمی(نامحدود)  60 هزار تومان*\n\n🔰 نکته مهم :\n\n🎖توجه داشته باشید ربات به مدت  24 ساعت رایگان برای تست در گروه نصب می‌شود و بعد تست و رضایت کامل اعمالات صورت می‌گیرد\n\nبرای خرید به ایدی یا پیام رسان زیر مراجعه و اعلام کنید :\n\n🆔 : '..check_markdown(UserSudo)..'\n\nپیام رسان : '..check_markdown(PvUserSudo)..''
send(msg.chat_id,msg.id,bd,'html')

end
end

---------------- End Pv -------------
if gp_type(msg.chat_id) == "pv" and #base:smembers(TD_ID..'gpuser:'..msg.sender_user_id) > 0 or is_supergroup(msg) and is_Owner(msg) or is_Nazem(msg) or (is_Mod(msg) or is_ModTest(msg) and Ramin and not (base:sismember(TD_ID..'LimitCmd:'..msg.chat_id,Ramin) or base:sismember(TD_ID..'LimitCmd:'..msg.chat_id,BaseCmd))) then
----------------delete----------------
local bd = msg.sender_user_id
local cht = msg.chat_id
local chat = msg.chat_id
local gps = base:smembers(TD_ID..'gpuser:'..msg.sender_user_id)
local tgps = #base:smembers(TD_ID..'gpuser:'..msg.sender_user_id)
if is_supergroup(msg) then
bdcht = msg.chat_id
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
bdcht = v
end
end
local function typegpadd(name,mrr)
if is_supergroup(msg) then
base:sadd(TD_ID..''..name..''..cht,mrr)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:sadd(TD_ID..''..name..''..v,mrr)
end
end
end
local function typegprem(name,mrr)
if is_supergroup(msg) then
base:srem(TD_ID..''..name..''..cht,mrr)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:srem(TD_ID..''..name..''..v,mrr)
end
end
end
local function typegpdel(name)
if is_supergroup(msg) then
base:del(TD_ID..''..name..''..cht)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:del(TD_ID..''..name..''..v)
end
end
end
local function typegpset(name,mrr)
if is_supergroup(msg) then
base:set(TD_ID..''..name..''..cht,mrr)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:set(TD_ID..''..name..''..v,mrr)
end
end
end
local function typegphset(name,mrr,r619)
if is_supergroup(msg) then
base:hset(TD_ID..''..name..''..cht,mrr,r619)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:hset(TD_ID..''..name..''..v,mrr,r619)
end
end
end
local function typegphdel(name,mrr)
if is_supergroup(msg) then
base:hdel(TD_ID..''..name..''..cht,mrr)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:hdel(TD_ID..''..name..''..v,mrr)
end
end
end
--local owner = base:smembers(TD_ID..'OwnerList:'..bdcht)
if base:sismember(TD_ID..'Gp2:'..bdcht,'added') then


if Ramin and (Ramin:match('^filterjoin +(.*)') or Ramin:match('^فیلترجوین +(.*)') ) and is_JoinChannel(msg) then
if string.find(Ramin:match('^filterjoin (.*)$') or Ramin:match('^فیلترجوین (.*)$'),"[%(%)%.%+%-%*%?%[%]%^%$%%]") then
send(cht,msg.id,'🖕😐','md')
else
local word = Ramin:match('^filterjoin +(.*)') or Ramin:match('^فیلترجوین +(.*)')
typegpadd('Filtersjoin:',word)
send(cht,msg.id,'◈*کلمه*  *'..word..'* *درلیست جوین فیلتر شدہ ها قرار گرفت*. ','md')
end
end

if Ramin and (Ramin:match('^remfilterjoin +(.*)') or Ramin:match('^حذف فیلترجوین +(.*)')) and is_JoinChannel(msg) then
local word = Ramin:match('^remfilterjoin +(.*)') or Ramin:match('^حذف فیلترجوین +(.*)')
typegprem('Filtersjoin:',word)
send(cht,msg.id,'◈*کلمه*  *'..word..'* *ازلیست جوین فیلتر شدہ ها حذف شد*.','md')
end

if (Ramin == 'clean filterlist' or Ramin == 'پاکسازی لیست فیلتر جوین') and is_JoinChannel(msg) then
typegpdel('Filtersjoin:')
send(cht,msg.id,'◈*لیست کلمات فیلترجوین شدہ پاکسازی شد*.','md')
end



if (Ramin == 'clean filterlist' or Ramin == 'پاکسازی لیست فیلتر') and is_JoinChannel(msg) then
typegpdel('Filters:')
send(cht,msg.id,'◈*لیست کلمات فیلتر شدہ پاکسازی شد*.','md')
end


if Ramin and (Ramin:match('^filter +(.*)') or Ramin:match('^فیلترکردن +(.*)') ) and is_JoinChannel(msg) then
if string.find(Ramin:match('^filter (.*)$') or Ramin:match('^فیلترکردن (.*)$'),"[%(%)%.%+%-%*%?%[%]%^%$%%]") then
send(cht,msg.id,'🖕😐','md')
else
local word = Ramin:match('^filter +(.*)') or Ramin:match('^فیلترکردن +(.*)')
typegpadd('Filters:',word)
send(cht,msg.id,'◈*کلمه*  *'..word..'* *درلیست فیلتر شدہ ها قرار گرفت*. ','md')
end
end

if Ramin and (Ramin:match('^remfilter +(.*)') or Ramin:match('^حذف فیلتر +(.*)')) and is_JoinChannel(msg) then
local word = Ramin:match('^remfilter +(.*)') or Ramin:match('^حذف فیلتر +(.*)')
typegprem('Filters:',word)
send(cht,msg.id,'◈*کلمه*  *'..word..'* *ازلیست فیلتر شدہ ها حذف شد*.','md')
end
if (Ramin == 'clean filterlist' or Ramin == 'پاکسازی لیست فیلتر') and is_JoinChannel(msg) then
typegpdel('Filters:')
send(cht,msg.id,'◈*لیست کلمات فیلتر شدہ پاکسازی شد*.','md')
end
if (Ramin == 'filterlist' or Ramin == 'لیست فیلتر') and is_JoinChannel(msg) then
if is_supergroup(msg) then
local list = base:smembers(TD_ID..'Filters:'..cht)
local t = '• لیست کلمات فیلتر شده :\n'
for k,v in pairs(list) do
t = t..k.."- *"..v.."*\n"
end
if #list == 0 then
t = '◈*لیست کلمات فیلتر شدہ دراین گروہ خالی می باشد*.'
end
send(cht,msg.id,t,'md')
end
if gp_type(msg.chat_id) == "pv" then
local t = '◈لیست کلمات فیلتر شدہ در *'..tgps..'* گروہ شما\n• برای دیدن لیست گروہ ها میتوانید از دستور گروہ های من یا [mygps] استفادہ کنید.\n'
for k,v in pairs(gps) do
local list = base:smembers(TD_ID..'Filters:'..v)
for a,b in pairs(list) do
t = ""..t..""..b.."\nدر گروه *"..k.."*\n\n"
end
end
send(cht,msg.id,t,'md')
end
end
--- filter name
if Ramin and (Ramin:match('^filtername +(.*)') or Ramin:match('^فیلتر اسم +(.*)') or Ramin:match('^مسدود اسم +(.*)')) and is_JoinChannel(msg) then
if string.find(Ramin:match('^filtername (.*)$') or Ramin:match('^فیلتر اسم (.*)$') or Ramin:match('^مسدود اسم (.*)$'),"[%*?^$]") then
send(cht,msg.id,'🖕😐','md')
else
local word = Ramin:match('^filtername +(.*)') or Ramin:match('^فیلتر اسم +(.*)') or Ramin:match('^مسدود اسم (.*)$')
typegpadd('FilterName:',word)
send(cht,msg.id,'◈ *اسم* *'..word..'* *به لیست ممنوع شدہ ها اضافه شد*','md')
end
end

if Ramin and (Ramin:match('^remfiltername +(.*)') or Ramin:match('^حذف فیلتر اسم +(.*)') or Ramin:match('^حذف مسدود اسم +(.*)')) and is_JoinChannel(msg) then
local word = Ramin:match('^remfiltername +(.*)') or Ramin:match('^حذف فیلتر اسم +(.*)') or Ramin:match('^حذف مسدود اسم +(.*)')
typegprem('FilterName:',word)
send(cht,msg.id,'◈ *اسم* *'..word..'* *از لیست ممنوع شده ها حذف شد*.','md')
end
if (Ramin == 'clean filternamelist' or Ramin == 'پاکسازی لیست اسم غیرمجاز') and is_JoinChannel(msg) then
typegpdel('FilterName:')
send(cht,msg.id,'◈*لیست اسامی غیرمجاز وممنوع شدہ ها از سیستم پاکسازی شد*.','md')
end
if (Ramin == 'filternamelist' or Ramin == 'لیست مسدود اسم ها') and is_JoinChannel(msg) then
if is_supergroup(msg) then
local list = base:smembers(TD_ID..'FilterName:'..cht)
local t = ' لیست اسامی فیلتر شده :\n'
for k,v in pairs(list) do
t = t..k.."- *"..v.."*\n"
end
if #list == 0 then
t = ' لیست اسامی فیلتر شده خالی است'
end
send(cht,msg.id,t,'md')
end
if gp_type(msg.chat_id) == "pv" then
local t = ' لیست اسامی فیلتر شدہ در *'..tgps..'* گروہ شما\nبرای دیدن لیست گروہ ها میتوانید از دستور گروہ های من یا [mygps] استفادہ کنید.\n'
for k,v in pairs(gps) do
local list = base:smembers(TD_ID..'FilterName:'..v)
for a,b in pairs(list) do
t = ""..t..""..b.."\nدر گروه *"..k.."*\n\n"
end
end
send(cht,msg.id,t,'md')
end
end

--- filter Bio
if Ramin and (Ramin:match('^filterbio +(.*)') or Ramin:match('^فیلتر بیو +(.*)') or Ramin:match('^مسدود بیو +(.*)')) and is_JoinChannel(msg) then
if string.find(Ramin:match('^filterbio (.*)$') or Ramin:match('^فیلتر بیو (.*)$') or Ramin:match('^مسدود بیو (.*)$'),"[%*?^$]") then
send(cht,msg.id,'🖕😐','md')
else
local word = Ramin:match('^filterbio +(.*)') or Ramin:match('^فیلتر بیو +(.*)') or Ramin:match('^مسدود بیو +(.*)')
typegpadd('FilterBio:',word)
send(cht,msg.id,'◈*کلمه* *'..word..'* *به لیست بیوگرافی های غیرمجاز اضافه شد* !','md')
end
end

if Ramin and (Ramin:match('^remfilterbio +(.*)') or Ramin:match('^حذف فیلتر بیو +(.*)') or Ramin:match('^حذف مسدود بیو +(.*)')) and is_JoinChannel(msg) then
local word = Ramin:match('^remfilterbio +(.*)') or Ramin:match('^حذف فیلتر بیو +(.*)') or Ramin:match('^حذف مسدود بیو +(.*)')
typegprem('FilterBio:',word)
send(cht,msg.id,' ◈*کلمه* *'..word..'* *به کلمات غیرمجاز در بیوگرافی اضافه شد* !','md')
end
if (Ramin == 'clean filterbiolist' or Ramin == 'پاکسازی لیست بیوهای غیرمجاز') and is_JoinChannel(msg) then
typegpdel('FilterBio:')
send(cht,msg.id,'◈ *پاکسازی لیست بیوگرافی های غیرمجاز از سیستم پاکسازی شد*.','md')
end
if (Ramin == 'filterbiolist' or Ramin == 'لیست مسدود بیوها') and is_JoinChannel(msg) then
if is_supergroup(msg) then
local list = base:smembers(TD_ID..'FilterBio:'..cht)
local t = ' لیست بیوهای غیرمجاز :\n'
for k,v in pairs(list) do
t = t..k.."- *"..v.."*\n"
end
if #list == 0 then
t = ' لیست بیوهای غیرمجاز خالی میباشد !'
end
send(cht,msg.id,t,'md')
end
if gp_type(msg.chat_id) == "pv" then
local t = ' لیست بیوهای غیرمجاز در *'..tgps..'* گروہ شما\nبرای دیدن لیست گروہ ها میتوانید از دستور گروہ های من یا [mygps] استفادہ کنید.\n'
for k,v in pairs(gps) do
local list = base:smembers(TD_ID..'FilterBio:'..v)
for a,b in pairs(list) do
t = ""..t..""..b.."\nدر گروه *"..k.."*\n\n"
end
end
send(cht,msg.id,t,'md')
end
end

function change(ops)
if not ops then return end
changelang = {
FA={"لینک","یوزرنیم","فوروارد","هشتگ","وب","متن","انگلیسی","فارسی","فحش","منشن","ویرایش","گروه","ورود","دستورات","ربات","تبچی","سرویس","عکس","فایل","استیکر","فیلم","ویدیوسلفی","نظرسنجی","مخاطب","بازی","اینلاین","موقعیت","گیف","آهنگ","ویس"},
EN={"link","username","forward","hashtag","webpage","text","english","persian","fosh","mention","edit","muteall","join","cmd","bot","tabchi","tgservice","photo","document","sticker","video","videonote","poll","contact","game","inline","location","gif","music","voice"}
}
for k,v in pairs(changelang.FA) do
if ops == v then
return changelang.EN[k]
end
end
return false
end
if Ramin1 and (Ramin1:match('^قفل لیستی (.*)') or Ramin1:match('^lock list (.*)'))  and is_JoinChannel(msg)then
local inputz = Ramin1:match('^قفل لیستی (.*)') or Ramin1:match('^lock list (.*)')
text = "قفل لیستی به ترتیب زیر می باشد :\n\n\n"
for i in string.gmatch(inputz, "%S+") do
forgod = change(i)
if not forgod then
text = "خطا !"
break
else
base:sadd(TD_ID..'Gp:'..msg.chat_id,'Del:'..forgod..'')
text = text.."◈ قفل "..i.." فعال شد !\n"
end
end
send(msg.chat_id, msg.id, text, 'md')
end
if Ramin1 and (Ramin1:match('^بازکردن لیستی (.*)') or Ramin1:match('^unlock list (.*)'))  and is_JoinChannel(msg)then
local inputz = Ramin1:match('^بازکردن لیستی (.*)') or Ramin1:match('^unlock list (.*)')
text = "بازکردن لیستی به ترتیب زیر می باشد :\n\n\n"
for i in string.gmatch(inputz, "%S+") do
forgod = change(i)
if not forgod then
text = "خطا !"
break
else
base:sadd(TD_ID..'Gp:'..msg.chat_id,'Del:'..forgod..'')
text = text.."◈ قفل "..i.." غیرفعال شد !\n"
end
end
send(msg.chat_id, msg.id, text, 'md')
end

if Ramin and is_ModLock(msg)   then
TDDelMatch =  Ramin:match('^lock (.*)$') or Ramin:match('^قفل (.*)$')
TDBanMatch = Ramin:match('^ban (.*)$') or Ramin:match('^حالت (.*) مسدود$')
TDKickMatch = Ramin:match('^kick (.*)$') or Ramin:match('^حالت (.*) اخراج$')
TDMuteMatch = Ramin:match('^mute (.*)$') or Ramin:match('^حالت (.*) سکوت$')
TDSilentMatch = Ramin:match('^silent (.*)$') or Ramin:match('^حالت (.*) سایلنت$')
TDWarnMatch = Ramin:match('^warn (.*)$') or Ramin:match('^حالت (.*) اخطار$')
TDUnlockMatch = Ramin:match('^unlock (.*)$') or Ramin:match('^بازکردن (.*)$') or Ramin:match('^باز کردن (.*)$')
TDMatches = TDDelMatch or TDBanMatch or TDKickMatch or TDMuteMatch or TDSilentMatch or TDWarnMatch or  TDUnlockMatch
if TDMatches then
local returntd1 = TDMatches:match('^photo$') or TDMatches:match('^game$') or TDMatches:match('^video$')or TDMatches:match('^flood$') or TDMatches:match('^inline$') or TDMatches:match('^videomsg$') or TDMatches:match('^caption$') or TDMatches:match('^voice$') or TDMatches:match('^location$') or TDMatches:match('^document$') or TDMatches:match('^contact$') or TDMatches:match('^text$') or TDMatches:match('^sticker$') or TDMatches:match('^stickers$') or TDMatches:match('^gif$') or TDMatches:match('^music$') or TDMatches:match('^عکس$') or TDMatches:match('^بازی$') or TDMatches:match('^فیلم$') or TDMatches:match('^دکمه شیشه ای$') or TDMatches:match('^ویدیومسیج$') or TDMatches:match('^کپشن$') or TDMatches:match('^موقعیت مکانی$') or TDMatches:match('^ویس$') or TDMatches:match('^فایل$') or TDMatches:match('^مخاطب$') or TDMatches:match('^متن$') or TDMatches:match('^استیکر$') or TDMatches:match('^استیکر متحرک$') or TDMatches:match('^گیف$') or TDMatches:match('^اهنگ$') or TDMatches:match('^آهنگ$') or TDMatches:match('^spam$') or TDMatches:match('^هرزنامه$')or TDMatches:match('^پیام مکرر$') or TDMatches:match('^پست کانال$') or TDMatches:match('^channelpost$') or TDMatches:match('^بدافزار$') or TDMatches:match('^malware$')
local returntd2 = TDMatches:match('^link$') or TDMatches:match('^fosh$') or TDMatches:match('^emoji$') or TDMatches:match('^tag$') or TDMatches:match('^username$') or TDMatches:match('^english$') or TDMatches:match('^persian$') or TDMatches:match('^hyper$') or TDMatches:match('^mention$') or TDMatches:match('^هایپر$') or TDMatches:match('^weblink$') or TDMatches:match('^font$') or TDMatches:match('^وب$') or TDMatches:match('^فونت$')  or TDMatches:match('^فراخانی$') or TDMatches:match('^هشتگ$') or TDMatches:match('^یوزرنیم$') or TDMatches:match('^لینک$') or TDMatches:match('^فحش$') or TDMatches:match('^ایموجی$') or TDMatches:match('^فارسی$') or TDMatches:match('^انگلیسی$')
local returntdf = TDMatches:match('^forward$') or TDMatches:match('^fwd$') or TDMatches:match('^فوروارد$')
local returntdb = TDMatches:match('^bots$') or TDMatches:match('^ربات$')
local returntde = TDMatches:match('^edit$') or TDMatches:match('^ویرایش$')
local returnbio = TDMatches:match('^لینک بیو$') or TDMatches:match('^biolink$')
local returntrue = returntd1 or returntd2 or returntdf or returntde or returntdb or returnbio
local function tdlock(Guard)
if Guard:match('^photo$') or Guard:match('^عکس$') then
td = 'Photo'
tde = 'ρнσтσ'
tdf = 'عکس'
elseif Guard:match('^game$') or Guard:match('^بازی$') then
td = 'Game'
tde = 'gαмε'
tdf = 'بازی'
elseif Guard:match('^video$') or Guard:match('^فیلم$') then
td = 'Video'
tde = 'vιdεσ'
tdf = 'فیلم'
elseif Guard:match('^inline$') or Guard:match('^دکمه شیشه ای$') then
td = 'Inline'
tde = 'ιηℓιηε'
tdf = 'دکمه شیشه ای'
elseif Guard:match('^videomsg$') or Guard:match('^ویدیومسیج$') then
td = 'Videomsg'
tde = 'vιdεσмsg'
tdf = 'ویدیومسیج'
elseif Guard:match('^caption$') or Guard:match('^کپشن$') then
td = 'Caption'
tde = 'cαρтιση'
tdf = 'کپشن'
elseif Guard:match('^voice$') or Guard:match('^ویس$')  then
td = 'Voice'
tde = 'vσιcε'
tdf = 'ویس'
elseif Guard:match('^location$') or Guard:match('^موقعیت مکانی$') then
td = 'Location'
tde = 'ℓσcαтιση'
tdf = 'موقعیت مکانی'
elseif Guard:match('^document$') or Guard:match('^فایل$') then
td = 'Document'
tde = '∂σcυмεηт'
tdf = 'فایل'
elseif Guard:match('^contact$') or Guard:match('^مخاطب$') then
td = 'Contact'
tde = 'cσηтαcт'
tdf = 'مخاطب'
elseif Guard:match('^text$') or Guard:match('^متن$') then
td = 'Text'
tde = 'тεxт'
tdf = 'متن'
elseif Guard:match('^sticker$') or Guard:match('^استیکر$') then
td = 'Sticker'
tde = 'sтιcкεя'
tdf = 'استیکر'
elseif Guard:match('^stickers$') or Guard:match('^استیکر متحرک$') then
td = 'Stickers'
tde = 'sтιcкεяs'
tdf = 'استیکر متحرک'
elseif Guard:match('^gif$') or Guard:match('^گیف$') then
td = 'Gif'
tde = 'gιғ'
tdf = 'گیف'
elseif Guard:match('^music$') or Guard:match('^آهنگ$') or Guard:match('^اهنگ$') then
td = 'Music'
tde = 'мυsιc'
tdf = 'آهنگ'
elseif Guard:match('^flood$') or Guard:match('^پیام مکرر$')then
td = 'Flood'
tde = 'ғlood'
tdf = 'پیام مکرر'
elseif Guard:match('^spam$') or Guard:match('^هرزنامه$')then
td = 'Spam'
tde = 'ѕpaм'
tdf = 'هرزنامه'
elseif Guard:match('^link$') or Guard:match('^لینک$') then
td = 'Link'
tde = 'ℓιηк'
tdf = 'لینک'
elseif Guard:match('^fosh$') or Guard:match('^فحش$') then
td = 'Fosh'
tde = 'Fosh'
tdf = 'فحش'
elseif Guard:match('^emoji$') or Guard:match('^ایموجی$') then
td = 'Emoji'
tde = 'Emoji'
tdf = 'ایموجی'
elseif Guard:match('^tag$') or Guard:match('^هشتگ$') then
td = 'Tag'
tde = 'тαg'
tdf = 'هشتگ'
elseif Guard:match('^username$') or Guard:match('^یوزرنیم$') then
td = 'Username'
tde = 'υsεяηαмε'
tdf = 'یوزرنیم'
elseif Guard:match('^persian$') or Guard:match('^فارسی$') then
td = 'Persian'
tde = 'ρεяsιση'
tdf = 'فارسی'
elseif Guard:match('^english$') or Guard:match('^انگلیسی$') then
td = 'English'
tde = 'εηgℓιsн'
tdf = 'انگلیسی'
elseif Guard:match('^edit$') or Guard:match('^ویرایش$') then
td = 'Edit'
tde = 'ε∂ιт'
tdf = 'ویرایش'
elseif Guard:match('^forward$') or Guard:match('^fwd$') or Guard:match('^فوروارد$') then
td = 'Forward'
tde = 'ғσяωαя∂'
tdf = 'فوروارد'
elseif Guard:match('^bots$') or Guard:match('^ربات$') then
td = 'Bots'
tde = 'вσт'
tdf = 'ربات'
elseif Guard:match('^hyper$') or Guard:match('^هایپر$') then
td = 'Hyper'
tde = 'нypυrlιɴĸ'
tdf = 'هایپرلینک'
elseif Guard:match('^weblink$') or Guard:match('^وب$') then
td = 'Weblink'
tde = 'нypυrlιɴĸ'
tdf = 'وب'
elseif Guard:match('^font$') or Guard:match('^فونت$') then
td = 'Font'
tde = 'нypυrlιɴĸ'
tdf = 'فونت'
elseif Guard:match('^mention$') or Guard:match('^فراخانی$') then
td = 'Mention'
tde = 'мυηтιση'
tdf = 'فراخانی'
elseif Guard:match('^channelpost$') or Guard:match('^پست کانال$') then
td = 'Channelpost'
tde = 'cнαɴɴelpoѕт'
tdf = 'پست کانال'
elseif Guard:match('^malware$') or Guard:match('^بدافزار$') then
td = 'Malware'
tde = 'мαlwαre'
tdf = 'بدافزار'
elseif Guard:match('^biolink$') or Guard:match('^لینک بیو$') then
td = 'Biolink'
tde = 'вιolιɴĸ'
tdf = 'لینک بیو'
end
end



--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function locks_del(msg,en,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
nametd = '['..name..'](tg://user?id='..bd..')'
if lang then
--send(cht,msg.id,'• ∂σηε вү :'..nametd..'\n➣∂εℓεтε #'..tde..' нαs вεεη #εηαвℓε...!\n┅┅──┄┄═✺═┄┄──┅┅\nιғ '..en..' тнe #'..tde..',тнe мeѕѕαɢe wιll вe ∂εℓεтε','md')
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'🔐* حذف * #لینک بیو  *فعال شد*.','md')
else
send(cht,msg.id,'🔐 *قفل*  '..tdf..'  *فعال شد*.','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function locks_warn(msg,en,fa)
local max_warn = tonumber(base:get(TD_ID..'max_warn:'..cht) or 5)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if gp_type(cht) == "channel" then
nametd = '['..name..'](tg://user?id='..bd..')'
else
nametd = ''..name..''
end
if lang then
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'⚠️* اخطار * #لینک بیو  *فعال شد*','md')
else
send(cht,msg.id,'⚠️ *اخطار*  #'..tdf..'  *فعال شد*.','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function locks_Babak(msg,en,fa,bden,bdfa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if gp_type(cht) == "channel" then
nametd = '['..name..'](tg://user?id='..bd..')'
else
nametd = ''..name..''
end
if lang then
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'🚷 *'..fa..'* #'..tdf..' *فعال شد*','md')
else
send(cht,msg.id,'🚷 *'..fa..'* #'..tdf..' *فعال شد*','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function locks_ddel(msg,en,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if gp_type(cht) == "channel" then
nametd = '['..name..'](tg://user?id='..bd..')'
else
nametd = ''..name..''
end
if lang then
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'🔐* حذف * #لینک بیو  *غیرفعال شد*.','md')
else
send(cht,msg.id,'🔐 *حذف*  #'..tdf..'  *غیرفعال شد*. ','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function locks_dwarn(msg,en,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if gp_type(cht) == "channel" then
nametd = '['..name..'](tg://user?id='..bd..')'
else
nametd = ''..name..''
end
if lang then
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'⚠️* اخطار * #لینک بیو  *غیرفعال شد*','md')
else
send(cht,msg.id,'⚠️ *اخطار*  #'..tdf..'  *غیرفعال*','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function locks_Khan(msg,en,fa,bden,bdfa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if gp_type(cht) == "channel" then
nametd = '['..name..'](tg://user?id='..bd..')'
else
nametd = ''..name..''
end
if lang then
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'🔓 *'..fa..'* #'..tdf..' *غیرفعال شد*.','md')
else
send(cht,msg.id,'🔓 *'..fa..'* #'..tdf..' *غیرفعال شد*.','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
function unlocks(msg,en,fa)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if gp_type(cht) == "channel" then
nametd = '['..name..'](tg://user?id='..bd..')'
else
nametd = ''..name..''
end
if lang then
else
if tdf == 'لینک بیو' then
send(cht,msg.id,'🔓 *'..fa..'* #'..tdf..' *غیرفعال شد*.','md')
else
send(cht,msg.id,'🔓 *'..fa..'* #'..tdf..' *غیرفعال شد*.','md')
end
end
end
GetUser(bd,name)
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
if Ramin and (TDDelMatch) and is_JoinChannel(msg) then
tdlock(TDDelMatch)
if returntrue then
if tonumber(msg.reply_to_message_id) == 0 then
if base:sismember(TD_ID..'Gp:'..bdcht,'Del:'..td) then
if lang then
else
send(msg.chat_id,msg.id,'🔐 *قفل* #'..tdf..' *از قبل فعال می باشد*!','md')
end
else
typegpadd('Gp:','Del:'..td)
if returntd1 then
locks_del(msg,'ѕenт','ارسال')
end
if returntd2 then
locks_del(msg,'ѕenт','ارسال')
end
if returntdf then
locks_del(msg,'ѕenт','فرایند')
end
if returntde then
locks_del(msg,'υѕer','ویرایش پیام,پیام')
end
if returntdb then
locks_del(msg,'added','دعوت ربات,')
end
if returnbio then
locks_del(msg,'υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  قفل '..tdf..' را در گروه '..gp..' فعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
end
else
function mamad(Ramin,ALPHA)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(ALPHA.sender_user_id) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,ALPHA.sender_user_id) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشدشما نمیتوانید او را از ارسال "..tdf.." محدود کنید !*","md")
return false
elseif OwnUser(msg,ALPHA.sender_user_id) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد شما نمیتوانید او را از ارسال "..tdf.." محدود کنید !*","md")
return false
elseif NazemUser(msg,ALPHA.sender_user_id) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد شما نمیتوانید او را از ارسال "..tdf.." محدود کنید !*","md")
return false
elseif ModUser(msg,ALPHA.sender_user_id) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد شما نمیتوانید او را از ارسال "..tdf.." محدود کنید !*","md")
return false
elseif ModUserTest(msg,ALPHA.sender_user_id) then
send(chat,msg.id,"◈* کاربر  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد شما نمیتوانید او را از ارسال "..tdf.." محدود کنید !*","md")
return false
elseif VipUser(msg,ALPHA.sender_user_id) then
send(chat,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد شما نمیتوانید او را از ارسال "..tdf.." محدود کنید  !*","md")
else
if base:sismember(TD_ID..'Gp3:'..chat_id,ALPHA.sender_user_id..' حذف '..tdf) then
send(msg.chat_id,msg.id,'◈ *کاربر*  ['..name..'](tg://user?id='..ALPHA.sender_user_id..') \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *از قبل در لیست محدودی های ارسال*  *'..tdf..'*  *وجود داشت*!','md')
else
base:sadd(TD_ID..'Gp3:'..chat_id,ALPHA.sender_user_id..' حذف '..tdf)
send(msg.chat_id,msg.id,'◈ *کاربر*  ['..name..'](tg://user?id='..ALPHA.sender_user_id..') \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n از ارسال  *'..tdf..'*  در گروہ ممنوع شد و هم اکنون در صورت قفل نبودن *'..tdf..'* نیز *'..tdf..'* های ارسالی وی حذف خواهند شد!','md')
end
end
end
GetUser(ALPHA.sender_user_id,name)
end
getMessage(cht, tonumber(msg.reply_to_message_id),mamad)
end
end
end
----------------Warn----------------
if Ramin and (TDWarnMatch) and is_JoinChannel(msg) then
tdlock(TDWarnMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Warn:'..td) then
if lang then
else
send(msg.chat_id,msg.id,'⚠️ *اخطار* #'..tdf..' *از قبل فعال می باشد*!','md')
end
else
typegprem('Gp:','Kick:'..td)
typegprem('Gp:','Ban:'..td)
typegpadd('Gp:','Warn:'..td)
if returntd1 then
locks_warn(msg,'ѕenт','ارسال')
end
if returntd2 then
locks_warn(msg,'ѕenт','ارسال')
end
if returntdf then
locks_warn(msg,'ѕenт','ارسال')
end
if returntde then
locks_warn(msg,'υѕer','فرایند')
end
if returntdb then
locks_warn(msg,'added','دعوت')
end
if returnbio then
locks_warn(msg,'υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..' اخطار '..tdf..' را در گروه '..gp..' فعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
end
end
end
----------------Mute----------------
if Ramin and (TDMuteMatch) and is_JoinChannel(msg) then
tdlock(TDMuteMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Mute:'..td) then
if lang then
else
send(msg.chat_id,msg.id,'📵 *سکوت* #'..tdf..' *از قبل فعال می باشد*!','md')
end
else
typegprem('Gp:','Silent:'..td)
typegprem('Gp:','Kick:'..td)
typegprem('Gp:','Ban:'..td)
typegpadd('Gp:','Mute:'..td)
if returntd1 then
locks_Babak(msg,'мυтε','سکوت','ѕenт','ارسال')
end
if returntd2 then
locks_Babak(msg,'мυтε','سکوت','ѕenт','ارسال')
end
if returntdf then
locks_Babak(msg,'мυтε','سکوت','ѕenт','ارسال')
end
if returntde then
locks_Babak(msg,'мυтε','سکوت','υѕer','فرایند')
end
if returntdb then
locks_Babak(msg,'мυтε','سکوت','added','دعوت')
end
if returnbio then
locks_Babak(msg,'мυтε','سکوت','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  سکوت '..tdf..' را در گروه '..gp..' فعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
end
end
end
----------------Kick----------------
if Ramin and (TDKickMatch) and is_JoinChannel(msg) then
tdlock(TDKickMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Kick:'..td) then
if lang then
else
send(msg.chat_id,msg.id,'❌ *اخراج* #'..tdf..' *از قبل فعال می باشد*!','md')
end
else
typegprem('Gp:','Ban:'..td)
typegpadd('Gp:','Kick:'..td)
typegprem('Gp:','Warn:'..td)
typegprem('Gp:','Mute:'..td)
typegprem('Gp:','Silent:'..td)
if returntd1 then
locks_Babak(msg,'кιcк','اخراج','ѕenт','ارسال')
end
if returntd2 then
locks_Babak(msg,'кιcк','اخراج','ѕenт','ارسال')
end
if returntdf then
locks_Babak(msg,'кιcк','اخراج','ѕenт','ارسال')
end
if returntde then
locks_Babak(msg,'кιcк','اخراج','υѕer','فرایند')
end
if returntdb then
locks_Babak(msg,'кιcк','اخراج','added','دعوت')
end
if returnbio then
locks_Babak(msg,'кιcк','اخراج','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  اخراج '..tdf..' را در گروه '..gp..' فعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
end
end
end
----------------Ban----------------
if Ramin and (TDBanMatch) and is_JoinChannel(msg) then
tdlock(TDBanMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Ban:'..td) then
if lang then
else
send(msg.chat_id,msg.id,'🚫 *مسدود* #'..tdf..' *از قبل فعال می باشد*!','md')
end
else
typegpadd('Gp:','Ban:'..td)
typegprem('Gp:','Kick:'..td)
typegprem('Gp:','Warn:'..td)
typegprem('Gp:','Mute:'..td)
typegprem('Gp:','Silent:'..td)
if returntd1 then
locks_Babak(msg,'вαη','مسدود','ѕenт','ارسال')
end
if returntd2 then
locks_Babak(msg,'вαη','مسدود','ѕenт','ارسال')
end
if returntdf then
locks_Babak(msg,'вαη','مسدود','ѕenт','ارسال')
end
if returntde then
locks_Babak(msg,'вαη','مسدود','υѕer','فرایند')
end
if returntdb then
locks_Babak(msg,'вαη','مسدود','added','دعوت')
end
if returnbio then
locks_Babak(msg,'вαη','مسدود','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  مسدود '..tdf..' را در گروه '..gp..' فعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
end
end
end
----------------Silent----------------
if Ramin and (TDSilentMatch) and is_JoinChannel(msg) then
tdlock(TDSilentMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Silent:'..td) then
if lang then
else
send(msg.chat_id,msg.id,'🔇 *میوت* #'..tdf..' *از قبل فعال می باشد*!','md')
end
else
typegprem('Gp:','Ban:'..td)
typegprem('Gp:','Kick:'..td)
typegprem('Gp:','Mute:'..td)
typegpadd('Gp:','Silent:'..td)
if returntd1 then
locks_Babak(msg,'sιℓεηт','سایلنت','ѕenт','ارسال')
end
if returntd2 then
locks_Babak(msg,'sιℓεηт','سایلنت','ѕenт','ارسال')
end
if returntdf then
locks_Babak(msg,'sιℓεηт','سایلنت','ѕenт','ارسال')
end
if returntde then
locks_Babak(msg,'sιℓεηт','سایلنت','υѕer','فرایند')
end
if returntdb then
locks_Babak(msg,'sιℓεηт','سایلنت','added','دعوت')
end
if returnbio then
locks_Babak(msg,'sιℓεηт','سایلنت','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  سایلنت '..tdf..' را در گروه '..gp..' فعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
end
end
end
----------------Don't delelte----------------
if Ramin and (TDDdelMatch) and is_JoinChannel(msg) then
tdlock(TDDdelMatch)
if returntrue then
if tonumber(msg.reply_to_message_id) == 0 then
if base:sismember(TD_ID..'Gp:'..bdcht,'Del:'..td) then
typegprem('Gp:','Del:'..td)
if returntd1 then
locks_ddel(msg,'ѕenт','ارسال')
end
if returntd2 then
locks_ddel(msg,'ѕenт','ارسال')
end
if returntdf then
locks_ddel(msg,'ѕenт','فرایند')
end
if returntde then
locks_ddel(msg,'υѕer','ویرایش پیام,پیام')
end
if returntdb then
locks_ddel(msg,'added','دعوت ربات,')
end
if returnbio then
locks_ddel(msg,'υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  قفل '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'🔐 *حذف* #'..tdf..' *از قبل فعال می باشد*!','md')
end
end
else
function mamad(Ramin,ALPHA)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if base:sismember(TD_ID..'Gp3:'..chat_id,ALPHA.sender_user_id..'Del:'..td) then
base:srem(TD_ID..'Gp3:'..chat_id,ALPHA.sender_user_id..'Del:'..td)
sendM(msg.chat_id,ALPHA.sender_user_id,msg.id,'◈کاربر '..name..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• از محدودیت ارسال '..tdf..' رهایی یافت و هم اکنون در صورت قفل نبودن '..tdf..' میتواند در گروه '..tdf..' ارسال کند...!',10,utf8.len(name))
else
sendM(msg.chat_id,ALPHA.sender_user_id,msg.id,'◈کاربر '..name..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در لیست محدودی های ارسال '..tdf..' وجود نداشت...!',10,utf8.len(name))
end
end
GetUser(ALPHA.sender_user_id,name)
end
getMessage(cht, tonumber(msg.reply_to_message_id),mamad)
end
end
end
----------------Don't Warn----------------
if Ramin and (TDDwarnMatch)  and is_JoinChannel(msg) then
tdlock(TDDwarnMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Warn:'..td) then
typegprem('Gp:','Warn:'..td)
if returntd1 then
locks_dwarn(msg,'ѕenт','ارسال')
end
if returntd2 then
locks_dwarn(msg,'ѕenт','ارسال')
end
if returntdf then
locks_dwarn(msg,'ѕenт','ارسال')
end
if returntde then
locks_dwarn(msg,'υѕer','فرایند')
end
if returntdb then
locks_dwarn(msg,'added','دعوت')
end
if returnbio then
locks_dwarn(msg,'υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  اخطار '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'⚠️ *اخطار* #'..tdf..' *از قبل فعال می باشد*!','md')
end
end
end
end
----------------Don't Mute----------------
if Ramin and (TDDmuteMatch) and is_JoinChannel(msg) then
tdlock(TDDmuteMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Mute:'..td) then
typegprem('Gp:','Mute:'..td)
if returntd1 then
locks_Khan(msg,'мυтε','سکوت','ѕenт','ارسال')
end
if returntd2 then
locks_Khan(msg,'мυтε','سکوت','ѕenт','ارسال')
end
if returntdf then
locks_Khan(msg,'мυтε','سکوت','ѕenт','ارسال')
end
if returntde then
locks_Khan(msg,'мυтε','سکوت','υѕer','فرایند')
end
if returntdb then
locks_Khan(msg,'мυтε','سکوت','added','دعوت')
end
if returnbio then
locks_Khan(msg,'мυтε','سکوت','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  قفل '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'📵 *سکوت* #'..tdf..' *از قبل فعال می باشد*!','md')
end
end
end
end
----------------Don't Kick----------------
if Ramin and (TDDkickMatch) and is_JoinChannel(msg) then
tdlock(TDDkickMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Kick:'..td) then
typegprem('Gp:','Kick:'..td)
if returntd1 then
locks_Khan(msg,'кιcк','اخراج','ѕenт','ارسال')
end
if returntd2 then
locks_Khan(msg,'кιcк','اخراج','ѕenт','ارسال')
end
if returntdf then
locks_Khan(msg,'кιcк','اخراج','ѕenт','ارسال')
end
if returntde then
locks_Khan(msg,'кιcк','اخراج','υѕer','فرایند')
end
if returntdb then
locks_Khan(msg,'кιcк','اخراج','added','دعوت')
end
if returnbio then
locks_Khan(msg,'кιcк','اخراج','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  اخراج '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'❌ *اخراج* #'..tdf..' *از قبل فعال می باشد*!','md')

end
end
end
end
----------------Don't Ban----------------
if Ramin and (TDDbanMatch) and is_JoinChannel(msg) then
tdlock(TDDbanMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Ban:'..td) then
typegprem('Gp:','Ban:'..td)
if returntd1 then
locks_Khan(msg,'вαη','مسدود','ѕenт','ارسال')
end
if returntd2 then
locks_Khan(msg,'вαη','مسدود','ѕenт','ارسال')
end
if returntdf then
locks_Khan(msg,'вαη','مسدود','ѕenт','ارسال')
end
if returntde then
locks_Khan(msg,'вαη','مسدود','υѕer','فرایند')
end
if returntdb then
locks_Khan(msg,'вαη','مسدود','added','دعوت')
end
if returnbio then
locks_Khan(msg,'вαη','مسدود','υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  مسدود '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'🚫 *مسدود* #'..tdf..' *از قبل فعال می باشد*!','md')

end
end
end
end
----------------Don't Silent ----------------
if Ramin and (TDDsilentMatch) and is_JoinChannel(msg) then
tdlock(TDDsilentMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Silent:'..td) then
typegprem('Gp:','Silent:'..td)
if returntd1 then
locks_Khan(msg,'sιℓεηт','سایلنت','ѕenт','ارسال')
end
if returntd2 then
locks_Khan(msg,'sιℓεηт','سایلنت','ѕenт','ارسال')
end
if returntdf then
locks_Khan(msg,'sιℓεηт','سایلنت','ѕenт','ارسال')
end
if returntde then
locks_Khan(msg,'sιℓεηт','سایلنت','υѕer','فرایند')
end
if returntdb then
locks_Khan(msg,'sιℓεηт','سایلنت','added','دعوت')
end
if returnbio then
locks_Khan(msg,'sιℓεηт','سایلنت','υѕυя нαυe','داشتن')
end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  سایلنت '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'🔇 *میوت* #'..tdf..' *از قبل فعال می باشد*!','md')

end
end
end
----------------Unlock----------------
if Ramin and (TDUnlockMatch) and is_JoinChannel(msg) then
tdlock(TDUnlockMatch)
if returntrue then
if base:sismember(TD_ID..'Gp:'..bdcht,'Del:'..td..'') or base:sismember(TD_ID..'Gp:'..bdcht,'Warn:'..td..'') or base:sismember(TD_ID..'Gp:'..bdcht,'Ban:'..td..'') or base:sismember(TD_ID..'Gp:'..bdcht,'Mute:'..td..'') or base:sismember(TD_ID..'Gp:'..bdcht,'Kick:'..td..'') or base:sismember(TD_ID..'Gp:'..bdcht,'Silent:'..td..'') then
if is_supergroup(msg) then
base:srem(TD_ID..'Gp:'..cht,'Del:'..td)
base:srem(TD_ID..'Gp:'..cht,'Warn:'..td)
base:srem(TD_ID..'Gp:'..cht,'Kick:'..td)
base:srem(TD_ID..'Gp:'..cht,'Ban:'..td)
base:srem(TD_ID..'Gp:'..cht,'Mute:'..td)
base:srem(TD_ID..'Gp:'..cht,'Silent:'..td)
end
if gp_type(msg.chat_id) == "pv" then
for k,v in pairs(gps) do
base:srem(TD_ID..'Gp:'..v,'Del:'..td)
base:srem(TD_ID..'Gp:'..v,'Warn:'..td)
base:srem(TD_ID..'Gp:'..v,'Kick:'..td)
base:srem(TD_ID..'Gp:'..v,'Ban:'..td)
base:srem(TD_ID..'Gp:'..v,'Mute:'..td)
base:srem(TD_ID..'Gp:'..v,'Silent:'..td)
end
end
if returntd1 then
unlocks(msg,'ѕenт','ارسال')
end
if returntd2 then
unlocks(msg,'ѕenт','ارسال')
end
if returntdf then
unlocks(msg,'ѕenт','فرایند')
end
if returntde then
unlocks(msg,'υѕer','ویرایش')
end
if returntdb then
unlocks(msg,'added','دعوت')
end
if returnbio then
unlocks(msg,'υѕυя нαυe','داشتن')
end
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if reportpv then
if base:get(TD_ID..'Link:'..msg.chat_id) then
link = '('..base:get(TD_ID..'Link:'..msg.chat_id)..')'
else
link = 'لینک گروه شناسایی نشد !'
end
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..cht) or 'nil'
for k,v in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..cht..''},
},}
local namee = '<a href="tg://user?id='..bd..'"> '..name..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..'  قفل '..tdf..' را در گروه '..gp..' غیرفعال کرد.\n\n'..tarikh..'\n◈ مدیر عزیز شما میتوانید درپیوی ربات  جهت بازکردن قفل '..tdf..' دستور بازکردن '..tdf..' را ارسال کنید !'
send_inline(v,text,keyboard,'html')
end
end
end
end
GetUser(bd,name)
else
if lang then
else
send(msg.chat_id,msg.id,'🔓 #'..tdf..' *از قبل غیرفعال می باشد*!','md')
end
end
end
---
end
end
--------------------join-----------------
--------------------join-----------------
if Ramin == 'join off' or Ramin == 'جوین غیرفعال' and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp:'..bdcht,'Lock:Join') then
send(cht,msg.id,'◈*جوین کاربران غیرفعال بود*. ','md')
else
typegpadd('Gp:','Lock:Join')
send(cht,msg.id,'◈*جوین کاربران غیرفعال شد*.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n☝️ *هم اکنون کاربران قادر به عضویت در گروہ نمیباشند و در صورت عضویت از گروہ ریمو خواهند شد*.','md')
end
end
if Ramin == 'join on' or Ramin == 'جوین فعال' and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp:'..bdcht,'Lock:Join') then
typegprem('Gp:','Lock:Join')
send(cht,msg.id,'◈*جوین کاربران فعال شد*.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n☝️ *عضویت کاربران با لینک ازاد شد و کاربران میتوانند با لینک وارد گروہ شوند*.','md')
else
send(cht,msg.id,'◈جوین کاربران فعال بود.','md')
end
end
--------------------cmds-----------------
if Ramin == 'cmds off' or Ramin == 'دستورات غیرفعال' and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp:'..bdcht,'Lock:Cmd') then
send(cht,msg.id,'◈*دستورات ربات برای کاربران عادی غیرفعال بود*.','md')
else
typegpadd('Gp:','Lock:Cmd')
send(cht,msg.id,'◈*دستورات ربات برای کاربران عادی غیرفعال شد*.','md')
end
end
if Ramin == 'cmds on' or Ramin == 'دستورات فعال' and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp:'..bdcht,'Lock:Cmd') then
typegprem('Gp:','Lock:Cmd')
send(cht,msg.id,'◈*دستورات ربات برای کاربران عادی فعال شد.*','md')
else
send(cht,msg.id,'◈دستورات ربات برای کاربران عادی فعال بود.*','md')
end
end
--------------------tgservice-----------------
if Ramin == 'tgservice on'  or Ramin == 'قفل سرویس'  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp:'..bdcht,'Lock:TGservice') then
send(cht,msg.id,'◈ *قفل سرویس فعال می باشد*. ','md')
else
typegpadd('Gp:','Lock:TGservice')
send(cht,msg.id,'◈قفل سرویس فعال شد .','md')
end
end
if Ramin == 'tgservice off' or Ramin == 'بازکردن سرویس'  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp:'..bdcht,'Lock:TGservice') then
typegprem('Gp:','Lock:TGservice')
send(cht,msg.id,'◈*قفل سرویس غیرفعال شد*. ','md')
else
send(cht,msg.id,'◈*قفل سرویس غیرفعال بود*. ','md')
end
end
------set cmd------
if Ramin and (Ramin:match('^addcmd (.*)') or Ramin:match('^افزودن دستور (.*)')) and tonumber(msg.reply_to_message_id) > 0 then
local cmd = Ramin:match('^addcmd (.*)') or Ramin:match('^افزودن دستور (.*)')
function Saved(Ramin,ALPHA)
if ALPHA.content._ == 'messageText' then
typegpadd('CmDlist:',ALPHA.content.text)
typegphset('CmD:',ALPHA.content.text,cmd)
send(cht,msg.id,'◈ *از این پس دستور* *'..cmd..'* *را میتوانید با* *'..ALPHA.content.text..'* *نیز انجام دهید* ','md')
end
end
getMessage(cht, tonumber(msg.reply_to_message_id),Saved)
end
if Ramin and (Ramin:match('^delcmd (.*)') or Ramin:match('^حذف دستور (.*)')) then
local cmd = Ramin:match('^delcmd (.*)') or Ramin:match('^حذف دستور (.*)')
typegphdel('CmD:',cmd)
typegprem('CmDlist:',cmd)
send(cht,msg.id,'◈ *دستور* *'..cmd..'* *از لیست دستورات حذف شد*.','md')
end
if Ramin == 'clean cmdlist' or Ramin == 'پاکسازی لیست دستورات' then
typegpdel('CmD:')
typegpdel('CmDlist:')
send(cht,msg.id,'◈ *لیست تمامی دستورات اضافه شدہ از سیستم پاکسازی شد*.','md')
end
if Ramin == 'cmdlist' or Ramin == 'لیست دستورات' then
local CmDlist = base:smembers(TD_ID..'CmDlist:'..bdcht)
local t = 'لیست دستورات جدید ربات : \n'
for k,v in pairs(CmDlist) do
if is_supergroup(msg) then
mmdi = base:hget(TD_ID..'CmD:'..cht,v)
end
if gp_type(msg.chat_id) == "pv" then
for r,y in pairs(gps) do
mmdi = base:hget(TD_ID..'CmD:'..y,v)
end
end
t = t..k..") "..v.." > "..mmdi.."\n"
end
if #CmDlist == 0 then
t = '• هیچ دستوری درسیستم ثبت نشده است '
end
send(cht, msg.id,t,'md')
end
------text chats------
if Ramin and (Ramin:match('^setchat (.*)') or Ramin:match('^تنظیم چت (.*)')) and tonumber(msg.reply_to_message_id) > 0 then
local cmd = Ramin:match('^setchat (.*)') or Ramin:match('^تنظیم چت (.*)')
function Saved(Ramin,ALPHA)
if ALPHA.content._ == 'messageText' then
typegpadd('Textlist:',cmd)
typegphset('Text:',cmd,ALPHA.content.text)
send(cht,msg.id,'◈ *'..ALPHA.content.text..'* *تنظیم شد در جواب* :  *'..cmd..'*','md')
end
end
getMessage(cht, tonumber(msg.reply_to_message_id),Saved)
end
if Ramin == 'chatlist' or Ramin == 'لیست چت' then
local Textlist = base:smembers(TD_ID..'Textlist:'..bdcht)
local t = 'لیست چت : \n'
for k,v in pairs(Textlist) do
if is_supergroup(msg) then
mmdi = base:hget(TD_ID..'Text:'..cht,v)
end
if gp_type(msg.chat_id) == "pv" then
for r,y in pairs(gps) do
mmdi = base:hget(TD_ID..'Text:'..y,v)
end
end
t = t..k..") "..v.." > "..mmdi.."\n"
end
if #Textlist == 0 then
t = '◈ لیست تنظیم چت درسیستم ثبت نشده است.'
end
send(cht, msg.id,t,'md')
end
if Ramin and (Ramin:match('^delchat (.*)') or Ramin:match('^حذف چت (.*)')) then
local cmd = Ramin:match('^delchat (.*)') or Ramin:match('^حذف چت (.*)')
typegphdel('Text:',cmd)
typegprem('Textlist:',cmd)
send(cht,msg.id,'◈*'..cmd..'* \n*از لیست کلماتی که ربات به ان پاسخ میدهد حذف شد*','md')
end
if Ramin == 'clean chatlist' or Ramin == 'پاکسازی لیست چت' then
typegpdel('Textlist:')
typegpdel('Text:')
send(cht,msg.id,'◈لیست تمامی چت ها ازسیستم پاکسازی شد.','md')
end
-----stciker chat-----

if Ramin and (Ramin:match('^setgif (.*)') or Ramin:match('^تنظیم چت گیف (.*)')) and tonumber(msg.reply_to_message_id) > 0 then
local cmd = Ramin:match('^setgif (.*)') or Ramin:match('^تنظیم چت گیف (.*)')
function Saved(Ramin,ALPHA)
if ALPHA.content._ == 'messageAnimation' then
typegpadd('Gifslist:',cmd)
typegpset('Gifs:'..cmd,ALPHA.content.animation.animation.persistent_id)
send(cht,msg.id,'◈ *گیف* : *'..cmd..'* *ذخیره شد.*','md')
end
end
getMessage(cht, tonumber(msg.reply_to_message_id),Saved)
end

if Ramin == 'giflist' or  Ramin == 'لیست گیف' then
local Stickerslist = base:smembers(TD_ID..'Gifslist:'..bdcht)
local t = 'Gifs: \n'
for k,v in pairs(Stickerslist) do
t = t..k.." - "..v.."\n"
end
if #Stickerslist == 0 then
t = '◈ *لیست گیف ها خالی است* .'
end
send(cht, msg.id,t,'md')
end
if Ramin and (Ramin:match('^delgif (.*)') or Ramin:match('^حذف چت گیف (.*)'))  then
local cmd = Ramin:match('^delgif (.*)') or Ramin:match('^حذف چت گیف (.*)')
typegprem('Gifslist:',cmd)
typegpdel('Gifs:'..cmd)
send(cht,msg.id,' انجام شد\n>گیف: '..cmd..'\nاز لیست پاک شد!','md')
end
if Ramin == 'clean giflist' or Ramin == 'پاکسازی لیست گیف' then
typegpdel('Gifslist:')
send(cht,msg.id,'◈ *لیست گیف پاکسازی شد*. ','md')
end

if Ramin and (Ramin:match('^setsticker (.*)') or Ramin:match('^تنظیم چت استیکر (.*)')) and tonumber(msg.reply_to_message_id) > 0 then
local cmd = Ramin:match('^setsticker (.*)') or Ramin:match('^تنظیم چت استیکر (.*)')
function Saved(Ramin,ALPHA)
if ALPHA.content._ == 'messageSticker' then
typegpadd('Stickerslist:',cmd)
typegpset('Stickers:'..cmd,ALPHA.content.sticker.sticker.persistent_id)
send(cht,msg.id,'◈*استیکر* : *'..cmd..'* *ذخیرہ شد*. ','md')
end
end
getMessage(cht, tonumber(msg.reply_to_message_id),Saved)
end
if Ramin == 'stickerlist' or  Ramin == 'لیست استیکر' then
local Stickerslist = base:smembers(TD_ID..'Stickerslist:'..bdcht)
local t = 'Stickers: \n'
for k,v in pairs(Stickerslist) do
t = t..k.." - "..v.."\n"
end
if #Stickerslist == 0 then
t = '◈ *لیست استیکر ها خالی است.*  '
end
send(cht, msg.id,t,'md')
end
if Ramin and (Ramin:match('^delsticker (.*)') or Ramin:match('^حذف چت استیکر (.*)'))  then
local cmd = Ramin:match('^delsticker (.*)') or Ramin:match('^حذف چت استیکر (.*)')
typegprem('Stickerslist:',cmd)
typegpdel('Stickers:'..cmd)
send(cht,msg.id,'◈ *استیکر* : '..cmd..'\n*از لیست پاک شد*. ','md')
end
if Ramin == 'clean stickerlist' or Ramin == 'پاکسازی لیست استیکر' then
typegpdel('Stickerslist:')
send(cht,msg.id,'◈ *لیست استیکر پاکسازی شد*. ','md')
end
if Ramin == 'ban filter' or Ramin == 'مسدود فیلتر روشن' and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp:'..cht,'Ban:Filter')
send(cht, msg.id, '• مسدود فیلتر روشن شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• نکته: هرکاربری که ازکلمات فیلتر شدہ درگروہ ارسال کند از گروہ مسدود خواهد شد!','md')
end
if Ramin == 'dban filter' or Ramin == 'مسدود فیلتر خاموش' and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp:'..cht,'Ban:Filter')
send(cht, msg.id, '• مسدود فیلتر روشن شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n نکته: هرکاربری که از کلمات فیلتر شدہ در گروہ ارسال کند فقط کلمه حذف خواهد شد!','md')
end

if Ramin == 'ban filtersticker on' or Ramin == 'مسدود فیلتر استیکر روشن' and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp:'..cht,'Ban:FilterSticker')
send(cht, msg.id, '• مسدود فیلترینگ استیکر روشن شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• نکته: هرکاربری که ازاستیکرهای فیلتر شدہ درگروہ ارسال کند از گروہ مسدود خواهد شد!','md')
end
if Ramin == 'ban filtersticker off' or Ramin == 'مسدود فیلتر استیکر خاموش' and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp:'..cht,'Ban:FilterSticker')
send(cht, msg.id, '• مسدود فیلترینگ استیکر خاموش شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nنکته: هرکاربری که از استیکرهای فیلتر شدہ در گروہ ارسال کند فقط استیکر حذف خواهد شد!','md')
end
if Ramin == 'join filter on' or Ramin == 'جوین فیلتر فعال' and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp:'..cht,'Join:Filter')
send(cht, msg.id, '• جوین فیلتر کلمات شده فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• نکته: هرکاربری که از کلمات فیلتر شده استفاده کند باید عضو کانال گروه بشوند!','md')
end
if Ramin == 'join filter off' or Ramin == 'جوین فیلتر غیرفعال' and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp:'..cht,'Join:Filter')
send(cht, msg.id, '• جوین فیلتر کلمات شده غیرفعال شد.','md')
end

if Ramin == 'join filter on' or Ramin == 'جوین ایموجی فعال' and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp:'..cht,'Join:Emoji')
send(cht, msg.id, '• جوین ایموجی فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• نکته: هرکاربری که از ایموجی استفاده کند باید عضو کانال گروه بشوند!','md')
end
if Ramin == 'join filter off' or Ramin == 'جوین ایموجی غیرفعال' and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp:'..cht,'Join:Emoji')
send(cht, msg.id, '• جوین ایموجی غیرفعال شد.','md')
end


if Ramin == 'lock tabchi on' or Ramin == 'قفل تبچی فعال' and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..cht,'ScanAntiTabchi')
send(cht, msg.id, '• قفل تبچی فعال شد','md')
end
if Ramin == 'lock tabchi off' or Ramin == 'قفل تبچی غیرفعال' and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp2:'..cht,'ScanAntiTabchi')
send(cht, msg.id, '• قفل تبچی غیرفعال شد','md')
end


if Ramin == 'add filter on' or Ramin == 'اد فیلتر فعال' and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp:'..cht,'Add:Filter')
send(cht, msg.id, '• اداجباری فیلتر کلمات شده فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• نکته: هرکاربری که از کلمات فیلتر شده استفاده کند باید داخل گروه ممبر عضو کنند!','md')
end
if Ramin == 'add filter off' or Ramin == 'اد فیلتر غیرفعال' and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp:'..cht,'Add:Filter')
send(cht, msg.id, '• اداجباری فیلتر کلمات شده غیرفعال شد.','md')
end


if Ramin == 'botchat on' or Ramin == 'چت ربات روشن' and is_JoinChannel(msg) then
typegprem('Gp2:','BotChat')
send(cht,msg.id,'• چت ربات فعال شد!\n• شما میتوانید با دستور\nsetchat (text)\nبا ریپلی برروی جواب آن چت,ربات را سخن گوکنید\n\nبرای مثال setchat khobi\nرا با ریپلی بر روی پیام mrc وارد میکنیم از این پس ربات به khobi جواب mrc خواهد داد!','md')
end
if Ramin == 'botchat off' or Ramin == 'چت ربات خاموش' and is_JoinChannel(msg) then
typegpadd('Gp2:','BotChat')
send(cht,msg.id,'• چت ربات غیرفعال شد!','md')
end

end
end
-----End Pv Cmds-----
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') and is_supergroup(msg) then
if is_Owner(msg) or  is_Nazem(msg) then

if Ramin and (Ramin:match('^feedback') or Ramin:match('^پشتیبانی')) and is_JoinChannel(msg) then
local Pm = Ramin:match('^feedback') or Ramin:match('^پشتیبانی')
local function LinkGp(BlaCk,ALPHA)
local function setlinkgp(td,Ramin)
local function UserStats(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username
end
local link = base:get(TD_ID..'Link:'..msg.chat_id)
if not link and Ramin.invite_link == '' then
linkgp = 'عدم دسترسی به لینک گروه'
else
linkgp = Ramin.invite_link or link
end
send(Sudoid,0,'درخواست پشتیبانی از سوی ['..name..'](tg://user?id='..msg.sender_user_id..')\nدر گروه '..ALPHA.title..'\nلینک گروه : '..linkgp..'','md')
send(msg.chat_id,msg.id,'پیام با موفقیت ارسال شد...!\n\nلطفا منتظر پاسخ پشتیبانی بمانید...','html')
end
GetUser(msg.sender_user_id,UserStats)
end
getChannelFull(msg.chat_id,setlinkgp)
end
GetChat(msg.chat_id,LinkGp)
end



if Ramin == 'reset info' and is_Owner(msg) and is_Nazem(msg) and tonumber(msg.reply_to_message_id) == 0 then
base:del(TD_ID..'Total:KickUser:'..msg.chat_id..':'..msg.sender_user_id)
base:del(TD_ID..'Total:AddUser:'..msg.chat_id..':'..msg.sender_user_id)
base:del(TD_ID..'Total:BanUser:'..msg.chat_id..':'..msg.sender_user_id)
send(msg.chat_id,msg.id,'#انجام شد\nاطلاعات شما  بازنشانی شد...!','md')
end
if Ramin == 'reset info' and tonumber(msg.reply_to_message_id) ~= 0  and is_Owner(msg) then
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
function Gettpm(BlaCk, ALPHA)
local user = ALPHA.sender_user_id
if user then
base:del(TD_ID..'Total:KickUser:'..msg.chat_id..':'..user)
base:del(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user)
base:del(TD_ID..'Total:BanUser:'..msg.chat_id..':'..user)
base:del(TD_ID..'forceaddfor',user)
base:del(TD_ID..'addeduser'..msg.chat_id,user,added)
base:del(startwarn,msg.sender_user_id)
local function name(ramin,alpha)
send(msg.chat_id,msg.id,'#انجام شد\nاطلاعات کاربر : @'..check_markdown(alpha.username or '')..'\n'..ec_name(alpha.first_name)..'\n بازنشانی شد#...!','md')
end
GetUser(user,name)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Gettpm)
end




if Ramin == 'modtag' or Ramin == 'تگ مدیران' then
local list = base:smembers(TD_ID..'ModList:'..msg.chat_id)
if #list == 0 then
--send(msg.chat_id, msg.id, '◈ لیست مدیران گروه خالی میباشد.  ', 'md')
else
local txt = 'مدیران گروه اعلام حضور کنند :\n\n'
for k,v in pairs(list) do
local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
local day = base:get(TD_ID..'daymod:'..msg.chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
txt = ''..txt..' '..username..' | '
end
send(msg.chat_id, msg.id, txt, 'html')
end
end


if Ramin == 'modlist' or Ramin == 'لیست مدیران' then
local list = base:smembers(TD_ID..'ModList:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ لیست مدیران گروه خالی میباشد.  ', 'md')
else
local txt = 'لیست مدیران گروه :\n\n'
for k,v in pairs(list) do
local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
local day = base:get(TD_ID..'daymod:'..msg.chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
txt = ''..txt..'🄰 '..username..'<code>'..v..'</code>\n('..d..')\n\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end


if Ramin == 'modlisttest' or Ramin == 'لیست مدیران افتخاری' then
local list = base:smembers(TD_ID..'ModListtest:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ لیست مدیران افتخاری خالی می باشد.  ', 'md')
else
local txt = 'لیست مدیران افتخاری گروه :\n\n'
for k,v in pairs(list) do

local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..'<b>'..Alphafa(k)..'-</b> '..username..' \n🆔:<code>'..v..'</code>\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end
if Ramin == 'Active admins' or Ramin == 'فعالیت ادمین ها' or Ramin == 'آمار ادمین ها' then
local list = base:smembers(TD_ID..'ModList:'..msg.chat_id)
local stats = base:zrevrange(TD_ID..'bot:msgusr2:'..msg.chat_id..':', 0, 2, 'withscores')
if #list == 0 then
send(msg.chat_id, msg.id, '◈ هیچ ادمینی به مدیریت ربات ارتقا نیافته است ', 'md')
else 
local txt = 'فعالیت کلی مدیران تا الان :\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
for k,v in pairs(list) do
local Msg = base:get(TD_ID..'Total:messages:'..msg.chat_id..'') or 0
local Msgs = base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..v) or 0
local Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date('%Y/%m/%d')..':'..v or 00000000)) or 0

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

local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'کاربر'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..'<b>'..k..'-</b>'..username..'\nفعالیت امروز:<code>'..Msgsday..'|'..UsStatus..'</code>\nکل پیام:<code>'..Msgs..' پیام</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end
if Ramin == 'sendreports on' or Ramin == 'ارسال گزارشات ربات فعال' then
if reportpv then
send(msg.chat_id, msg.id, '*ارسال گزارشات ربات به پیوی مالکان قبلان فعال می باشد.*','md')
else
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'reportpv')
send(msg.chat_id, msg.id, '*ارسال گزارشات ربات به پیوی مالکان  فعال شد*.','md')
end
end
if Ramin == 'sendreports off' or Ramin == 'ارسال گزارش غیرفعال' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'reportpv')
send(msg.chat_id, msg.id, '*ارسال گزارشات ربات به پیوی مالکان غیرفعال شد*.','md')
end

--<><><><>Promote
if (Ramin == 'reloadstats' or Ramin == 'بازنگری امار') and is_JoinChannel(msg) then
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..msg.chat_id..v)
base:del(TD_ID..'AllUsers'..msg.chat_id)
base:del(TD_ID..'AllUsers'..msg.chat_id..v)
base:del(TD_ID..'Total:JoinedByLink:'..msg.chat_id)
base:del(TD_ID..'babak:Document:'..msg.chat_id)
base:del(TD_ID..'babak:Audio:'..msg.chat_id)
base:del(TD_ID..'babak:Voice:'..msg.chat_id)
base:del(TD_ID..'babak:Video:'..msg.chat_id)
base:del(TD_ID..'babak:Animation:'..msg.chat_id)
base:del(TD_ID..'babak:Photo:'..msg.chat_id)
base:del(TD_ID..'babak:VideoNote:'..msg.chat_id)
base:del(TD_ID..'babak:messages:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:messages:'..msg.chat_id)
base:del(TD_ID.."babak:users:"..msg.chat_id)
base:del(TD_ID..'babak:users:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:adds:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:adds:'..msg.chat_id)
base:del(TD_ID..'Total:JoinedByLink:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Document:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Audio:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Voice:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Video:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Animation:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Photo:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:VideoNote:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:JoinedByLink:'..msg.chat_id..'')
base:del(TD_ID..'Total:AddUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:BanUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:KickUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Sticker:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Animation:'..msg.chat_id..':'..v)
base:del(TD_ID..'babak:Sticker:'..msg.chat_id)
base:del(TD_ID..'babak:Animation:'..msg.chat_id)
base:del(TD_ID..'Total:messages:'..msg.chat_id)
end
base:del(TD_ID..'AllUsers'..msg.chat_id)
send(msg.chat_id,msg.id,'بازنگری آمار گروه با موفقیت انجام شد.','md')
end





if Ramin1 and (Ramin1:match('^lock pin$') or Ramin1:match('^قفل سنجاق$')) and is_JoinChannel(msg) then
base:set(TD_ID.."sg:pin"..msg.chat_id,"lock")
send(msg.chat_id,msg.id,'• قفل سنجاق فعال شد!','md')
end

if Ramin1 and (Ramin1:match('^unlock pin$') or Ramin1:match('^بازکردن سنجاق$')) and is_JoinChannel(msg) then
base:del(TD_ID.."sg:pin"..msg.chat_id)
send(msg.chat_id,msg.id,'• سنجاق کردن برای مدیران آزاد شد!','md')
end


if Ramin1 and (Ramin1:match('^lock permissions$') or Ramin1:match('^قفل مجوز$')) and is_JoinChannel(msg) then
base:set(TD_ID.."sg:permissions"..msg.chat_id,"lock")
send(msg.chat_id,msg.id,'• قفل مجوز ادمین ها فعال شد!','md')
end

if Ramin1 and (Ramin1:match('^unlock permissions$') or Ramin1:match('^بازکردن مجوز$')) and is_JoinChannel(msg) then
base:del(TD_ID.."sg:permissions"..msg.chat_id)
send(msg.chat_id,msg.id,'• قفل مجوز ادمین ها غیرفعال شد!','md')
end


-------------------------
if (Ramin == 'promotesticker' or Ramin == 'ارتقا ربات') and is_JoinChannel(msg) then
function PromoteByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if base:sismember(TD_ID..'ModLockOptionBot:'..msg.chat_id,user) then
send(chat,msg.id,"◈*ادمین*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *از قبل مجوز ارسال کردن لینک در گروه رو داشتید.*.","md")
else
base:sadd(TD_ID..'ModLockOptionBot:'..msg.chat_id,user)
send(chat,msg.id,"◈*ادمین عزیز*  ["..name.."](tg://user?id="..ALPHA.sender_user_id..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *مجوز ارسال کردن لینک توسط مالک داده شد.*.","md")
end
end
GetUser(user,name)
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id), PromoteByReply)
end
end

if (Ramin == 'demotesticker' or Ramin == 'عزل ربات' ) and is_JoinChannel(msg) then
function DemoteByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if not base:sismember(TD_ID..'ModLockOptionBot:'..msg.chat_id,user) then
send(chat,msg.id,"◈*ادمین عزیز*  ["..name.."](tg://user?id="..user..")\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *از قبل مجوز ارسال کردن لینک ممنوع شده است*.","md")
else
base:srem(TD_ID..'ModLockOptionBot:'..msg.chat_id,user)
send(chat,msg.id,"◈*ادمین عزیز*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *مجوز ارسال کردن لینک برشما ممنوع شد*.","md")
end
end
GetUser(user,name)
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DemoteByReply)
end
end





if Ramin and (Ramin:match('^تنظیم لقب (.*)$')) and tonumber(msg.reply_to_message_id) ~= 0  then
local rank = Ramin:match('^تنظیم لقب (.*)$')
local function SetRank_Rep(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
end
if SudUser(msg,user) then
send(chat,msg.id,"◈* کاربر سودو ربات می باشد دسترسی تنظیم لقب به این کاربر رو ندارید !*","md")
return false
end
if Setcust(chat_id, user, CustomTitle).error_code == 400 then
text = "◈ ربات توانایی انجام این کار را ندارد کاربر توسط ربات ادمین گروه نشده است!"
return false
end
base:set(TD_ID..'rank'..msg.chat_id..user,rank)
Setcust(msg.chat_id,user,rank)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,' ◈ *لقب ادمین گروه به* ['..rank..'](tg://user?id='..user..') *ثبت شد*.','md')
end
GetUser(user,name)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),SetRank_Rep)
end


if Ramin and (Ramin:match('^حذف لقب (.*)$')) and tonumber(msg.reply_to_message_id) ~= 0  then
local rank = Ramin:match('^حذف لقب (.*)$')
local function DelRank_Rep(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
end
if SudUser(msg,user) then
send(chat,msg.id,"◈* کاربر سودو ربات می باشد دسترسی حذف لقب به این کاربر رو ندارید !*","md")
return false
end
if Setcust(chat_id, user, CustomTitle).error_code == 400 then
text = "◈ ربات توانایی انجام این کار را ندارد کاربر توسط ربات ادمین گروه نشده است!"
return false
end
base:del(TD_ID..'rank'..msg.chat_id..user)
Remcust(msg.chat_id,user,rank)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,' ◈ *لقب ادمین گروه که* ['..rank..'](tg://user?id='..user..') *ثبت شده بود از سیستم حذف شد*.','md')
end
GetUser(user,name)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DelRank_Rep)
end


if ALPHAent and (Ramin:match('^تنظیم لقب (.*) (.*)')) or Ramin and (Ramin:match('^تنظیم لقب @(.*) (.*)') or Ramin:match('^تنظیم لقب (%d+) (.*)$')) and is_JoinChannel(msg) then
local BDSource,title = Ramin:match('^تنظیم لقب (.*) (.*)')
function BD_promote(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^تنظیم لقب @(.*) (.*)') then
Rami = ALPHA.id
elseif not ALPHAent and Ramin:match('^تنظیم لقب (%d+) (.*)') then
Rami = BDSource
elseif ALPHAent and Ramin:match('^تنظیم لقب (.*) (.*)') then
Rami = msg.content.entities[0].type.user_id
end
if Rami then
if tonumber(Rami) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
end
if SudUser(msg,Rami) then
send(chat,msg.id,"◈* کاربر سودو ربات می باشد دسترسی تنظیم لقب به این کاربر رو ندارید !*","md")
return false
end
if Setcust(chat_id, Rami, CustomTitle).error_code == 400 then
text = "◈ ربات توانایی انجام این کار را ندارد کاربر توسط ربات ادمین گروه نشده است!"
return false
end
Setcust(msg.chat_id,Rami,title)
send(msg.chat_id,msg.id,' ◈ *لقب ادمین گروه به* ['..title..'](tg://user?id='..Rami..')\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *ثبت شد*.','md')
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_promote)
end

if ALPHAent and (Ramin:match('^حذف لقب (.*) (.*)')) or Ramin and (Ramin:match('^حذف لقب @(.*) (.*)') or Ramin:match('^حذف لقب (%d+) (.*)$')) and is_JoinChannel(msg) then
local BDSource,title = Ramin:match('^حذف لقب (.*) (.*)')
function BD_promote(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^حذف لقب @(.*) (.*)') then
Rami = ALPHA.id
elseif not ALPHAent and Ramin:match('^حذف لقب (%d+) (.*)') then
Rami = BDSource
elseif ALPHAent and Ramin:match('^حذف لقب (.*) (.*)') then
Rami = msg.content.entities[0].type.user_id
end
if Rami then
if tonumber(Rami) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
end
if SudUser(msg,Rami) then
send(chat,msg.id,"◈* کاربر سودو ربات می باشد دسترسی حذف لقب به این کاربر رو ندارید !*","md")
return false
end
if Setcust(chat_id, Rami, CustomTitle).error_code == 400 then
text = "◈ ربات توانایی انجام این کار را ندارد کاربر توسط ربات ادمین گروه نشده است!"
return false
end
Remcust(msg.chat_id,Rami,title)
send(msg.chat_id,msg.id,' ◈ *لقب ادمین گروه که* ['..title..'](tg://user?id='..Rami..')\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *ثبت شده بود از سیستم حذف شد*.','md')
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_promote)
end



if Ramin and (Ramin:match('^ادمین$') or Ramin:match('^[Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn]$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
AddAdmin(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end

if Ramin and (Ramin:match('^ادمین (.*)$') or Ramin:match('^[Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
AddAdmin(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^ادمین @(.*)$') or Ramin:match('^[Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^ادمین @(.*)$') or Ramin:match('^[Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn] @(.*)$')
function modusername(extra,result,success)
if result.id then
AddAdmin(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end

if Ramin and (Ramin:match('^ادمین (%d+)$') or Ramin:match('^[Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
AddAdmin(msg, msg.chat_id, Ramin:match('^ادمین (%d+)$') or Ramin:match('^[Ss][Ee][Tt][Aa][Dd][Mm][Ii][Nn] (%d+)$'))
end

if Ramin and (Ramin:match('^حذف ادمین$')  or Ramin:match('^[Rr][Ee][Mm][Aa][Dd][Mm][Ii][Nn]$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
DelAdmin(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end

if Ramin and (Ramin:match('^حذف ادمین (.*)$') or Ramin:match('^[Rr][Ee][Mm][Aa][Dd][Mm][Ii][Nn] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
DelAdmin(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^حذف ادمین @(.*)$') or Ramin:match('^[Rr][Ee][Mm][Aa][Dd][Mm][Ii][Nn] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف ادمین @(.*)$') or Ramin:match('^[Rr][Ee][Mm][Aa][Dd][Mm][Ii][Nn] @(.*)$')
function remmodusername(extra,result,success)
if result.id then
DelAdmin(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end

if Ramin and (Ramin:match('^حذف ادمین (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Aa][Dd][Mm][Ii][Nn] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
DelAdmin(msg, msg.chat_id, Ramin:match('^حذف ادمین (%d+)$') or Ramin:match('^[Rr][Ee][Mm][Aa][Dd][Mm][Ii][Nn] (%d+)$'))
end






if Ramin and (Ramin:match('^ارتقا$') or Ramin:match('^promote$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
Setadmin(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end

if Ramin and (Ramin:match('^ارتقا (.*)$') or Ramin:match('^promote (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Setadmin(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^ارتقا @(.*)$') or Ramin:match('^promote @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^ارتقا @(.*)$') or Ramin:match('^promote @(.*)$')
function modusername(extra,result,success)
if result.id then
Setadmin(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end

if Ramin and (Ramin:match('^ارتقا (%d+)$') or Ramin:match('^promote (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Setadmin(msg, msg.chat_id, Ramin:match('^ارتقا (%d+)$') or Ramin:match('^promote (%d+)$'))
end

if Ramin and (Ramin:match('^عزل$')  or Ramin:match('^demote$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
Remadmin(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end

if Ramin and (Ramin:match('^عزل (.*)$') or Ramin:match('^demote (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Remadmin(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^عزل @(.*)$') or Ramin:match('^demote @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^عزل @(.*)$') or Ramin:match('^demote @(.*)$')
function remmodusername(extra,result,success)
if result.id then
Remadmin(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end

if Ramin and (Ramin:match('^عزل (%d+)$') or Ramin:match('^demote (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Remadmin(msg, msg.chat_id, Ramin:match('^عزل (%d+)$') or Ramin:match('^demote (%d+)$'))
end

if Ramin and (Ramin:match('^معاون$') or Ramin:match('^setnazem$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
SetNazem(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end
if Ramin and (Ramin:match('^معاون (.*)$') or Ramin:match('^setnazem (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
SetNazem(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^معاون @(.*)$') or Ramin:match('^setnazem @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^معاون @(.*)$') or Ramin:match('^setnazem @(.*)$')
function modusername(extra,result,success)
if result.id then
SetNazem(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end
if Ramin and (Ramin:match('^معاون (%d+)$') or Ramin:match('^setnazem (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
SetNazem(msg, msg.chat_id, Ramin:match('^معاون (%d+)$') or Ramin:match('^setnazem (%d+)$'))
end
if Ramin and (Ramin:match('^حذف معاون$')  or Ramin:match('^remnazem$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
RemNazem(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end
if Ramin and (Ramin:match('^حذف معاون (.*)$') or Ramin:match('^remnazem (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
RemNazem(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^حذف معاون @(.*)$') or Ramin:match('^remnazem @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف معاون @(.*)$') or Ramin:match('^remnazem @(.*)$')
function remmodusername(extra,result,success)
if result.id then
RemNazem(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end
if Ramin and (Ramin:match('^حذف معاون (%d+)$') or Ramin:match('^remnazem (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
RemNazem(msg, msg.chat_id, Ramin:match('^حذف معاون (%d+)$') or Ramin:match('^remnazem (%d+)$'))
end
--------------------------
if Ramin == 'NazemList' or Ramin == 'لیست معاون ها' and is_Owner(msg) then
local list = base:smembers(TD_ID..'NazemList:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ لیست معاون ها خالی می باشد.  ', 'md')
else
local txt = 'لیست معاون های گروه :\n\n'
for k,v in pairs(list) do
local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
local day = base:get(TD_ID..'daynazem:'..msg.chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
txt = ''..txt..'🄰 '..username..'<code>'..v..'</code>\n('..d..')\n\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end

if Ramin == 'clean NazemList' or Ramin  == 'پاکسازی لیست معاون ها'  and is_Owner(msg) then
base:del(TD_ID..'NazemList:'..msg.chat_id)
base:del(TD_ID..'daynazem:'..msg.chat_id)
send(msg.chat_id,msg.id,'◈ *لیست معاونین گروه پاکسازی شد.* ','md')
end

---
if Ramin == 'delcmd on' or Ramin == 'پاکسازی دستور فعال' then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'delcmd') then
send(msg.chat_id, msg.id, '◈*پاکسازی دستورات روشن شد*. ','md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'delcmd')
else
send(msg.chat_id, msg.id, '◈*پاکسازی دستورات از قبل روشن بود*. ','md')
end
end
if Ramin == 'delcmd off' or Ramin == 'پاکسازی دستور غیرفعال' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'delcmd') then
send(msg.chat_id, msg.id, '◈*پاکسازی دستورات خاموش شد*.','md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'delcmd')
else
send(msg.chat_id, msg.id, '◈*پاکسازی دستورات خاموش بود*.','md')
end
end

if is_Mod(msg) and is_ModClean(msg)  then
if Ramin == 'clean msg' or Ramin == 'پاکسازی کلی پیام ها'  then
send(msg.chat_id,msg.id, '◈ پاکسازی ربات درحال انجام لطفا  تا اتمام پاکسازی هیچ دستوری ارسال نشود!. ','md')
end
end

if Ramin == 'clean modlist' or Ramin == 'پاکسازی لیست مدیران'  then
base:del(TD_ID..'ModList:'..msg.chat_id)
base:del(TD_ID..'daymod:'..msg.chat_id)
send(msg.chat_id,msg.id, '◈ *پاکسازی لیست مدیران با موفقیت انجام شد *. ','md')
end
if Ramin == 'clean modlisttest' or Ramin == 'پاکسازی لیست مدیران افتخاری'  then
base:del(TD_ID..'ModListtest:'..msg.chat_id)
send(msg.chat_id,msg.id, '◈ *پاکسازی لیست مدیران افتخاری با موفقیت انجام شد *. ','md')
end



if Ramin == 'clean tabchi' or Ramin == 'پاکسازی تبچی ها' then
if not base:get(BotCliId..'Reloading:'..msg.chat_id) then
base:setex(BotCliId..'Reloading:'..msg.chat_id,300,true)
send(msg.chat_id,msg.id,'ربات درحال انجام عملیات شناسایی تبچی ها...\n\n ▎','md')
else
send(msg.chat_id,msg.id,'◈ این دستور به علت محدودیت تلگرام هر پنچ دقیقه یکبار قابل اجرا است!','md')
end
end





if Ramin == 'config' or Ramin == 'پیکربندی' and is_JoinChannel(msg) then
local function GetMod(BlaCk,ALPHA)
for k,v in pairs(ALPHA.members) do
function ByAddUser(BlaCk,ALPHA)
if ALPHA.type._ == "userTypeBot"  then
base:sadd(TD_ID..'ModList:'..msg.chat_id,v.user_id)
base:sadd(TD_ID..'ModList:'..msg.chat_id,1087968824)
end
end
GetUser(v.user_id,ByAddUser)
end
---send(msg.chat_id,msg.id,'◈ *تمامی ربات هایی که ادمین گروہ بودند به لیست مدیران ربات اضافه شدند* . ',"md")
end
getChannelMembers(msg.chat_id,'Administrators',0,200,GetMod)
end

if Ramin == 'configanonyadmin' or Ramin == 'پیکربندی ادمین ناشناس' and is_JoinChannel(msg) then
local function GetMod(BlaCk,ALPHA)
for k,v in pairs(ALPHA.members) do
function ByAddUser(BlaCk,ALPHA)
if ALPHA.type._ == "userTypeBot"  then
base:sadd(TD_ID..'ModList:'..msg.chat_id,v.user_id)
base:sadd(TD_ID..'ModAnony:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModCleanList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModBanList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModMuteList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModWarnList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModLockList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModpanelList:'..msg.chat_id,1087968824)
base:sadd(TD_ID..'ModVipList:'..msg.chat_id,1087968824)
end
end
GetUser(v.user_id,ByAddUser)
end
send(msg.chat_id,msg.id,'◈ *تمامی ادمین ناشناس ها به لیست مدیران ربات اضافه شدند* . ',"md")
end
getChannelMembers(msg.chat_id,'Administrators',0,200,GetMod)
end

end
if Ramin and (is_Owner(msg) or is_Nazem(msg) or (is_Mod(msg) or is_ModTest(msg)  and not (base:sismember(TD_ID..'LimitCmd:'..msg.chat_id,Ramin) or base:sismember(TD_ID..'LimitCmd:'..msg.chat_id,BaseCmd)))) then
if Ramin == 'lockedlist' or Ramin == 'لیست محدود شدگان قفلی'  then
local t = '*لیست محدود شدگان قفلی *:\n*برای رفع محدودیت هر کاربر بر روی متن جلوی >  کلیک کردہ و ان را ارسال کنید!*\n\n'
local Ramin = base:smembers(TD_ID..'Gp3:'..msg.chat_id)
for k,v in pairs(Ramin) do
local list = v:match('^(%d+)')
Name = base:get(TD_ID..'FirstName:'..list) or 'بدون نام'
t = t..k..'-㋛['..v..'](tg://user?id='..list..')\n['..Name..']\n»*رهایی '..v..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
end
if #Ramin == 0 then
t = '◈ *لیست محدود شدگان قفلی درسیستم خالی می باشد*. '
end
send(msg.chat_id,msg.id,t,'md')
end

if Ramin == 'clean lockedlist' or Ramin == 'پاکسازی محدود شدگان قفلی'  then
base:del(TD_ID..'Gp3:'..msg.chat_id)
send(msg.chat_id,msg.id,'◈ *لیست محدودشدگان پاکسازی شد*. ','md')
end
if Ramin and (Ramin:match('^رهایی (%d+) (.*) (.*)$'))  then
local user = Ramin:match('^رهایی (.*)$')
local id = user:match('(%d+)')
local mmad = string.gsub(user,id,'')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if base:sismember(TD_ID..'Gp3:'..msg.chat_id,user) then
base:srem(TD_ID..'Gp3:'..msg.chat_id,user)

send(msg.chat_id,msg.id,"• کاربر ["..name.."](tg://user?id="..id..") ≃ "..id.." از محدودیت *"..mmad.."* رهایی یافت!","md")
--sendM(msg.chat_id,id,msg.id,' کاربر '..name..' از محدودیت'..mmad..' رهایی یافت',8,utf8.len(name))
else
send(msg.chat_id,msg.id,'> عملیات ناموفق !','md')
end
end
GetUser(id,name)
end

if Ramin == 'filtersens off' or Ramin == 'حساسیت فیلتر غیرفعال' or Ramin == 'بازکردن فیلتر'  then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'FilterSen')
send(msg.chat_id,msg.id,'◈ *حساسیت کلمات فیلتر شدہ باز شد*. ','md')
end
if Ramin == 'filtersens on' or Ramin == 'حساسیت فیلتر فعال' or Ramin == 'قفل فیلتر' then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'FilterSen')
send(msg.chat_id,msg.id,'◈ *حساسیت کلمات فیلتر قفل شد*. ','md')
end
if Ramin == 'kickbotpm on' or Ramin == 'پیام مسدود ربات روشن'  then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'kickbotpm')
send(msg.chat_id,msg.id,'◈ اخطار ادکنندہ ربات فعال شد.','md')
end
if Ramin == 'kickbotpm off' or Ramin == 'پیام مسدود ربات خاموش' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'kickbotpm')
send(msg.chat_id,msg.id,'◈ اخطار ادکنندہ ربات غیرفعال شد. ','md')
end

if Ramin == 'msgcheckpm on' or Ramin == 'پیام مسیج چک روشن' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm')
send(msg.chat_id,msg.id,'◈ *پیام مسدود ربات #فعال شد و از این پس کسی ربات اد کند پیام #اخطار دادہ خواهد شد.* ','md')
end
if Ramin == 'msgcheckpm off' or Ramin == 'پیام مسیج چک خاموش' then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm')
send(msg.chat_id,msg.id,'◈ *پیام مسدود ربات #غیرفعال شد و از این پس پیام #اخطار ربات دادہ نخواهد شد* ','md')
end


if Ramin == 'unlock mode' or Ramin == 'تنظیمات کارخانه'  then
send(msg.chat_id,msg.id,'◈ *تمامی قفل های تنظیم شدہ درسیستم به حالت آزاد ثبت شد* ','md')
base:del(TD_ID..'Gp:'..msg.chat_id)
base:del(TD_ID.."sg:sticker"..chat_id)
base:del(TD_ID.."sg:link"..chat_id)
base:del(TD_ID.."sg:gif"..chat_id)
base:del(TD_ID.."sg:edit"..chat_id)
base:del(TD_ID.."sg:file"..chat_id)
base:del(TD_ID.."sg:film"..chat_id)
base:del(TD_ID.."sg:photo"..chat_id)
base:del(TD_ID.."sg:fwd"..chat_id)
base:del(TD_ID.."sg:post"..chat_id)
base:del(TD_ID.."sg:stickers"..chat_id)
base:del(TD_ID.."sg:txt"..chat_id)
base:del(TD_ID.."sg:user"..chat_id)
base:del(TD_ID.."sg:inline"..chat_id)
base:del(TD_ID.."sg:loc"..chat_id)
base:del(TD_ID.."sg:biolink"..chat_id)
base:del(TD_ID.."sg:farsi"..chat_id)
base:del(TD_ID.."sg:english"..chat_id)
base:del(TD_ID.."sg:hyper"..chat_id)
base:del(TD_ID.."sg:mention"..chat_id)
base:del(TD_ID.."sg:voice"..chat_id)
base:del(TD_ID.."sg:music"..chat_id)
base:del(TD_ID.."sg:self"..chat_id)
base:del(TD_ID.."sg:caption"..chat_id)
base:del(TD_ID.."sg:game"..chat_id)
base:del(TD_ID.."sg:tag"..chat_id)
base:del(TD_ID.."sg:bot"..chat_id)
base:del(TD_ID.."sg:contact"..chat_id)
base:del(TD_ID.."sg:malware"..chat_id)
end

if Ramin == 'gid' or Ramin == 'ایدی گروه' then
send(msg.chat_id,msg.id,msg.chat_id,'md')
end
if Ramin == 'setgp' or Ramin == 'تنظیمات شخصی فعال' and is_Owner(msg) then
base:sadd(TD_ID..'gpuser:'..msg.sender_user_id,msg.chat_id)
send(msg.chat_id,msg.id,'◈ *گروہ با موفقیت درلیست ثبت شدہ های تنظیمی پیوی ثبت شد. مالک عزیز شما می توانید تنظیمات کلی ربات رو در پیوی ربات [دکمه مدیریت] انجام بدهید*.  ','md')
end




-- if Ramin == "menu" or Ramin == "پنل" or Ramin == "راهنما" or Ramin == "فهرست" then
-- base:sadd(TD_ID..'AntiPanel:'..msg.chat_id,msg.sender_user_id)
-- function BDClearPanel()
-- if base:sismember(TD_ID..'AntiPanel:'..msg.chat_id,msg.sender_user_id) then
-- local function Gaurd(ramin,g)
-- if g.username == '' then name = ec_name(g.first_name) else name = g.username end
-- base:set(TD_ID.."ToshMenuFormid"..msg.chat_id ,msg.sender_user_id)
-- local formidw = base:get(TD_ID.."ToshMenuFormid"..msg.chat_id)
-- local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(g.first_name)..'</a> '
-- local keyboard = {}
-- keyboard.inline_keyboard = {{
-- {text = '◈ نمایش دوباره پنل مدیریتی ',callback_data = 'Menu:'..chat_id..':'..formidw..''},
-- },}
-- t = "◈<b>کاربر</b>  "..username.." <b>پنل مدیریتی به صورت خودکار بسته شد!</b>\n\n♻️ جهت نمایش دوباره پنل مدیریتی دکمه نمایش دوباره پنل مدیریتی را لمس کنید! "
-- send_inline(msg.chat_id,t,keyboard,'html')
-- base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
-- deleteMessages(chat_id,{[0] = msg_id})
-- base:srem(TD_ID..'AntiPanel:'..msg.chat_id,msg.sender_user_id)
-- end
-- GetUser(msg.sender_user_id,Gaurd)
-- end
-- end
-- alarm(300,BDClearPanel) 
-- end


if Ramin == "expire" or Ramin == "اعتبار" then
local ex = base:ttl(TD_ID.."ExpireData:"..msg.chat_id)
if ex == 0 or ex == -2 then
Time_S = "[ بدون اعتبار ]"
elseif ex == -1 then 
Time_S = 'گروه به صورت نامحدود شارژ می‌باشد'
else
local Time_ = getTimeUptime(ex)



local txt = '◈ تاریخ اتمام شارژ :\n'..jdatee(' `#Y/#M/#D | #x`')..''
local tarikh ='◈ تاریخ امروز :\n'.. jdate('`#Y/#M/#D  | #x` ')..''
Time_S = "📆 اعتبار ربات در این گروہ : \n\n◈ [ " .. Time_ .. " ] \n\n"..tarikh.."\n "..txt..""
end
send(msg.chat_id,msg.id,Time_S,'md')
end
------------------

if (Ramin == "clean deleted" or Ramin == 'پاکسازی دیلیت اکانتی ها') and is_JoinChannel(msg) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
function list(BlaCk,ALPHA)
for k,v in pairs(ALPHA.members) do
local function Checkdeleted(BlaCk,ALPHA)
if ALPHA.type._ == "userTypeDeleted" then
KickUser(msg.chat_id,ALPHA.id)
end
end
GetUser(v.user_id,Checkdeleted)
end
send(msg.chat_id,msg.id,'◈*کاربران دلیت اکانت شدہ ها از گروہ حذف شد*. ','md')
end
tdbot_function ({_= "getChannelMembers",channel_id = getChatId(msg.chat_id).id,offset = 0,limit= 1000},list,nil)
else
send(msg.chat_id,msg.id,'◈*ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
------------------------
--------------

if Ramin1 and (Ramin1:match('^setabout (.*)') or  Ramin1:match('^تنظیم توضیحات (.*)')) then
bd = Ramin1:match('^setabout (.*)') or  Ramin1:match('^تنظیم توضیحات (.*)')
changeChatDescription(msg.chat_id, bd)
txtokchanged = " تغییر کرد"
changeChatDescriptiontxtok = "توضیحات گروه به "
base:set(TD_ID..'abcli:'..msg.chat_id,bd)
send(msg.chat_id,msg.id,changeChatDescriptiontxtok..bd..txtokchanged,'md')
end


if Ramin1 and (Ramin1:match('^[Ss]etdescription (.*)') or Ramin1:match('^تنظیم درباره (.*)')) then
local description = Ramin1:match('^تنظیم درباره (.*)') or Ramin1:match('^[Ss]etdescription (.*)')
changeDes(msg.chat_id,description)
local text = [[درباره گروه تغییر کرده به ]]..description
send(msg.chat_id,msg.id,text,'md')
end
if Ramin1 and (Ramin1:match('^[Ss]etname (.*)') or Ramin1:match('^تنظیم نام (.*)')) then
local Title = Ramin1:match('^[Ss]etname (.*)') or Ramin1:match('^تنظیم نام (.*)')
local function GetName(BlaCk, ALPHA)
local Hash = TD_ID..'StatsGpByName'..msg.chat_id
local ChatTitle = ALPHA.title
base:set(Hash,ChatTitle)
changeChatTitle(msg.chat_id,Title)
send(msg.chat_id, msg.id,'◈ <code>نام گروه تغییر کرد به<code> : <b>'..Title..'</b> ','html')
end
GetChat(msg.chat_id,GetName)
end
if Ramin and (Ramin:match('^pin (%d+)$') or Ramin:match('^سنجاق (%d+)$')) and is_ModPin(msg)  and is_JoinChannel(msg) then
local times = Ramin:match('^pin (%d+)$') or Ramin:match('^سنجاق (%d+)$')
time = times * 3600
timeer = time / 3600
base:setex(TD_ID..'PinTime'..msg.chat_id, time, true)
base:set(TD_ID..'PinMessage'..msg.chat_id, 'yes')
send(msg.chat_id,msg.reply_to_message_id,'◈ *ایــن پیام سنجاق شد به مدت زمان* *'..timeer..'* *ساعت* ','md')
Pin(msg.chat_id,msg.reply_to_message_id, 1)
end
if (Ramin == 'pin' or Ramin == 'سنجاق') and is_JoinChannel(msg) and is_ModPin(msg)  and tonumber(msg.reply_to_message_id) > 0 then
base:incr(TD_ID..'messagePinMessage:'..msg.chat_id..':'..msg.sender_user_id)
send(msg.chat_id,msg.reply_to_message_id,'◈*سنجاق شد* ','md')
Pin(msg.chat_id,msg.reply_to_message_id, 1)
end

if (Ramin == 'unpin' or Ramin == 'حذف سنجاق') and is_JoinChannel(msg) and is_ModPin(msg) then
send(msg.chat_id,msg.id,'◈ حذف سنجاق شد ','md')
Unpin(msg.chat_id)
end



if Ramin and (Ramin1:match('^lockgp (%d+) (%d+) (%d+)') or Ramin1:match('^قفل گروه (%d+) (%d+) (%d+)')) and is_JoinChannel(msg)  and is_ModLock(msg)  then
local CmdEn = {
string.match(Ramin1, "^(lockgp) (%d+) (%d+) (%d+)$")
}
local CmdFa = {
string.match(Ramin1, "^(قفل گروه) (%d+) (%d+) (%d+)$")
}
local Matches1 = CmdEn[2] or CmdFa[2]
local Matches2 = CmdEn[3] or CmdFa[3]
local Matches3 = CmdEn[4] or CmdFa[4]
local hour = string.gsub(Matches1, "h", "")
local num1 = tonumber(hour) * 3600
local minutes = string.gsub(Matches2, "m", "")
local num2 = tonumber(minutes) * 60
local second = string.gsub(Matches3, "s", "")
local num3 = tonumber(second)
local timelock = tonumber(num1 + num2 + num3)

H = ''..os.date('%H')..''
M = ''..os.date('%M')..''
S = ''..os.date('%S')..''

hor = Matches1 + H
minr = Matches2 + M
Se = Matches3 + S
base:setex(TD_ID..'MuteAlllimit:'..msg.chat_id, timelock, true)
send(msg.chat_id,msg.id,'◈ قفل گروہ فعال شد به مدت:\n\n⏰ : *'..Matches1..'* ساعت *'..Matches2..'* دقیقه *'..Matches3..'* ثانیه\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• الان ساعت *'..os.date('%H')..'*:*'..os.date('%M')..'*:*'..os.date('%S')..'*\n• گروہ شما در ساعت  : *'..hor..'*:*'..minr..'*:*'..Se..'* باز خواهد شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n📝 پیام کاربران تا اتمام زمان تعیین شدہ پاک خواهد شد.','md')
end
if Ramin and (Ramin:match('^lockmute (%d+)[hms]') or Ramin:match('^قفل گروه (%d+)[س]')) and is_JoinChannel(msg)  and is_ModLock(msg)  then
local num = Ramin:match('^lockmute (%d+)[hms]') or Ramin:match('^قفل گروه (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'MuteAlltime')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'MuteAlltime2')
base:set(TD_ID..'MuteAlltime:'..msg.chat_id,time)
base:set(TD_ID..'MuteAlltime2:'..msg.chat_id,time - 30)
local timecgms = tonumber(base:get(TD_ID..'MuteAlltime:'..chat_id)) or 20
local hash = TD_ID..'MuteAlllimit:'..msg.chat_id
base:setex(hash, tonumber(time), true)
send(msg.chat_id,msg.id,'◈ قفل گروہ فعال شد به مدت:\n⏰ : *'..th..'* '..t..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n📝 پیام کاربران تا اتمام زمان تعیین شدہ پاک خواهد شد.','md')
end

if Ramin == 'muteall' or Ramin == 'تعطیل کردن' or Ramin == 'قفل گروه' and is_ModLock(msg)    then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'automuteall') then
send(msg.chat_id,msg.id,'◈*تعطیلی خودکار فعال است برای تعطیل کردن گروہ ابتدا با دستور تعطیل کردن خودکار خاموش تعطیلی خودکار را غیرفعال کنید* ','md')
else
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Mute_All')
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,b in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..msg.chat_id..''},
},}
local namee = '<a href="tg://user?id='..msg.sender_user_id..'"> '..msg.sender_user_id..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..' دستور قفل گروه را در گروه '..gp..' ارسال کرد.\n\n'..tarikh..''
send_inline(b,text,keyboard,'html')
end
end
sendPhoto(msg.chat_id,msg.id,0,1,nil,'./Alpha/lockgp.jpg','◈ گروہ با موفقیت #قفل شد.🔐\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ ارسال هرگونه پیام و رسانه توسط ربات هوشمند پاک خواهد شد.❌',dl_cb, nil)
--send(msg.chat_id,msg.id,'◈ گروہ با موفقیت #قفل شد.🔐\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n◂ *ارسال هرگونه پیام و رسانه توسط ربات هوشمند پاک خواهد شد*.❌','md')
end
end


if Ramin == 'unmuteall' or Ramin == 'بازکردن' or Ramin == 'بازکردن گروه'  then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'autoon') then
send(msg.chat_id,msg.id,'⚠️ خطای دستوری\n\n• *کاربر عزیز قفل خودکار گروه فعال می باشد*\n*برای بازکردن گروہ ابتدا دستور*\n* قفل خودکار غیرفعال*\nرا ارسال کردہ وبعد دستور #بازکردن را بفرستید.','md')
else
base:del(TD_ID..'MuteAlllimit:'..msg.chat_id)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Mute_All')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'MuteAlltime')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'MuteAlltime2')
local mutes =  base:smembers(TD_ID..'Mutes:'..msg.chat_id)
for k,v in pairs(mutes) do
base:srem(TD_ID..'Mutes:'..msg.chat_id,v)
UnRes(msg.chat_id,v)
end
dofile('./Alpha/time.lua')
local irantime = os.date('%X', os.time()+2.5*60*60)
local shamsidate = os.date("%Y/%m/%d",os.time()+2.5*60*60)
local daysweek = os.date('%A',os.time()+2.5*60*60)
local monthiran = os.date('%B',os.time()+2.5*60*60)
local daysweek = daysweek:gsub("Saturday", " شنبه ")
local daysweek = daysweek:gsub("Sunday", " یکشنبه ")
local daysweek = daysweek:gsub("Monday", " دوشنبه")
local daysweek = daysweek:gsub("Tuesday", " سه شنبه ")
local daysweek = daysweek:gsub("Wednesday", " چهارشنبه ")
local daysweek = daysweek:gsub("Thursday", " پنچ شنبه ")
local daysweek = daysweek:gsub(" Friday", " جمعه ")
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,b in pairs(ownerslist) do
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ ارسال گزارش تنظیم قفل کردن◈',callback_data = 'ERROR:'..msg.chat_id..''},
},}
local namee = '<a href="tg://user?id='..msg.sender_user_id..'"> '..msg.sender_user_id..'</a> '
text = '◈ ارسال گزارش تنظیم قفل کردن\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر '..namee..' دستور بازکردن گروه را در گروه '..gp..' ارسال کرد.\n\n'..tarikh..''
send_inline(b,text,keyboard,'html')
end
end
sendPhoto(msg.chat_id,msg.id,0,1,nil,'./Alpha/unlockgp.jpg','◈ گروہ با موفقیت #باز شد.🔓\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ ارسال پیام و رسانه در گروہ آزاد شد و کاربران میتوانند به فعالیت خود ادامه دهند.',dl_cb, nil)

--send(msg.chat_id,msg.id,'◈ گروہ با موفقیت #باز شد.🔓\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n◂ *ارسال پیام و رسانه در گروہ آزاد شد و کاربران میتوانند به فعالیت خود ادامه دهند*.','md')
end
else
send(msg.chat_id,msg.id,'◈*ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end


if Ramin and (Ramin:match('^setpin (.*)') or Ramin:match('^تنظیم سنجاق (.*)'))  then
local Matches = Ramin:match('^setpin (.*)') or Ramin:match('^تنظیم سنجاق (.*)')
tdbot.sendMessage(msg.chat_id, msg.id, 1,'پیام سنجاق خودکار تنظیم شد', 1, 'md')
base:set(TD_ID.."MsgPin"..msg.chat_id, Matches)
end

if Ramin and (Ramin:match('^(pin) (%d+):(%d+)-(%d+):(%d+)$') or Ramin:match('^(سنجاق) (%d+):(%d+)-(%d+):(%d+)$'))  then
local CmdEn = {
string.match(Ramin, "^(pin) (%d+):(%d+)-(%d+):(%d+)$")
}
local CmdFa = {
string.match(Ramin, "^(سنجاق) (%d+):(%d+)-(%d+):(%d+)$")
}
local Matches2 = CmdEn[2] or CmdFa[2]
local Matches3 = CmdEn[3] or CmdFa[3]
local Matches4 = CmdEn[4] or CmdFa[4]
local Matches5 = CmdEn[5] or CmdFa[5]
local End = Matches4..":"..Matches5
local Start = Matches2..":"..Matches3
if not base:get(TD_ID.."MsgPin"..msg.chat_id) then
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• هیچ پیامی جهت سنجاق کردن به صورت خودکار تنظیم نشده است!\n» *تنظیم سنجاق متن*', 1, 'md')
elseif End == Start then
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• زمان تنظیم شده شما اشتباه می باشد!', 1, 'md')
else
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• زمان سنجاق خودکار تنظیم شده به : \n*'..Start..'* الی *'..End..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nبه صورت اتوماتیک سنجاق تنظیم شده در گروه انجام خواهد شد!', 1, 'md')
base:set(TD_ID.."Autopin1"..msg.chat_id,Start)
base:set(TD_ID.."Autopin2"..msg.chat_id,End)
end
end


if (Ramin == 'lockauto on' or Ramin == 'قفل خودکار فعال')  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'autoon')  then
send(msg.chat_id,msg.id,'• قفل خودکار فعال شد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ زمان استارت : '..base:get(TD_ID.."atolct1"..msg.chat_id)..' الی '..base:get(TD_ID.."atolct2"..msg.chat_id)..' ','md')
else
send(msg.chat_id,msg.id,'• زمان قفل خودکار در سیستم ربات تنظیم نشده است!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ برای تنظیم کردن زمان از دستور زیر استفاده کنید :\n » قفل خودکار [زمان استارت-زمان اتمام] ','md')
end
end
if (Ramin == 'lockauto off' or Ramin == 'قفل خودکار غیرفعال')  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'autoon')  then
base:del(TD_ID.."atolct1"..msg.chat_id)
base:del(TD_ID.."atolct2"..msg.chat_id)
base:del(TD_ID.."lc_ato:"..msg.chat_id)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'autoon')
send(msg.chat_id,msg.id,'◈قفل خودکار کلی گروه غیرفعال شد.','md')
else
send(msg.chat_id,msg.id,'◈قفل خودکار کلی گروه غیرفعال می باشد!','md')
end
end
if Ramin1 and (Ramin1:match('^([Mm]uteall) (.*)$') or Ramin1:match('^(حالت قفل خودکار) (.*)$')) and is_JoinChannel(msg) then
local Ramin1 = Ramin1:gsub("حالت قفل خودکار", "muteall")
local status = {string.match(Ramin1, "^([Mm]uteall) (.*)$")}
if status[2] == 'mute' or status[2] == 'محدود' then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Tele_Mute')
send(msg.chat_id,msg.id,' ◈*تعطیل کردن گروہ در حالت محدود سازی قرار گرفت*. ','md')
end
if status[2] == 'del' or status[2] == 'حذف' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Tele_Mute')
send(msg.chat_id,msg.id,' ◈ *تعطیل کردن گروہ در حالت حذف پیام کاربر قرار گرفت*','md')
end
end

if Ramin and (Ramin:match('^(lock auto) (%d+):(%d+)-(%d+):(%d+)$') or Ramin:match('^(قفل خودکار) (%d+):(%d+)-(%d+):(%d+)$'))  then
local CmdEn = {
string.match(Ramin, "^(lock auto) (%d+):(%d+)-(%d+):(%d+)$")
}
local CmdFa = {
string.match(Ramin, "^(قفل خودکار) (%d+):(%d+)-(%d+):(%d+)$")
}
local Matches2 = CmdEn[2] or CmdFa[2]
local Matches3 = CmdEn[3] or CmdFa[3]
local Matches4 = CmdEn[4] or CmdFa[4]
local Matches5 = CmdEn[5] or CmdFa[5]
local End = Matches4..":"..Matches5
local Start = Matches2..":"..Matches3
if End == Start then
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• زمان تنظیم شده شما اشتباه می باشد!', 1, 'md')
else
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• زمان قفل خودکار گروه تنظیم شده به : \n*'..Start..'* الی *'..End..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nبه صورت اتوماتیک قفل خودکار تنظیم شده در گروه انجام خواهد شد! ', 1, 'md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'autoon')
base:set(TD_ID.."atolct1"..msg.chat_id,Start)
base:set(TD_ID.."atolct2"..msg.chat_id,End)
end
end


if (Ramin == 'lockauto' or Ramin == 'قفل خودکار')  and is_JoinChannel(msg) then
local s = base:get(TD_ID.."atolct1"..msg.chat_id)
local t = base:get(TD_ID.."atolct2"..msg.chat_id)
if not s and not t then
base:setex(TD_ID.."bot:SetMuteall:start" .. msg.chat_id .. ":" .. msg.sender_user_id, 60, true)
base:del(TD_ID.."bot:SetMuteall:stop" .. msg.chat_id .. ":" .. msg.sender_user_id)
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• لطفا زمان شروع قفل خودکار را ارسال نمایید ! \n • الان ساعت *'..os.date('%H')..'*:*'..os.date('%M')..'*:*'..os.date('%S')..'*', 1, 'md')
elseif not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'autoon') then
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• قفل خودکار فعال شد !\nبرای تنظیم مجدد زمان ، دستور Settime را ارسال نمایید !', 1, 'md')
base:set(TD_ID.."bot:duplipost:mute" .. msg.chat_id, true)
else

local start = base:get(TD_ID.."atolct1"..msg.chat_id)
local stop = base:get(TD_ID.."atolct2"..msg.chat_id)
if start and stop then
if base:get(TD_ID.."bot:muteall:Run" .. msg.chat_id) then
AutolockFa = "قفل خودکار  روشن می باشد : " .. start .. "\n• پایان : " .. stop
else
AutolockFa = "قفل خودکار در انتظار ساعت شروع : " .. start .. "\n• پایان : " .. stop
end
else
AutolockFa = "تنظیم نشده"
end


tdbot.sendMessage(msg.chat_id, msg.id, 1, '• قفل خودکار از قبل فعال است !\n'..AutolockFa..'\nبرای تنظیم مجدد زمان ، دستور Settime را ارسال نمایید !', 1, 'md')
end
end

if base:get(TD_ID.."bot:SetMuteall:start" .. msg.chat_id .. ":" .. msg.sender_user_id) and Ramin:match("^%d+:%d+$") then
local ap = {
string.match(Ramin, "^(%d+:)(%d+)$")
}
local h = Ramin:match("%d+:")
h = h:gsub(":", "")
local m = Ramin:match(":%d+")
m = m:gsub(":", "")
local h_ = 23
local m_ = 59
if h_ >= tonumber(h) and m_ >= tonumber(m) then
local TimeStart = Ramin:match("^%d+:%d+")
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• لطفا زمان پایان قفل خودکار را ارسال نمایید !', 1, 'md')
base:del(TD_ID.."bot:SetMuteall:start" .. msg.chat_id .. ":" .. msg.sender_user_id)
base:set(TD_ID.."atolct1" .. msg.chat_id, TimeStart)
base:setex(TD_ID.."bot:SetMuteall:stop" .. msg.chat_id .. ":" .. msg.sender_user_id, 60, true)
else
tdbot.sendMessage(msg.chat_id, msg.id, 1, '• زمان ارسال شده صحیح نمیباشد !', 1, 'md')
end
end

if base:get(TD_ID.."bot:SetMuteall:stop" .. msg.chat_id .. ":" .. msg.sender_user_id) then
local t = base:get(TD_ID.."atolct1" .. msg.chat_id)
if Ramin:match("^%d+:%d+") and not Ramin:match(t) then
local ap = {
string.match(Ramin, "^(%d+):(%d+)$")
}
local h = Ramin:match("%d+:")
h = h:gsub(":", "")
local m = Ramin:match(":%d+")
m = m:gsub(":", "")
local h_ = 23
local m_ = 59
if h_ >= tonumber(h) and m_ >= tonumber(m) then
local TimeStop = Ramin:match("^%d+:%d+")
base:del(TD_ID.."bot:SetMuteall:stop" .. msg.chat_id .. ":" .. msg.sender_user_id)
base:set(TD_ID.."atolct2" .. msg.chat_id, TimeStop)
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'autoon')
local start = base:get(TD_ID.."atolct1"..msg.chat_id)
local stop = base:get(TD_ID.."atolct2"..msg.chat_id)
tdbot.sendMessage(msg.chat_id, msg.id, 1, "• قفل خودکار هر روز در ساعت " .. start .. " فعال و در ساعت " .. stop .. " غیرفعال خواهد شد !", 1, 'md')
base:del(TD_ID.."bot:muteall:start_Unix" .. msg.chat_id)
base:del(TD_ID.."bot:muteall:stop_Unix" .. msg.chat_id)
else
tdbot.sendMessage(msg.chat_id, msg.id, 1, "• زمان ارسال شده صحیح نمیباشد !", 1, 'md')
end
end
end


if (Ramin == 'Settime' or Ramin == 'تنظیم زمان')  and is_JoinChannel(msg) then
base:setex(TD_ID.."bot:SetMuteall:start" .. msg.chat_id .. ":" .. msg.sender_user_id, 60, true)
base:del(TD_ID.."bot:SetMuteall:stop" .. msg.chat_id .. ":" .. msg.sender_user_id)
tdbot.sendMessage(msg.chat_id, msg.id, 1, "• لطفا زمان شروع قفل خودکار را ارسال نمایید ! \nبه طور مثال :\n14:38", 1, 'md')
end



if Ramin and (Ramin:match('^autoclener (%d+):(%d+)') or Ramin:match('^پاکسازی (%d+):(%d+)')) then
local CmdEn = {
string.match(Ramin, "^(autoclener) (%d+):(%d+)$")
}
local CmdFa = {
string.match(Ramin, "^(پاکسازی) (%d+):(%d+)$")
}
local Matches2 = CmdEn[2] or CmdFa[2]
local Matches3 = CmdEn[3] or CmdFa[3]
local Start = Matches2..":"..Matches3
local End = Matches2..":"..Matches3 + 1
base:set(TD_ID.."DelaUtO"..msg.chat_id,Start)
base:set(TD_ID.."DelaUtO2"..msg.chat_id,End)
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'autoclener')
tdbot.sendMessage(msg.chat_id , msg.id, 1, "◈پاکسازی خودکار پیام گروه فعال شد!\nپاکسازی خودکار پیام ها هر روز در ساعت "..Start.." به صورت کامل پاکسازی خواهد شد!\n━┄┅┄┅┄┅┄┅┄┅┄┅┄━\nبرای غیرفعال کردن پاکسازی خودکار پیام از دستور زیر استفاده نمایید :\n• *پاکسازی خودکار پیام غیرفعال*", 0, 'md')
end


if (Ramin == 'autoclener on' or Ramin == 'پاکسازی خودکار پیام فعال')  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'autoclener')  then
send(msg.chat_id,msg.id,'• پاکسازی خودکار پیام ها فعال شد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ زمان استارت : '..base:get(TD_ID.."DelaUtO"..msg.chat_id)..'','md')
else
send(msg.chat_id,msg.id,'• زمان پاکسازی خودکار پیام ها تنظیم نشده است!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ برای تنظیم کردن زمان از دستور زیر استفاده کنید :\n مثال : \nپاکسازی خودکار پیام 23:00 ','md')
end
end

if (Ramin == 'autoclener off' or Ramin == 'پاکسازی خودکار پیام غیرفعال')  then
base:del(TD_ID.."DelaUtO"..msg.chat_id)
base:del(TD_ID.."DelaUtO2"..msg.chat_id)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'autoclener')
tdbot.sendMessage(msg.chat_id , msg.id, 1, "◈پاکسازی خودکار پیام گروه غیرفعال شد!", 0, 'md')
end


if Ramin and Ramin:match("^filterstickerpack$") or Ramin:match("^فیلتر پک استیکر$") and tonumber(msg.reply_to_message_id) > 0 then
function filter_packs(extra, result)
stickers_id = result.content.sticker.set_id
if base:sismember(TD_ID.."filterpack"..msg.chat_id,stickers_id) then
send(msg.chat_id, msg.id,"• پک استیکر در لیست فیلتر ها می باشد❗️" ,"html")
else
base:sadd(TD_ID.."filterpack"..msg.chat_id,stickers_id)
send(msg.chat_id, msg.id,"• پک استیکر در لیست فیلتر ها قرار گرفت وازاین به بعد استیکری با مشخصات این درگروہ حذف خواهد شد." ,"html")
end
function filter_pack(extra, result)
local stickers_name = result.name
if not base:sismember(TD_ID.."filterpackname"..msg.chat_id,stickers_name) then
base:sadd(TD_ID.."filterpackname"..msg.chat_id,stickers_name)
end
end
getStickerSet(stickers_id, filter_pack)
end
getMessage(msg.chat_id, msg.reply_to_message_id, filter_packs)
end

if Ramin and Ramin:match("^remfilterstickerpack$") or Ramin:match("^حذف پک استیکر$") and tonumber(msg.reply_to_message_id) > 0 then
function filter_packs(extra, result)
stickers_id = result.content.sticker.set_id
if not base:sismember(TD_ID.."filterpack"..msg.chat_id,stickers_id) then
send(msg.chat_id, msg.id,"• پک استیکر در لیست فیلتر ها نمی باشد!" ,"html")
else
base:srem(TD_ID.."filterpack"..msg.chat_id,stickers_id)
send(msg.chat_id, msg.id,"• پک استیکر ازلیست قفل شدہ ها حذف شد." ,"html")
end
function filter_pack(extra, result)
local stickers_name = result.name
if base:sismember(TD_ID.."filterpackname"..msg.chat_id,stickers_name) then
base:srem(TD_ID.."filterpackname"..msg.chat_id,stickers_name)
end
end
getStickerSet(stickers_id, filter_pack)
end
getMessage(msg.chat_id, msg.reply_to_message_id, filter_packs)
end

if Ramin and Ramin:match("^لیست استیکر فیلتر$") then
local packlist = base:smembers(TD_ID.."filterpackname"..msg.chat_id)
text = "لیست استیکرهای قفل شده:\n"
for k,v in pairs(packlist) do
text = text..k.." - t.me/addstickers/"..v.." \n"
end
if #packlist == 0 then
text = "• لیست استیکر ها خالی می باشد!"
end
send(msg.chat_id, msg.id,text,"html")
end

if (Ramin == 'clean banlist' or Ramin == 'پاکسازی لیست مسدود') and is_JoinChannel(msg) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
local function Clean(BlaCk,ALPHA)
for k,v in pairs(ALPHA.members) do
base:del(TD_ID..'BanUser:'..msg.chat_id)
UnRes(msg.chat_id,v.user_id)
end
end
send(msg.chat_id,msg.id,' ◈*تمام کاربران محروم شدہ از لیست مسدود حذف شدند*','md')
getChannelMembers(msg.chat_id,"Banned",0, 100000000000,Clean)
else
send(msg.chat_id,msg.id,' ◈*ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end)
end
if Ramin == 'clean mutelist' or Ramin == 'پاکسازی لیست سکوت' then
local function GetRestricted(arg, data)
msg=arg.msg
local i = 1
local un = ''
if data.total_count > 0 then
i = 1
k = 0
local function getuser(arg, mdata)
local ST = data.members[k].status
if ST.can_add_web_page_previews == false and ST.can_send_media_messages == false and ST.can_send_messages == false and ST.can_send_other_messages == false and ST.is_member == true then
unsilent_user(msg.chat_id, data.members[k].user_id)
i = i + 1
end
k = k + 1
if k < data.total_count then
tdbot.getUser(data.members[k].user_id, getuser, nil)
else
if i == 1 then
return tdbot.sendMessage(msg.chat_id, msg.id, 0, "◈ *لیست کاربران سکوت شده خالی می باشد.*. ", 0, "md")
else
--return tdbot.sendMessage(msg.chat_id, msg.id, 0, "*لیست کاربران سایلنت شده پاک شد*", 0, "md")
end
end
end
tdbot.getUser(data.members[k].user_id, getuser, nil)
else
return tdbot.sendMessage(msg.chat_id, msg.id, 0, "◈ *لیست کاربران سکوت شده خالی می باشد.*. ", 0, "md")
end
end
tdbot.getChannelMembers(msg.chat_id, 0, 100000, 'Restricted', GetRestricted, {msg=msg})
end



if Ramin == 'clean mutelist' or Ramin == 'پاکسازی لیست سایلنت' then
local function GetRestricted(arg, data)
msg=arg.msg
local i = 1
local un = ''
if data.total_count > 0 then
i = 1
k = 0
local function getuser(arg, mdata)
local ST = data.members[k].status
if ST.can_add_web_page_previews == false and ST.can_send_media_messages == false and ST.can_send_messages == false and ST.can_send_other_messages == false and ST.is_member == true then
unsilent_user(msg.chat_id, data.members[k].user_id)
i = i + 1
end
k = k + 1
if k < data.total_count then
tdbot.getUser(data.members[k].user_id, getuser, nil)
else
if i == 1 then
return tdbot.sendMessage(msg.chat_id, msg.id, 0, "◈ *لیست کاربران سکوت شده خالی می باشد.*. ", 0, "md")
else
--return tdbot.sendMessage(msg.chat_id, msg.id, 0, "*لیست کاربران سایلنت شده پاک شد*", 0, "md")
end
end
end
tdbot.getUser(data.members[k].user_id, getuser, nil)
else
return tdbot.sendMessage(msg.chat_id, msg.id, 0, "◈ *لیست کاربران سکوت شده خالی می باشد.*. ", 0, "md")
end
end
tdbot.getChannelMembers(msg.chat_id, 0, 100000, 'Restricted', GetRestricted, {msg=msg})
end









if Ramin == 'clean mutelist' or Ramin == 'پاکسازی لیست سکوت' then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
base:del(TD_ID..'SilentList:'..msg.chat_id)
local mute = base:smembers(TD_ID..'MuteList:'..msg.chat_id)
for k,v in pairs(mute) do
base:del(TD_ID..'MuteList:'..msg.chat_id)
base:del(TD_ID..'tabchiresjoin:'..msg.chat_id)
UnRes(msg.chat_id,v)
end
send(msg.chat_id,msg.id,' ◈ *تمام افراد سکوت شدہ ازاد شدند*. ','md')
else
send(msg.chat_id,msg.id,' ◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end



if Ramin == 'clean mutelist' or Ramin == 'پاکسازی لیست سایلنت' then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
base:del(TD_ID..'SilentList:'..msg.chat_id)
local mute = base:smembers(TD_ID..'MuteList:'..msg.chat_id)
for k,v in pairs(mute) do
base:del(TD_ID..'MuteList:'..msg.chat_id)
UnRes(msg.chat_id,v)
end
send(msg.chat_id,msg.id,' ◈ *تمام افراد سکوت شدہ ازاد شدند*. ','md')
else
send(msg.chat_id,msg.id,' ◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
if Ramin and (Ramin:match('^(.*)') or Ramin:match('^(.*)'))  then
Admin(msg.chat_id, BotCliId, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end

if (Ramin == 'addcleaner' or Ramin == 'نصب') then
Admin(msg.chat_id, BotCliId, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
if (Ramin == 'addcleaner' or Ramin == 'نصب رایگان') then
Admin(msg.chat_id, BotCliId, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
if (Ramin == 'clean bots' or Ramin == 'پاکسازی ربات ها') and is_JoinChannel(msg) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
local function CleanBot(BlaCk,ALPHA)
for k,v in pairs(ALPHA.members) do
if tonumber(v.user_id) ~= tonumber(BotJoiner) then
KickUser(msg.chat_id,v.user_id)
end
end
end
getChannelMembers(msg.chat_id,"Bots",0, 100000000000,CleanBot)
send(msg.chat_id,msg.id,'◈ *تمامیه ربات های مخرب از گروه اخراج شدند*. ','md')
else
send(msg.chat_id,msg.id,'◈ *دسرسی لازم برای پاکسازی  ربات های مخرب رو ندارد. ','html')
end
end)
end
--------
if (Ramin == 'remlink' or Ramin == 'حذف لینک') and is_JoinChannel(msg) then
base:del(TD_ID..'Link:'..msg.chat_id)
send(msg.chat_id,msg.id,'◈ *لینک گروہ تنظیم شدہ از سیستم ربات حذف شد*. ','md')
end
--------
if  Ramin == 'بای بای !' and is_JoinChannel(msg)  then
dofile('./Alpha/time.lua')
local link = base:get(TD_ID..'Link:'..msg.chat_id)
local function LinkGp(BlaCk,ALPHA)
local function setlinkgp(td,Ramin)
if not link and Ramin.invite_link == '' then
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '• گروه پشتیبانی • ',url=LinkSuppoRt}
}
}
Left(msg.chat_id,BotCliId,'Left')
Leave_api(msg.chat_id)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send_inline(msg.chat_id,'• گروہ :<code>'..ALPHA.title..'</code>\n\n• شارژ اعتبار ربات شما تمام شد.\n• جهت تمدید شارژ ربات به دکمه های زیر مراجعه کنید.\n• زمان : *'..tarikh..'*\n',keyboard,'html')
else
dofile('./Alpha/time.lua')
local Ramin = Ramin.invite_link or link
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '• لینک گروه • ',url=link},
},{
{text = '• پشتیبانی • ',url=LinkSuppoRt}
}
}

Leave_api(msg.chat_id)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send_inline(msg.chat_id,'• گروہ :<code>'..ALPHA.title..'</code>\n\n• شارژ اعتبار ربات شما تمام شد.\n• جهت تمدید شارژ ربات به دکمه های زیر مراجعه کنید.\n• زمان : *'..tarikh..'*\n\n• لینک فعلی گروہ :\n'..link..'',keyboard,'html')
send_inline(Sudoid,'• • گزارش اتمام شارژ : \n• • گروہ :'..ALPHA.title..'\n\n• • شارژ اعتبار ربات دراین گروہ تمام شد.\n• زمان : *'..tarikh..'*\n\n• لینک فعلی گروہ :\n'..link..'',keyboard,'html')
end
end
getChannelFull(msg.chat_id,setlinkgp)
end
GetChat(msg.chat_id,LinkGp)
end


if (Ramin == 'link' or Ramin == 'لینک' or Ramin == 'لینک گروه' or Ramin == 'لینک عکسدار' or Ramin == 'لینک عکس دار') and is_JoinChannel(msg)  then
local function LinkGp(BlaCk,ALPHA)
local function setlinkgp(td,Ramin)
if not Ramin.invite_link then
send(msg.chat_id,msg.id,'◈ *ربات به قسمت دعوت کاربران با لینک دسترسی ندارد*\n◂ *لطفا ربات رو که ادمین کردی دسترسی لینک (invite link) را فعال کنید*.','md')
else
end
end
end
GetChat(msg.chat_id,LinkGp)
end

if (Ramin == 'revoke link' or Ramin == 'باطل کردن لینک') and is_JoinChannel(msg)  then
local link = base:get(TD_ID..'Link:'..msg.chat_id)
local function LinkGp(BlaCk,ALPHA)
local function setlinkgp(td,Ramin)
if not Ramin.invite_link then
send(msg.chat_id,msg.id,'◈ *ربات به قسمت دعوت کاربران با لینک دسترسی ندارد*\n◂ *لطفا ابتدا ربات را ادمین گروہ کنید سپس این دستور را اراسال نمایید*.\n*یا با دستور setlink link لینک گروہ خود را دستی ثبت کنید*.','md')
else
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '•〔'..ALPHA.title..'•',url= Ramin.invite_link},
},{
{text= '•〔 اشتراک لینک جدید•',url ='https://telegram.me/share/url?url='..Ramin.invite_link..'/&text=🌐 لینک جدید گروه' }
}
}
send_inline(msg.chat_id,'◈ لینک قبلی گروه با موفقیت باطل شد.\n\n• نام گروه:<code>'..ALPHA.title..'</code>\n🌐 لینک گروه جدید :\n '..Ramin.invite_link..'',keyboard,'html')
base:set(TD_ID..'Link:'..msg.chat_id,Ramin.invite_link)
end
end
exportChatInviteLink(msg.chat_id,setlinkgp)
end
GetChat(msg.chat_id,LinkGp)
end
if Ramin and (Ramin:match('^setlink http(.*)') or Ramin:match('^تنظیم لینک http(.*)')) then
local link = msg.content.text:match('^setlink (.*)') or msg.content.text:match('^تنظیم لینک (.*)')
base:set(TD_ID..'Link:'..msg.chat_id,link)
send(msg.chat_id,msg.id,'◈<code>لینک گروه ثبت شد</code> :\n'..link..'','html')
end



if (Ramin:match("^مسدود همنام (.*)$") or Ramin:match("^[Ba][Aa][Nn][Ee][Ss] (.*)$")) then
local text = Ramin:match("^مسدود همنام (.*)$")
local function GroupMembers(extra, result, success)
if result.members then
for x,y in pairs(result.members) do
local function name(arg, data, success)
if data.first_name:match("^(.*)"..text.."(.*)$") or data.first_name:match("^"..text.."(.*)$") or data.first_name:match("(.*)"..text.."$") then
KickUser(msg.chat_id,y.user_id)
end
end
GetUser(y.user_id,name,nil)
end
end
send(msg.chat_id,msg.id,'◈ کاربران که با اسم '..text..' بودند در گروه مسدود شدند. ','md')
end
getChannelMembers(msg.chat_id, 'Search' , 0, 200, GroupMembers)
end


if (Ramin:match("^سکوت همنام (.*)$") or Ramin:match("^[Mm][Uu][Tt][Ee][Ss] (.*)$")) then
local text = Ramin:match("^سکوت همنام (.*)$")
local function GroupMembers(extra, result, success)
if result.members then
for x,y in pairs(result.members) do
local function name(arg, data, success)
if data.first_name:match("^(.*)"..text.."(.*)$") or data.first_name:match("^"..text.."(.*)$") or data.first_name:match("(.*)"..text.."$") then
MuteUser(msg.chat_id,y.user_id,0)
end
end
GetUser(y.user_id,name,nil)
end
end
send(msg.chat_id,msg.id,'◈ کاربرانی که با اسم *'..text..'* بودند در گروه سکوت شدند. ','md')
end
getChannelMembers(msg.chat_id, 'Search' , 0, 200, GroupMembers)
end
if (Ramin:match("^تبچی همنام (.*)$") or Ramin:match("^[Tt][Aa][Bb][Cc][Hh][Ii] (.*)$")) then
local text = Ramin:match("^تبچی همنام (.*)$")
local function GroupMembers(extra, result, success)
if result.members then
for x,y in pairs(result.members) do
local function name(arg, data, success)
if data.first_name:match("^(.*)"..text.."(.*)$") or data.first_name:match("^"..text.."(.*)$") or data.first_name:match("(.*)"..text.."$") then
KickUser(msg.chat_id,y.user_id)
base:sadd(TD_ID..'AGTMute:',y.user_id)
end
end
GetUser(y.user_id,name,nil)
end
end
send(msg.chat_id,msg.id,'◈ کاربرانی که با اسم *'..text..'* بودند در گروه به عنوان تبچی شناسایی شدند. ','md')
end
getChannelMembers(msg.chat_id, 'Search' , 0, 200, GroupMembers)
end


if (Ramin:match("^مسدود بیوگرافی (.*)$") or Ramin:match("^[Ba][Aa][Nn][Bb][Ii][Oo] (.*)$")) then
local text = Ramin:match("^مسدود بیوگرافی (.*)$")
local function GroupMembers(extra, result, success)
if result.members then
for x,y in pairs(result.members) do
local function name(arg, data, success)
if data.about:match("^(.*)"..text.."(.*)$") or data.about:match("^"..text.."(.*)$") or data.about:match("(.*)"..text.."$") then
KickUser(msg.chat_id,y.user_id)
end
end
GetUser(y.user_id,name,nil)
end
end
send(msg.chat_id,msg.id,'◈ کاربرانی که با بیوگرافی '..text..' بودند در گروه مسدود شدند. ','md')
end
getChannelMembers(msg.chat_id, 'Search' , 0, 200, GroupMembers)
end


if (Ramin:match("^سکوت بیوگرافی (.*)$") or Ramin:match("^[Mm][Uu][Tt][Ee][Bb][Ii][Oo] (.*)$")) then
local text = Ramin:match("^سکوت بیوگرافی (.*)$")
local function GroupMembers(extra, result, success)
if result.members then
for x,y in pairs(result.members) do
local function name(arg, data, success)
if data.about:match("^(.*)"..text.."(.*)$") or data.about:match("^"..text.."(.*)$") or data.about:match("(.*)"..text.."$") then
MuteUser(msg.chat_id,y.user_id,0)
end
end
GetUser(y.user_id,name,nil)
end
end
send(msg.chat_id,msg.id,'◈ کاربرانی که با بیوگرافی *'..text..'* بودند در گروه سکوت شدند. ','md')
end
getChannelMembers(msg.chat_id, 'Search' , 0, 200, GroupMembers)
end
if (Ramin:match("^تبچی بیوگرافی (.*)$") or Ramin:match("^[Tt][Aa][Bb][Cc][Hh][Ii][Bb][Ii][Oo] (.*)$")) then
local text = Ramin:match("^تبچی بیوگرافی (.*)$")
local function GroupMembers(extra, result, success)
if result.members then
for x,y in pairs(result.members) do
local function name(arg, data, success)
if data.about:match("^(.*)"..text.."(.*)$") or data.about:match("^"..text.."(.*)$") or data.about:match("(.*)"..text.."$") then
KickUser(msg.chat_id,y.user_id)
base:sadd(TD_ID..'AGTMute:',y.user_id)
end
end
GetUser(y.user_id,name,nil)
end
end
send(msg.chat_id,msg.id,'◈ کاربرانی که با بیوگرافی *'..text..'* بودند در گروه به عنوان تبچی شناسایی شدند. ','md')
end
getChannelMembers(msg.chat_id, 'Search' , 0, 200, GroupMembers)
end


if Ramin and (Ramin:match("^پاکسازی لیست سیاه$") or Ramin:match("^[Cc][Ll][Ee][Aa][Nn] [Bb][Ll][Oo][Cc][Kk][Ll][Ii][Ss][Tt]$")) and tonumber(msg.reply_to_message_id) == 0  then
local function removeblocklist(extra, result , success)
if tonumber(result.total_count) == 0 then
send(msg.chat_id, msg.id, '◈ لیست سیاه گروه خالی می باشد !', 'md')
else
local k = 0
if result.members then
for k,v in pairs(result.members) do
k = k + 1
RemoveFromBanList(msg.chat_id, v.user_id)
end
end
send(msg.chat_id, msg.id, '◈ لیست سیاه گروه با موفقیت پاکسازی شد !', 'html')
end
end
getChannelMembers(msg.chat_id, "Banned", 0, 200, removeblocklist)
end

if Ramin and (Ramin:match('[Cc]lean deleteacc') or Ramin:match('پاکسازی دلیت اکانت ها')) and is_JoinChannel(msg) then
local function GetDeleted(arg, data)
if data.members then
for k,v in pairs (data.members) do
local function GetUser(arg, data)
if data.type and data.type._ == "userTypeDeleted"  then
kick_user(data.id, msg.chat_id)
end
end
tdbot.getUser(v.user_id, GetUser, {msg=arg.msg})
end
end
end
for i = 1, 2 do
tdbot.getChannelMembers(msg.chat_id, 0, 100000000000, 'Recent', GetDeleted, {msg=msg})
end
for i = 1, 1 do
tdbot.getChannelMembers(msg.chat_id, 0, 100000000000, 'Search', GetDeleted, {msg=msg})
end
return tdbot.sendMessage(msg.chat_id, msg.id, 0, "◈تمام اکانت های دلیت ‌شده از گروه حذف شدند. ", 0, "md")
end


if Ramin and (Ramin:match("^پاکسازی کاربران خیلی وقت پیش$") or Ramin:match("^[Cc][Ll][Ee][Aa][Nn] [Ll][Aa][Ss][Tt][Ee][Mm][Pp][Tt][Yy]$")) and tonumber(msg.reply_to_message_id) == 0  then
function list(extra, result, success)
if result.members then
for k,v in pairs(result.members) do
local function CheckLastEmpty(extra, result, success)
if result.status._ == "userStatusEmpty" then
KickUser(msg.chat_id, result.id)
end
end
getUser(v.user_id, CheckLastEmpty)
end
end
send(msg.chat_id, msg.id,'◈ کاربران بازدید خیلی وقت پیش با موفقیت اخراج شدند !' ,'md')
end
getChannelMembers(msg.chat_id, "Recent", 0, 200, list)
end

if  Ramin and (Ramin:match("^پاکسازی کاربران یک ماه پیش$") or Ramin:match("^[Cc][Ll][Ee][Aa][Nn] [Ll][Aa][Ss][Tt][Mm][Oo][Nn][Tt][Hh]$")) and tonumber(msg.reply_to_message_id) == 0  then
function list(extra, result, success)
if result.members then
for k,v in pairs(result.members) do
local function CheckLastMonth(extra, result, success)
if result.status._ == "userStatusLastMonth" then
KickUser(msg.chat_id, result.id)
end
end
getUser(v.user_id, CheckLastMonth)
end
end
sendText(msg.chat_id, msg.id,'◈ کاربران بازدید یک ماه پیش با موفقیت اخراج شدند !' ,'md')
end
getChannelMembers(msg.chat_id, "Recent", 0, 200, list)
end

if Ramin and (Ramin:match("^پاکسازی کاربران یک هفته پیش$") or Ramin:match("^[Cc][Ll][Ee][Aa][Nn] [Ll][Aa][Ss][Tt][Ww][Ee][Ee][Kk]$")) and tonumber(msg.reply_to_message_id) == 0  then
function list(extra, result, success)
if result.members then
for k,v in pairs(result.members) do
local function CheckLastWeek(extra, result, success)
if result.status._ == "userStatusLastWeek" then
KickUser(msg.chat_id, result.id)
end
end
getUser(v.user_id, CheckLastWeek)
end
end
send(msg.chat_id, msg.id,'◈ کاربران بازدید یک هفته پیش با موفقیت اخراج شدند !' ,'md')
end
getChannelMembers(msg.chat_id, "Recent", 0, 200, list)
end

if Ramin and (Ramin:match("^پاکسازی کاربران بازدید اخیرا$") or Ramin:match("^[Cc][Ll][Ee][Aa][Nn] [Ll][Aa][Ss][Tt][Ss][Ee][Ee][Nn][Rr][Ee][Cc][Nn][Tt][Ll][Yy]$")) and tonumber(msg.reply_to_message_id) == 0 and Clean_ModAccess(msg,msg.chat_id) and Force(msg) then
function list(extra, result, success)
if result.members then
for k,v in pairs(result.members) do
local function CheckRecently(extra, result, success)
if result.status._ == "userStatusRecently" then
if not is_vip1(msg.chat_id,v.user_id) and not is_Cli1(v.user_id) then
KickUser(msg.chat_id, result.id)
end
end
end
getUser(v.user_id, CheckRecently)
end
end
send(msg.chat_id, msg.id,'◈ کاربران بازدید اخیرا با موفقیت اخراج شدند !' ,'md')
end
getChannelMembers(msg.chat_id, "Recent", 0, 200, list)
end
if Ramin and (Ramin:match('[Cc]lean fake') or Ramin:match('پاکسازی فیک')) and is_JoinChannel(msg) then
getChatMember(msg.chat_id,BotCliId,function(data,org)
if org.status and org.status.can_restrict_members then
local function check(arg,data)
for k,v in pairs(data.members) do
local function clean(arg,data)
if data.status.author_signature == "Deleted Account"  then
end
if data.status.expires == "last seen within a week" then
end
end
GetUser(v.user_id,clean)
end
send(msg.chat_id,msg.id,'◈*اعضای #غیرفعال و فیک از گروه اخراج شدند*.','md')
end
tdbot_function ({_= "getChannelMembers",channel_id = getChatId(msg.chat_id).id,offset = 0,limit= 1000},check,nil)
else
send(msg.chat_id,msg.id,'◈ <code>دسرسی لازم برای پاکسازی  اعضای #غیرفعال رو ندارد</code> .','html')
end
end)
end
--<><><><>Vip Add

if Ramin and (Ramin:match('^معاف$') or Ramin:match('^setvipadd$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
SetAdd(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end
if Ramin and (Ramin:match('^معاف (.*)$') or Ramin:match('^setvipadd (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
SetAdd(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^معاف @(.*)$') or Ramin:match('^setvipadd @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^معاف @(.*)$') or Ramin:match('^setvipadd @(.*)$')
function modusername(extra,result,success)
if result.id then
SetAdd(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end
if Ramin and (Ramin:match('^معاف (%d+)$') or Ramin:match('^setvipadd (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
SetAdd(msg, msg.chat_id, Ramin:match('^معاف (%d+)$') or Ramin:match('^setvipadd (%d+)$'))
end
if Ramin and (Ramin:match('^اجبار$')  or Ramin:match('^remvipadd$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
RemAdd(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end
if Ramin and (Ramin:match('^اجبار (.*)$') or Ramin:match('^remvipadd (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
RemAdd(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^اجبار @(.*)$') or Ramin:match('^remvipadd @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^اجبار @(.*)$') or Ramin:match('^remvipadd @(.*)$')
function remmodusername(extra,result,success)
if result.id then
RemAdd(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end
if Ramin and (Ramin:match('^اجبار (%d+)$') or Ramin:match('^remvipadd (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
RemAdd(msg, msg.chat_id, Ramin:match('^اجبار (%d+)$') or Ramin:match('^remvipadd (%d+)$'))
end

if Ramin == 'vipaddlist' or Ramin == 'لیست معاف' then
local list = base:smembers(TD_ID..'VipAdd:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ *لیست کاربران معاف از اد اجباری خالی می باشد*.', 'md')
else
local txt = 'لیست کاربران معاف شده ربات :\n\n'
for k,v in pairs(list) do

local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'none'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..'<b>'..k..'-</b>• نام کاربر:'..username..'\nایدی کاربر:<code>'..v..'</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end
if (Ramin == 'clean vipaddlist' or Ramin == 'پاکسازی لیست معاف')  and is_JoinChannel(msg) then
base:del(TD_ID..'VipAdd:'..msg.chat_id)
base:del(TD_ID..'VipJoin:'..msg.chat_id)

send(msg.chat_id, msg.id,'◈ *لیست کاربران معاف شده پاک شد*.','md')
end

-------------------------------

if Ramin and (Ramin:match('^عضو ویژه$') or Ramin:match('^setvip$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
SetVip(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end
if Ramin and (Ramin:match('^عضو ویژه (.*)$') or Ramin:match('^setvip (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
SetVip(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^عضو ویژه @(.*)$') or Ramin:match('^setvip @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^عضو ویژه @(.*)$') or Ramin:match('^setvip @(.*)$')
function modusername(extra,result,success)
if result.id then
SetVip(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end
if Ramin and (Ramin:match('^عضو ویژه (%d+)$') or Ramin:match('^setvip (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
SetVip(msg, msg.chat_id, Ramin:match('^عضو ویژه (%d+)$') or Ramin:match('^setvip (%d+)$'))
end
if Ramin and (Ramin:match('^حذف ویژه$')  or Ramin:match('^remvip$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
RemVip(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end
if Ramin and (Ramin:match('^حذف ویژه (.*)$') or Ramin:match('^remvip (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
RemVip(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^حذف ویژه @(.*)$') or Ramin:match('^remvip @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف ویژه @(.*)$') or Ramin:match('^remvip @(.*)$')
function remmodusername(extra,result,success)
if result.id then
RemVip(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end
if Ramin and (Ramin:match('^حذف ویژه (%d+)$') or Ramin:match('^remvip (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
RemVip(msg, msg.chat_id, Ramin:match('^حذف ویژه (%d+)$') or Ramin:match('^remvip (%d+)$'))
end
if Ramin == 'viplist' or Ramin == 'لیست ویژه'  then
local list = base:smembers(TD_ID..'Vip:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ *لیست ویژه خالی می باشد.*  ', 'md')
else
local txt = 'لیست کاربران ویژه :\n\n'
for k,v in pairs(list) do
local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
local day = base:get(TD_ID..'daymod:'..msg.chat_id..v)
if day then
d = day
else
d = 'نامشخص'
end
txt = ''..txt..'🄰 '..username..'<code>'..v..'</code>\n('..d..')\n\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end




if Ramin == 'statustabchi' or Ramin == 'وضعیت تبچی' then
local function SetSudo(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
function name(ramin,alpha)
if base:sismember(TD_ID..'AGTMute:',user) then
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◆  کاربر ["..Mention.."](tg://user?id="..user..") ربات تبچی می باشد!", 0, "md")
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..Mention.."](tg://user?id="..user..") خوشبختانه تبچی نمی باشد!", 0, "md")
end
end
GetUser(user,name)
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),SetSudo)
end
end

if Ramin and (Ramin:match('^statustabchi @(.*)') or Ramin:match('^وضعیت تبچی @(.*)')) then
local username = Ramin:match('^statustabchi @(.*)') or Ramin:match('^وضعیت تبچی @(.*)')
function BanallByUsername(BlaCk,ALPHA)
local user = ALPHA.id
if user then
if base:sismember(TD_ID..'AGTMute:',user) then
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر ["..username.."](tg://user?id="..user..") ربات تبچی می باشد!", 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..username.."](tg://user?id="..user..") خوشبختانه تبچی نمی باشد!", 0, "md")
end
else
send(msg.chat_id, msg.id,'◇*کاربر*  @'..username..'  یافت نشد ...!','md')
end
end
resolve_username(username,BanallByUsername)
end
if Ramin and (Ramin:match('^statustabchi (%d+)$') or Ramin:match('^وضعیت تبچی (%d+)$')) then
local user = Ramin:match('^statustabchi (%d+)') or Ramin:match('^وضعیت تبچی (%d+)')
local function name(ramin,alpha)
if base:sismember(TD_ID..'AGTMute:',user) then
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر ["..Mention.."](tg://user?id="..user..") ربات تبچی می باشد!", 0, "md")
base:srem(TD_ID..'SUDO',user)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..Mention.."](tg://user?id="..user..") خوشبختانه تبچی نمی باشد!", 0, "md")
end
end
GetUser(user,name)
end
if ALPHAent and (Ramin:match('^statustabchi (.*)') or Ramin:match('^وضعیت تبچی (.*)') ) and is_JoinChannel(msg) then
local user = msg.content.entities[0].type.user_id
local function name(ramin,alpha)
if base:sismember(TD_ID..'AGTMute:',user) then
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر ["..Mention.."](tg://user?id="..user..") ربات تبچی می باشد!", 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..Mention.."](tg://user?id="..user..") سخوشبختانه تبچی نمی باشد!", 0, "md")
end
end
GetUser(user,name)
end

if (Ramin == 'clean viplist' or Ramin == 'پاکسازی لیست ویژه') and is_JoinChannel(msg) then
base:del(TD_ID..'Vip:'..msg.chat_id)
send(msg.chat_id,msg.id,'◈ *لیست افراد ویژه پاکسازی شد* ','md')
end
----------------------------------------------------------

if Ramin and (Ramin:match('^setrank (.*)$') or Ramin:match('^تنظیم مقام (.*)$')) and tonumber(msg.reply_to_message_id) ~= 0  then
local rank = Ramin:match('^setrank (.*)$') or Ramin:match('^تنظیم مقام (.*)$')
local function SetRank_Rep(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '❎ من نمیتوانم پیام خودم را چک کنم','md')
return false
end
if tonumber(user) == 219201071 then
send(msg.chat_id, msg.id,'نمیتونی به محمد لقب بدی 🖕😐','md')
return false
end
base:set(TD_ID..'rank'..msg.chat_id..user,rank)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'◈ *مقام کاربر* : '..MBD(name,user)..' *به* ['..rank..'] *تغییر کرد* ','md')
end
GetUser(user,name)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),SetRank_Rep)
end
if Ramin and (Ramin:match('^delrank$') or Ramin:match('^حذف مقام$')) and tonumber(msg.reply_to_message_id) ~= 0 then
local rank = Ramin:match('^delrank$') or Ramin:match('^حذف مقام$')
local function DelRank_Rep(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
base:del(TD_ID..'rank'..msg.chat_id..user)
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
sendM(msg.chat_id,user,msg.id,'• مقام کاربر : '..name..' پاک شد .',15,utf8.len(name))
end
GetUser(user,name)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DelRank_Rep)
end


base:sismember(TD_ID..'Gp2:'..msg.chat_id,'AntiTabchi')
if (Ramin == 'antitabchi on' or Ramin == 'ضد تبچی احراز هویت فعال') and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'AntiTabchi')
send(msg.chat_id,msg.id,'• احراز هویت (ضدتبجی) فعال شد و کاربرانی که عضو میشوند باید به سوال ربات پاسخ دهند تا ربات نبودن آن ها ثابت شود در غیراین صورت ربات شناخته شده و از گروه اخراج میشوند','md')
end
if (Ramin == 'antitabchi off' or Ramin == 'ضد تبچی احراز هویت غیرفعال') and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'AntiTabchi')
send(msg.chat_id,msg.id,'• ضد تبچی احراز هویت غیرفعال شد !','md')
end

if (Ramin == 'firstmute on' or Ramin == 'محدودیت تبچی فعال') and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'FirstTabchiMute')
send(msg.chat_id,msg.id,'• محدود شدن تمامی اعضای جدید به محض ورود فعال شد !\nاین کاربران باید حتما به سوال احراز هویت پاسخ دهند تا بتوانند در گروه پیام ارسال کنند !','md')
end
if (Ramin == 'firstmute off' or Ramin == 'محدودیت تبچی غیرفعال') and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'FirstTabchiMute')
send(msg.chat_id,msg.id,'• محدود شدن تمامی اعضا به محض ورود غیرفعال شد !','md')
end


if (Ramin == 'Adminautopm on' or Ramin == 'تعیین خودکار ادمین فعال') and is_Owner(msg) and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Adminpm:on')
limitmsg = base:get(TD_ID..'Adminpm:'..msg.chat_id) or 100
send(msg.chat_id,msg.id,'• حالت تعیین خودکار ادمین فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ تعداد پیام جهت تعیین ادمین : *'..limitmsg..'*','md')
end
if (Ramin == 'Adminautopm off' or Ramin == 'تعیین خودکار ادمین غیرفعال') and is_Owner(msg)  and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Adminpm:on')
send(msg.chat_id,msg.id,'• حالت تعیین خودکار ادمین غیرفعال شد.','md')
end

if Ramin and (Ramin:match('^setadminpm (%d+)$') or Ramin:match('^تعداد تعیین خودکار ادمین (%d+)$')) and is_Owner(msg)  and is_JoinChannel(msg) then
local num = Ramin:match('^setadminpm (%d+)') or Ramin:match('^تعداد تعیین خودکار ادمین (%d+)')
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Adminpm:on') then
if tonumber(num) < 100 then
send(msg.chat_id,msg.id,'عددی بزرگتر از 100 ارسال شود!','md')
else
base:set(TD_ID..'Adminpm:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• تعداد پیام تعیین خودکار ادمین هر کاربر در گروه تنظیم شد به : *'..Alphafa(num)..'* پیام\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • هر فرد در طول روز اگر به تعداد '..Alphafa(num)..' پیام ارسال کند به صورت خودکار گزارش فعالیت کاربر به مالک گروه ارسال خواهد شد!','md')
end
else
send(msg.chat_id,msg.id,'• حالت تعیین خودکار ادمین فعال نمی باشد\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • برای فعال کردن این بخش ابتدا دستور تعیین خودکار ادمین فعال ارسال نمایید!','md')
end
end


if (Ramin == 'Kheyanat on' or Ramin == 'قفل خیانت فعال') and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Kheyanat:on')
limitmsg = base:get(TD_ID..'KheyanatDel:'..msg.chat_id) or 10
send(msg.chat_id,msg.id,'• قفل خیانت ادمین ها فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ تعداد خیانت درسیستم : *'..limitmsg..'*\n','md')
end

if (Ramin == 'limitpm on' or Ramin == 'لیمیت پیام فعال') and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'limitpm:on')
limitmsg = base:get(TD_ID..'limitpm:'..msg.chat_id) or 100
timelimit = base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600
send(msg.chat_id,msg.id,'• حالت لیمیت پیام فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ تعداد لیمیت ارسال هرکاربر : *'..limitmsg..'*\nزمان محدویت هرکاربر : *'..timelimit..'*','md')
end
if (Ramin == 'limitpm off' or Ramin == 'لیمیت پیام غیرفعال') and is_JoinChannel(msg) then
local function checkadmin(BlaCk,Guardian)
if Guardian.status.can_restrict_members then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'limitpm:on')
local unlimit = base:smembers(TD_ID..'limituser:'..msg.chat_id)
for k,v in pairs(unlimit) do
base:srem(TD_ID..'limituser:'..msg.chat_id,v)
UnRes(msg.chat_id,v)
end
send(msg.chat_id,msg.id,'• حالت لیمیت پیام غیرفعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ کاربرانی که به در لیست لیمیت ارسال پیام بودند آزاد شدند!','md')
else
send(msg.chat_id,msg.id,'✖️ ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید سپس مجدد تلاش کنید !','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end

if (Ramin == 'unlimitpm' or Ramin == 'رفع لیمیت پیام' ) and tonumber(msg.reply_to_message_id) ~= 0 and is_JoinChannel(msg) and is_ModMute(msg) then
function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'limitpm'..user)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..user)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date('%Y/%m/%d')..':'..user or 00000000)
UnRes(msg.chat_id,user)
send(chat,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..user..") | `"..user.."`  \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n * از محدودیت لیمیت پیام در روز رها شد و از سکوت نیز خارج شد.*","md")
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end

if Ramin and (Ramin:match('^setlimitpm (%d+)$') or Ramin:match('^تعداد لیمیت پیام (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^setlimitpm (%d+)') or Ramin:match('^تعداد لیمیت پیام (%d+)')
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'limitpm:on') then
if tonumber(num) < 100 then
send(msg.chat_id,msg.id,'عددی بزرگتر از 50 ارسال شود!','md')
else
base:set(TD_ID..'limitpm:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• تعداد لیمیت پیام هر کاربر در گروه تنظیم شد به : *'..Alphafa(num)..'* پیام\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • هر فرد در طول روز می تواند به تعداد '..Alphafa(num)..' پیام ارسال کند!','md')
end
else
send(msg.chat_id,msg.id,'• لیمیت پیام در گروه فعال نمی باشد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • برای فعال کردن این بخش ابتدا دستور لیمیت پیام فعال ارسال نمایید!','md')
end
end


if Ramin and (Ramin:match('^setcleanpm (%d+)$') or Ramin:match('^تعداد پاکسازی خودکار (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^setcleanpm (%d+)') or Ramin:match('^تعداد پاکسازی خودکار (%d+)')
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'cleanpm:on') then
if tonumber(num) < 1500 then
send(msg.chat_id,msg.id,'عددی بزرگتر از 1500 ارسال شود!','md')
else
base:set(TD_ID..'cleanpm:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• تعداد پیام گروه جهت عملیات پاکسازی : *'..Alphafa(num)..'* پیام\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • در گروه اگر ماکسیم پیام به '..Alphafa(num)..' برسد عملیات پاکسازی خودکار انجام خواهد شد!','md')
end
else
send(msg.chat_id,msg.id,'• پاکسازی خودکار عددی در گروه فعال نمی باشد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • برای فعال کردن این بخش ابتدا دستور پاکسازی خودکار عددی فعال ارسال نمایید!','md')
end
end


if (Ramin == 'cleantpm on' or Ramin == 'پاکسازی خودکار عددی فعال') and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'cleanpm:on')
limitmsg = base:get(TD_ID..'cleanpm:'..msg.chat_id) or 1500
send(msg.chat_id,msg.id,'• پاکسازی خودکار عددی فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ تعداد پیام کلی جهت عملیات پاکسازی کلی : *'..limitmsg..'*','md')
end
if (Ramin == 'cleantpm off' or Ramin == 'پاکسازی خودکار عددی غیرفعال') and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'cleanpm:on')
base:del(TD_ID.."cleanpm:"..msg.chat_id)
base:del(TD_ID.."CL:clean:"..msg.chat_id)
send(msg.chat_id,msg.id,'• پاکسازی خودکار عددی غیرفعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ عملیات پاکسازی خودکار کلی پیام از سیستم ربات جهت پاکسازی انجام نخواهد شد!','md')
end




if Ramin and (Ramin:match('^setmutetime (%d+)[hms]') or Ramin:match('^زمان سکوت (%d+)[ساعت]')) and is_JoinChannel(msg) then
local num = Ramin:match('^setmutetime (%d+)[hms]') or Ramin:match('^زمان سکوت (%d+)[ساعت]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)ساعت')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)ساعت')
time = time_match * 3600
end
base:set(TD_ID..'mutetime:'..msg.chat_id,time)
local Time_ = getTimeUptime(time)
send(msg.chat_id,msg.id,'• زمان محدودیت سکوت تنظیم شد بر روی : *'..Time_..'* \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت محدود شدن کاربر,کاربر مورد نظر *'..Time_..'*  از ارسال پیام در گروه منع خواهد شد.','md')
end

if Ramin == 'panel public' or Ramin == 'قفل پنل غیرفعال' then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'PanelPv')
send(msg.chat_id,msg.id,'• پنل بر روی همگانی تنظیم شد و مدیر دیگر قادر به کار با پنل دیگر مدیران نیز خواهد بود','md')
end

if Ramin == 'panel privite' or Ramin == 'قفل پنل فعال' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'PanelPv')
send(msg.chat_id,msg.id,'• پنل بر روی خصوصی تنظیم شد و مدیر دیگر قادر به کار با پنل دیگران مدیران نخواهد بود','md')
end

if Ramin == 'del' or Ramin == 'حذف' and tonumber(msg.reply_to_message_id) ~= 0 then
function DelByReply(BlaCk,ALPHA)
deleteMessages(msg.chat_id,{[0] = msg.id})
deleteMessages(msg.chat_id,{[0] = ALPHA.id})
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DelByReply)
end


if Ramin and (Ramin:match('^cleanerautotime (%d+)[h]') or Ramin:match('^زمان پاکسازی خودکار (%d+) [ساعت]')) and is_JoinChannel(msg) then
local num = Ramin:match('^cleanerautotime (%d+)[h]') or Ramin:match('^زمان پاکسازی خودکار (%d+) [ساعت]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+) ساعت')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+) ساعت')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
base:set(TD_ID..'cgmautotime:'..msg.chat_id,time)
base:set(TD_ID..'cgmautotime1:'..msg.chat_id,time)
base:set(TD_ID..'cgmautotime2:'..msg.chat_id,time)
base:set(TD_ID..'cgmautotime3:'..msg.chat_id,time)
base:set(TD_ID..'cgmautotime4:'..msg.chat_id,time)
send(msg.chat_id,msg.id,'• زمان پاکسازی خودکار تنظیم شد بر روی : *'..th..'* '..t..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• یعنی هر *'..th..'* '..t..' ساعت یکبار پاکسازی تمامی پیام های گپ بصورت اتوماتیک انجام خواهد شد...! ','md')
end


if Ramin and (Ramin:match('^scanautotabchi (%d+)[h]') or Ramin:match('^زمان اسکن تبلیغگر (%d+) [ساعت]')) and is_JoinChannel(msg) then
local num = Ramin:match('^scanautotabchi (%d+)[h]') or Ramin:match('^زمان اسکن تبلیغگر (%d+) [ساعت]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+) ساعت')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+) ساعت')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
base:set(TD_ID..'scantabchiautotime:'..msg.chat_id,time)
send(msg.chat_id,msg.id,'• زمان اسکن تبلیغگر خودکار  : *'..th..'* '..t..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• یعنی هر *'..th..'* '..t..' ساعت یکبار ربات تمامی ممبر گروه را از صحت تبلیغگر بودن چک خواهد کرد! ','md')
end


if (Ramin == 'scanautotabchi on' or Ramin == 'اسکن خودکار تبلیغگر فعال')  and is_JoinChannel(msg) then
local timecgmbaghi = base:ttl(TD_ID..'scantabauto:'..msg.chat_id)
local timecgm = base:get(TD_ID..'scantabchiautotime:'..msg.chat_id)
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'scantabautoon') and timecgm then
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "• زمان باقی مانده تا انجام پاکسازی \n:[ " .. Time_ .. " ]"
send(msg.chat_id,msg.id,'• اسکن خودکار تبلیغگر از قبل فعال می باشد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ *'..Time_S..'*','md')
else
if timecgm then
local timecgm2 = timecgm / 3600
base:setex(TD_ID..'scantabauto:'..msg.chat_id,timecgm,true)
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'scantabautoon')
send(msg.chat_id,msg.id,'• اسکن خودکار تبلیغگر فعال شد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • زمان برای انجام عملیات  *'..timecgm2..'* ساعت یکبار انجام خواهد شد.','md')
else
send(msg.chat_id,msg.id,'• زمان اسکن خودکار تبلیغگر گروه تنظیم نشده است!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ برای تنظیم کردن زمان از دستور زیر استفاده کنید :\n » *زمان اسکن تبلیغگر [عدد] ساعت* ','md')
end
end
end
---------------
if Ramin == 'lock porn'   and is_JoinChannel(msg) then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Porn')
send(msg.chat_id,msg.id,'• فعال شد','md')

end




if (Ramin == 'scanautotabchi off' or Ramin == 'اسکن خودکار تبلیغگر غیرفعال')  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'scantabautoon') then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'scantabautoon')
base:del(TD_ID..'scantabauto:'..msg.chat_id)
send(msg.chat_id,msg.id,'• اسکن خودکار تبلیغگر غیرفعال شد!','md')
else
send(msg.chat_id,msg.id,'• اسکن تبلیغگر خودکار فعال شد!','md')
end
end

if (Ramin == 'cgm on' or Ramin == 'پاکسازی خودکار فعال')  and is_JoinChannel(msg) then
local timecgmbaghi = base:ttl(TD_ID..'cgmauto:'..msg.chat_id)
local timecgm = base:get(TD_ID..'cgmautotime:'..msg.chat_id)
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'cgmautoon') and timecgm then
local Time_ = getTimeUptime(timecgmbaghi)
Time_S = "• زمان باقی مانده تا انجام پاکسازی \n:[ " .. Time_ .. " ]"
send(msg.chat_id,msg.id,'• پاکسازی خودکار کلی پیام ها فعال می باشد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ *'..Time_S..'*','md')
else
if timecgm then
local timecgm2 = timecgm / 3600
t1 = timecgm - 60
t2 = timecgm - 300
t3 = timecgm - 1200
t4 = timecgm - 3540

base:setex(TD_ID..'cgmauto:'..msg.chat_id,timecgm,true)
base:setex(TD_ID..'cgmauto1:'..msg.chat_id,t1,true)
base:setex(TD_ID..'cgmauto2:'..msg.chat_id,t2,true)
base:setex(TD_ID..'cgmauto3:'..msg.chat_id,t3,true)
base:setex(TD_ID..'cgmauto4:'..msg.chat_id,t4,true)
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'cgmautoon')
send(msg.chat_id,msg.id,'• پاکسازی خودکار کلی پیام ها فعال شد!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ • زمان پاکسازی خودکار کلی پیام  *'..timecgm2..'* ساعت یکبار انجام خواهد شد.','md')
else
send(msg.chat_id,msg.id,'• زمان پاکسازی خودکار کلی پیام ها تنظیم نشده است!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ برای تنظیم کردن زمان از دستور زیر استفاده کنید :\n » *زمان پاکسازی خودکار [عدد] ساعت* ','md')
end
end
end
if (Ramin == 'cgm off' or Ramin == 'پاکسازی خودکار غیرفعال')  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'cgmautoon') then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'cgmautoon')
base:del(TD_ID..'cgmauto:'..msg.chat_id)
base:del(TD_ID..'cgmauto1:'..msg.chat_id)
base:del(TD_ID..'cgmauto2:'..msg.chat_id)
base:del(TD_ID..'cgmauto3:'..msg.chat_id)
base:del(TD_ID..'cgmauto4:'..msg.chat_id)
send(msg.chat_id,msg.id,'• پاکسازی خودکار غیرفعال شد!','md')
else
send(msg.chat_id,msg.id,'• پاکسازی خودکار غیرفعال بود!','md')
end
end
--<><><>BotCgm

if Ramin and (Ramin:match('^cbmtime (%d+)[hms]') or Ramin:match('^زمان پاکسازی پیام ربات (%d+) [ثانیه]')) and is_JoinChannel(msg) then
local num = Ramin:match('^cbmtime (%d+)[hms]') or Ramin:match('^زمان پاکسازی پیام ربات (%d+) [ثانیه]')
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+) ثانیه')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+) ثانیه')
time = time_match
th = time * 1
t = 'ثانیه'
end
base:set(TD_ID..'cbmtime:'..msg.chat_id,time)
send(msg.chat_id,msg.id,'• زمان پاکسازی پیام ربات تنظیم شد به : '..th..' '..t..' \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• کاربر گرامی پاکسازی پیام های خودکار ربات هر ['..th..' '..t..'] یکبار به صورت خودکار انجام خواهد شد. ','md')
end


if Ramin and (Ramin:match('^cleanwelcometime (%d+)[hms]') or Ramin:match('^زمان پاکسازی خوش آمدگویی (%d+) [ثانیه]')) and is_JoinChannel(msg) then
local num = Ramin:match('^cleanwelcometime (%d+)[hms]') or Ramin:match('^زمان پاکسازی خوش آمدگویی (%d+) [ثانیه]')
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+) ثانیه')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+) ثانیه')
time = time_match
th = time * 1
t = 'ثانیه'
end
base:set(TD_ID..'cleanwelcometime:'..msg.chat_id,time)
send(msg.chat_id,msg.id,'• زمان پاکسازی پیام خوش آمدگویی تنظیم شد به : '..th..' '..t..' \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• کاربر گرامی پاکسازی پیام های خودکار خوش آمدگویی ربات ['..th..' '..t..'] یکبار به صورت خودکار انجام خواهد شد. ','md')
end


if Ramin and (Ramin:match('^قفل (.*)')) and is_JoinChannel(msg) then
local input = {string.match(Ramin, "^(قفل) (.*)$")}
if input[2] == "لینک" then
base:set(TD_ID.."sg:link"..msg.chat_id,"del")
elseif input[2] == "متن" then
base:set(TD_ID.."sg:txt"..msg.chat_id,"del")
elseif input[2] == "ویرایش" then
base:set(TD_ID.."sg:edit"..msg.chat_id,"del")
elseif input[2] == "تگ" or input[2] == "هشتگ" then
base:set(TD_ID.."sg:tag"..msg.chat_id,"del")
elseif input[2] == "فوروارد" then
base:set(TD_ID.."sg:fwd"..msg.chat_id,"del")
elseif input[2] == "یوزرنیم" then
base:set(TD_ID.."sg:user"..msg.chat_id,"del")
elseif input[2] == "اینلاین" then
base:set(TD_ID.."sg:inline"..msg.chat_id,"del")
elseif input[2] == "مکان" then
base:set(TD_ID.."sg:loc"..msg.chat_id,"del")
elseif input[2] == "استیکر" then
base:set(TD_ID.."sg:sticker"..msg.chat_id,"del")
elseif input[2] == "گیف" then
base:set(TD_ID.."sg:gif"..msg.chat_id,"del")
elseif input[2] == "ویس" then
base:set(TD_ID.."sg:voice"..msg.chat_id,"del")
elseif input[2] == "موزیک" then
base:set(TD_ID.."sg:music"..msg.chat_id,"del")
elseif input[2] == "بازی" then
base:set(TD_ID.."sg:game"..msg.chat_id,"del")
elseif input[2] == "عکس" then
base:set(TD_ID.."sg:photo"..msg.chat_id,"del")
elseif input[2] == "ویدیو سلفی" then
base:set(TD_ID.."sg:self"..msg.chat_id,"del")
elseif input[2] == "فارسی" then
base:set(TD_ID.."sg:farsi"..msg.chat_id,"del")
elseif input[2] == "انگلیسی" then
base:set(TD_ID.."sg:english"..msg.chat_id,"del")
elseif input[2] == "اینلاین" then
base:set(TD_ID.."sg:inline"..msg.chat_id,"del")
elseif input[2] == "فیلم" then
base:set(TD_ID.."sg:film"..msg.chat_id,"del")
elseif input[2] == "منشن" then
base:set(TD_ID.."sg:mention"..msg.chat_id,"del")
elseif input[2] == "ادیت" then
base:set(TD_ID.."sg:edit"..msg.chat_id,"del")
elseif input[2] == "منشن" then
base:set(TD_ID.."sg:mention"..msg.chat_id,"del")
elseif input[2] == "ربات" then
base:set(TD_ID.."sg:bot"..msg.chat_id,"del")
elseif input[2] == "هایپرلینک" then
base:set(TD_ID.."sg:hyper"..msg.chat_id,"del")
elseif input[2] == "وب لینک" then
base:set(TD_ID.."sg:weblink"..msg.chat_id,"del")
elseif input[2] == "فونت" then
base:set(TD_ID.."sg:font"..msg.chat_id,"del")
elseif input[2] == "مخاطب" then
base:set(TD_ID.."sg:contact"..msg.chat_id,"del")
elseif input[2] == "کپشن" then
base:set(TD_ID.."sg:caption"..msg.chat_id,"del")
elseif input[2] == "استیکرمتحرک" then
base:set(TD_ID.."sg:stickers"..msg.chat_id,"del")
elseif input[2] == "ربات" then
base:set(TD_ID.."sg:bot"..msg.chat_id,"del")
elseif input[2] == "لینک بیو" then
base:set(TD_ID.."sg:biolink"..msg.chat_id,"del")
elseif input[2] == "بدافزار" then
base:set(TD_ID.."sg:malware"..msg.chat_id,"del")
elseif input[2] == "پست" then
base:set(TD_ID.."sg:post"..msg.chat_id,"del")
elseif input[2] == "فایل" then
base:set(TD_ID.."sg:file"..msg.chat_id,"del")
end
end
-------------------------
if Ramin and (Ramin:match('^بازکردن (.*)') or Ramin:match('^باز کردن (.*)')) and is_JoinChannel(msg) then
local input = {string.match(Ramin, "^(بازکردن) (.*)$")} or {string.match(Ramin, "^(باز کردن) (.*)$")}
if input[2] == "لینک" then
base:del(TD_ID.."sg:link"..msg.chat_id)
elseif input[2] == "متن" then
base:del(TD_ID.."sg:txt"..msg.chat_id)
elseif input[2] == "ویرایش" then
base:del(TD_ID.."sg:edit"..msg.chat_id)
elseif input[2] == "تگ" or input[2] == "هشتگ" then
base:del(TD_ID.."sg:tag"..msg.chat_id)
elseif input[2] == "فوروارد" then
base:del(TD_ID.."sg:fwd"..msg.chat_id)
elseif input[2] == "یوزرنیم" then
base:del(TD_ID.."sg:user"..msg.chat_id)
elseif input[2] == "اینلاین" then
base:del(TD_ID.."sg:inline"..msg.chat_id)
elseif input[2] == "مکان" then
base:del(TD_ID.."sg:loc"..msg.chat_id)
elseif input[2] == "استیکر" then
base:del(TD_ID.."sg:sticker"..msg.chat_id)
elseif input[2] == "گیف" then
base:del(TD_ID.."sg:gif"..msg.chat_id)
elseif input[2] == "ویس" then
base:del(TD_ID.."sg:voice"..msg.chat_id)
elseif input[2] == "موزیک" then
base:del(TD_ID.."sg:music"..msg.chat_id)
elseif input[2] == "بازی" then
base:del(TD_ID.."sg:game"..msg.chat_id)
elseif input[2] == "عکس" then
base:del(TD_ID.."sg:photo"..msg.chat_id)
elseif input[2] == "ویدیو سلفی" then
base:del(TD_ID.."sg:self"..msg.chat_id)
elseif input[2] == "فارسی" then
base:del(TD_ID.."sg:farsi"..msg.chat_id)
elseif input[2] == "انگلیسی" then
base:del(TD_ID.."sg:english"..msg.chat_id)
elseif input[2] == "اینلاین" then
base:del(TD_ID.."sg:inline"..msg.chat_id)
elseif input[2] == "فیلم" then
base:del(TD_ID.."sg:film"..msg.chat_id)
elseif input[2] == "منشن" then
base:del(TD_ID.."sg:mention"..msg.chat_id)
elseif input[2] == "ادیت" then
base:del(TD_ID.."sg:edit"..msg.chat_id)
elseif input[2] == "منشن" then
base:del(TD_ID.."sg:mention"..msg.chat_id)
elseif input[2] == "ربات" then
base:del(TD_ID.."sg:bot"..msg.chat_id)
elseif input[2] == "هایپرلینک" then
base:del(TD_ID.."sg:hyper"..msg.chat_id)
elseif input[2] == "وب لینک" then
base:del(TD_ID.."sg:weblink"..msg.chat_id)
elseif input[2] == "فونت" then
base:del(TD_ID.."sg:font"..msg.chat_id)
elseif input[2] == "مخاطب" then
base:del(TD_ID.."sg:contact"..msg.chat_id)
elseif input[2] == "کپشن" then
base:del(TD_ID.."sg:caption"..msg.chat_id)
elseif input[2] == "استیکرمتحرک" then
base:del(TD_ID.."sg:stickers"..msg.chat_id)
elseif input[2] == "ربات" then
base:del(TD_ID.."sg:bot"..msg.chat_id)
elseif input[2] == "لینک بیو" then
base:del(TD_ID.."sg:biolink"..msg.chat_id)
elseif input[2] == "بدافزار" then
base:del(TD_ID.."sg:malware"..msg.chat_id)
elseif input[2] == "پست" then
base:del(TD_ID.."sg:post"..msg.chat_id)
elseif input[2] == "فایل" then
base:del(TD_ID.."sg:file"..msg.chat_id)
base:del(TD_ID.."Del:Spam"..msg.chat_id)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Mute:Spam')
base:srem(TD_ID..'Gp:'..msg.chat_id,'Ban:Spam')
base:srem(TD_ID..'Gp:'..msg.chat_id,'Warn:Spam')
base:srem(TD_ID..'Gp:'..msg.chat_id,'Silent:Spam')
base:srem(TD_ID..'Gp:'..msg.chat_id,'Kick:Spam')
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Spam')
end
end
----------------------
if Ramin and (Ramin:match('^locklink (%d+)[hms]') or Ramin:match('^حذف لینک (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^locklink (%d+)[hms]') or Ramin:match('^حذف لینک (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimelink:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Link')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل لینک تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال لینک تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
---------------------------
if Ramin and (Ramin:match('^locksticker (%d+)[hms]') or Ramin:match('^حذف استیکر (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^locksticker (%d+)[hms]') or Ramin:match('^حذف استیکر (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimesticker:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Sticker')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل استیکر تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال استیکر تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----------------------------
if Ramin and (Ramin:match('^lockphoto (%d+)[hms]') or Ramin:match('^حذف عکس (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockphoto (%d+)[hms]') or Ramin:match('^حذف عکس (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimephoto:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Photo')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل عکس تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال عکس تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----------------------------
if Ramin and (Ramin:match('^lockself (%d+)[hms]') or Ramin:match('^حذف فیلم سلفی (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockself (%d+)[hms]') or Ramin:match('^حذف فیلم سلفی (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimeself:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Videomsg')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل فیلم سلفی تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال فیلم سلفی تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
if Ramin and (Ramin:match('^lockusername (%d+)[hms]') or Ramin:match('^حذف یوزنیم (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockusername (%d+)[hms]') or Ramin:match('^حذف یوزنیم (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimeusername:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Username')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل یوزرنیم تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال یوزرنیم تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
if Ramin and (Ramin:match('^locktag (%d+)[hms]') or Ramin:match('^حذف هشتگ (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^locktag (%d+)[hms]') or Ramin:match('^حذف هشتگ (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimetag:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Username')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل هشتگ تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال هشتگ تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----------------------------
if Ramin and (Ramin:match('^lockfarsi (%d+)[hms]') or Ramin:match('^حذف چت فارسی (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockfarsi (%d+)[hms]') or Ramin:match('^حذف چت فارسی (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimefarsi:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Persian')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل چت فارسی تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال چت فارسی تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
if Ramin and (Ramin:match('^lockenglish (%d+)[hms]') or Ramin:match('^حذف چت انگلیسی (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockenglish (%d+)[hms]') or Ramin:match('^حذف چت انگلیسی (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimeenglish:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:English')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل چت انگلیسی تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال چت انگلیسی تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end

if Ramin and (Ramin:match('^lockmention (%d+)[hms]') or Ramin:match('^حذف منشن (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockmention (%d+)[hms]') or Ramin:match('^حذف منشن (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimemention:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Mention')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل منشن تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال منشن تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
-----locktimedoc
if Ramin and (Ramin:match('^lockfile (%d+)[hms]') or Ramin:match('^حذف فایل (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockfile (%d+)[hms]') or Ramin:match('^حذف فایل (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimedoc:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Document')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل فایل تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال فایل تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----locktimeforward
if Ramin and (Ramin:match('^lockforward (%d+)[hms]') or Ramin:match('^حذف فوروارد (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockforward (%d+)[hms]') or Ramin:match('^حذف فوروارد (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimeforward:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Forward')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل فوروارد تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال فوروارد تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----locktimevideo
if Ramin and (Ramin:match('^lockfilm (%d+)[hms]') or Ramin:match('^حذف فیلم (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockfilm (%d+)[hms]') or Ramin:match('^حذف فیلم (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimevideo:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Video')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل فیلم تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال فیلم تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----locktimemusic
if Ramin and (Ramin:match('^lockmusic (%d+)[hms]') or Ramin:match('^حذف موزیک (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockmusic (%d+)[hms]') or Ramin:match('^حذف موزیک (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimemusic:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Audio')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل موزیک تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال موزیک تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----locktimegif
if Ramin and (Ramin:match('^lockgif (%d+)[hms]') or Ramin:match('^حذف گیف (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockgif (%d+)[hms]') or Ramin:match('^حذف گیف (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimegif:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Gif')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل گیف تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال گیف تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----locktimevoice
if Ramin and (Ramin:match('^lockvoice (%d+)[hms]') or Ramin:match('^حذف ویس (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockvoice (%d+)[hms]') or Ramin:match('^حذف ویس (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimevoice:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Contact')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل ویس تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال ویس تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
---locktimecontact
if Ramin and (Ramin:match('^lockcontact (%d+)[hms]') or Ramin:match('^حذف شماره (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockcontact (%d+)[hms]') or Ramin:match('^حذف شماره (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimecontact:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Contact')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل مخاطب تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال شمارہ مخاطب تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
---locktimetext
if Ramin and (Ramin:match('^locktext (%d+)[hms]') or Ramin:match('^حذف متن (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^locktext (%d+)[hms]') or Ramin:match('^حذف متن (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimetext:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Text')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل متن تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال متن تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
----locktimestickers
if Ramin and (Ramin:match('^lockstickes (%d+)[hms]') or Ramin:match('^حذف استیکر متحرک (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^lockstickes (%d+)[hms]') or Ramin:match('^حذف استیکر متحرک (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'locktimestickers:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp:'..msg.chat_id,'Del:Stickers')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• واکنش قفل استیکرمتحرک تغییر کرد به زمانی  : *'..th..'* '..t..'\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• در صورت ارسال استیکر متحرک تامدت زمان تنظیم شدہ پاک خواهد شد!  ','md')
end
GetUser(bd,name)
end
------------------------------
if Ramin and (Ramin:match('^welcometime (%d+)[hms]') or Ramin:match('^خوش امدگویی (%d+)[سدث]')) and is_JoinChannel(msg) then
local num = Ramin:match('^welcometime (%d+)[hms]') or Ramin:match('^خوش امدگویی (%d+)[سدث]')
if Ramin and (Ramin:match('(%d+)h') or Ramin:match('(%d+)س')) then
time_match = Ramin:match('(%d+)h') or Ramin:match('(%d+)س')
time = time_match * 3600
th = time / 3600
t = 'ساعت'
end
if Ramin and (Ramin:match('(%d+)m') or Ramin:match('(%d+)د')) then
time_match = Ramin:match('(%d+)m') or Ramin:match('(%d+)د')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
if Ramin and (Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')) then
time_match = Ramin:match('(%d+)s') or Ramin:match('(%d+)ث')
time = time_match
th = time * 1
t = 'ثانیه'
end
local hash = TD_ID..'welcometime:'..msg.chat_id
base:setex(hash, tonumber(time), true)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Welcomeon')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(msg.chat_id,msg.id,'• قفل خوش آمدگویی فعال شد به مدت  : *'..th..'* '..t..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• توسط :['..name..'](tg://user?id='..msg.sender_user_id..') ≃ *'..msg.sender_user_id..'*','md')
end
GetUser(bd,name)
end

if (Ramin == 'cbm on' or Ramin == 'پاکسازی پیام ربات فعال')  and is_JoinChannel(msg) then
local timecgms = base:get(TD_ID..'cbmtime:'..msg.chat_id) or 20
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'cbmon') then
send(msg.chat_id,msg.id,'• پاکسازی خودکار از قبل فعال بود\n\n• زمان : *'..timecgms..'*','md')
else
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'cbmon')
send(msg.chat_id,msg.id,'• پاکسازی خودکار پیام های ربات فعال شد...!\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• زمان پاکسازی خودکار هر *'..timecgms..'* ثانیه یکبار است.','md')
end
end
if (Ramin == 'cbm off' or Ramin == 'پاکسازی پیام ربات غیرفعال')  and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'cbmon') then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'cbmon')
send(msg.chat_id,msg.id,'• پاکسازی خودکار پیام های ربات غیرفعال شد.!','md')
else
send(msg.chat_id,msg.id,'• پاکسازی خودکار پیام های ربات غیرفعال بود.!','md')
end
end
--------------
if (Ramin == 'mutemedia' or Ramin == 'سکوت رسانه' or Ramin == 'خفه رسانه') and tonumber(msg.reply_to_message_id) ~= 0 and is_JoinChannel(msg) and is_ModMute(msg) then
function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function name(ramin,alpha)
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربر  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
else
dofile('./Alpha/time.lua')
local irantime = os.date('%X', os.time()+2.5*60*60)
local shamsidate = os.date("%Y/%m/%d",os.time()+2.5*60*60)
local daysweek = os.date('%A',os.time()+2.5*60*60)
local monthiran = os.date('%B',os.time()+2.5*60*60)
local daysweek = daysweek:gsub("Saturday", " شنبه ")
local daysweek = daysweek:gsub("Sunday", " یکشنبه ")
local daysweek = daysweek:gsub("Monday", " دوشنبه")
local daysweek = daysweek:gsub("Tuesday", " سه شنبه ")
local daysweek = daysweek:gsub("Wednesday", " چهارشنبه ")
local daysweek = daysweek:gsub("Thursday", " پنچ شنبه ")
local daysweek = daysweek:gsub(" Friday", " جمعه ")
MuteMedia(msg.chat_id,user)
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,user)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف سکوت ◈',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..user..'"> '..Mention..'</a> '
text = "◈ ارسال گزارش سکوت کردن کاربر از رسانه ها\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..user.."  در گروه "..gp.." توسط "..username.." سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه حذف سکوت کاربر از لیست سکوت خارج کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'MuteMediaList:'..msg.chat_id,user) then
base:zincrby(TD_ID..'bot:mute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmute1:') then
txtt1 = ''..base:get(TD_ID..'Text:editmute1:')..''
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..Mention.."](tg://user?id="..user..") از قبل در لیست سکوت رسانه ها می باشد.", 0, "md")
end
else
if base:get(TD_ID..'Text:editmute:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmute:')..''
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:sadd(TD_ID..'MuteMediaList:'..msg.chat_id,user)
base:set(TD_ID..'daymute:'..chat..user,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..Mention.."](tg://user?id="..user..") در گروه سکوت رسانه شد.", 0, "md")
base:sadd(TD_ID..'MuteMediaList:'..msg.chat_id,user)
base:set(TD_ID..'daymute:'..chat..user,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
end
end
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end
if ALPHAent and (Ramin:match('^mutemedia (.*)') or Ramin:match('^سکوت رسانه (.*)')) or Ramin and (Ramin:match('^mutemedia @(.*)') or Ramin:match('^سکوت رسانه @(.*)') or Ramin:match('^mutemedia (%d+)$') or Ramin:match('^سکوت رسانه (%d+)$')) and is_JoinChannel(msg) and is_ModMute(msg) then
local BDSource = Ramin:match('^mutemedia (.*)') or Ramin:match('^سکوت رسانه (.*)')
function BD_mute(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^mutemedia @(.*)') or Ramin:match('^سکوت رسانه @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^mutemedia (%d+)') or Ramin:match('^سکوت رسانه (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^mutemedia (.*)') or Ramin:match('^سکوت رسانه (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(Ramin) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,Ramin) then
send(chat,msg.id,"◈* کاربر  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,Ramin) then
send(chat,msg.id,"◈*کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
else
dofile('./Alpha/time.lua')
local irantime = os.date('%X', os.time()+2.5*60*60)
local shamsidate = os.date("%Y/%m/%d",os.time()+2.5*60*60)
local daysweek = os.date('%A',os.time()+2.5*60*60)
local monthiran = os.date('%B',os.time()+2.5*60*60)
local daysweek = daysweek:gsub("Saturday", " شنبه ")
local daysweek = daysweek:gsub("Sunday", " یکشنبه ")
local daysweek = daysweek:gsub("Monday", " دوشنبه")
local daysweek = daysweek:gsub("Tuesday", " سه شنبه ")
local daysweek = daysweek:gsub("Wednesday", " چهارشنبه ")
local daysweek = daysweek:gsub("Thursday", " پنچ شنبه ")
local daysweek = daysweek:gsub(" Friday", " جمعه ")
MuteUser(msg.chat_id,Ramin,0)
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,Ramin)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف سکوت ◈',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..Ramin..'"> '..BDSource..'</a> '
text = "◈ ارسال گزارش سکوت کردن کاربر از رسانه ها\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..Ramin.."  در گروه "..gp.." توسط "..username.." سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه حذف سکوت کاربر از لیست سکوت خارج کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'MuteList:'..msg.chat_id,Ramin) then
base:zincrby(TD_ID..'bot:mute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmute1:') then
txtt1 = ''..base:get(TD_ID..'Text:editmute1:')..''
local txtt1 = replace(txtt1,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..BDSource.."](tg://user?id="..Ramin..") از قبل در لیست سکوت رسانه ها می باشد.", 0, "md")
end
else
if base:get(TD_ID..'Text:editmute:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmute:')..''
local txtt1 = replace(txtt1,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:sadd(TD_ID..'MuteList:'..msg.chat_id,Ramin)
base:set(TD_ID..'daymute:'..chat..Ramin,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
else
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..BDSource.."](tg://user?id="..Ramin..") در گروه سکوت رسانه شد.", 0, "md")
base:sadd(TD_ID..'MuteList:'..msg.chat_id,Ramin)
base:set(TD_ID..'daymute:'..chat..Ramin,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
end
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_mute)
end

if (Ramin == 'unmutemedia' or Ramin == 'رفع سکوت رسانه' or Ramin == 'حذف سکوت رسانه') and tonumber(msg.reply_to_message_id) ~= 0 and is_JoinChannel(msg) and is_ModMute(msg) then
function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
UnRes(msg.chat_id,user)
dofile('./Alpha/time.lua')
local irantime = os.date('%X', os.time()+2.5*60*60)
local shamsidate = os.date("%Y/%m/%d",os.time()+2.5*60*60)
local daysweek = os.date('%A',os.time()+2.5*60*60)
local monthiran = os.date('%B',os.time()+2.5*60*60)
local daysweek = daysweek:gsub("Saturday", " شنبه ")
local daysweek = daysweek:gsub("Sunday", " یکشنبه ")
local daysweek = daysweek:gsub("Monday", " دوشنبه")
local daysweek = daysweek:gsub("Tuesday", " سه شنبه ")
local daysweek = daysweek:gsub("Wednesday", " چهارشنبه ")
local daysweek = daysweek:gsub("Thursday", " پنچ شنبه ")
local daysweek = daysweek:gsub(" Friday", " جمعه ")
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,user)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سکوت کاربر ◈',callback_data = 'Alphr:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..user..'"> '..name..'</a> '
text = "◈ ارسال گزارش حذف سکوت کردن کاربر  از رسانه ها\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..user.."  در گروه "..gp.." توسط "..username.." حذف سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه سکوت کاربر به لیست سکوت شده ها اضافه کنید."
send_inline(v,text,keyboard,'html')
end
end

if base:sismember(TD_ID..'MuteMediaList:'..msg.chat_id,user) then
base:zincrby(TD_ID..'bot:unmute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if base:get(TD_ID..'Text:editmuterem1:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmuterem1:')..''
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:srem(TD_ID..'SilentList:'..msg.chat_id,user)
base:srem(TD_ID..'MuteMediaList:'..msg.chat_id,user)
base:del(TD_ID..'daymute:'..chat..user)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر ["..Mention.."](tg://user?id="..user..") از لیست سکوت رسانه ها حذف شد.", 0, "md")
base:srem(TD_ID..'SilentList:'..msg.chat_id,user)
base:srem(TD_ID..'MuteMediaList:'..msg.chat_id,user)
base:del(TD_ID..'daymute:'..chat..user)

end
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if base:get(TD_ID..'Text:editmuterem:')  then
txtt = ''..base:get(TD_ID..'Text:editmuterem:')..''
local txtt = replace(txtt,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0, txtt, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..Mention.."](tg://user?id="..user..") در لیست سکوت رسانه ها نمی باشد.", 0, "md")
end
end
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end
if ALPHAent and (Ramin:match('^unmutemedia (.*)') or Ramin:match('^حذف سکوت رسانه (.*)')) or Ramin and (Ramin:match('^unmutemedia @(.*)') or Ramin:match('^حذف سکوت رسانه @(.*)') or Ramin:match('^حذف سکوت رسانه @(.*)') or Ramin:match('^unmutemedia (%d+)$') or Ramin:match('^حذف سکوت رسانه (%d+)$') or Ramin:match('^حذف سکوت رسانه (%d+)$')) and is_ModMute(msg) and is_JoinChannel(msg) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local BDSource = Ramin:match('^unmutemedia (.*)') or Ramin:match('^حذف سکوت رسانه (.*)')
function BD_unmute(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^unmutemedia @(.*)') or Ramin:match('^حذف سکوت رسانه @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^unmutemedia (%d+)') or Ramin:match('^حذف سکوت رسانه (%d+)')  then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^unmutemedia (.*)') or Ramin:match('^حذف سکوت رسانه (.*)')  then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
dofile('./Alpha/time.lua')
local irantime = os.date('%X', os.time()+2.5*60*60)
local shamsidate = os.date("%Y/%m/%d",os.time()+2.5*60*60)
local daysweek = os.date('%A',os.time()+2.5*60*60)
local monthiran = os.date('%B',os.time()+2.5*60*60)
local daysweek = daysweek:gsub("Saturday", " شنبه ")
local daysweek = daysweek:gsub("Sunday", " یکشنبه ")
local daysweek = daysweek:gsub("Monday", " دوشنبه")
local daysweek = daysweek:gsub("Tuesday", " سه شنبه ")
local daysweek = daysweek:gsub("Wednesday", " چهارشنبه ")
local daysweek = daysweek:gsub("Thursday", " پنچ شنبه ")
local daysweek = daysweek:gsub(" Friday", " جمعه ")
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,Ramin)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سکوت کاربر ◈',callback_data = 'Alphr:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..Ramin..'"> '..BDSource..'</a> '
text = "◈ ارسال گزارش حذف سکوت کردن کاربر  از رسانه ها\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..Ramin.."  در گروه "..gp.." توسط "..username.." حذف سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه سکوت کاربر به لیست سکوت شده ها اضافه کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'MuteMediaList:'..msg.chat_id,Ramin) then
base:zincrby(TD_ID..'bot:unmute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmuterem1:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmuterem1:')..''
local txtt1 = replace(txtt1,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
UnRes(msg.chat_id,Ramin)
base:del(TD_ID..'daymute:'..chat..Ramin)
base:srem(TD_ID..'SilentList:'..msg.chat_id,Ramin)
base:srem(TD_ID..'MuteMediaList:'..msg.chat_id,Ramin)
else
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر [["..BDSource.."](tg://user?id="..Ramin..") از لیست سکوت رسانه ها حذف شد.", 0, "md")
UnRes(msg.chat_id,Ramin)
base:del(TD_ID..'daymute:'..chat..Ramin)
base:srem(TD_ID..'SilentList:'..msg.chat_id,Ramin)
base:srem(TD_ID..'MuteMediaList:'..msg.chat_id,Ramin)
base:zincrby(TD_ID..'bot:unmute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
else
if base:get(TD_ID..'Text:editmuterem:')  then
txtt = ''..base:get(TD_ID..'Text:editmuterem:')..''
local txtt = replace(txtt,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0, txtt, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..BDSource.."](tg://user?id="..Ramin..") در لیست سکوت رسانه ها نمی باشد.", 0, "md")
end
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_unmute)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end


--<><><>Mute
if (Ramin == 'mute' or Ramin == 'سکوت' or Ramin == 'خفه') and tonumber(msg.reply_to_message_id) ~= 0 and is_JoinChannel(msg) and is_ModMute(msg) then
function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function name(ramin,alpha)
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربر  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربر*  ["..Mention.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
else
if base:get(TD_ID.."mute_stats"..msg.chat_id) == "mutetime" then
local ex = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatmute = 'سکوت شد به مدت '..Time_..''
MuteUser(msg.chat_id,user,msg.date+ex)
else
hallatmute = 'سکوت شد.'
MuteUser(msg.chat_id,user,0)
end
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,user)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف سکوت ◈',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..user..'"> '..Mention..'</a> '
text = "◈ ارسال گزارش سکوت کردن کاربر\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..user.."  در گروه "..gp.." توسط "..username.." سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه حذف سکوت کاربر از لیست سکوت خارج کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'MuteList:'..msg.chat_id,user) then
base:zincrby(TD_ID..'bot:mute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmute1:') then
txtt1 = ''..base:get(TD_ID..'Text:editmute1:')..''
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..Mention.."](tg://user?id="..user..") سکوت می باشد.", 0, "md")
end
else
if base:get(TD_ID..'Text:editmute:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmute:')..''
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
base:set(TD_ID..'daymute:'..chat..user,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..Mention.."](tg://user?id="..user..") "..hallatmute.."", 0, "md")
base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
base:set(TD_ID..'daymute:'..chat..user,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
end
end
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end

if ALPHAent and (Ramin:match('^mute (.*)') or Ramin:match('^سکوت (.*)')) or Ramin and (Ramin:match('^mute @(.*)') or Ramin:match('^سکوت @(.*)') or Ramin:match('^mute (%d+)$') or Ramin:match('^سکوت (%d+)$')) and is_JoinChannel(msg) and is_ModMute(msg) then
local BDSource = Ramin:match('^mute (.*)') or Ramin:match('^سکوت (.*)')
function BD_mute(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^mute @(.*)') or Ramin:match('^سکوت @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^mute (%d+)') or Ramin:match('^سکوت (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^mute (.*)') or Ramin:match('^سکوت (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(Ramin) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,Ramin) then
send(chat,msg.id,"◈* کاربر  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,Ramin) then
send(chat,msg.id,"◈*کاربر*  ["..BDSource.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به سکوت کردن این کاربر را ندارید !*","md")
else
if base:get(TD_ID.."mute_stats"..msg.chat_id) == "mutetime" then
local ex = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatmute = 'سکوت شد به مدت '..Time_..''
MuteUser(msg.chat_id,Ramin,msg.date+ex)
else
hallatmute = 'سکوت شد.'
MuteUser(msg.chat_id,Ramin,0)
end
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,Ramin)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف سکوت ◈',callback_data = 'Alphm:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..Ramin..'"> '..BDSource..'</a> '
text = "◈ ارسال گزارش سکوت کردن کاربر\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..Ramin.."  در گروه "..gp.." توسط "..username.." سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه حذف سکوت کاربر از لیست سکوت خارج کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'MuteList:'..msg.chat_id,Ramin) then
base:zincrby(TD_ID..'bot:mute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmute1:') then
txtt1 = ''..base:get(TD_ID..'Text:editmute1:')..''
local txtt1 = replace(txtt1,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..BDSource.."](tg://user?id="..Ramin..") سکوت می باشد.", 0, "md")
end
else
if base:get(TD_ID..'Text:editmute:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmute:')..''
local txtt1 = replace(txtt1,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:sadd(TD_ID..'MuteList:'..msg.chat_id,Ramin)
base:set(TD_ID..'daymute:'..chat..Ramin,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
else
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..BDSource.."](tg://user?id="..Ramin..") سکوت شد.", 0, "md")
base:sadd(TD_ID..'MuteList:'..msg.chat_id,Ramin)
base:set(TD_ID..'daymute:'..chat..Ramin,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
end
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_mute)
end
--<><><>UnMute
if (Ramin == 'unmute' or Ramin == 'رفع سکوت' or Ramin == 'حذف سکوت') and tonumber(msg.reply_to_message_id) ~= 0 and is_JoinChannel(msg) and is_ModMute(msg) then
function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
UnRes(msg.chat_id,user)
base:set(TD_ID.."ToshFormid3"..msg.chat_id ,user)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سکوت کاربر ◈',callback_data = 'Alphr:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..user..'"> '..name..'</a> '
text = "◈ ارسال گزارش حذف سکوت کاربر\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..user.."  در گروه "..gp.." توسط "..username.." حذف سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه سکوت کاربر به لیست سکوت شده ها اضافه کنید."
send_inline(v,text,keyboard,'html')
end
end

if base:sismember(TD_ID..'MuteList:'..msg.chat_id,user) then
base:zincrby(TD_ID..'bot:unmute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if base:get(TD_ID..'Text:editmuterem1:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmuterem1:')..''
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:srem(TD_ID..'SilentList:'..msg.chat_id,user)
base:srem(TD_ID..'MuteList:'..msg.chat_id,user)
base:del(TD_ID..'daymute:'..chat..user)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر ["..Mention.."](tg://user?id="..user..") حذف سکوت شد.", 0, "md")
base:srem(TD_ID..'SilentList:'..msg.chat_id,user)
base:srem(TD_ID..'MuteList:'..msg.chat_id,user)
base:del(TD_ID..'daymute:'..chat..user)

end
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if base:get(TD_ID..'Text:editmuterem:')  then
txtt = ''..base:get(TD_ID..'Text:editmuterem:')..''
local txtt = replace(txtt,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0, txtt, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..Mention.."](tg://user?id="..user..") سکوت نمی باشد.", 0, "md")
end
end
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end
if ALPHAent and (Ramin:match('^unmute (.*)') or Ramin:match('^رفع سکوت (.*)') or Ramin:match('^حذف سکوت (.*)')) or Ramin and (Ramin:match('^unmute @(.*)') or Ramin:match('^رفع سکوت @(.*)') or Ramin:match('^حذف سکوت @(.*)') or Ramin:match('^unmute (%d+)$') or Ramin:match('^رفع سکوت (%d+)$') or Ramin:match('^حذف سکوت (%d+)$')) and is_ModMute(msg) and is_JoinChannel(msg) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local BDSource = Ramin:match('^unmute (.*)') or Ramin:match('^رفع سکوت (.*)') or Ramin:match('^حذف سکوت (.*)')
function BD_unmute(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^unmute @(.*)') or Ramin:match('^رفع سکوت @(.*)') or Ramin:match('^حذف سکوت @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^unmute (%d+)') or Ramin:match('^رفع سکوت (%d+)') or Ramin:match('^حذف سکوت (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^unmute (.*)') or Ramin:match('^رفع سکوت (.*)') or Ramin:match('^حذف سکوت (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then

base:set(TD_ID.."ToshFormid3"..msg.chat_id ,Ramin)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ سکوت کاربر ◈',callback_data = 'Alphr:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..Ramin..'"> '..BDSource..'</a> '
text = "◈ ارسال گزارش حذف سکوت کاربر\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..Ramin.."  در گروه "..gp.." توسط "..username.." حذف سکوت شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه سکوت کاربر به لیست سکوت شده ها اضافه کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'MuteList:'..msg.chat_id,Ramin) then
base:zincrby(TD_ID..'bot:unmute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmuterem1:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmuterem1:')..''
local txtt1 = replace(txtt1,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
UnRes(msg.chat_id,Ramin)
base:del(TD_ID..'daymute:'..chat..Ramin)
base:srem(TD_ID..'SilentList:'..msg.chat_id,Ramin)
base:srem(TD_ID..'MuteList:'..msg.chat_id,Ramin)
else
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر [["..BDSource.."](tg://user?id="..Ramin..") حذف سکوت شد.", 0, "md")
UnRes(msg.chat_id,Ramin)
base:del(TD_ID..'daymute:'..chat..Ramin)
base:srem(TD_ID..'SilentList:'..msg.chat_id,Ramin)
base:srem(TD_ID..'MuteList:'..msg.chat_id,Ramin)
base:zincrby(TD_ID..'bot:unmute:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
else
if base:get(TD_ID..'Text:editmuterem:')  then
txtt = ''..base:get(TD_ID..'Text:editmuterem:')..''
local txtt = replace(txtt,"user","["..BDSource.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0, txtt, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..BDSource.."](tg://user?id="..Ramin..") سکوت نمی باشد.", 0, "md")
end
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_unmute)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end

if Ramin and (Ramin:match('^([Ss]etforce) (.*)$') or Ramin:match('^(وضعیت افزودن اجباری) (.*)$')) then
local Ramin = Ramin:gsub("وضعیت افزودن اجباری", "setforce")
local status = {string.match(Ramin, "^([Ss]etforce) (.*)$")}
if status[2] == 'new user' or status[2] == 'جدید' then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'force_NewUser')
send(msg.chat_id,msg.id,'• وضعیت افزودن اجباری برای کاربران جدید فعال شد\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• از این پس کاربران جدید باید به تعداد دلخواه شما ممبر به گروہ اضافه کنند تا بتوانند پیام ارسال کنند!','md')
end
if status[2] == 'all user' or status[2] == 'همه' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'force_NewUser')
send(msg.chat_id,msg.id,'• وضعیت افزودن اجباری برای همه کاربران فعال شد','md')
end
end
if Ramin and  Ramin:match('^سکوت (%d+)[دقیقه]') and is_JoinChannel(msg) then
local num =  Ramin:match('^سکوت (%d+)[دقیقه]')
if Ramin and  Ramin:match('(%d+)دقیقه') then
time_match = Ramin:match('(%d+)دقیقه')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
base:set(TD_ID..'mutealpha:'..msg.chat_id,time)
local function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if VipUser(msg,user) then
send(msg.chat_id,msg.id,"⚠️ خطای دستوری\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• کاربر دارای مقام میباشد شما نمیتوانید او را سکوت کنید...!",'md')
else
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
send(chat,msg.id,"• کاربر ["..name.."](tg://user?id="..user..") سکوت شد به مدت  *"..th.."* *"..t.."*","md")
MuteUser(msg.chat_id,user,msg.date+time)
--base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
else
sendM(msg.chat_id,user,msg.id,"• کاربر : "..name.." در حالت سکوت قرار نگرفت !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n✖️ ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید سپس مجدد تلاش کنید !",10,utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(user,name)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end

if Ramin and  Ramin:match('^سکوت رسانه (%d+)[دقیقه]') and is_JoinChannel(msg) then
local num =  Ramin:match('^سکوت رسانه (%d+)[دقیقه]')
if Ramin and  Ramin:match('(%d+)دقیقه') then
time_match = Ramin:match('(%d+)دقیقه')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
base:set(TD_ID..'mutealpha:'..msg.chat_id,time)
local function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if VipUser(msg,user) then
send(msg.chat_id,msg.id,"⚠️ خطای دستوری\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• کاربر دارای مقام میباشد شما نمیتوانید او را سکوت کنید...!",'md')
else
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
send(chat,msg.id,"• کاربر ["..name.."](tg://user?id="..user..") سکوت شد به مدت  *"..th.."* *"..t.."*","md")
MuteUser(msg.chat_id,user,msg.date+time)
MuteMediaTime(msg.chat_id,user,msg.date+time)
--base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
else
sendM(msg.chat_id,user,msg.id,"• کاربر : "..name.." در حالت سکوت قرار نگرفت !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n✖️ ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید سپس مجدد تلاش کنید !",10,utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(user,name)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end


if Ramin and  Ramin:match('^مسدود (%d+)[دقیقه]') and is_JoinChannel(msg) then
local num =  Ramin:match('^مسدود (%d+)[دقیقه]')
if Ramin and  Ramin:match('(%d+)دقیقه') then
time_match = Ramin:match('(%d+)دقیقه')
time = time_match * 60
th = time / 60
t = 'دقیقه'
end
base:set(TD_ID..'mutealpha:'..msg.chat_id,time)
local function Restricted(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if VipUser(msg,user) then
send(msg.chat_id,msg.id,"⚠️ خطای دستوری\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• کاربر دارای مقام میباشد شما نمیتوانید او را سکوت کنید...!",'md')
else
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
send(chat,msg.id,"• کاربر ["..name.."](tg://user?id="..user..") مسدود شد به مدت  *"..th.."* *"..t.."*","md")
kickChatMemberTime(msg.chat_id,user,msg.date+time)
--base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
else
sendM(msg.chat_id,user,msg.id,"• کاربر : "..name.." در حالت مسدود قرار نگرفت !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n✖️ ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید سپس مجدد تلاش کنید !",10,utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
GetUser(user,name)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Restricted)
end


if (Ramin == 'clean warnlist' or Ramin == 'پاکسازی لیست اخطار') and is_JoinChannel(msg) then
base:del(TD_ID..''..msg.chat_id..':warn')
send(msg.chat_id, msg.id,'لیست اخطار ها پاکسازی شد','md')
end

if Ramin == 'warnlistauto' or Ramin == 'لیست اخطار خودکار' then
local list = base:smembers(TD_ID..'WarnAdd:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '• لیست اخطار خودکاری خالی می باشد !', 'md')
else
local txt = 'لیست اخطار خودکار :\n\n'
for k,v in pairs(list) do

local usrname = base:get('UserName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'UserName:'..v) or 'none'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..'<b>'..k..'-</b>• نام کاربر:'..username..'\nایدی کاربر:<code>'..v..'</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end



if ALPHAent and (Ramin:match('^unban (.*)') or Ramin:match('^رفع مسدود (.*)') or Ramin:match('^حذف مسدود (.*)')) or Ramin and (Ramin:match('^unban @(.*)') or Ramin:match('^رفع مسدود @(.*)') or Ramin:match('^حذف مسدود @(.*)') or Ramin:match('^unban (%d+)$') or Ramin:match('^حذف مسدود (%d+)$')) and is_JoinChannel(msg) and is_ModBan(msg)  then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local MGuard = Ramin:match('^unban (.*)') or Ramin:match('^رفع مسدود (.*)') or Ramin:match('^حذف مسدود (.*)')
function Raminsal(BlaCk,ALPHA)
local function pro(Rami,mmd)
if not ALPHAent and Ramin:match('^unban @(.*)') or Ramin:match('^رفع مسدود @(.*)') or Ramin:match('^حذف مسدود @(.*)') then
Ram = ALPHA.id
elseif not ALPHAent and Ramin:match('^unban (%d+)') or Ramin:match('^رفع مسدود (%d+)') or Ramin:match('^حذف مسدود (%d+)') then
Ram = MGuard
elseif ALPHAent and Ramin:match('^unban (.*)') or Ramin:match('^رفع مسدود (.*)') or Ramin:match('^حذف مسدود (.*)') then
Ram = msg.content.entities[0].type.user_id
end
if Ram then
for k, v in pairs(mmd.members) do
if tonumber(v.user_id) == tonumber(Ram) then
if Ram then
username = "["..base:get(TD_ID..'FirstName:'..Ram).."](tg://user?id="..Ram..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ram).."](tg://user?id="..Ram..")"
end
UnRes(msg.chat_id,Ram)
reportowner('• کاربر \n '..username..'\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• آزاد گردید !\nتوسط : ['..msg.sender_user_id..'](tg://user?id='..msg.sender_user_id..')')
end
end
if base:sismember(TD_ID..'BanUser:'..msg.chat_id,Ram) then
base:zincrby(TD_ID..'bot:unban:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:BanUser:'..msg.chat_id)
if base:get(TD_ID..'Text:editmuterem1:')  then
txtt1 = ''..base:get(TD_ID..'Text:editmuterem1:')..''
local txtt1 = replace(txtt1,"user","["..MGuard.."](tg://user?id="..Ram..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
UnRes(msg.chat_id,Ram)
base:srem(TD_ID..'BanUser:'..msg.chat_id,Ram)
base:del(TD_ID..'dayban:'..msg.chat_id..Ram)
else
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر [["..MGuard.."](tg://user?id="..Ram..") حذف مسدود شد.", 0, "md")
UnRes(msg.chat_id,Ram)
base:del(TD_ID..'daymute:'..chat..Ram)
base:srem(TD_ID..'BanUser:'..msg.chat_id,Ram)
base:del(TD_ID..'dayban:'..msg.chat_id..Ram)
end
else
if base:get(TD_ID..'Text:editmuterem:')  then
txtt = ''..base:get(TD_ID..'Text:editmuterem:')..''
local txtt = replace(txtt,"user","["..BDSource.."](tg://user?id="..Ram..")")
tdbot.sendMessage(chat, msg.id, 0, txtt, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..MGuard.."](tg://user?id="..Ram..") مسدود نمی باشد.", 0, "md")
end
end
else
send(msg.chat_id, msg.id,'❎  کاربر  با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
getChannelMembers(msg.chat_id,"Banned",0, 100000000000,pro)
end
resolve_username(MGuard,Raminsal)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end



if Ramin == 'abouttime on' or Ramin == 'تایم گروه فعال' and is_JoinChannel(msg) then
base:set(TD_ID..'abouttime:on'..msg.chat_id,true)
send(msg.chat_id, msg.id, '• نمایش ساعت در بیوگرافی گروه فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ازاین به بعد ساعت وتاریخ دربیوگرافی گروه بامتن تنظیم شده نمایش داده می شود.','md')
end
if Ramin == 'abouttime off' or Ramin == 'تایم گروه غیرفعال' then
base:del(TD_ID..'abouttime:on'..msg.chat_id)
base:del(TD_ID..'abcli:'..msg.chat_id)
t = 'قوانین:1.فرستادن لینک ممنوع2.اسپم کردن گروه ممنوع3.رعایت ادب4.احترام به ادمین های گروه'
changeChatDescription(msg.chat_id, t)
send(msg.chat_id, msg.id, '• نمایش ساعت در بیوگرافی گروه فعال شد.','md')
end





if ALPHAent and (Ramin:match('^ban (.*)') or Ramin:match('^مسدود (.*)') or Ramin:match('^بن (.*)')) or Ramin and (Ramin:match('^ban @(.*)') or Ramin:match('^مسدود @(.*)')  or Ramin:match('^بن @(.*)') or Ramin:match('^ban (%d+)$') or Ramin:match('^مسدود (%d+)$') or Ramin:match('^بن (%d+)$')) and is_JoinChannel(msg) and is_ModBan(msg) then
local MrtmAlpha = Ramin:match('^ban (.*)') or Ramin:match('^مسدود (.*)')  or Ramin:match('^بن (.*)')
function BD_Ban(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^ban @(.*)') or Ramin:match('^مسدود @(.*)') or Ramin:match('^بن @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^ban (%d+)') or Ramin:match('^مسدود (%d+)') or Ramin:match('^بن (%d+)') then
Ramin = MrtmAlpha
elseif ALPHAent and Ramin:match('^ban (.*)') or Ramin:match('^مسدود (.*)') or Ramin:match('^بن (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(Ramin) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,Ramin) then
send(chat,msg.id,"◈* کاربر  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,Ramin) then
send(chat,msg.id,"◈*کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
else
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then

base:set(TD_ID.."ToshFormid3"..msg.chat_id ,Ramin)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
base:sadd(TD_ID..'BanUser:'..msg.chat_id,Ramin)
if base:get(TD_ID.."ban_stats"..chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'bantime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'مسدود شد به مدت '..Time_..''
kickChatMemberTime(msg.chat_id,Ramin,msg.date+ex)
else
hallatban = 'مسدود شد!'
KickUser(msg.chat_id,Ramin)
end
base:set(TD_ID..'dayban:'..chat..Ramin,tarikh)
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف مسدود ◈',callback_data = 'BanA:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..Ramin..'"> '..MrtmAlpha..'</a> '
text = "◈ ارسال گزارش مسدود کردن کاربر\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..Ramin.."  در گروه "..gp.." توسط "..username.." مسدود شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه حذف مسدود کاربر از لیست مسدود خارج کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'BanUser:'..msg.chat_id,Ramin) then
if base:get(TD_ID..'Text:editban1:') then
txtt1 = ''..base:get(TD_ID..'Text:editban1:')..''
local txtt1 = replace(txtt1,"user","["..MrtmAlpha.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..MrtmAlpha.."](tg://user?id="..Ramin..") مسدود می باشد.", 0, "md")
end
else
if base:get(TD_ID..'Text:editban:')  then
txtt1 = ''..base:get(TD_ID..'Text:editban:')..''
local txtt1 = replace(txtt1,"user","["..MrtmAlpha.."](tg://user?id="..Ramin..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:sadd(TD_ID..'BanUser:'..msg.chat_id,Ramin)
base:set(TD_ID..'daymute:'..chat..Ramin,tarikh)
else
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..MrtmAlpha.."](tg://user?id="..Ramin..") "..hallatban.."", 0, "md")
if base:get(TD_ID.."ban_stats"..chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'bantime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'مسدود شد به مدت '..Time_..''
kickChatMemberTime(msg.chat_id,Ramin,msg.date+ex)
else
hallatban = 'مسدود شد!'
KickUser(msg.chat_id,Ramin)
end
base:zincrby(TD_ID..'bot:ban:'..chat..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:BanUser:'..chat)
base:sadd(TD_ID..'BanUser:'..msg.chat_id,Ramin)
base:set(TD_ID..'daymute:'..chat..Ramin,tarikh)
end
end
else
send(msg.chat_id,msg.id,"◈*کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..")\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *از گروه مسدود نشد*\n✖️ *ربات به قسمت محرومیت کاربران  دسترسی ندارد* !","md")
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..MrtmAlpha..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(MrtmAlpha,BD_Ban)
end






if (Ramin == 'ban' or Ramin == 'مسدود' or Ramin == 'بن') and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) > 0 and is_ModBan(msg) then
function BanByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function TDname(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربر  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به مسدود کردن این کاربر را ندارید !*","md")
else
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then

base:set(TD_ID.."ToshFormid3"..msg.chat_id ,user)
local tarikh = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
if msg.sender_user_id then
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'FirstName:'..msg.sender_user_id)..'</a>'
else
username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..base:get(TD_ID..'UserName:'..msg.sender_user_id)..'</a>'
end
if reportpv then
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
for k,v in pairs(ownerslist) do
local formidw = base:get(TD_ID.."ToshFormid3"..msg.chat_id)
local keyboard = {}
keyboard.inline_keyboard = {{
{text = '◈ حذف مسدود ◈',callback_data = 'BanA:'..chat_id..':'..formidw..''},
},}
local namee = '<a href="tg://user?id='..user..'"> '..name..'</a> '
text = "◈ ارسال گزارش مسدود کردن کاربر\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◈ کاربر "..namee.." | "..user.."  در گروه "..gp.." توسط "..username.." مسدود شد.\n\n"..tarikh.."\n\n◈ مالک عزیز شما می توانید با لمس کردن دکمه حذف مسدود کاربر از لیست مسدود خارج کنید."
send_inline(v,text,keyboard,'html')
end
end
if base:sismember(TD_ID..'BanUser:'..msg.chat_id,user) then
if base:get(TD_ID..'Text:editban1:') then
txtt1 = ''..base:get(TD_ID..'Text:editban1:')..''
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..Mention.."](tg://user?id="..user..") مسدود می باشد.", 0, "md")
end
else
if base:get(TD_ID..'Text:editban:')  then
txtt1 = ''..base:get(TD_ID..'Text:editban:')..''
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:sadd(TD_ID..'BanUser:'..msg.chat_id,user)
base:set(TD_ID..'daymute:'..chat..user,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
base:zincrby(TD_ID..'bot:ban:'..chat..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:BanUser:'..msg.chat_id)
if base:get(TD_ID.."ban_stats"..chat_id) == "bantime" then
local ex = tonumber(base:get(TD_ID..'bantime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
hallatban = 'مسدود شد به مدت '..Time_..''
kickChatMemberTime(msg.chat_id,user,msg.date+ex)
else
hallatban = 'مسدود شد!'
KickUser(msg.chat_id,user)
end
tdbot.sendMessage(chat, msg.id, 0,"◈ کاربر ["..Mention.."](tg://user?id="..user..") "..hallatban.."", 0, "md")
base:sadd(TD_ID..'BanUser:'..msg.chat_id,user)
base:set(TD_ID..'daymute:'..chat..user,tarikh)
base:incr(TD_ID..'Total:MuteUser:'..msg.chat_id)
end
end
else
send(msg.chat_id,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..user..") | `"..user.."` *از گروہ مسدود نشد*.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n✖️ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*.","md")
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
GetUser(user,TDname)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),BanByReply)
end


if (Ramin == 'unban' or Ramin == 'رفع مسدود' or Ramin == 'حذف مسدود') and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) > 0 and is_ModBan(msg) and is_JoinChannel(msg) then
function UnBan_by_reply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function name(ramin,alpha)
local function pro(Rami,mmd)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
for k, v in pairs(mmd.members) do
if tonumber(v.user_id) == tonumber(user) then
UnRes(msg.chat_id,user)
reportowner('• کاربر  ['..name..'](tg://user?id='..user..') | `'..user..'`\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• از لیست مسدودین حذف شد\nتوسط : ['..msg.sender_user_id..'](tg://user?id='..msg.sender_user_id..')')
end
end
if base:sismember(TD_ID..'BanUser:'..msg.chat_id,user) then
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if base:get(TD_ID..'Text:editbanrem1:')  then
txtt1 = ''..base:get(TD_ID..'Text:editbanrem1:')..''
local txtt1 = replace(txtt1,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0,txtt1, 0, "md")
base:srem(TD_ID..'BanUser:'..msg.chat_id,user)
base:del(TD_ID..'dayban:'..msg.chat_id..user)
UnRes(msg.chat_id,user)
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
tdbot.sendMessage(chat, msg.id, 0,"◆ کاربر ["..Mention.."](tg://user?id="..user..") حذف مسدود شد.", 0, "md")
base:srem(TD_ID..'BanUser:'..msg.chat_id,user)
base:del(TD_ID..'dayban:'..msg.chat_id..user)
UnRes(msg.chat_id,user)
base:zincrby(TD_ID..'bot:unban:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:BanUser:'..msg.chat_id)
end
else
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
if base:get(TD_ID..'Text:editbanrem:')  then
txtt = ''..base:get(TD_ID..'Text:editbanrem:')..''
local txtt = replace(txtt,"user","["..Mention.."](tg://user?id="..user..")")
tdbot.sendMessage(chat, msg.id, 0, txtt, 0, "md")
else
tdbot.sendMessage(chat, msg.id, 0, "◆ کاربر ["..Mention.."](tg://user?id="..user..") مسدود نمی باشد.", 0, "md")
end
end
end
getChannelMembers(msg.chat_id,"Banned",0, 100000000000,pro)
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),UnBan_by_reply)
end
--<><><>Kick
if ALPHAent and (Ramin:match('^kick (.*)') or Ramin:match('^اخراج (.*)')) or Ramin and (Ramin:match('^kick @(.*)') or Ramin:match('^اخراج @(.*)') or Ramin:match('^kick (%d+)$') or Ramin:match('^اخراج (%d+)$')) and is_JoinChannel(msg) and is_ModBan(msg) then
local MrtmAlpha = Ramin:match('^kick (.*)') or Ramin:match('^اخراج (.*)')
function BD_kick(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^kick @(.*)') or Ramin:match('^اخراج @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^kick (%d+)') or Ramin:match('^اخراج (%d+)') then
Ramin = MrtmAlpha
elseif ALPHAent and Ramin:match('^kick (.*)') or Ramin:match('^اخراج (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(Ramin) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ *معاون گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,Ramin) then
send(chat,msg.id,"◈* کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,Ramin) then
send(chat,msg.id,"◈* کاربر  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,Ramin) then
send(chat,msg.id,"◈*کاربر*  ["..MrtmAlpha.."](tg://user?id="..Ramin..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
else
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
KickUser(msg.chat_id,Ramin)
UnRes(msg.chat_id,Ramin)
base:zincrby(TD_ID..'bot:kick:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:KickUser:'..msg.chat_id)
send(msg.chat_id,msg.id,"◈ کاربر ["..MrtmAlpha.."](tg://user?id="..Ramin..") اخراج شد. ","md")
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..MrtmAlpha..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(MrtmAlpha,BD_kick)
end
if (Ramin == 'kick' or Ramin == 'اخراج') and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) > 0 and is_ModBan(msg) then
function kick_by_reply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *سودو ربات می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *مالک گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *معاون گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربر  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂ *ادمین افتخاری گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربر*  ["..name.."](tg://user?id="..user..") \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ◂*عضو ویژه گروه می باشد دسترسی به اخراج کردن این کاربر را ندارید !*","md")
else
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
function name(BlaCk,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
send(chat,msg.id,"◈ کاربر  ["..name.."](tg://user?id="..user..") اخراج شد.","md")
KickUser(msg.chat_id,user)
UnRes(msg.chat_id,user)
base:zincrby(TD_ID..'bot:kick:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:KickUser:'..msg.chat_id)
end
GetUser(user,name)
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),kick_by_reply)
end

if (Ramin == 'clean res' or Ramin == 'پاکسازی لیست محدود') and is_JoinChannel(msg) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local function pro(arg,data)
for k,v in pairs(data.members) do
UnRes(msg.chat_id,v.user_id)
end
end
getChannelMembers(msg.chat_id,"Restricted",0, 100000000000,pro)
send(msg.chat_id,msg.id,'◈ *افراد محدود پاک شدند*.','md')
else
send(msg.chat_id,msg.id,'◈ *ربات به قسمت محرومیت کاربران  دسترسی ندارد*. ','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end
if Ramin and (Ramin:match('^setflood (%d+)$') or Ramin:match('^تعدادفلود (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^setflood (%d+)') or Ramin:match('^تعدادفلود (%d+)')
if tonumber(num) < 2 then
send(msg.chat_id,msg.id,'• عددی بزرگتر از *2* بکار ببرید','md')
else
base:set(TD_ID..'Flood:Max:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• حداکثر پیام مکرر تنظیم شد به : *'..num..'*','md')
end
end
if Ramin and (Ramin:match('^setforcemax (%d+)$') or Ramin:match('^تعدادافزودن اجباری (%d+)$')) then
local num = Ramin:match('^setforcemax (%d+)') or Ramin:match('^تعدادافزودن اجباری (%d+)')
if tonumber(num) < 2 then
send(msg.chat_id,msg.id,'• عددی بزرگتر از *۲* بکار ببرید','md')
else
base:set(TD_ID..'Force:Max:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• حداکثر عضو تنظیم شد به : *'..num..'*','md')
end
end

if Ramin and (Ramin:match('^forcepm (%d+)$') or Ramin:match('^تعداد اخطار افزودن اجباری (%d+)$')) then
local num = Ramin:match('^forcepm (%d+)') or Ramin:match('^تعداد اخطار افزودن اجباری (%d+)')
if tonumber(num) < 2 then
send(msg.chat_id,msg.id,'• عددی بزرگتر از *2* بکار ببرید','md')
else
base:set(TD_ID..'Force:Pm:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'⏰ تعداد اخطار پیام افزودن اجباری تنظیم شد به : *'..num..'* بار','md')
end
end

if Ramin and (Ramin:match('^forclimit (%d+)') or Ramin:match('^تعداد اخطار پیام محدودیت (%d+)')) then
local num = Ramin:match('^forclimit (%d+)') or Ramin:match('^تعداد اخطار پیام محدودیت (%d+)')
if tonumber(num) < 2 then
send(msg.chat_id,msg.id,'• عددی بزرگتر از *2* بکار ببرید','md')
else
base:set(TD_ID..'Force:Pmmsg:'..msg.chat_id,num)
base:set(TD_ID..'Force:Pmst:'..msg.chat_id,num)
base:set(TD_ID..'Force:Pmvoice:'..msg.chat_id,num)
base:set(TD_ID..'Force:Pmmusic:'..msg.chat_id,num)
base:set(TD_ID..'Force:Pmself:'..msg.chat_id,num)
base:set(TD_ID..'Force:Pmfile:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'⏰ تعداد اخطار پیام محدودیت ارسال پیامی تنظیم شد به : *'..num..'* بار','md')
end
end

if Ramin and (Ramin:match('^joinwarn (%d+)$') or Ramin:match('^اخطار جوین اجباری (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^joinwarn (%d+)') or Ramin:match('^اخطار جوین اجباری (%d+)')
base:set(TD_ID..'joinwarn:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• تعداد اخطار جوین اجباری تنظیم شد بر روی : *'..num..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⚠️توجه : به هر کاربر در یک روز حداکثر '..num..' اخطار داده میشود و فردای همان روز باز در صورت ارسال پیام اخطار دریافت خواهد کرد','md')
end
if Ramin and (Ramin:match('^warnmax (%d+)$') or Ramin:match('^حداکثر اخطار (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^warnmax (%d+)') or Ramin:match('^حداکثر اخطار (%d+)')
if tonumber(num) < 2 then
send(msg.chat_id,msg.id,'• عددی بزرگتر از *2* بکار ببرید','md')
else
base:set(TD_ID..'Warn:Max:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• حداکثر اخطار تنظیم شد به *'..num..'*','md')
end
end
if Ramin and (Ramin:match('^setspam (%d+)$') or Ramin:match('^تعدادحروف (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^setspam (%d+)') or Ramin:match('^تعدادحروف (%d+)')
if tonumber(num) < 1 then
send(msg.chat_id,msg.id,'• عددی بزرگتر از *1* بکار ببرید','md')
else
if tonumber(num) > 4096 then
send(msg.chat_id,msg.id,'• عددی کوچکتر از *4096* را بکار ببرید','md')
else
base:set(TD_ID..'NUM_CH_MAX:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• حساسیت به پیام های طولانی تنظیم شد به :*'..num..'*','md')
end
end
end

if Ramin and (Ramin:match('^setfloodtime (%d+)$') or Ramin:match('^زمان فلود (%d+)$')) and is_JoinChannel(msg) then
local num = Ramin:match('^setfloodtime (%d+)') or Ramin:match('^زمان فلود (%d+)')
if tonumber(num) < 2 then
send(msg.chat_id,msg.id,'• زمان برسی باید بیشتر از *1* باشد','md')
else
base:set(TD_ID..'Flood:Time:'..msg.chat_id,num)
send(msg.chat_id,msg.id,'• زمان برسی تنظیم شد به : *'..num..'*','md')
end
end
----------------------------------------------




if Ramin and (Ramin:match('^(.*) گروه ما')) then
local list = base:zrevrange(TD_ID..'bot:msgusr2:'..msg.chat_id..':', 0, 500, 'withscores')
if #list == 0 then
send(msg.chat_id, msg.id, '◈ سیستم در درسترس نیست.  ', 'md')
else
local txt = '🤔 فکر کنم در اینجا اینا '..Ramin..' می باشد  : '
for k,v in pairs(list) do
local min1= math.random (0,20)
local min2= math.random (0,50)
local min3= math.random (0,70)
local min4= math.random (0,100)
local min5= math.random (0,200)
local min6= math.random (0,300)
local min7= math.random (0,400)
local min8= math.random (0,500)
namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == min1 or k == min2 or k == min3 or  k == min4  or  k == min5 or  k == min6 or  k == min7 or  k == min8 then
user_info = "["..namee.."](tg://user?id="..v[1]..")"
txt = ''..txt..'\nᴥ '..user_info..''
end--]]
end
send(msg.chat_id, msg.id, txt, 'md')
end
end



if Ramin == 'آمار ممبرها' then
local list = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ سیستم آمار دردسترسی نیست.  ', 'md')
else
local txt = 'آمار وضعیت ممبرهای گروه تا الان :\n\n'
for k,v in pairs(list) do
local min1= math.random (0,10)
local max1= math.random (11,50)
local min2= math.random (11,50)
local max2= math.random (51,100)
local min3= math.random (101,200)
local max3= math.random (201,300)
if (k > min1) and (k < max1) or (k > min2) and (k < max2) or (k > min3) and (k < max3)   then
local Msg = base:get(TD_ID..'Total:messages:'..msg.chat_id..'') or 0
local Msgs = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date('%Y/%m/%d')..':'..v or 00000000)) or 0
local Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date('%Y/%m/%d')..':'..v or 00000000)) or 0
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
local usrname = base:get('FirstName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'FirstName:'..v) or 'بدون نام'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..''..username..'('..UsStatus..' '..Msgs..')\n'
end--]]
end
send(msg.chat_id, msg.id, txt, 'html')
end
end

if (Ramin == 'tabchires on' or Ramin == 'حالت تبچی محدود فعال') and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'tabchires') then
send(msg.chat_id,msg.id,'• محدودیت تبچی به محض ورود فعال می باشد!' ,'md')
else
send(msg.chat_id,msg.id,'• محدودیت تبچی به محض ورود فعال شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nاین مورد به این صورت هست که کاربری که به محض ورود 5ثانیه داخل گروه سکوت خواهد شد وبعد اتمام زمان آزاد می شود.' ,'md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'tabchires')
end
end
if (Ramin == 'tabchires off' or Ramin == 'حالت تبچی محدود غیرفعال') and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Welcomeongif') then
send(msg.chat_id,msg.id,'• محدودیت تبچی به محض ورودغیر فعال شد. ' ,'md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Welcomeongif')
else
send(msg.chat_id,msg.id,'• محدودیت تبچی به محض ورودغیر فعال بود.' ,'md')
end
end
if (Ramin == 'welcomegp on' or Ramin == 'خوش امدگویی گروه فعال') and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Welcomeon') then
send(msg.chat_id,msg.id,'◈ خوش امدگویی گروه فعال بود.' ,'md')
else
send(msg.chat_id,msg.id,'◈ خوش امدگویی گروه فعال شد.' ,'md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'Welcomeon')
end
end
if (Ramin == 'welcomegp off' or Ramin == 'خوش امدگویی گروه غیرفعال') and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'Welcomeon') then
send(msg.chat_id,msg.id,'◈ خوش امدگویی گروه غیرفعال شد.' ,'md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'Welcomeon')
else
send(msg.chat_id,msg.id,'◈ خوش امدگویی گروه غیرفعال بود.' ,'md')
end
end
----------------------------------------------
if Ramin == 'restart forceadd' or Ramin == 'شروع دوباره افزودن اجباری' then
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
base:del(TD_ID..'NewUser'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..msg.chat_id..v)
end
send(msg.chat_id,msg.id,'> افزودن اجباری ریستارت شد و تمامی افراد باید دوباره به مقدار مورد نظر کاربر به گروه اضافه کنند تا بتواند در گروه پیام دهد','md')
end
if Ramin == 'forceadd on' or Ramin == 'افزودن اجباری فعال' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'force_NewUser') then
typeadd = '•  اد اجباری بر روی کاربران جدید تنظیم شده است\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nشما میتوانید برای تغییر به همه کاربران با زدن دستور Setforce all user اد اجباری را برای همه کاربران فعال کنید!'
else
typeadd = '•  اد اجباری بر روی تمامی کاربران تنظیم شده است\n▁▁▁▂▂▂▂▂▂▂▁▁▁\nدر صورت علاقه شما میتوانید اد اجباری را با دستور Setforce new user بر روی کاربران جدید تنظیم کنید تا فقط کاربران جدید اجبار به اد شوند!'
end
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forceadd') then
send(msg.chat_id,msg.id,'• قفل *افزودن اجباری* #فعال بود\n\n*وضعیت* : '..typeadd,'md')
else
send(msg.chat_id,msg.id,'• قفل *افزودن اجباری* #فعال شد\nتعداد اخطار پیام افزودن : *'..Forcepm..'* بار\nتعداد افزودن : *'..Forcemax..'* نفر\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n*وضعیت* : '..typeadd,'md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'forceadd')
end
end
if Ramin == 'forceadd off' or Ramin == 'افزودن اجباری غیرفعال' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forceadd') then
send(msg.chat_id,msg.id,'• قفل *افزودن اجباری* #غیرفعال شد' ,'md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'forceadd')
base:del(TD_ID..'test:'..msg.chat_id)
base:del(TD_ID..'Force:Pm:'..msg.chat_id)
base:del(TD_ID..'Force:Max:'..msg.chat_id)
else
send(msg.chat_id,msg.id,'• قفل *افزودن اجباری* #غیرفعال بود','md')
end
end
-----------------

if Ramin == 'del' or Ramin == 'حذف' and tonumber(msg.reply_to_message_id) ~= 0 then
function DelByReply(BlaCk,ALPHA)
deleteMessages(msg.chat_id,{[0] = msg.id})
deleteMessages(msg.chat_id,{[0] = ALPHA.id})
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DelByReply)
end

if (Ramin == 'deluser' or Ramin == 'سکوت' or Ramin == 'مسدود' or Ramin == 'اخراج' or Ramin == 'تبچی' or Ramin == 'بن'  ) and is_JoinChannel(msg) then
function DelallByReply(BlaCk,ALPHA)
if tonumber(ALPHA.sender_user_id) == tonumber(BotJoiner) then
return false
end
if VipUser(msg,ALPHA.sender_user_id) then
--send(msg.chat_id, msg.id, "من نمیتوانم پیام های یک فرد دارای  مقام را پاک کنم ", 'md')
else
--send(msg.chat_id, msg.id, "حذف شد. ", 'md')
deleteMessagesFromUser(msg.chat_id,ALPHA.id)
deleteMessages(msg.chat_id,{[0] = ALPHA.id})
end
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DelallByReply)
end
end--]]





if Ramin == 'forcejoinmute on' or Ramin == 'جوین اجباری سکوت فعال' then
if  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmute') then
send(msg.chat_id,msg.id,'◈ قفل *جوین اجباری سکوت* #فعال بود','md')
else
send(msg.chat_id,msg.id,'◈ قفل *جوین اجباری سکوت* #فعال شد','md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmute')
end
end

if Ramin == 'forcejoinmute off' or Ramin == 'جوین اجباری سکوت غیرفعال' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmute') then
send(msg.chat_id,msg.id,'◈ قفل *جوین اجباری سکوت* #غیرفعال شد','md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmute')
else
send(msg.chat_id,msg.id,'◈ قفل *جوین اجباری سکوت* #غیرفعال بود','md')
end
end

if Ramin == 'forcejoinmutehallat mute' or Ramin == 'حالت جوین اجباری سکوت' then
if  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmutehallat') then
send(msg.chat_id,msg.id,'◈ حالت *جوین اجباری سکوت* #فعال بود','md')
else
send(msg.chat_id,msg.id,'◈ حالت *جوین اجباری سکوت* #فعال شد.\n◈ یعنی هر کاربری که در گروه عضو کانال(جوین اجباری) نشده باشد در گروه سکوت دائم خواهد شد.','md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmutehallat')
end
end

if Ramin == 'forcejoinmutehallat mutetime' or Ramin == 'حالت جوین اجباری سکوت زمانی' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmutehallat') then
local timemutejoin = tonumber(base:get(TD_ID..'mutetimejoin:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(timemutejoin)
send(msg.chat_id,msg.id,'◈ حالت *جوین اجباری سکوت زمانی* #فعال شد\n◈ یعنی هر کاربری که در گروه عضو کانال(جوین اجباری)  نشده باشد به مدت '..Time_..' سکوت خواهد شد. ','md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmutehallat')
else
send(msg.chat_id,msg.id,'◈ حالت *جوین اجباری سکوت زمانی* #فعال بود','md')
end
end

local CH = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
if Ramin == 'forcejoin on' or Ramin == 'جوین اجباری فعال' then
if base:get(TD_ID..'setch:'..msg.chat_id)  then
if  base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoin') then
send(msg.chat_id,msg.id,'◈ قفل *جوین اجباری* #فعال بود\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• کانال جوین اجباری :@'..CH..'','md')
else
send(msg.chat_id,msg.id,'◈ قفل *جوین اجباری* #فعال شد\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n[جهت عمل کرد عضویت اجباری باید ربات زیر را در کانال خود ادمین کنید\n 🆔 : '..UserJoiner..']\n\n• کانال جوین اجباری :@'..CH..'','md')
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'forcejoin')
end
else
send(msg.chat_id,msg.id,'انجام نشد ✖️\nکانال شما تنظیم نشده است ابتدا با دستور (تنظیم کانال channel ) یا (setch channel ) کانال خود را تنظیم کنید سپس اقدام به فعال کردن جوین اجباری کنید.','md')
end
end
if Ramin == 'forcejoin off' or Ramin == 'جوین اجباری غیرفعال' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoin') then
send(msg.chat_id,msg.id,'• قفل *جوین اجباری* #غیرفعال شد','md')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'forcejoin')
else
send(msg.chat_id,msg.id,'• قفل *جوین اجباری* #غیرفعال بود','md')
end
end
if Ramin and (Ramin:match('^setch (.*)') or Ramin:match('^تنظیم کانال (.*)')) and is_JoinChannel(msg) then
local CH = Ramin:match('^setch (.*)') or Ramin:match('^تنظیم کانال (.*)')
base:set(TD_ID..'setch:'..msg.chat_id,CH)
send(msg.chat_id,msg.id,'• کانال تنظیم شد به :\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n @'..CH..'','html')
end
if Ramin1 and (Ramin1:match('^[Rr]emwelcome$') or Ramin1:match('^حذف خوش امدگویی$')) and is_JoinChannel(msg) then
base:del(TD_ID..'Text:Welcome:'..msg.chat_id)
base:del(TD_ID..'Text:WelcomeGif:'..msg.chat_id)
base:del(TD_ID..'gif'..msg.chat_id)
send(msg.chat_id,msg.id,'• پیام خوش امدگویی با موفقیت حذف شد.','md')
end
if Ramin1 and (Ramin1:match('^lock duplipost$') or Ramin1:match('^قفل پست تکراری$')) and is_JoinChannel(msg) then
base:set(TD_ID.."bot:duplipost:mute" .. msg.chat_id, true)
send(msg.chat_id,msg.id,'• قفل پست تکراری فعال شد!','md')
end
if Ramin1 and (Ramin1:match('^unlock duplipost$') or Ramin1:match('^بازکردن پست تکراری$')) and is_JoinChannel(msg) then
base:del(TD_ID.."bot:duplipost:mute"..msg.chat_id)
send(msg.chat_id,msg.id,'• قفل پست تکراری غیرفعال شد.','md')
end
if Ramin1 and (Ramin1:match('^lock antithief$') or Ramin1:match('^قفل ضد تبچی هوشمند$')) and is_JoinChannel(msg) then
base:set(TD_ID.."sg:locktabalpha"..msg.chat_id,"lock")
send(msg.chat_id,msg.id,'• قفل ضد تبچی هوشمند فعال شد.\nمالک عزیز شناسایی کاربران تبلیغگر ومخرب در گروه از این بابت فعالیت داشته باشد به پیوی شما ارسال خواهد شد.','md')
end
if Ramin1 and (Ramin1:match('^unlock antithief$') or Ramin1:match('^بازکردن ضد تبچی هوشمند$')) and is_JoinChannel(msg) then
base:del(TD_ID.."sg:locktabalpha"..msg.chat_id)
send(msg.chat_id,msg.id,'• قفل ضد تبچی هوشمند غیرفعال شد.','md')
end
if Ramin1 and (Ramin1:match('^[Ss]etWarn (.*)') or Ramin1:match('^حالت اخطار (.*)'))  and is_JoinChannel(msg) then
local input = {string.match(Ramin1, "^(حالت اخطار) (.*)$")}
if input[2] == "اخراج" then
base:set(TD_ID.."warn_stats"..msg.chat_id,"kick")
send(msg.chat_id, msg.id, "◈ حالت اخطارات کاربران به حالت <code>اخراج#</code> تغییر یافت.","html")
elseif input[2] == "سکوت" then
base:set(TD_ID.."warn_stats"..msg.chat_id,"silent")
send(msg.chat_id, msg.id, "◈ حالت اخطارات کاربران به حالت <code>سکوت#</code> تغییر یافت.","html")
elseif input[2] == "سکوت زمانی" then
base:set(TD_ID.."warn_stats"..msg.chat_id,"silenttime")
local ex = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(ex)
send(msg.chat_id, msg.id, "◈ حالت اخطارات کاربران به اضافه شدن به لیست سکوت زمانی به مدت <b>"..Time_.." </b> تغییر کردهر کاربری به حداکثر اخطار خود برسد در گروه به صورت زمانی ارسال پیام برروی کاربر قفل خواهد شد.","html")
end
end
if Ramin1 and (Ramin1:match('^[Ss]ettextadd (.*)') or Ramin1:match('^تنظیم متن اداجباری (.*)'))  and is_JoinChannel(msg) then
local Alpha = Ramin1:match('^[Ss]ettextadd (.*)') or Ramin1:match('^تنظیم متن اداجباری (.*)')
base:set(TD_ID..'Text:AddTXT:'..msg.chat_id,Alpha)
send(msg.chat_id,msg.id,'• پیام افرودن اجباری گروه تنظیم وثبت شد.','md')
end
if Ramin1 and (Ramin1:match('^[Dd]eltextjoin$') or Ramin1:match('^حذف پیام اداجباری$')) and is_JoinChannel(msg) then
base:del(TD_ID..'Text:AddTXT:'..msg.chat_id)
send(msg.chat_id,msg.id,'• پیام افرودن اجباری گروه تنظیم وثبت شد.','md')
end
if Ramin1 and (Ramin1:match('^[Ss]ettextjoin (.*)') or Ramin1:match('^تنظیم متن عضویت اجباری (.*)'))  and is_JoinChannel(msg)then
local Alpha = Ramin1:match('^[Ss]ettextjoin (.*)') or Ramin1:match('^تنظیم متن عضویت اجباری (.*)')
base:set(TD_ID..'Text:Chjoin:'..msg.chat_id,Alpha)
send(msg.chat_id,msg.id,'• پیام عضویت اجباری کانال تنظیم وثبت شد.','md')
end

if Ramin1 and (Ramin1:match('^[Dd]eltextjoin$') or Ramin1:match('^حذف پیام عضویت اجباری$')) and is_JoinChannel(msg) then
base:del(TD_ID..'Text:Chjoin:'..msg.chat_id)
send(msg.chat_id,msg.id,'• پیام عضویت اجباری کانال با موفقيت حذف شد.','md')
end

if Ramin1 and (Ramin1:match('^[Ss]etnamejoin (.*)') or Ramin1:match('^تنظیم اسم کانال (.*)'))  and is_JoinChannel(msg)then
local Alpha = Ramin1:match('^[Ss]etnamejoin (.*)') or Ramin1:match('^تنظیم اسم کانال (.*)')
base:set(TD_ID..'Text:ChName:'..msg.chat_id,Alpha)
send(msg.chat_id,msg.id,'• نام کانال برای عضویت اجباری تنظیم وثبت شد.','md')
end
if Ramin1 and (Ramin1:match('^[Dd]elnamejoin$') or Ramin1:match('^حذف اسم کانال$')) and is_JoinChannel(msg) then
base:del(TD_ID..'Text:ChName:'..msg.chat_id)
send(msg.chat_id,msg.id,'• نام کانال برای عضویت اجباری حذف شد.','md')
end
if Ramin1 and (Ramin1:match('^[Ss]etrules (.*)') or Ramin1:match('^تنظیم قوانین (.*)')) and is_JoinChannel(msg) then
local rules = Ramin1:match('^[Ss]etrules (.*)') or Ramin1:match('^تنظیم قوانین (.*)')
base:set(TD_ID..'Rules:'..msg.chat_id,rules)
send(msg.chat_id,msg.id,'• قوانین گروه با موفقیت ثبت شد','md')
end
if Ramin1 and (Ramin1:match('^[Dd]elrules$') or Ramin1:match('^حذف قوانین$')) and is_JoinChannel(msg) then
base:del(TD_ID..'Rules:'..msg.chat_id)
send(msg.chat_id,msg.id,'• قوانین گروه حذف شد.','md')
end
if (Ramin == "warn" or Ramin == "اخطار") and tonumber(msg.reply_to_message_id) > 0 and is_ModWarn(msg) and base:get(TD_ID.."warn_stats"..chat_id) == "kick"  then
function WarnByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then

if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربرسودو ربات می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربرمالک گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربرمعاون گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربرادمین گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربرادمین افتخاری گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربرعضو ویژه گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
else
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(warnhash2) == tonumber(warn) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
KickUser(msg.chat_id,user)
UnRes(msg.chat_id,user)
base:hdel(hashwarn,user, '0')
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
send(msg.chat_id,msg.id,' • کاربر ['..name..'](tg://user?id='..user..') | `'..user..'`\n🚷 به علت بی توجهی به اخطار های  مدیران از گروه اخراج شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• اخطار ها : *'..Alphafa(warnhash)..'* از *'..Alphafa(warn)..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n• *قوانین گروہ باید اولویت اول قرار بگیرد.*','md')
else
sendM(msg.chat_id,user, msg.id, '✖️اخطار های '..name..' به حداکثر رسیده ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید تا توانایی اخراج کردن را داشته باشد !', 12, utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
base:hset(hashwarn,user, tonumber(warnhash2) + 1)
local n = base:get(TD_ID.."AlphaName"..msg.chat_id)

if not base:hget(TD_ID..msg.chat_id..':warn',user) then
warnhash = "0"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',user)
end
base:get(TD_ID..'Warn:Max:'..msg.chat_id)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
text = '• کاربر ['..name..'](tg://user?id='..user..') | `'..user..'` * ازطرف مدیران گروه اخطار دریافت کرد * !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n⚠️ وضعیت اخطار شما : *'..Alphafa(warnhash - 1)..'* از *' ..Alphafa(warn)..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n🚷 وضعیت اخطار های شما به حداکثر خود برسد از گروه #اخراج می شوید.'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:warn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
end
GetUser(user,name)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),WarnByReply)
end

if (Ramin == "warn" or Ramin == "اخطار") and tonumber(msg.reply_to_message_id) > 0 and is_ModWarn(msg) and base:get(TD_ID.."warn_stats"..chat_id) == "silenttime"  then
function WarnByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربرسودو ربات می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربرمالک گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربرمعاون گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربرادمین گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربرادمین افتخاری گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربرعضو ویژه گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
else
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(warnhash2) == tonumber(warn) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
MuteUser(msg.chat_id,user,msg.date+timemutemsg)
local Time_ = getTimeUptime(timemutemsg)
--MuteUser(msg.chat_id,user,0)
base:hdel(hashwarn,user, '0')
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
send(msg.chat_id,msg.id,' • کاربر ['..name..'](tg://user?id='..user..') | `'..user..'`\n🚷 به علت بی توجهی به اخطار های  مدیران درگروه به مدت *'..Time_..'* سکوت شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• اخطار ها : *'..Alphafa(warnhash - 1)..'* از *'..Alphafa(warn)..'*','md')
else
sendM(msg.chat_id,user, msg.id, '✖️اخطار های '..name..' به حداکثر رسیده ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید تا توانایی سکوت کردن را داشته باشد !', 12, utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
base:hset(hashwarn,user, tonumber(warnhash2) + 1)
local n = base:get(TD_ID.."AlphaName"..msg.chat_id)

if not base:hget(TD_ID..msg.chat_id..':warn',user) then
warnhash = "0"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',user)
end
base:get(TD_ID..'Warn:Max:'..msg.chat_id)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(timemutemsg)
text = '• کاربر ['..name..'](tg://user?id='..user..') | `'..user..'` * ازطرف مدیران گروه اخطار دریافت کرد * !\n⚠️ وضعیت اخطار شما : *'..Alphafa(warnhash - 1)..'* از *' ..Alphafa(warn)..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های شما به حداکثر خود برسد درگروه به مدت '..Time_..' سکوت خواهید شد!'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:warn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
end
GetUser(user,name)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),WarnByReply)
end


if (Ramin == "warn" or Ramin == "اخطار") and tonumber(msg.reply_to_message_id) > 0 and is_ModWarn(msg) and base:get(TD_ID.."warn_stats"..msg.chat_id) == "silent"  then
function WarnByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربرسودو ربات می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربرمالک گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربرمعاون گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربرادمین گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربرادمین افتخاری گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربرعضو ویژه گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
else
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(warnhash2) == tonumber(warn) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
MuteUser(msg.chat_id,user,0)
base:hdel(hashwarn,user, '0')
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
send(msg.chat_id,msg.id,' • کاربر ['..name..'](tg://user?id='..user..') | `'..user..'`\n🚷 به علت بی توجهی به اخطار های  مدیران درگروه سکوت شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• اخطار ها : *'..Alphafa(warnhash)..'* از *'..Alphafa(warn)..'*','md')
else
sendM(msg.chat_id,user, msg.id, '✖️اخطار های '..name..' به حداکثر رسیده ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید تا توانایی سکوت کردن را داشته باشد !', 12, utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
base:hset(hashwarn,user, tonumber(warnhash2) + 1)
if not base:hget(TD_ID..msg.chat_id..':warn',user) then
warnhash = "0"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',user)
end
base:get(TD_ID..'Warn:Max:'..msg.chat_id)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
text = '• کاربر ['..name..'](tg://user?id='..user..') | `'..user..'` * ازطرف مدیران گروه اخطار دریافت کرد * !\n⚠️ وضعیت اخطار شما : *'..Alphafa(warnhash)..'* از *' ..Alphafa(warn)..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های شما به حداکثر خود برسد درگروه #سکوت می شوید.'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:warn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
end
GetUser(user,name)
end
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),WarnByReply)
end


if ALPHAent and (Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)')) or Ramin and (Ramin:match('^warn @(.*)') or Ramin:match('^اخطار @(.*)') or Ramin:match('^warn (%d+)$') or Ramin:match('^اخطار (%d+)$')) and is_JoinChannel(msg) and is_ModWarn(msg) and base:get(TD_ID.."warn_stats"..msg.chat_id) == "kick" then
local BDSource = Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)')
function BD_warn(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^warn @(.*)') or Ramin:match('^اخطار @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^warn (%d+)') or Ramin:match('^اخطار (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربرسودو ربات می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربرمالک گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربرمعاون گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربرادمین گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربرادمین افتخاری گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربرعضو ویژه گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
else
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if name then
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
if tonumber(warnhash) == tonumber(warn) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
KickUser(msg.chat_id,Ramin)
UnRes(msg.chat_id,Ramin)
base:hdel(hashwarn,Ramin, '0')
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
send(msg.chat_id,msg.id,' • کاربر '..username..' \n🚷 به علت بی توجهی به اخطار های  مدیران از گروہ اخراج شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• اخطار ها : *'..Alpha(warnhash)..'* از *'..Alpha(warn)..'*','md')
--sendM(msg.chat_id,Ramin, msg.id, text, 32, utf8.len(name))
else
sendM(msg.chat_id,Ramin, msg.id, '✖️اخطار های '..name..' به حداکثر رسیده ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید تا توانایی اخراج داشته باشد !', 12, utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else

local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
base:hset(hashwarn,Ramin, tonumber(warnhash2 + 1))
if not base:hget(TD_ID..msg.chat_id..':warn',Ramin) then
warnhash = "3"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin)
end
base:get(TD_ID..'Warn:Max:'..msg.chat_id)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
text = '◈ *کاربر *  • کاربر '..username..' * ازطرف مدیران گروه اخطار دریافت کرد * !\n⚠️ وضعیت اخطار شما : *'..Alphafa(warnhash - 1)..'* از *' ..Alphafa(warn)..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های شما به حداکثر خود برسد از گروه #اخراج می شوید.'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:warn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
GetUser(Ramin,name)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_warn)
end


if ALPHAent and (Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)')) or Ramin and (Ramin:match('^warn @(.*)') or Ramin:match('^اخطار @(.*)') or Ramin:match('^warn (%d+)$') or Ramin:match('^اخطار (%d+)$')) and is_JoinChannel(msg) and is_ModWarn(msg)  and base:get(TD_ID.."warn_stats"..msg.chat_id) == "silent" then
local BDSource = Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)')
function BD_warn(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^warn @(.*)') or Ramin:match('^اخطار @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^warn (%d+)') or Ramin:match('^اخطار (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربرسودو ربات می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربرمالک گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربرمعاون گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربرادمین گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربرادمین افتخاری گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربرعضو ویژه گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
else
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if name then
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
if tonumber(warnhash) == tonumber(warn) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
MuteUser(msg.chat_id,Ramin,0)
base:hdel(hashwarn,Ramin, '0')
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
send(msg.chat_id,msg.id,' • کاربر '..username..'\n🚷 به علت بی توجهی به اخطار های  مدیران درگروه سکوت شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• اخطار ها : *'..Alpha(warnhash)..'* از *'..Alpha(warn)..'*','md')

--sendM(msg.chat_id,Ramin, msg.id, text, 32, utf8.len(name))
else
sendM(msg.chat_id,Ramin, msg.id, '✖️اخطار های '..name..' به حداکثر رسیده ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید تا توانایی اخراج داشته باشد !', 12, utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
base:hset(hashwarn,Ramin, tonumber(warnhash2 + 1 ))
if not base:hget(TD_ID..msg.chat_id..':warn',Ramin) then
warnhash = "0"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin)
end
base:get(TD_ID..'Warn:Max:'..msg.chat_id)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
text = '• کاربر '..username..' * ازطرف مدیران گروه اخطار دریافت کرد * !\n⚠️ وضعیت اخطار شما : *'..Alphafa(warnhash - 1)..'* از *' ..Alphafa(warn)..'*\\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های شما به حداکثر خود برسد درگروه #سکوت می شوید.'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:warn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
GetUser(Ramin,name)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_warn)
end

if ALPHAent and (Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)')) or Ramin and (Ramin:match('^warn @(.*)') or Ramin:match('^اخطار @(.*)') or Ramin:match('^warn (%d+)$') or Ramin:match('^اخطار (%d+)$')) and is_JoinChannel(msg) and is_ModWarn(msg)  and base:get(TD_ID.."warn_stats"..msg.chat_id) == "silenttime" then
local BDSource = Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)')
function BD_warn(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^warn @(.*)') or Ramin:match('^اخطار @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^warn (%d+)') or Ramin:match('^اخطار (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^warn (.*)') or Ramin:match('^اخطار (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if tonumber(user) == tonumber(BotCliId) then
send(msg.chat_id, msg.id,  '◈ مدیر عزیز من یک ربات هستم نمی  توانم پیام خودم رو چک کنم !','md')
return false
elseif SudUser(msg,user) then
send(chat,msg.id,"◈* کاربرسودو ربات می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif OwnUser(msg,user) then
send(chat,msg.id,"◈* کاربرمالک گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif NazemUser(msg,user) then
send(chat,msg.id,"◈* کاربرمعاون گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUser(msg,user) then
send(chat,msg.id,"◈* کاربرادمین گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif ModUserTest(msg,user) then
send(chat,msg.id,"◈* کاربرادمین افتخاری گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
return false
elseif VipUser(msg,user) then
send(chat,msg.id,"◈*کاربرعضو ویژه گروه می باشد دسترسی اخطاردادن به این کاربر را ندارید !*","md")
else
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if name then
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
if tonumber(warnhash) == tonumber(warn) then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
MuteUser(msg.chat_id,Ramin,msg.date+timemutemsg)
local Time_ = getTimeUptime(timemutemsg)
base:hdel(hashwarn,Ramin, '0')

if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "3"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
send(msg.chat_id,msg.id,' • کاربر '..username..'\n🚷 به علت بی توجهی به اخطار های  مدیران درگروه به مدت *'..Time_..'* سکوت شد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n• اخطار ها : *'..Alphafa(warnhash)..'* از *'..Alphafa(warn)..'*','md')

--sendM(msg.chat_id,Ramin, msg.id, text, 32, utf8.len(name))
else
sendM(msg.chat_id,Ramin, msg.id, '✖️اخطار های '..name..' به حداکثر رسیده ولی ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید تا توانایی اخراج داشته باشد !', 12, utf8.len(name))
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
else
local warnhash2 = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
base:hset(hashwarn,Ramin, tonumber(warnhash2 + 1 ))
if not base:hget(TD_ID..msg.chat_id..':warn',Ramin) then
warnhash = "0"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin)
end
base:get(TD_ID..'Warn:Max:'..msg.chat_id)
if not base:get(TD_ID..'Warn:Max:'..msg.chat_id) then
warn = "0"
else
warn = base:get(TD_ID..'Warn:Max:'..msg.chat_id)
end
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local Time_ = getTimeUptime(timemutemsg)
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
text = '◈ *کاربر * '..username..' * ازطرف مدیران گروه اخطار دریافت کرد * !\n⚠️ وضعیت اخطار شما : *'..Alphafa(warnhash - 1)..'* از *' ..Alphafa(warn)..'*\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🚷 وضعیت اخطار های شما به حداکثر خود برسد درگروه به مدت '..Time_..' سکوت خواهید شد!'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:warn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
GetUser(Ramin,name)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_warn)
end

if ALPHAent and (Ramin:match('^unwarn (.*)') or Ramin:match('^حذف اخطار (.*)')) or Ramin and (Ramin:match('^unwarn @(.*)') or Ramin:match('^حذف اخطار @(.*)') or Ramin:match('^unwarn (%d+)$') or Ramin:match('^حذف اخطار (%d+)$')) and is_JoinChannel(msg) and is_ModWarn(msg)   then
local BDSource = Ramin:match('^unwarn (.*)') or Ramin:match('^حذف اخطار (.*)')
function BD_unwarn(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^unwarn @(.*)') or Ramin:match('^حذف اخطار @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^unwarn (%d+)') or Ramin:match('^حذف اخطار (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^unwarn (.*)') or Ramin:match('^حذف اخطار (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin) or 1
if tonumber(warnhash) == tonumber(1) then
text = '• کاربر ['..name..'](tg://user?id='..Ramin..') | `'..Ramin..'` \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🤷🏻‍♂️ هیچ اخطاری درسیستم ربات ثبت نشدہ است !'
send(msg.chat_id,msg.id,text,'md')
else
if not base:hget(TD_ID..msg.chat_id..':warn',Ramin) then
warnhash = "0"
else
warnhash = base:hget(TD_ID..msg.chat_id..':warn',Ramin)
end
base:hdel(TD_ID..msg.chat_id..':warn',Ramin,'0')
if Ramin then
username = "["..base:get(TD_ID..'FirstName:'..Ramin).."](tg://user?id="..Ramin..")"
else
username = "["..base:get(TD_ID..'UserName:'..Ramin).."](tg://user?id="..Ramin..")"
end
text = '• کاربر '..username..' 📌 تمامی اخطار های ثبت شدہ در سیستم ربات  ریست وپاکسازی شد !'
send(msg.chat_id,msg.id,text,'md')
base:zincrby(TD_ID..'bot:unwarn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
end
else
send(msg.chat_id, msg.id,'❎  کاربر '..BDSource..' با این مشخصات یافت نشد !\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n *خطای دستوری به سه دلیل می تواند باشد* :\n1️⃣ `یوزرنیم اشتباه`\n2️⃣ `ایدی عددی اشتباه`\n3️⃣ `کاربر اصلاوجود ندارد`\n ◂ *خواهشمند است از صحت درست بودن مشخصات کاربر مطلع باشید.*','md')
end
end
resolve_username(BDSource,BD_unwarn)
end

if (Ramin == "unwarn" or Ramin == "حذف اخطار") and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) > 0  and is_ModWarn(msg) then
function UnWarnByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if tonumber(warnhash) == tonumber(1) then
text = '• کاربر ['..name..'](tg://user?id='..user..') | `'..user..'` \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🤷🏻‍♂️ هیچ اخطاری درسیستم ربات ثبت نشدہ است !'
send(msg.chat_id,msg.id,text,'md')
else
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',user)
local hashwarn = TD_ID..msg.chat_id..':warn'
local hashwarnbd = TD_ID..user..':warn'
local max_warn = tonumber(base:get(TD_ID..'Warn:Max:'..msg.chat_id) or 3)
base:hdel(hashwarnbd,msg.chat_id,max_warn)
base:hdel(hashwarn,user,'0')
UnRes(msg.chat_id,user)
base:zincrby(TD_ID..'bot:unwarn:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:WarnUser:'..msg.chat_id)
text = '• کاربر ['..name..'](tg://user?id='..user..') | `'..user..'` \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n📌 تمامی اخطار های ثبت شدہ در سیستم ربات  ریست وپاکسازی شد !'
send(msg.chat_id,msg.id,text,'md')
end
end
GetUser(user,name)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),UnWarnByReply)
end

msgsalpha = {}
addalpha = {}
videoalpha = {}
photoalpha = {}
filealpha = {}
selfalpha = {}
stickeralpha = {}
gifalpha = {}
audioalpha = {}
voicealpha = {}


function ForStart(msg,tables,status)
list = base:smembers(TD_ID.."AllUsers:"..msg.chat_id)
for k,v in pairs(list) do
GetStatus = tonumber(base:get(TD_ID.."Total:"..status..":"..msg.chat_id..":"..v))
if base:get(TD_ID.."Total:"..status..":"..msg.chat_id..":"..v) then
table.insert(tables,GetStatus)
end
end
end
function ForSort(msg,tables,text,status)
table.sort(tables)
GpStatus = tonumber(base:get(TD_ID.."Total:"..status..":"..msg.chat_id) or 0)
Text = Text..' *'..text..'* '..GpStatus..'\n'
end
function ForNumber(msg,tables,text,status,t2)
list = base:smembers(TD_ID.."AllUsers:"..msg.chat_id)
for k,v in ipairs(tables) do
Number = v
end
for k,U in pairs(list) do
GetStatus = tonumber(base:get(TD_ID.."Total:"..status..":"..msg.chat_id..":"..U))
if GetStatus == Number then
Ramin = U
end
end
if base:get(TD_ID.."Total:"..status..":"..msg.chat_id..":"..msg.sender_user_id) and Number then
if #tables == 0 then
Text = Text
else
Name = base:get(TD_ID..'UserName:'..Ramin) or 'none'
Text = Text..'〘['..text..''..Number..''..t2..' '..Name..' ](tg://user?id='..Ramin..')〙\n'
function getindex(t,id)
for i,v in pairs(t) do
if v == id then
return i
end
end
return nil
end
table.remove(tables,getindex(tables, tonumber(Number)))
end
end
end

if Ramin == 'statscmd' or Ramin == 'آمار دستورات'   then
local ban =  base:zrevrange(TD_ID..'bot:ban:'..msg.chat_id..':', 0, 2, 'withscores')
local vip =  base:zrevrange(TD_ID..'bot:vip:'..msg.chat_id..':', 0, 2, 'withscores')
local vipjoin =  base:zrevrange(TD_ID..'bot:vipjoin:'..msg.chat_id..':', 0, 2, 'withscores')
local unban =  base:zrevrange(TD_ID..'bot:unban:'..msg.chat_id..':', 0, 2, 'withscores')
local mute =  base:zrevrange(TD_ID..'bot:mute:'..msg.chat_id..':', 0, 2, 'withscores')
local unmute =  base:zrevrange(TD_ID..'bot:unmute:'..msg.chat_id..':', 0, 2, 'withscores')
local warn =  base:zrevrange(TD_ID..'bot:warn:'..msg.chat_id..':', 0, 2, 'withscores')
local unwarn =  base:zrevrange(TD_ID..'bot:unwarn:'..msg.chat_id..':', 0, 2, 'withscores')
local kick =  base:zrevrange(TD_ID..'bot:kick:'..msg.chat_id..':', 0, 2, 'withscores')
local Tab =  base:zrevrange(TD_ID..'bot:Tab:'..msg.chat_id..':', 0, 2, 'withscores')
local clean =  base:zrevrange(TD_ID..'bot:clean:'..msg.chat_id..':', 0, 2, 'withscores')
KickUser = base:get(TD_ID..'Total:KickUser:'..msg.chat_id..'') or 0
BanUser = base:get(TD_ID..'Total:BanUser:'..msg.chat_id..'') or 0
WarnUser = base:get(TD_ID..'Total:WarnUser:'..msg.chat_id..'') or 0
MuteUser = base:get(TD_ID..'Total:MuteUser:'..msg.chat_id..'') or 0
TabUser = base:get(TD_ID..'Total:TabUser:'..msg.chat_id..'') or 0
VipUser = base:get(TD_ID..'Total:VipUser:'..msg.chat_id..'') or 0
JoinUser = base:get(TD_ID..'Total:JoinUser:'..msg.chat_id..'') or 0
CleanUser = base:get(TD_ID..'Total:CleanUser:'..msg.chat_id..'') or 0
local timet = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
stattextss = '✭ آمار استفاده شده از دستورات ربات تا الان ✭ \n• زمان : '..timet..'\n◂ فعالترین کاربران از نظر دستورات به ترتیب زیر می باشد : \n\n'
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
send(msg.chat_id,msg.id,stattextss,'md')
end

if Ramin == 'آمار' or Ramin == 'امار' or Ramin == 'statis' then
STNum = tonumber(base:get(TD_ID..'ST:Number:'..msg.chat_id)) or 10
local anmisticker =  base:zrevrange(TD_ID..'bot:Unsupported:'..msg.chat_id..':', 0, 2, 'withscores')
local VideoNote =  base:zrevrange(TD_ID..'bot:VideoNote:'..msg.chat_id..':', 0, 2, 'withscores')
local Sticker =  base:zrevrange(TD_ID..'bot:Sticker:'..msg.chat_id..':', 0, 2, 'withscores')
local Audio =  base:zrevrange(TD_ID..'bot:Audio:'..msg.chat_id..':', 0, 2, 'withscores')
local Voice =  base:zrevrange(TD_ID..'bot:Voice:'..msg.chat_id..':', 0, 2, 'withscores')
local Photo =  base:zrevrange(TD_ID..'bot:Photo:'..msg.chat_id..':', 0, 2, 'withscores')
local ban =  base:zrevrange(TD_ID..'bot:ban:'..msg.chat_id..':', 0, 2, 'withscores')
local unban =  base:zrevrange(TD_ID..'bot:unban:'..msg.chat_id..':', 0, 2, 'withscores')
local mute =  base:zrevrange(TD_ID..'bot:mute:'..msg.chat_id..':', 0, 2, 'withscores')
local unmute =  base:zrevrange(TD_ID..'bot:unmute:'..msg.chat_id..':', 0, 2, 'withscores')
local warn =  base:zrevrange(TD_ID..'bot:warn:'..msg.chat_id..':', 0, 2, 'withscores')
local unwarn =  base:zrevrange(TD_ID..'bot:unwarn:'..msg.chat_id..':', 0, 2, 'withscores')
local kick =  base:zrevrange(TD_ID..'bot:kick:'..msg.chat_id..':', 0, 2, 'withscores')
local Tab =  base:zrevrange(TD_ID..'bot:Tab:'..msg.chat_id..':', 0, 2, 'withscores')
local stats = base:zrevrange(TD_ID..'bot:msgusr2:'..msg.chat_id..':', 0, STNum, 'withscores')
local addstats = base:zrevrange(TD_ID..'bot:addusr2:'..msg.chat_id..':', 0, 2, 'withscores')
local delstats = base:zrevrange(TD_ID..'bot:delusr:'..msg.chat_id..':', 0, 2, 'withscores')
local Gif =  base:zrevrange(TD_ID..'bot:Gif:'..msg.chat_id..':', 0, 2, 'withscores')
local Msg = base:get(TD_ID..'Total:messages:'..msg.chat_id..'') or 0
local link = base:get(TD_ID..'Total:JoinedByLink:'..msg.chat_id..'') or 0
KickUser = base:get(TD_ID..'Total:KickUser:'..msg.chat_id..'') or 0
KickUser = base:get(TD_ID..'Total:BanUser:'..msg.chat_id..'') or 0 
WarnUser = base:get(TD_ID..'Total:WarnUser:'..msg.chat_id..'') or 0
MuteUser = base:get(TD_ID..'Total:MuteUser:'..msg.chat_id..'') or 0
TabUser = base:get(TD_ID..'Total:TabUser:'..msg.chat_id..'') or 0
local ttladd = base:get(TD_ID..'Total:AddUser:'..msg.chat_id) or 0
local ttldel = base:get(TD_ID..'Total:DelUser:'..msg.chat_id) or 0

local timet = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
stattextss = '✭ آمار فعالیت گروه تا این لحظه ✭ \n• زمان : '..timet..'\n◂ فعالترین کاربران امروز : \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
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

for k, v in pairs(delstats) do
local namee = base:get(TD_ID..'FirstName:'..v[1]) or 'بدون نام'
if k == 1 then
rankstat = "➊نفر اول"
stattextss = stattextss .. "\n┈┅┅━✦━┅┅┈\n🏵 بیشترین مسدود کننده ها : \n"
elseif k == 2 then
rankstat = "➋نفر دوم"
else
rankstat = "➌نفر سوم"
end
user_info = "["..namee.."](tg://user?id="..v[1]..")"
stattextss = stattextss .. rankstat .. " : " .. user_info .. " با " .. v[2] .. " کاربر \n"
end





stattextss = stattextss .. "\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n◂ کل پیام های گروه : *" ..Msg.. "* پیام"
stattextss = stattextss .. "\n◂ اعضای عضو شده با لینک : *" ..link.. "* نفر"
stattextss = stattextss .. "\n◂ کل اعضای دعوتی : *" ..ttladd.. "* نفر"
stattextss = stattextss .. "\n◂ کل اعضای مسدودی : *" ..ttldel.. "* نفر"
send(msg.chat_id,msg.id,stattextss,'md')
end



--[[if Ramin == 'امار گروه' or Ramin == 'امار'  then
StatusGp(msg,msg.chat_id)
end--]]

if Ramin == 'ریست امار' or Ramin == 'ریست آمار'  then

base:zremrangebyscore(TD_ID..'bot:msgusr2:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Unsupported:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:VideoNote:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Sticker:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Audio:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Voice:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Photo:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:addusr2:'..msg.chat_id..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Gif:'..msg.chat_id..':', 0, 2000000)
send(msg.chat_id,msg.id,'تمامی اطلاعات آمار با موفقیت ریست شد !','html')
end

----------------------------------------------
if (Ramin == 'rules' or Ramin == 'قوانین') and is_JoinChannel(msg) then
local rules = base:get(TD_ID..'Rules:'..msg.chat_id) or '•  قوانینی برای گروه ثبت نشده است'
send(msg.chat_id,msg.id,'• قوانین گروه :\n'..rules..'','html')
end

end
end
end
----------------------------------------------
if Ramin and ((is_Sudo(msg) and not (base:sismember(TD_ID..'PnlSudo:',Ramin) or base:sismember(TD_ID..'PnlSudo:',BaseCmd) or base:sismember(TD_ID..'PnlSudo_2:',msg.sender_user_id..':'..Ramin) or base:sismember(TD_ID..'PnlSudo_2:',msg.sender_user_id..':'..BaseCmd))) or is_FullSudo(msg)) then
if Ramin == 'autoleave on' or Ramin == 'لفت خودکار روشن' then
base:del(TD_ID..'AutoLeave')
send(msg.chat_id,msg.id,'done','html')
end
if Ramin == 'autoleave off' or Ramin == 'لفت خودکار خاموش' then
base:set(TD_ID..'AutoLeave',true)
send(msg.chat_id,msg.id,'done','html')
end
if Ramin == 'freeinstall on' or Ramin == 'نصب رایگان فعال' then
base:set(TD_ID..'freeinstall',true)
send(msg.chat_id,msg.id,'• نصب رایگان خودکار ربات فعال شد.','html')
end
if Ramin == 'freeinstall off' or Ramin == 'نصب رایگان غیرفعال' then
base:del(TD_ID..'freeinstall')
send(msg.chat_id,msg.id,'• نصب رایگان خودکار ربات غیرفعال شد.','html')
end
if Ramin == 'freeinstallbot on'  then
base:set(TD_ID..'freeBotadd',true)
base:sadd(TD_ID..'FilterName:','رایگان')
base:sadd(TD_ID..'FilterName:','↻ DIGI ANTI ⇦')
base:sadd(TD_ID..'FilterName:','ربات')
base:sadd(TD_ID..'FilterName:','ᶠʳᵉᵉ')
base:sadd(TD_ID..'FilterName:','free')
base:sadd(TD_ID..'FilterName:','ANTI')
base:sadd(TD_ID..'FilterName:','مبصر')
send(msg.chat_id,msg.id,'• فعال شد','html')
end
if Ramin == 'freeinstallbot off'  then
base:del(TD_ID..'freeBotadd')
send(msg.chat_id,msg.id,'• غیرفعال شد','html')
end
---------------------------------------------
if Ramin == 'joinchannel off' or Ramin == 'جوین چنل خاموش' then
base:del(TD_ID..'joinchnl')
send(msg.chat_id, msg.id, '• جوین چنل خاموش شد و دیگر کاربران برای استفاده از دستورات نیازی به ورود به کانال ربات نخواهند داشت!','md')
end
if Ramin == 'joinchannel on' or Ramin == 'جوین چنل روشن' then
base:set(TD_ID..'joinchnl',true)
send(msg.chat_id,msg.id, '• جوین چنل روشن شد و کاربران برای استفاده از دستورات ربات باید ابتدا در کانال ربات عضو شوند!','md')
end
----------------------------------------------

if Ramin:match("^[Ss][Tt][Aa][Tt][Uu][Ss]$") or Ramin:match("^دسترسی ربات$") and tonumber(msg.reply_to_message_id) == 0  then
local function BotStats(extra, result, success)
local function groupinfo(arg, data, success)
local link = base:get(TD_ID.."Link:"..msg.chat_id) or ''
local GroupName =  base:get(TD_ID..'StatsGpByName'..msg.chat_id)
local Gpname = okname(GroupName)
if data.administrator_count == 0 then
send(msg.chat_id, msg.id, '• ربات ادمین گروه نمی باشد!' , 'md')
else
if result.members then
for k,v in pairs(result.members) do
if v.user_id == tonumber(our_id) and v.status._== "chatMemberStatusAdministrator" then
if v.status.can_change_info then
change_info = '✓'
else
change_info = '✗'
end
if v.status.can_delete_messages then
delete_messages = '✓'
else
delete_messages = '✗'
end
if v.status.can_restrict_members then
restrict_members = '✓'
else
restrict_members = '✗'
end
if v.status.can_invite_users then
invite_users = '✓'
else
invite_users = '✗'
end
if v.status.can_pin_messages then
pin_messages = '✓'
else
pin_messages = '✗'
end
if v.status.can_promote_members then
promote_members = '✓'
else
promote_members = '✗'
end
if v.status.is_anonymous then
is_anonymous = '✓'
else
is_anonymous = '✗'
end

if v.status.can_post_messages then
can_post_messages = '✓'
else
can_post_messages = '✗'
end
send(msg.chat_id,msg.id, '• دسترسی ربات در گروه به صورت ذیل می باشد : \n\n◈تغییر اطلاعات گروه: '..change_info..'\n◈حذف پیام های گروه: '..delete_messages..'\n◈ مسدود کردن کاربر: '..restrict_members..'\n◈ لینک دعوت گروه: '..invite_users..'\n◈ سنجاق کردن پیام:  '..pin_messages..'\n◈ اضافه کردن ادمین: '..promote_members..'\n◈ ادمین مخفی: '..promote_members..'\nارسال پست کانال : '..can_post_messages..'\n \n• اطلاعات گروه به صورت ذیل می باشد :\n◈ تعداد ادمین ها : [ '..(data.administrator_count or 'عدم دسترسی')..' ]\n◈ تعداد افراد مسدود : [ '..(data.banned_count or 'عدم دسترسی')..' ]\n◈ افراد دارای محدودیت : [ '..(data.restricted_count or 'عدم دسترسی')..' ]\n◈ تعداد اعضا : [ '..(data.member_count or 'عدم دسترسی')..' ]\n◈ اطلاعات گروه : [ '..(data.description or 'Not Found')..' ]','md')
end
end
end
end
end

getChannelFull(msg.chat_id, groupinfo, nil)
end
getChannelMembers(msg.chat_id, 'Administrators' , 0, 200, BotStats)
end


if (Ramin:match("^دسترسی ربات (-100)(%d+)$") or Ramin:match("^[Ss][Tt][Aa][Tt][Uu][Ss] (-100)(%d+)$")) and tonumber(msg.reply_to_message_id) == 0  then
local chat_id = Ramin:match("^دسترسی ربات (.*)$") or Ramin:match("^[Ss][Tt][Aa][Tt][Uu][Ss] (.*)$")
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added')  then
sendText(msg.chat_id, msg.id, '◈ ربات در این گروه نصب نشده است!', 'md')
else
local function BotStats(extra, result, success)
local function groupinfo(arg, data, success)
local link = base:get(TD_ID.."Link:"..msg.chat_id) or ''
local GroupName =  base:get(TD_ID..'StatsGpByName'..msg.chat_id)
local Gpname = okname(GroupName)
if data.administrator_count == 0 then
sendText(msg.chat_id, msg.id, '• ربات ادمین گروه نمی باشد!', 'md')
else
if result.members then
for k,v in pairs(result.members) do
if v.user_id == tonumber(our_id) and v.status._== "chatMemberStatusAdministrator" then
if v.status.can_change_info then
change_info = '✓'
else
change_info = '✗'
end
if v.status.can_delete_messages then
delete_messages = '✓'
else
delete_messages = '✗'
end
if v.status.can_restrict_members then
restrict_members = '✓'
else
restrict_members = '✗'
end
if v.status.can_invite_users then
invite_users = '✓'
else
invite_users = '✗'
end
if v.status.can_pin_messages then
pin_messages = '✓'
else
pin_messages = '✗'
end
if v.status.can_promote_members then
promote_members = '✓'
else
promote_members = '✗'
end
if v.status.is_anonymous then
is_anonymous = '✓'
else
is_anonymous = '✗'
end
if v.status.can_post_messages then
can_post_messages = '✓'
else
can_post_messages = '✗'
end
send(msg.chat_id,msg.id, '• دسترسی ربات در گروه به صورت ذیل می باشد : \n\n◈تغییر اطلاعات گروه: '..change_info..'\n◈حذف پیام های گروه: '..delete_messages..'\n◈ مسدود کردن کاربر: '..restrict_members..'\n◈ لینک دعوت گروه: '..invite_users..'\n◈ سنجاق کردن پیام:  '..pin_messages..'\n◈ اضافه کردن ادمین: '..promote_members..'\n◈ ادمین مخفی: '..promote_members..'\n◈ارسال پست کانال : '..can_post_messages..'','md')
end
end
end
end
end
getChannelFull(chat_id, groupinfo, nil)
end
getChannelMembers(chat_id, 'Administrators' , 0, 200, BotStats)
end
end



if Ramin and (Ramin:match('^setnerkh (.*)') or Ramin:match('^تنظیم نرخ (.*)')) then
local nerkh = Ramin:match('^setnerkh (.*)') or Ramin:match('^تنظیم نرخ (.*)')
base:set(TD_ID..'nerkh',nerkh)
send(msg.chat_id, msg.id, 'متن نرخ تنظیم شد بر روی :\n'..nerkh..'', 'html')
end

if Ramin and (Ramin:match('^setnumbercard (.*)') or Ramin:match('^تنظیم شماره کارت (.*)')) then
local numbercard = Ramin:match('^setnumbercard (.*)') or Ramin:match('^تنظیم شماره کارت (.*)')
base:set(TD_ID..'numbercard',numbercard)
send(msg.chat_id, msg.id, '• شماره کارت تنظیم شده به  :\n'..numbercard..'', 'html')
end
if Ramin == 'delnerkh' or Ramin == 'حذف نرخ' then
base:del(TD_ID..'nerkh')
send(msg.chat_id, msg.id, '• نرخ تنظیم شده ربات حذف شد!', 'html')
end
if Ramin == 'delnumbercard' or Ramin == 'حذف شماره کارت' then
base:del(TD_ID..'numbercard')
send(msg.chat_id, msg.id, '• شماره کارت تنظیم شده حذف شد.', 'html')
end
if Ramin == 'umbercard' or Ramin == 'شماره کارت' then
txt = base:get(TD_ID..'numbercard')
send(msg.chat_id, msg.id, txt, 'html')
end
if Ramin and (Ramin:match('^setmonshi (.*)') or Ramin:match('^تنظیم منشی (.*)')) then
local monshi = Ramin:match('^setmonshi (.*)') or Ramin:match('^تنظیم منشی (.*)')
base:set(TD_ID..'monshi',monshi)
send(msg.chat_id, msg.id, 'متن منشی تنظیم شد بر روی :\n'..monshi..'', 'html')
end

--[[if Ramin == 'پینگ' or Ramin == 'ping' then
sendVideoNote(msg.chat_id,msg.id,0,1,nil,'./Alpha/data/videonote.mp4')
end --]]

if ALPHAent and (Ramin:match('^block (.*)') or Ramin:match('^بلاک (.*)')) or Ramin and (Ramin:match('^block @(.*)') or Ramin:match('^بلاک @(.*)') or Ramin:match('^block (%d+)') or Ramin:match('^بلاک (%d+)')) and is_JoinChannel(msg) then
local BDSource = Ramin:match('^block (.*)') or Ramin:match('^بلاک (.*)')
function BD_block(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^block @(.*)') or Ramin:match('^بلاک @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^block (%d+)') or Ramin:match('^بلاک (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^block (.*)') or Ramin:match('^بلاک (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
if base:sismember(TD_ID..'SUDO',Ramin) then
sendM(msg.chat_id,Ramin,msg.id,"❌ #اخطار  !\n• کاربر "..BDSource.." جزو مدیران ربات است و امکان بلاک کردن او وجود ندارد...!",33,utf8.len(BDSource))
else
sendM(msg.chat_id,Ramin,msg.id,'• کاربر : '..BDSource..' از اکانت ربات بلاک شد!', 10,utf8.len(BDSource))
Block(Ramin)
end
else
send(msg.chat_id, msg.id,'• کاربر '..BDSource..' یافت نشد ...!',  'md')
end
end
resolve_username(BDSource,BD_block)
end
--<><><><>UnBlock
if ALPHAent and (Ramin:match('^unblock (.*)') or Ramin:match('^انبلاک (.*)')) or Ramin and (Ramin:match('^unblock @(.*)') or Ramin:match('^انبلاک @(.*)') or Ramin:match('^unblock (%d+)') or Ramin:match('^انبلاک (%d+)')) and is_JoinChannel(msg) then
local BDSource = Ramin:match('^unblock (.*)') or Ramin:match('^انبلاک (.*)')
function BD_unblock(BlaCk,ALPHA)
if not ALPHAent and Ramin:match('^unblock @(.*)') or Ramin:match('^انبلاک @(.*)') then
Ramin = ALPHA.id
elseif not ALPHAent and Ramin:match('^unblock (%d+)') or Ramin:match('^انبلاک (%d+)') then
Ramin = BDSource
elseif ALPHAent and Ramin:match('^unblock (.*)') or Ramin:match('^انبلاک (.*)') then
Ramin = msg.content.entities[0].type.user_id
end
if Ramin then
sendM(msg.chat_id,Ramin,msg.id,'• کاربر : '..BDSource..' انبلاک شد!', 10,utf8.len(BDSource))
Unblock(Ramin)
else
send(msg.chat_id, msg.id,'• کاربر '..BDSource..' یافت نشد ...!','md')
end
end
resolve_username(BDSource,BD_unblock)
end

if Ramin and (Ramin1:match('^leave (-100)(%d+)$') or Ramin1:match('^خروج (-100)(%d+)$')) then
local chat_id = Ramin1:match('^leave (.*)$') or Ramin1:match('^خروج (.*)$')
local Hash = TD_ID..'StatsGpByName'..chat_id
base:del(Hash)
base:del(TD_ID..'Gp2:'..chat_id)
base:del(TD_ID..'Gp:'..chat_id)
base:del(TD_ID..'Gp3:'..chat_id)
base:del(TD_ID..'NewUser'..chat_id)
base:del(TD_ID.."ExpireData:"..chat_id)
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
local function GetName(BlaCk,ALPHA)
local function name(ramin,alpha)
if ALPHA.title then
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local timet = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
sendM(chat_id,msg.sender_user_id, msg.id,'• انجام شد\n• توسط : '..name..'\n\n💢 ربات از گروه با مشخصات زیر :\n• نام گروه : '..(ALPHA.title or '-')..'\n🆔 ایدی گروه : '..chat_id..'\nخارج شد\n زمان: '..timet..'',20,utf8.len(name))
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..chat_id..v)
base:del(TD_ID..'Total:AddUser:'..chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..chat_id..':'..v)
base:del(TD_ID..'Total:BanUser:'..chat_id..':'..v)
base:del(TD_ID..'Total:KickUser:'..chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..chat_id..':'..os.date("%Y/%m/%d")..':'..v)
end
end
end
GetUser(msg.sender_user_id,name)
end
GetChat(chat_id,GetName)
Left(chat_id,BotCliId,"Left")
Leave_api(chat_id)
end
if Ramin == 'server info' or Ramin == 'اطلاعات سرور' then
local serverinfo = io.popen("sh ./serverinfo.sh"):read("*a")
send(msg.chat_id,msg.id,serverinfo,'md')
end
if Ramin == 'chats' or Ramin == 'لیست گروه ها' then
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then
local list = base:smembers(TD_ID..'group:')
local t = 'لیست گروه های مدیریتی ربات:\n\n'
for k,v in pairs(list) do
local expire = base:ttl(TD_ID.."ExpireData:"..v)
if expire == -1 then
EXPIRE = "نامحدود"
else
local d = math.floor(expire / day ) + 1
EXPIRE = d.." روز"
end
local GroupsName = base:get(TD_ID..'StatsGpByName'..v)
t = t..k.."-💢\n•  ایدی گروه : ["..v.."]\n•  اسم گروه : "..(GroupsName or '---').."\n•  تاریخ انقضا گروه : ["..EXPIRE.."]\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n"
end
local file = io.open("./Alpha/data/Gplist.txt","w")
file:write(t)
file:close()
if #list == 0 then
t = 'لیست گروهها خالی میباشد !'
end
sendDocument(msg.chat_id,msg.id,0,1,nil,'./Alpha/data/Gplist.txt')
end
send(msg.chat_id,msg.id,t,'md')
end
if Ramin == 'backup' or Ramin == 'بک اپ' then
sendDocument(msg.chat_id,msg.id,0,1,nil,'/var/lib/redis/dump.rdb', '', dl_cb, nil)
end

if Ramin == 'reload' or Ramin == 'ریلود' then
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/animations/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/documents/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/music/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/photos/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/temp/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/video_notes/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/videos/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/voice/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/thumbnails/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/files/stickers/*")
io.popen("rm -rf ~/.telegram-bot/AlphaApi/data/stickers/*") 
io.popen("rm -rf ~/Alpha/Alpha/photo*.jpg")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/animations/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/documents/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/music/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/photos/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/temp/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/video_notes/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/videos/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/voice/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/thumbnails/*")
run_bash("rm -rf ~/.telegram-bot/AlphaApi/files/stickers/*")
dofile('B.lua')
send(msg.chat_id,msg.id,' • هلپر ربات بروزرسانے شد. ','md')
end

if  Ramin == 'پورن' then
local curl = io.popen('curl -X POST "https://www.picpurify.com/analyse/1.1" -F "API_KEY=NJSkerBnS720ALnGxTxo7CLbw8ehmKC8" -F "task=porn_moderation" -F "origin_id=xxxxxxxxx" -F "reference_id=yyyyyyyy" -F "file_image=@Alpha/data/pic.jpg"')

local res = curl:read('*all')   
local jdat = json:decode(res)   
---send(msg.chat_id,msg.id,''..jdat.status..'','md')
if jdat.porn_moderation.porn_content == true then
send(msg.chat_id, msg.id,'این یک تصویر پورن است', "md")
else
send(msg.chat_id, msg.id,'این یک تصویر معمولی است', "md")
end
end  






if Ramin == 'list thief agt' or Ramin == 'لیست سیستم AGT'  then
local list = base:smembers(TD_ID..'AGTMute:')
--local list2 = base:smembers(TD_ID..'GlobalyBanned:')
if #list == 0  then
send(msg.chat_id, msg.id, '• هیچ ربات تبلیغگری درسیستم پردازش اجراییAGT :یافت نشد.', 'md')
else
for k,v in pairs(list) do
ram = k
end


local keyboard = {}
keyboard.inline_keyboard = {{
{text = '• تعداد مسدود همگانی: '..ram..' عدد',callback_data = 'TAlphaBan:'..chat_id},
--},{
--{text = '• تعداد محدود همگانی: '..ram2..'عدد',callback_data = 'TabAlphaMute:'..chat_id},
}}
send_inline(msg.chat_id,'• لیست کاربران اخلالگر گروه ها درسیستمAGT',keyboard,'html')
---send(msg.chat_id, msg.id,'\n• تعداد محدود همگانی :  <b>'..ram..'</b> \n• تعداد مسدود همگانی : <b>'..ram2..'</b>\n شناسایی شده است.', 'html')
end
end

if Ramin == 'monshi on' or Ramin == 'منشی فعال' then
base:set(TD_ID..'MonShi:on',true)
send(msg.chat_id, msg.id, 'منشی #فعال شد','md')
end
if Ramin == 'monshi off' or Ramin == 'منشی غیرفعال' then
base:del(TD_ID..'MonShi:on')
send(msg.chat_id, msg.id, 'منشی #غیرفعال شد','md')
end
if Ramin == 'pmresan on' or Ramin == 'منشی فعال' then
base:del(TD_ID..'pmresan:on')
send(msg.chat_id, msg.id, 'پی ام رسانی روشن شد !','md')
end
if Ramin == 'pmresan off' or Ramin == 'منشی غیرفعال' then
base:set(TD_ID..'pmresan:on',true)
send(msg.chat_id, msg.id, 'پی ام رسانی خاموش شد !','md')
end

----------------------------------------------




if Ramin == 'reset list redis' or Ramin == 'ریست لیست ردیس'  then
local list = base:smembers(TD_ID..'SuperGp')
for k,v in pairs(list) do
for k, b in pairs(allusers) do
base:del(TD_ID..'BanUser:'..v)
base:del(TD_ID..'BanUser:'..v)
base:del(TD_ID..'MuteList:'..v)
base:del(TD_ID..'tabchiresjoin:'..v)
base:del(TD_ID..''..v..':warn')
base:del(TD_ID..''..v..':join')
base:zremrangebyscore(TD_ID..'bot:msgusr2:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Unsupported:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:VideoNote:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Sticker:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Audio:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Voice:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Photo:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:addusr2:'..v..':', 0, 2000000)
base:zremrangebyscore(TD_ID..'bot:Gif:'..v..':', 0, 2000000)
base:del(TD_ID..'Total:messages:'..v..'')
base:del(TD_ID..'Total:JoinedByLink:'..v..'')
base:del(TD_ID..'Total:AddUser:'..v)
base:del(TD_ID..'addeduser'..v..b)
base:del(TD_ID..'Total:AddUser:'..v..':'..b)
base:del(TD_ID..'Total:messages:'..v..':'..b)
base:del(TD_ID..'Total:BanUser:'..v..':'..b)
base:del(TD_ID..'Total:KickUser:'..v..':'..b)
base:del(TD_ID..'Total:messages:'..v..':'..os.date("%Y/%m/%d")..':'..b)
end
--send(msg.chat_id,msg.id,'• انجام شد','md')
end
end



if Ramin == 'resetstats' or Ramin == 'ریستارت امار' then
base:del(TD_ID..'SuperGp')
base:del(TD_ID..'Chat:Normal')
base:del(TD_ID..'ChatPrivite')
send(msg.chat_id,msg.id,'• انجام شد','md')
end
if Ramin == 'resetch' then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex1')
end
if Ramin and (Ramin:match("^مسدود همگانی با فوروارد$") or Ramin:match("^[Bb][Aa][Nn][Aa][Ll][Ll] [Ff][Oo][Rr][Ww][Aa][Rr][Dd]$")) then
base:setex(TD_ID.."banallforward"..msg.chat_id,45,true)
sendText(msg.chat_id, msg.id, ' لطفا پیامی از کاربر را فوروارد کنید:', 'md')
end

if Ramin and (Ramin:match('^مسدود همگانی$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll]$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
Banall(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end

if Ramin and (Ramin:match('^مسدود همگانی (.*)$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Banall(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^مسدود همگانی @(.*)$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = text:match('^مسدود همگانی @(.*)$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll] @(.*)$')
function modusername(extra,result,success)
if result.id then
Banall(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر @'..username..' یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end

if Ramin and (Ramin:match('^مسدود همگانی (%d+)$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Banall(msg, msg.chat_id, text:match('^مسدود همگانی (%d+)$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll] (%d+)$'))
end

if Ramin and (Ramin:match('^حذف مسدود همگانی$') or Ramin:match('^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
Unbanall(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end

if Ramin and (Ramin:match('^حذف مسدود همگانی (.*)$') or Ramin:match('^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
Unbanall(msg, msg.chat_id, id)
end

if Ramin and (Ramin:match('^حذف مسدود همگانی @(.*)$') or Ramin:match('^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف مسدود همگانی @(.*)$') or Ramin:match('^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] @(.*)$')
function remmodusername(extra,result,success)
if result.id then
Unbanall(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر @'..username..'  یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end

if Ramin and (Ramin:match('^حذف مسدود همگانی (%d+)$') or Ramin:match('^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
Unbanall(msg, msg.chat_id, text:match('^حذف مسدود همگانی (%d+)$') or Ramin:match('^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] (%d+)$'))
end


if Ramin and (Ramin:match('^لیست مسدود همگانی$') or Ramin:match('^[Bb][Aa][Nn][Aa][Ll][Ll][Ss]$')) and tonumber(msg.reply_to_message_id) == 0 then
local list = base:smembers(TD_ID..'GlobalyBanned:')
if #list == 0 then
send(msg.chat_id, msg.id, '◂ لیست مسدودین کلی خالی میباشد !', 'md')
else
local txt = '◂ لیست مسدودین کلی :\n\n'
for k,v in pairs(list) do
local firstname = redis:get('firstname'..v)
if firstname then
username = '<a href="tg://user?id='..v..'">'..check_html(firstname)..'</a>'
else
username = '<a href="tg://user?id='..v..'">'..v..'</a>'
end
txt = txt..k..' - [ '..username..' ]\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end


if Ramin == 'clean gbans' or Ramin == 'پاکسازی لیست گلوبال' then
base:del(TD_ID..'GlobalyBanned:')
send(msg.chat_id, msg.id,'• لیست گلوبال پاکسازی شد','md')
end



if Ramin == 'clean gbans' or Ramin == 'پاکسازی لیست گلوبال' then
base:del(TD_ID..'GlobalyBanned:')
base:del(TD_ID..'AGTMute:')
base:del(TD_ID..'GlobalyMute:')
send(msg.chat_id, msg.id,'• ok','md')
end
---------------Unbanall--------------
-------
if is_supergroup(msg) then

if Ramin == 'مالک گروه' and is_Sudo(msg) then
local function GetCreator(extra,result,success)
for k,v in pairs(result.members) do
if v.status._ == "chatMemberStatusCreator" then
local function Ramin(arg,data,success)
if data.first_name == '' then
username = 'nil'
else
username = ''..data.first_name..'- @'..data.username..''
end
function bio(x,b)
function GetPro(arg,data)
if data.photos[0] then
sendPhoto(msg.chat_id, msg.id, 0, 1, nil, data.photos[0].sizes[2].photo.persistent_id,'• صاحب اصلی گروه  '..username..'  میباشد\n• بیوگرافی : '..check_markdown(b.about or '')..'\n• کانال ما :'..Channel..'')
else
send(msg.chat_id,msg.id,'• صاحب اصلی گروہ '..username..'  میباشد\n\n• بیوگرافی : '..check_markdown(b.about or '')..'\n\n• کانال ما : @'..Channel..'','md')
end
end
number = {" 1 "," 2 "}
ramin = number[math.random(#number)]
tdbot_function ({_ ="getUserProfilePhotos",user_id = (v.user_id or 00000000),offset =ramin,limit = 100000000 },GetPro,nil)
end
GetUserFull(v.user_id,bio)
end
GetUser(v.user_id,Ramin,nil)
end
end
end
getChannelMembers(msg.chat_id,'Administrators',0,200,GetCreator)
end



if Ramin == 'leave' or Ramin == 'خروج' then
send(msg.chat_id,msg.id,"• ربات از گروه خارج شد...!",'md')
Left(msg.chat_id,BotCliId,'Left')
Leave_api(msg.chat_id)
end





if (Ramin == 'charge full' or Ramin == 'شارژ نامحدود') then
dofile('./Alpha/time.lua')
local function GetName(BlaCk,ALPHA)
local function setlinkgp(td,Ramin)

base:set(TD_ID.."ExpireData:"..msg.chat_id,true)
base:sadd(TD_ID..'Gp2:'..chat_id,'added')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex1')
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local link = base:get(TD_ID..'Link:'..msg.chat_id) or 'ثبت نشده است.'
linkgp = okname(link)
local timet = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send(msg.chat_id,msg.id,' ─┅━ تنظیم شارژ جدید گروه شما ━┅─\n◈ تعداد روز : نامحدود\n◈ نام گروه  '..ALPHA.title..'\n◈ تعداد ممبر گروه : '..Ramin.member_count..' کاربر\n◈ شارژ کننده : '..name..'\n◈ زمان  :  `'..timet..'`','md')
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '🔥 گزارش شارژ گروه  🔥',callback_data = 'ERROR:'..msg.chat_id},
},{
{text = '▶️ عضویت درگروه ',url = link},
}
}
send_inline(Sudoid,' ─┅━ گزارش شارژ کردن گروه ━┅─\n◈ تعداد روز : نامحدود\n◈ نام گروه  '..ALPHA.title..'\n◈ تعداد ممبر گروه : '..Ramin.member_count..' کاربر\n◈ شارژ کننده : '..name..'\n◈ زمان  :  <code>'..timet..'</code> ',keyboard,'html')
end
GetUser(msg.sender_user_id,name)
end
getChannelFull(msg.chat_id,setlinkgp)
end
GetChat(msg.chat_id,GetName)
end
if Ramin and Ramin:match('^chargegift (-%d+) (%d+)')  or Ramin and Ramin:match('^شارژ هدیه (-%d+) (%d+)') then
local Ramin = {
Ramin:match("^chargegift (-%d+) (%d+)")  or Ramin:match("^شارژ هدیه (-%d+) (%d+)")
}
local function GetName(BlaCk, ALPHA)
local function setlinkgp(td,Ramin)
local charge = base:ttl(TD_ID.."ExpireData:"..Ramin[1])
local timee = 86400 * Ramin[2]
local tamdidcharge = tonumber(charge) + tonumber(timee)
local newcharge = math.floor(tamdidcharge / 86400)
base:setex(TD_ID.."ExpireData:"..Ramin[1],tamdidcharge,true)
local ti = math.floor(timee / day )
local function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local text = '❤️🌹با سلام خسته نباشید\nبه کاربران گروه <code>'..ALPHA.title..'</code>\n\n📜تبریک به مدیران گروه\n ازطرف پشتیبانی ربات اعتبار هدیه شارژ ثبت وتنظیم شد.\n<code>🎁 میران اعتبار هدیه</code> [<b>'..matches[2]..'</b>]روز\n\n🗓میزان شارژ جدید شما با احتساب هدیه: [<b>'..newcharge..'</b>]روز\n• هدیه توسط :'..name..' '
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '💥 کانال تیم ',url='https://telegram.me/'..Config.Channel},
}
}
send_inline(Ramin[1],text,keyboard,'html')
send(Sudoid, msg.id,'شارژ گروه ['..Ramin[1]..'] به میزان ['..Ramin[2]..'] روز افزایش یافت.','md')
end
GetUser(msg.sender_user_id,name)
end
getChannelFull(msg.chat_id,setlinkgp)
end
GetChat(Ramin[1],GetName)
end

if Ramin and (Ramin:match('^chargemin (%d+)$') or Ramin:match('^شارژ هدیه (%d+)$')) then
local gp = Ramin:match('شارژ هدیه (%d+)$')
for k,v in pairs(base:smembers(TD_ID..'group:')) do
local ex = base:ttl(TD_ID.."ExpireData:"..v)
if ex and ex >= 0 then
local b = math.floor(ex / 86400) + 1
local t = tonumber(gp)
local time_ = b + t
local time = time_ * 86400
base:setex(TD_ID.."ExpireData:"..v,time,true)
end
XD = k
end
send(msg.chat_id, msg.id, 'تعداد *'..XD..'* گروه ربات به مدت *'..gp..'* روز با موفقیت شارژ شد.','md')
end
------------------------
if Ramin and (Ramin:match('^chargemin (%d+)$') or Ramin:match('^کسر شارژ همه (%d+)$')) then
local gp = Ramin:match('کسر شارژ همه (%d+)$')
for k,v in pairs(base:smembers(TD_ID..'group:')) do
local ex = base:ttl(TD_ID.."ExpireData:"..v)
if ex and ex >= 0 then
local b = math.floor(ex / day) - 1
local t = tonumber(gp)
local time_ = b - t
local time = time_ * day - 2
base:setex(TD_ID.."ExpireData:"..v,time,true)
end
XD = k
end
send(msg.chat_id, msg.id, 'تعداد *'..XD..'* گروه ربات به مدت *'..gp..'* از شارژ اعتبار کسیر گردید!','md')
end
------------------------
if Ramin and (Ramin:match('^codegift (%d+)') or Ramin:match('^کد هدیه (%d+)')) then
local Matches = Ramin:match('^codegift (%d+)') or Ramin:match('^کد هدیه (%d+)')
local code = {'1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
local a = code[math.random(#code)]
local b = code[math.random(#code)]
local c = code[math.random(#code)]
local d = code[math.random(#code)]
local e = code[math.random(#code)]
local f = code[math.random(#code)]
local chargetext = Matches
local codetext = ""..a..b..c..d..e..f..""
redis:sadd(TD_ID.."CodeGift:", codetext)
redis:hset(TD_ID.."CodeGiftt:", codetext , chargetext)
redis:setex(TD_ID.."CodeGiftCharge:"..codetext,chargetext * 86400,true)
local text = "*کد با موفقیت ساخته شد.\nکد :*\n*"..codetext.."*\n*دارای* *"..chargetext.."* *روز شارژ میباشد .*"..EndMsg
local text2 = "*کدهدیه جدید ساخته شد.*\n*¤ این کدهدیه دارای* *"..chargetext.."* *روز شارژ میباشد !*\n*¤ طرز استفاده :*\n*¤ ابتدا دستور 'gift' راوارد نماید سپس کدهدیه را وارد کنید :*\n*"..codetext.."*\n*رو در گروه خود ارسال کند ,* *"..chargetext.."* *روز شارژ به گروه آن اضافه میشود !*\n*¤¤¤ توجه فقط یک نفر میتواند از این کد استفاده کند !*"
send(msg.chat_id, msg.id,text,'md')
send(Sudoid, msg.id,text2,'md')
end

if Ramin == "giftlist" or Ramin == "لیست کدهدیه" then
local list = base:smembers(TD_ID.."CodeGift:")
local text = '*💢 لیست کد هدیه های ساخته شده :*\n'
for k,v in pairs(list) do
local expire = base:ttl(TD_ID.."CodeGiftCharge:"..v)
if expire == -1 then
EXPIRE = "نامحدود"
else
local d = math.floor(expire / 86400 ) + 1
EXPIRE = d..""
end
text = text..k.."- *• کدهدیه :*\n[ *"..v.."* ]\n*• شارژ :*\n*"..EXPIRE.."*\n\n❦❧❦❧❦❧❦❧❦❧\n"
end
if #list == 0 then
text = '*هیچ کد هدیه , ساخته نشده است*'..EndMsg
end
send(msg.chat_id, msg.id,text,'md')
end
if Ramin == "resetgif" or Ramin == "ریست هدیه" then
base:del(TD_ID.."CodeGift:")
send(msg.chat_id, msg.id,'ریست شد!','md')
end
---------------------------------


if Ramin and (Ramin:match('^charge (%d+)$') or Ramin:match('^شارژ (%d+)$')) then
local function GetName(BlaCk, Guardian)
local function setlinkgp(td,MrRamin)
local time = tonumber(Ramin:match('^charge (%d+)$') or Ramin:match('^شارژ (%d+)$'))* day
local charg = Ramin:match('^charge (%d+)') or Ramin:match('^شارژ (%d+)')
base:setex(TD_ID.."ExpireData:"..msg.chat_id,time-1,true)
base:set(TD_ID..'ExpireDataNum:'..msg.chat_id,charg)
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex3')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex2')
base:srem(TD_ID..'Gp2:'..msg.chat_id,'chex1')
local link = base:get(TD_ID..'Link:'..msg.chat_id) or 'ثبت نشده است.'
linkgp = okname(link)
local ti = math.floor(time / day )
local function name(black,guard)
if guard.username == '' then name = ec_name(guard.first_name) else name = guard.username end
local timet = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
local txt = '◈ تاریخ اتمام شارژ :\n'..jdatee(' #Y/#M/#D | #x')..''
send(msg.chat_id,msg.id,' ─┅━ تنظیم شارژ جدید گروه شما ━┅─\n◈ تعداد روز : '..ti..'روز\n◈ نام گروه  '..Guardian.title..'\n◈ شارژ کننده : '..name..'\n◈ زمان  :  `'..timet..'`\n\n '..txt..'','md')
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '🔥 گزارش شارژ گروه  🔥',callback_data = 'ERROR:'..msg.chat_id},
},{
{text = '▶️ عضویت درگروه ',url = link},
}
}
send_inline(Sudoid,' ─┅━ گزارش شارژ کردن گروه ━┅─\n◈ تعداد روز : '..ti..'روز\n◈ نام گروه  '..Guardian.title..'\n◈ شارژ کننده : @'..name..'\n◈ زمان  :  <code>'..timet..'</code>\n\n\n '..txt..' ',keyboard,'html')
end
GetUser(msg.sender_user_id,name)
end
getChannelFull(msg.chat_id,setlinkgp)
end
GetChat(msg.chat_id,GetName)
end



if Ramin == 'ownerlist' or Ramin == 'لیست مالکان' then
local list = base:smembers(TD_ID..'OwnerList:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈ *لیست مالکان گروه خالی میباشد* ', 'md')
else
local txt = 'لیست مالک های ربات در گروه :\n\n'
for k,v in pairs(list) do

local usrname = base:get('UserName:'..v)
if usrname then
username = '@'..usrname..' - <code>'..v..'</code>'
else
Name = base:get(TD_ID..'UserName:'..v) or 'none'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..'<b>'..k..'-</b>• نام کاربر:'..username..'\nایدی کاربر:<code>'..v..'</code>\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end

--<><><><>SetOwner

if Ramin and (Ramin:match('^مالک$') or Ramin:match('^setowner$')) and tonumber(msg.reply_to_message_id) > 0 then
function SetMod(extra, result, success)
SetOwner(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, SetMod)
end
if Ramin and (Ramin:match('^مالک (.*)$') or Ramin:match('^setowner (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
SetOwner(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^مالک @(.*)$') or Ramin:match('^setowner @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^مالک @(.*)$') or Ramin:match('^setowner @(.*)$')
function modusername(extra,result,success)
if result.id then
SetOwner(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, modusername)
end
if Ramin and (Ramin:match('^مالک (%d+)$') or Ramin:match('^setowner (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
SetOwner(msg, msg.chat_id, Ramin:match('^مالک (%d+)$') or Ramin:match('^setowner (%d+)$'))
end
if Ramin and (Ramin:match('^حذف مالک$')  or Ramin:match('^remowner$')) and tonumber(msg.reply_to_message_id) > 0 then
function RemMod(extra, result, success)
RemOwner(msg, msg.chat_id, result.sender_user_id)
end
getMessage(msg.chat_id, msg.reply_to_message_id, RemMod)
end
if Ramin and (Ramin:match('^حذف مالک (.*)$') or Ramin:match('^remowner (.*)$')) and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" and tonumber(msg.reply_to_message_id) == 0 then
id = msg.content.entities[0].type.user_id
RemOwner(msg, msg.chat_id, id)
end
if Ramin and (Ramin:match('^حذف مالک @(.*)$') or Ramin:match('^remowner @(.*)$')) and tonumber(msg.reply_to_message_id) == 0 then
local username = Ramin:match('^حذف مالک @(.*)$') or Ramin:match('^remowner @(.*)$')
function remmodusername(extra,result,success)
if result.id then
RemOwner(msg, msg.chat_id, result.id)
else
send(msg.chat_id, msg.id, '◂ کاربر ▏  @'..username..' ▕ یافت نشد !','md')
end
end
searchPublicChat(username, remmodusername)
end
if Ramin and (Ramin:match('^حذف مالک (%d+)$') or Ramin:match('^remowner (%d+)$')) and tonumber(msg.reply_to_message_id) == 0 then
RemOwner(msg, msg.chat_id, Ramin:match('^حذف مالک (%d+)$') or Ramin:match('^remowner (%d+)$'))
end

-----------------------ناظم

if Ramin == 'clean ownerlist' or Ramin  == 'پاکسازی لیست مالکان' then
base:del(TD_ID..'OwnerList:'..msg.chat_id)
send(msg.chat_id,msg.id,'◈ *لیست مالکین گروه پاکسازی شد* ','md')
end
-------------Globaly Banned--------------

if Ramin == 'kickall' or Ramin == 'اخراج همه' then
local function checkadmin(BlaCk,ALPHA)
if ALPHA.status.can_restrict_members then
function CleanMembers(arg,data)
for k, v in pairs(data.members) do
if tonumber(v.user_id) ~= tonumber(Sudoid) then
KickUser(msg.chat_id,v.user_id)
end
end
end
getChannelMembers(msg.chat_id,"Recent",0, 2000000,CleanMembers)
sendText(msg.chat_id,msg.id,'• انجام شد\nهمه ممبر ها اخراج شدند','md')
else
send(msg.chat_id,msg.id,'✖️ ربات به قسمت محرومیت کاربران  دسترسی ندارد !\n❗️لطفا از تنظیمات گروه این قابلیت را برای ربات فعال کنید سپس مجدد تلاش کنید !','md')
end
end
getChatMember(msg.chat_id,BotCliId,checkadmin)
end

end
end

-------fun------
----شخصی
if (not base:sismember(TD_ID..'Gp:'..msg.chat_id,'Lock:Cmd') or VipUser(msg,msg.sender_user_id)) and is_supergroup(msg) and base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then


if Ramin == 'ping' or  Ramin == 'پینگ' and is_JoinChannel(msg) then
local time_ = os.time()
if time_ ~= os.time() then
Stop = os.time() - time_
else
Stop = "بدون وقفه"
end
ping = io.popen("ping -c 1 api.telegram.org"):read("*a"):match("time=(%S+)")
send(msg.chat_id, msg.id, "◈ *ربات اصلی آنلاین می باشد!* ▸\n▲ ارسال : `" .. os.time() - time_ .. " ثانیه`\n▼ دریافت : `" .. Stop .. "`\n◄ پینگ سرور : `" .. ping .. "`\n", "md")
end



if Ramin == 'ربات' and is_JoinChannel(msg) then
if  msg.sender_user_id == 724990027 then
local rankpro = {'😍 وای عشق من سلطان من اومد ','☹️ بابا تو این گروه منو اذیت می کنند','😊 مالک این گروه عموی منه دوسش دارم','جووون','🤨 درد کجا بودی اینا منو اذیت می کنند'}
send(msg.chat_id,msg.id,rankpro[math.random(#rankpro)],'md')
else
local Bot = base:get(TD_ID..'rank'..msg.chat_id..msg.sender_user_id)
if Bot then
local rankpro = {'در خدمتم قربان 🤨 '..Bot..'','ربات خوبیم بخدا '..Bot..'','اوووف تو فقط صدام کن  '..Bot..'','هر لحظه قلب رباتیم برای تو میتپه '..Bot..'','ای جانان من تویی همه جان من '..Bot..'',' هیییس صدام نکن سر پستم '..Bot..' عه حواسم پرت نکن دارم لینک میپاکم 😒',''..Bot..'😡😡',''..Bot..'😍😍','لینک تو دماغت 🤪 '..Bot..'😍'}
send(msg.chat_id,msg.id,rankpro[math.random(#rankpro)],'md')
else
local function Guardian(Ramin,Gaurd)
if Gaurd.username == '' then
name = ec_name(Gaurd.first_name)
else
name = Gaurd.username
end
if ec_name(Gaurd.first_name) == '' then
frname = ec_name(Gaurd.last_name)
else
frname = ec_name(Gaurd.first_name)
end
local rrr ={name,frname,'['..name..'](tg://user?id='..msg.sender_user_id..')','['..frname..'](tg://user?id='..msg.sender_user_id..')'}
local rank = {rrr[math.random(#rrr)]..' در خدمتم قربان 🤨','آنلاینم فداتشم','ربات خوبیم بخدا  '..rrr[math.random(#rrr)].. 'هر لحظه قلب رباتیم برای تو میتپه😎','ای جانان من تویی همه جان من '..rrr[math.random(#rrr)].. 'به عشق تو❤️','هیییس صدام نکن سر پستم '..rrr[math.random(#rrr)],' عشقمی 😍'}
send(msg.chat_id,msg.id,rank[math.random(#rank)],'md')
end
GetUser(msg.sender_user_id,Guardian)
end
end
end
------Bot Chat-----
if Ramin and (Ramin:match('^setsticker (.*)') or Ramin:match('^تنظیم چت استیکر (.*)')) and tonumber(msg.reply_to_message_id) > 0 then
local cmd = Ramin:match('^setsticker (.*)') or Ramin:match('^تنظیم چت استیکر (.*)')
function Saved(Ramin,ALPHA)
if ALPHA.content._ == 'messageSticker' then
typegpadd('Stickerslist:',cmd)
typegpset('Stickers:'..cmd,ALPHA.content.sticker.sticker.persistent_id)
send(cht,msg.id,'◈*استیکر* : *'..cmd..'* *ذخیرہ شد*. ','md')
end
end
getMessage(cht, tonumber(msg.reply_to_message_id),Saved)
end


if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'BotChat') then
if Ramin and base:sismember(TD_ID..'Stickerslist:'..msg.chat_id,Ramin) then
local sticker = base:get(TD_ID..'Stickers:'..Ramin..''..msg.chat_id)
sendSticker(msg.chat_id,msg.id,sticker)
end


if Ramin and base:sismember(TD_ID..'Textlist:'..msg.chat_id,Ramin) then
local text = base:hget(TD_ID..'Text:'..msg.chat_id,Ramin)
send(msg.chat_id,msg.id,text,'html')
end

end
----------------------------------


if ALPHAent and (Ramin:match('^id (.*)') or Ramin:match('^آیدی (.*)') or Ramin:match('^ایدی (.*)')) and is_JoinChannel(msg) then
id = msg.content.entities[0].type.user_id
if id then
sendM(msg.chat_id,id, msg.id, ''..id..'',0,string.len(id))
end
end

if Ramin and (Ramin:match('^id @(.*)') or Ramin:match('^ایدی @(.*)')) and is_JoinChannel(msg) then
local username = Ramin:match('^id @(.*)') or Ramin:match('^ایدی @(.*)')
function IdByUserName(arg,data)
if data.id then
sendM(msg.chat_id,data.id, msg.id, ''..data.id..'', 0,string.len(data.id))
else
send(msg.chat_id,msg.id,"• کاربر : @"..check_markdown(username).." _یافت نشد _!",'md')
end
end
resolve_username(username,IdByUserName)
end


if (Ramin == 'time' or Ramin == 'زمان') then
local time = jdate('• امروز #x\n• تاریخ: #Y/#M/#D\n• ساعت: #h:#m:#s\n• فصل: #F\n• حیوان سال: #y \n• ذکر: #z') or 'لطفا بعدا تلاش کنید.'
send(msg.chat_id, msg.id,time, 'html')
end
if (Ramin == 'nerkh seke' or Ramin == 'نرخ سکه') then
result, res = https.request("https://api.codebazan.ir/arz/?type=tala")
if res ~= 200 then
return send(msg.chat_id,msg.id,"مشکل در ارتباط با سرور!",'md')
else
jdat = json:decode(result)
local text = "◈ قیمت سکه تا الان  : \n\n"
for i = 1, #jdat do
text = text .. "\n» نوع : " .. jdat[i].name .. "\n» قیمت : " .. jdat[i].price .. "\n» تغییر : " .. jdat[i].change .. "\n» درصد : " .. jdat[i].percent.."\n"
end
return send(msg.chat_id,msg.id,''..text..'\n🆔 '..Channel..'','md')
end
end


-- if (Ramin == 'arz' or Ramin == 'ارز') then
-- result, res = https.request("https://api.codebazan.ir/arz/?type=arz")
-- if res ~= 200 then
-- return send(msg.chat_id,msg.id,"مشکل در ارتباط با سرور!",'md')
-- else
-- data = json:decode(result)
-- flag = {"🇪🇺","🇦🇪","🇸🇪","🇦🇲","🇩🇿","🇸🇦","🇮🇳","🇶🇦","🇲🇾","🇳🇿","🇧🇭","🇳🇴","🇮🇶","🇨🇭","🇬🇪","🇷🇺","🇰🇼","🇳🇿","🇴🇲","🇨🇦","🇹🇭","🇹🇷","🇬🇧","🇭🇰","🇦🇿","🇩🇰","🇨🇳","🇯🇵","🇸🇾","🇺🇸"}
-- local text = "◈ قیمت ارز های روز با اطلاعات:\n\n"
-- for k,v in pairs(data) do
-- text = text..flag[k].."-"..v.name.." ↫ "..v.price.." ⇦ "..v.change..v.percent.."\n"
-- end
-- return send(msg.chat_id,msg.id,text,'md')
-- end
-- end

if Ramin and (Ramin:match('^هواشناسی (.*)')) and is_JoinChannel(msg) then
local Gaurd = Ramin:match('^هواشناسی (.*)')
url, res = https.request("https://api.codebazan.ir/weather/?city=" ..Gaurd)
if res ~= 200 then
return send(msg.chat_id,msg.id,"◈ مشکل در ارتباط با سرور!",'md')
else
data = json:decode(url)
if data.Ok then
local text = "◈ اطلاعات هواشناسی به صورت ذیل است  :"
for i, v in pairs(data.result) do
text = text .. "\n " ..i.. " : " ..v
end
return send(msg.chat_id,msg.id,text,'md')
else
return send(msg.chat_id,msg.id,"◈ اشکال در ایجاد کلمه لطفا دوباره تلاش کنید!",'md')
end
end
end

if Ramin and (Ramin:match('^fonten (.*)') or Ramin:match('^زیباسازی لاتین (.*)')) and is_JoinChannel(msg) then
local name = Ramin:match('^fonten (.*)') or Ramin:match('^زیباسازی لاتین (.*)')
result, res = https.request("https://api.codebazan.ir/font/?text="..name)
if res ~= 200 then
return send(msg.chat_id,msg.id,"◈ مشکل در ارتباط با سرور!",'md')
else
data = json:decode(result)
if data.ok then
local text = "◈ فونت برای 99 حالت ساخته شد:"
for k,v in pairs(data.result) do
text = text.."\n"..k.."- "..v
end
return send(msg.chat_id,msg.id,text,'md')
else
return send(msg.chat_id,msg.id,"اشکال در ایجاد کلمه لطفا دوباره تلاش کنید!",'md')
end
end
end

if (Ramin == 'سگ') and is_JoinChannel(msg) then
local  url , res = https.request('https://dog.ceo/api/breeds/image/random')
if res ~= 200 then
end
local jdat = json:decode(url)
dog  = jdat.message or ''
local file = DownloadFile(dog,'dog.jpg')
sendDocument(msg.chat_id,msg.id,0,1,nil,file,Channel,dl_cb,nil)
end

if (Ramin == 'گربه') and is_JoinChannel(msg) then
local  url = https.request('https://aws.random.cat/meow')
local jdat = json:decode(url)
local file = DownloadFile(jdat.file,'cat.jpg')
sendPhoto(msg.chat_id,msg.id,0,1,nil,file,'',dl_cb, nil)
end

if (Ramin == 'سگ') and is_JoinChannel(msg) then
local  url = https.request('https://random.dog/woof.json')
local jdat = json:decode(url)
io.popen('wget -O ./Alpha/dog.webp '..jdat.url..''):read('*a')
sendPhoto(msg.chat_id,msg.id,0,1,nil,'./Alpha/dog.webp',Channel,dl_cb,nil)
--sendDocument(msg.chat_id,msg.id,0,1,nil,'./Alpha/dog.webp','',dl_cb,nil)
end

if (Ramin == 'پرنده') and is_JoinChannel(msg) then
local  url = https.request('https://some-random-api.ml/img/birb')
local jdat = json:decode(url)
io.popen('wget -O ./Alpha/dog.webp '..jdat.link..''):read('*a')
sendPhoto(msg.chat_id,msg.id,0,1,nil,'./Alpha/dog.webp',Channel,dl_cb,nil)
--sendDocument(msg.chat_id,msg.id,0,1,nil,'./Alpha/dog.webp','',dl_cb,nil)
end

if Ramin and (Ramin:match('^تعبیر خواب (.*)'))  then
local bd = Ramin:match('تعبیر خواب (.*)')
base:set(TD_ID..'tabir:'..msg.chat_id,bd )
end
if Ramin and (Ramin:match('^تعبیر خواب (.*)'))  then
local bd = Ramin:match('تعبیر خواب (.*)')
local tabir = base:get(TD_ID..'tabir:'..msg.chat_id) or 'بدون نام'
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'دیدن تعبیر خواب',url='https://api.codebazan.ir/tabir/html/?text='..tabir}
}
}
send_inline(msg.chat_id,'• کاربر عزیز تعبیر خواب شما آماده شد.\n🌙تعبیر خواب شما :<code>'..tabir..'</code>\n💥برای مشاهده تعبیر خواب لطفا دکمه دیدن تعبیر خواب را  بزنید. ',keyboard,'html')
end
if Ramin and (Ramin:match('^اذان (.*)'))  then
local text = Ramin:match('اذان (.*)')
local url , res = http.request('http://api.aladhan.com/timingsByCity?city='..text..'&country=IR&method=2')
if res ~= 200 then
return
end
local jdat = json:decode(url)
local azan = '🕌اوقات شرعی امروز *'..text..'*به صورت ذیل است :\n──══──══──\n🌌اذان صبح :*'..jdat.data.timings.Fajr..'*\n\n🌅طلوع آفتاب:*'..jdat.data.timings.Sunrise..'*\n\n🏞اذان ظهر:*'..jdat.data.timings.Dhuhr..'*\n\n🏙اذان مغرب :*'..jdat.data.timings.Maghrib..'*\n\n🌆غروب آفتاب : *'..jdat.data.timings.Sunset..'*\n\n🌃زمان اشاء:*'..jdat.data.timings.Isha..'*\n\n🌙نیمه شب شرعی:*'..jdat.data.timings.Midnight..'*\n'
send(msg.chat_id,msg.id,azan,'md')
end

--[[if Ramin and (Ramin:match('^insta (.*)') or Ramin:match('^اینستگرام (.*)')) and is_JoinChannel(msg) then
local bd = Ramin:match('^insta (.*)') or Ramin:match('^اینستگرام (.*)')
if bd  then
local  url , res = https.request('https://api.codebazan.ir/instagram/?id='..bd)
if res ~= 200 then
end
local jdat = json:decode(url)
biography = jdat.graphql.user.biography or '---'
followedby = jdat.graphql.user.edge_followed_by.count or '---'
follow = jdat.graphql.user.edge_follow.count or '---'
name = jdat.graphql.user.full_name or '---'
id = jdat.graphql.user.id or '---'
pic = jdat.graphql.user.username or '---'
edge_owner_to_timeline_media = jdat.graphql.user.edge_owner_to_timeline_media.count or '---'
edge_felix_video_timeline = jdat.graphql.user.edge_felix_video_timeline.count or '---'
profile_pic_url_hd = jdat.graphql.user.profile_pic_url_hd or '---'
if jdat.graphql.user.is_private == true then
p = 'Is private'
else
p = 'Is not private'
end
local file = DownloadFile(profile_pic_url_hd,'insta.jpg')
sendPhoto(msg.chat_id,msg.id,0,1,nil,file, alpha,dl_cb, 'md')
alpha = '◈ Name: '..name..'\n🆔ID :'..id..'\n📥 Followers :'..followedby..'\n📤 Following:'..follow..'\n⛎ UserName :@'..pic..'\n✉️ Posts: '..edge_owner_to_timeline_media..'\n🎥 NumIGTV : '..edge_felix_video_timeline..' Flim\n🔌 Private status :'..p..''
else
send(msg.chat_id,msg.id,'• چنین کاربری در اینستگرام یافت نشد .','md')
end
end--]]
---------------------
if Ramin == 'وضعیت من' and is_JoinChannel(msg) then
local datebase = {"درحال شادی","ناراحت از زندگی","خیلی مصمم برای انجام کار","اماده انجام وظیفه","احتمالا یخورده خوابت میاد","خسته مثل دشمن😂","اماده خوردن چن تا ادم ازگشنگی😂😝😝"}
local num1= math.random (1,100);local num2= math.random (1,100);local num3= math.random (1,100);local num4= math.random (1,100);local num5= math.random (1,100);local num6= math.random (1,100);local num7= math.random (1,100);local num8= math.random (1,100)
local text = "وضعیت شما به صورت زیر است\n بی حوصلگی : "..num1.."%\nخوشحالی : "..num2.."%\nافسردگی : "..num3.."%\nامادگی جسمانی : "..num4.."%\nدرصد سلامتی : "..num5.."%\nتنبلی : "..num6.."%\nبی خیالی : "..num6.."%\nوضعیت روحی شما : "..datebase[math.random(#datebase)]
sendMessage(msg.chat_id, msg.id, 1, text, 1, "html")
end

if Ramin and (Ramin:match('^getpro (%d+)$') or Ramin:match('^عکس پروفایل (%d+)$')) then
local offset = tonumber(Ramin:match('^getpro (%d+)'))
or tonumber(Ramin:match('^عکس پروفایل (%d+)'))
if offset > 50 then
send(msg.chat_id,msg.id,'اشتباه زدی داداچ\n من بیشتر از 50 عکس پروفایل شما را نمیتوانم ارسال کنم ❎','md')
elseif offset < 1 then
send(msg.chat_id,msg.id,'لطفا عددی بزرگتر از 0 بکار ببرید• ','md')
else
function GetPro1(extra, result, success)
if result.photos[0] then
sendPhoto(msg.chat_id,msg.id, 0, 1, nil, result.photos[0].sizes[2].photo.persistent_id,'» تعداد پروفایل : '..offset..'/'..result.total_count..'\n» سایز عکس : '..result.photos[0].sizes[2].photo.size..' پیکسل ')
else
send(msg.chat_id,msg.id,'شما عکس پروفایل '..offset..' ندارید','md')
end
end
tdbot_function ({_ ="getUserProfilePhotos", user_id = msg.sender_user_id, offset = offset-1, limit = 100000000000000000000000 },GetPro1,nil)
end
end
if Ramin and (Ramin:match('^whois (%d+)$') or Ramin:match('^اطلاعات (%d+)$')) then
local id = tonumber(Ramin:match('^whois (%d+)') or Ramin:match('^اطلاعات (%d+)'))
local function Whois(BlaCk,ALPHA)
if ALPHA.first_name then
username = ALPHA.first_name
sendM(msg.chat_id,ALPHA.id, msg.id,username,0,utf8.len(username))
else
send(msg.chat_id,msg.id,'*کاربر ['..id..'] یافت نشد*','md')
end
end
GetUser(id,Whois)
end

if Ramin and Ramin:match('^echo (.*)$')  then
local txt = Ramin:match('^echo (.*)')
send(msg.chat_id,msg.id,txt,'md')
end

-- if Ramin and (Ramin:match('^به عکس$') or Ramin:match('^[Tt][Oo][Pp][Hh][Oo][Tt][Oo]$')) and tonumber(msg.reply_to_message_id) > 0  then
-- function tophoto(extra, result, success)
-- if result.content._ == "messageSticker" then
-- local pathf = result.content.sticker.sticker.path
-- sendPhoto(msg.chat_id, msg.id, 0, 1, nil, pathf, '', dl_cb, nil)
-- else
-- send(msg.chat_id, msg.id, '◄ این فایل استیکر نمیباشد !', 'md')
-- end
-- end
-- getMessage(msg.chat_id, tonumber(msg.reply_to_message_id), tophoto)
-- end

if Ramin and (Ramin:match('^به عکس$') or Ramin:match('^[Tt][Oo][Pp][Hh][Oo][Tt][Oo]$')) and tonumber(msg.reply_to_message_id) > 0  then
function tophoto(extra, result)
if result.content._ == 'messageSticker' then
print(result.content.sticker.sticker.path)
sendPhoto(msg.chat_id, msg.id, 0, 1, nil, result.content.sticker.sticker.path, '', dl_cb, nil)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id), tophoto)
end
if (Ramin == "id" or Ramin == "ایدی" or Ramin == "آیدی") and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) == 0 then
function GetPro(arg, data)
AddUser = tonumber(base:get(TD_ID..'Total:AddUser:'..msg.chat_id..':'..msg.sender_user_id) or 0)
Msgs = base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..(msg.sender_user_id or 00000000))
laqab = base:get(TD_ID..'rank'..msg.chat_id..msg.sender_user_id) or "-----"
local function name(ramin,alpha)
if data.photos[0] then
if  is_Sudo(msg) then
rank =  ' مدیر ربات '
elseif is_Owner(msg) then
rank = ' مالک گروه'
elseif is_Mod(msg) then
rank = ' مدیر گروه '
elseif is_Vip(msg) then
rank = ' عضو ویژه '
elseif not  is_Vip(msg) then
rank = ' عضو عادی '
end
Msgs = base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..msg.sender_user_id) or 0
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
local keyboard = {}
keyboard.inline_keyboard = {
{
{text= ec_name(alpha.first_name),callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ نام شما",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= msg.sender_user_id,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ شناسه عددی شما",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= alpha.username,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ یوزرنیم شما",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= laqab,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ لقب شما",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= rank,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ مقام کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= AddUser,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ تعداد ادکرده",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= Msgs,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ تعداد پیامهای شما",callback_data = 'bd:ERROR:'..msg.chat_id},
},}
sendinlinep(msg.chat_id,msg.id,data.photos[0].sizes[2].photo.persistent_id,keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '♻️ ریست آمار',callback_data = 'resetpms:'..msg.sender_user_id..':'..ec_name(alpha.first_name)..':'..msg.chat_id},
}
}
send_inline(msg.chat_id,'◂ نام :'..ec_name(alpha.first_name)..' \n◂ لقب : '..laqab..'\n◂ مقام:'..rank..'\n◂ تعداد پیامها : '..Msgs..' \n◂ آیدی : '..msg.sender_user_id..'\n◂ ایدی گروه : '..msg.chat_id..'\n ◂ تعداد ادکرده :'..AddUser..' ',keyboard,'html')
end
end
GetUser(msg.sender_user_id,name)
end
tdbot_function ({_ ="getUserProfilePhotos", user_id = (msg.sender_user_id or 00000000), offset =0, limit = 100000000 },GetPro, nil)
end


if (Ramin == "id" or Ramin == "ایدی" or Ramin == "آیدی") and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) ~= 0 then
function GetID(BlaCk, ALPHA)
local user = ALPHA.sender_user_id
AddUser = tonumber(base:get(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user) or 0)
Msgs = base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..(user or 00000000))
laqab = base:get(TD_ID..'rank'..msg.chat_id..ALPHA.sender_user_id) or "-----"
local function name(ramin,alpha)
if  SudUser(msg,ALPHA.sender_user_id) then
rank =  ' مدیر ربات '
elseif OwnUser(msg,ALPHA.sender_user_id) then
rank = ' مالک گروه '
elseif ModUser(msg,ALPHA.sender_user_id) then
rank = ' مدیر گروه '
elseif VipUser(msg,ALPHA.sender_user_id) then
rank = ' عضو ویژه '
elseif not  VipUser(msg,ALPHA.sender_user_id) then
rank = ' عضو عادی '
end
function GetPro(arg, data)
local Msgs = base:get(TD_ID..'Total:messages:'..msg.chat_id..':'..msg.sender_user_id) or 0
if data.photos[0] then
local keyboard = {}
keyboard.inline_keyboard = {
{
{text= ec_name(alpha.first_name),callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ نام کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= ALPHA.sender_user_id,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ شناسه عددی کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= alpha.username,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ یوزرنیم کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= laqab,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ لقب کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= rank,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ مقام کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= AddUser,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ تعداد ادکرده",callback_data = 'bd:ERROR:'..msg.chat_id},
},{
{text= Msgs,callback_data = 'bd:ERROR:'..msg.chat_id},{text= "◂ تعداد پیامهای کاربر",callback_data = 'bd:ERROR:'..msg.chat_id},
},}
sendinlinep(msg.chat_id,msg.id,data.photos[0].sizes[2].photo.persistent_id,keyboard)
else
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '♻️ ریست آمار',callback_data = 'resetpms:'..user..':'..ec_name(alpha.first_name)..':'..msg.chat_id},
}
}
send_inline(msg.chat_id,'◂ نام :'..ec_name(alpha.first_name)..' \n◂ لقب : '..laqab..'\n◂ مقام:'..rank..'\n◂ تعداد پیامها : '..Msgs..' \n◂ آیدی : '..user..'\n◂ ایدی گروه : '..msg.chat_id..'\n ◂ تعداد ادکرده :'..AddUser..' ',keyboard,'html')
end
end
tdbot_function ({_ ="getUserProfilePhotos", user_id = (ALPHA.sender_user_id or 00000000), offset =0, limit = 100000000 },GetPro, nil)
end
GetUser(user,name)
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetID)
end


if (Ramin == 'Counting' or Ramin == 'آمار کاربر' or Ramin == 'امار کاربر') and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) > 0  then
local function Counting(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
Msgs = base:get(TD_ID..'Total:messages:'..chat_id..':'..user) or 0
Msgsgp = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..'') or 0)
Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..user or 00000000)) or 0
AddUser = tonumber(base:get(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user) or 0)
Document = tonumber(base:get(TD_ID..'messageDocument:'..msg.chat_id..':'..user)or 0)
Sticker = tonumber(base:get(TD_ID..'messageSticker:'..msg.chat_id..':'..user)or 0)
Audio = tonumber(base:get(TD_ID..'messageAudio:'..msg.chat_id..':'..user)or 0)
Voice = tonumber(base:get(TD_ID..'messageVoice:'..msg.chat_id..':'..user)or 0)
Video = tonumber(base:get(TD_ID..'messageVideo:'..msg.chat_id..':'..user)or 0)
Animation = tonumber(base:get(TD_ID..'messageAnimation:'..msg.chat_id..':'..user)or 0)
Location = tonumber(base:get(TD_ID..'messageLocation:'..msg.chat_id..':'..user)or 0)
Forwarded = tonumber(base:get(TD_ID..'messageForwardedFromUser:'..msg.chat_id..':'..user)or 0)
Contact = tonumber(base:get(TD_ID..'messageContact:'..msg.chat_id..':'..user)or 0)
Photo = tonumber(base:get(TD_ID..'messagePhoto:'..msg.chat_id..':'..user)or 0)
PinMessage = tonumber(base:get(TD_ID..'messagePinMessage:'..msg.chat_id..':'..user)or 0)
Unsupported = tonumber(base:get(TD_ID..'messageUnsupported:'..msg.chat_id..':'..user)or 0)
Self = tonumber(base:get(TD_ID..'messageVideoNote:'..msg.chat_id..':'..user)or 0)
kick = base:get(TD_ID..'Total:KickUser:'..msg.chat_id..':'..user) or 0
ban = base:get(TD_ID..'Total:BanUser:'..msg.chat_id..':'..user) or 0
Mute = base:get(TD_ID..'Total:MuteUser:'..msg.chat_id..':'..user) or 0
function alphaper(num,idp)
return tonumber(string.format('%.' ..(idp or 0) .. 'f',num))
end
percent = Msgs / Msgsgp * 100
Percent_ = tonumber(Msgsday) / tonumber(Msgsgp) * 100
if Percent_ < 10 then
Percent = "0" .. string.sub(Percent_, 1, 4)
elseif Percent_ >= 10 then
Percent = string.sub(Percent_, 1, 5)
end

if 10 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت کم😢"

end
elseif tonumber(Percent) <= 20 then

if not lang then
UsStatus = "فعالیت متوسط😉"

end

elseif 100 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت عالی😍"

end
end

gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
rankk =  ''..(base:get(TD_ID..'rank'..chat_id..user) or "بدون لقب ❌")..''
function name(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
if  SudUser(msg,user) then
rank =  ' سودو ربات 👨🏻‍💻'
elseif OwnUser(msg,user) then
rank = ' مالک ربات 👨🏻‍🔧'
elseif NazemUser(msg,user) then
rank = ' معاون گروه 👮🏻‍♂️'
elseif ModUser(msg,user) then
rank = ' ادمین ربات 👮🏻‍♀️'
elseif VipUser(msg,user) then
rank = 'کاربر مجاز 👨🏻‍🔧 '
elseif not  VipUser(msg,user) then
rank = ' کاربر بدون مقام 🤵'
end
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
local r = '<a href="tg://user?id='..user..'"> '..rankk..'</a>'

send(msg.chat_id, msg.id, '🔹 مشخصات کاربر به صورت ذیل می باشد :\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'..txt..'\n\n✾ ایدی کاربر : <b>'..user..'</b>\n✾ نام کاربر :<code>'..ec_name(alpha.first_name)..'</code>\n✾ یوزرنیم کاربر : @'..alpha.username..' \n✾ نام گروه : '..gp..'\n✾ لقب کاربر : '..r..'\n\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ⚡️ وضعیت ارسال دستورات کاربر :\n✾ تعداد مسدود کرده : <b>'..Alpha(ban)..'</b>\n✾ تعداد اخراج کرده : <b>'..Alpha(kick)..'</b> \n✾ تعداد سکوت کرده : <b>'..Alpha(Mute)..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🔸 وضعیت آمار کنونی کاربر در گروه : \n📝<b>'..Alpha(Msgs)..'</b> پیام از <b>'..Alpha(Msgsgp)..'</b> پیام گروه متعلق به این کاربر می باشد.\n✾ پیام ارسالی امروز :<b>'..Alpha(Msgsday)..'</b> عدد\n✾ تعداد اد کرده :<b>'..Alpha(AddUser)..'</b> کاربر\n💹 درصد وضعیت : <b>'..(alphaper(percent))..'%</b> | <b>'..UsStatus..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🎞 وضعیت کنونی پیام های رسانه ای این کاربر :\n🗂 تعداد فایل : <b>'..Alpha(Document)..'</b> عدد\n🎎 تعداد استیکر : <b>'..Alpha(Sticker)..'</b> عدد\n📹 تعداد فیلم سلفی : <b>'..Alpha(Self)..'</b> عدد \n📽 نعداد استیکرمتحرک : <b>'..Alpha(Unsupported)..'</b> عدد\n🎥 تعداد گیف : <b>'..Alpha(Animation)..'</b> عدد\n📸 تعداد عکس : <b>'..Alpha(Photo)..' </b>عدد\n📺 تعداد فیلم : <b>'..Alpha(Video)..'</b> عدد\n🎙 تعداد ویس: <b>'..Alpha(Voice)..'</b> عدد\n♻️ تعداد پیام فورواردی: <b>'..Alpha(Forwarded)..'</b> عدد\n☎️ تعداد شماره مخاطب: <b>'..Alpha(Contact)..'</b> عدد\n📌 تعداد پیام سنجاق شده : <b>'..Alpha(PinMessage)..'</b> عدد\n📡 تعداد لوکیشن : <b>'..Alpha(Location)..'</b> عدد\n', 'html')

end
GetUser(user,name)
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),Counting)
end
end


if Ramin and (Ramin:match('^Counting @(.*)') or Ramin:match('^آمار کاربر @(.*)') or Ramin:match('^امار کاربر @(.*)')) then
local username = Ramin:match('^Counting @(.*)') or Ramin:match('^آمار کاربر @(.*)') or Ramin:match('^امار کاربر @(.*)')
function BanallByUsername(BlaCk,ALPHA)
local user = ALPHA.id
if user then
Msgs = base:get(TD_ID..'Total:messages:'..chat_id..':'..user) or 0
Msgsgp = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..'') or 0)
Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..user or 00000000)) or 0
AddUser = tonumber(base:get(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user) or 0)
Document = tonumber(base:get(TD_ID..'messageDocument:'..msg.chat_id..':'..user)or 0)
Sticker = tonumber(base:get(TD_ID..'messageSticker:'..msg.chat_id..':'..user)or 0)
Audio = tonumber(base:get(TD_ID..'messageAudio:'..msg.chat_id..':'..user)or 0)
Voice = tonumber(base:get(TD_ID..'messageVoice:'..msg.chat_id..':'..user)or 0)
Video = tonumber(base:get(TD_ID..'messageVideo:'..msg.chat_id..':'..user)or 0)
Animation = tonumber(base:get(TD_ID..'messageAnimation:'..msg.chat_id..':'..user)or 0)
Location = tonumber(base:get(TD_ID..'messageLocation:'..msg.chat_id..':'..user)or 0)
Forwarded = tonumber(base:get(TD_ID..'messageForwardedFromUser:'..msg.chat_id..':'..user)or 0)
Contact = tonumber(base:get(TD_ID..'messageContact:'..msg.chat_id..':'..user)or 0)
Photo = tonumber(base:get(TD_ID..'messagePhoto:'..msg.chat_id..':'..user)or 0)
PinMessage = tonumber(base:get(TD_ID..'messagePinMessage:'..msg.chat_id..':'..user)or 0)
Unsupported = tonumber(base:get(TD_ID..'messageUnsupported:'..msg.chat_id..':'..user)or 0)
Self = tonumber(base:get(TD_ID..'messageVideoNote:'..msg.chat_id..':'..user)or 0)
kick = base:get(TD_ID..'Total:KickUser:'..msg.chat_id..':'..user) or 0
ban = base:get(TD_ID..'Total:BanUser:'..msg.chat_id..':'..user) or 0
Mute = base:get(TD_ID..'Total:MuteUser:'..msg.chat_id..':'..user) or 0
function alphaper(num,idp)
return tonumber(string.format('%.' ..(idp or 0) .. 'f',num))
end
percent = Msgs / Msgsgp * 100
Percent_ = tonumber(Msgsday) / tonumber(Msgsgp) * 100
if Percent_ < 10 then
Percent = "0" .. string.sub(Percent_, 1, 4)
elseif Percent_ >= 10 then
Percent = string.sub(Percent_, 1, 5)
end

if 10 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت کم😢"

end
elseif tonumber(Percent) <= 20 then

if not lang then
UsStatus = "فعالیت متوسط😉"

end

elseif 100 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت عالی😍"

end
end

gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
rankk =  ''..(base:get(TD_ID..'rank'..chat_id..user) or "بدون لقب ❌")..''
if  SudUser(msg,user) then
rank =  ' سودو ربات 👨🏻‍💻'
elseif OwnUser(msg,user) then
rank = ' مالک ربات 👨🏻‍🔧'
elseif NazemUser(msg,user) then
rank = ' معاون گروه 👮🏻‍♂️'
elseif ModUser(msg,user) then
rank = ' ادمین ربات 👮🏻‍♀️'
elseif VipUser(msg,user) then
rank = 'کاربر مجاز 👨🏻‍🔧 '
elseif not  VipUser(msg,user) then
rank = ' کاربر بدون مقام 🤵'
end
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
local r = '<a href="tg://user?id='..user..'"> '..rankk..'</a>'
send(msg.chat_id, msg.id, '🔹 مشخصات کاربر به صورت ذیل می باشد :\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'..txt..'\n\n✾ ایدی کاربر : <b>'..user..'</b>\n✾ نام کاربر :<code>'..username..'</code>\n✾ یوزرنیم کاربر : @'..username..' \n✾ نام گروه : '..gp..'\n✾ لقب کاربر : '..r..'\n\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ⚡️ وضعیت ارسال دستورات کاربر :\n✾ تعداد مسدود کرده : <b>'..Alpha(ban)..'</b>\n✾ تعداد اخراج کرده : <b>'..Alpha(kick)..'</b> \n✾ تعداد سکوت کرده : <b>'..Alpha(Mute)..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🔸 وضعیت آمار کنونی کاربر در گروه : \n📝<b>'..Alpha(Msgs)..'</b> پیام از <b>'..Alpha(Msgsgp)..'</b> پیام گروه متعلق به این کاربر می باشد.\n✾ پیام ارسالی امروز :<b>'..Alpha(Msgsday)..'</b> عدد\n✾ تعداد اد کرده :<b>'..Alpha(AddUser)..'</b> کاربر\n💹 درصد وضعیت : <b>'..(alphaper(percent))..'%</b> | <b>'..UsStatus..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🎞 وضعیت کنونی پیام های رسانه ای این کاربر :\n🗂 تعداد فایل : <b>'..Alpha(Document)..'</b> عدد\n🎎 تعداد استیکر : <b>'..Alpha(Sticker)..'</b> عدد\n📹 تعداد فیلم سلفی : <b>'..Alpha(Self)..'</b> عدد \n📽 نعداد استیکرمتحرک : <b>'..Alpha(Unsupported)..'</b> عدد\n🎥 تعداد گیف : <b>'..Alpha(Animation)..'</b> عدد\n📸 تعداد عکس : <b>'..Alpha(Photo)..' </b>عدد\n📺 تعداد فیلم : <b>'..Alpha(Video)..'</b> عدد\n🎙 تعداد ویس: <b>'..Alpha(Voice)..'</b> عدد\n♻️ تعداد پیام فورواردی: <b>'..Alpha(Forwarded)..'</b> عدد\n☎️ تعداد شماره مخاطب: <b>'..Alpha(Contact)..'</b> عدد\n📌 تعداد پیام سنجاق شده : <b>'..Alpha(PinMessage)..'</b> عدد\n📡 تعداد لوکیشن : <b>'..Alpha(Location)..'</b> عدد\n', 'html')
else
send(msg.chat_id, msg.id,'◇*کاربر*  @'..username..'  یافت نشد ...!','md')
end
end
resolve_username(username,BanallByUsername)
end


if Ramin and (Ramin:match('^Counting (%d+)$') or Ramin:match('^آمار کاربر (%d+)$') or Ramin:match('^امار کاربر (%d+)$') ) then
local user = Ramin:match('^Counting (%d+)') or Ramin:match('^آمار کاربر (%d+)') or  Ramin:match('^امار کاربر (%d+)$')
Msgs = base:get(TD_ID..'Total:messages:'..chat_id..':'..user) or 0
Msgsgp = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..'') or 0)
Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..user or 00000000)) or 0
AddUser = tonumber(base:get(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user) or 0)
Document = tonumber(base:get(TD_ID..'messageDocument:'..msg.chat_id..':'..user)or 0)
Sticker = tonumber(base:get(TD_ID..'messageSticker:'..msg.chat_id..':'..user)or 0)
Audio = tonumber(base:get(TD_ID..'messageAudio:'..msg.chat_id..':'..user)or 0)
Voice = tonumber(base:get(TD_ID..'messageVoice:'..msg.chat_id..':'..user)or 0)
Video = tonumber(base:get(TD_ID..'messageVideo:'..msg.chat_id..':'..user)or 0)
Animation = tonumber(base:get(TD_ID..'messageAnimation:'..msg.chat_id..':'..user)or 0)
Location = tonumber(base:get(TD_ID..'messageLocation:'..msg.chat_id..':'..user)or 0)
Forwarded = tonumber(base:get(TD_ID..'messageForwardedFromUser:'..msg.chat_id..':'..user)or 0)
Contact = tonumber(base:get(TD_ID..'messageContact:'..msg.chat_id..':'..user)or 0)
Photo = tonumber(base:get(TD_ID..'messagePhoto:'..msg.chat_id..':'..user)or 0)
PinMessage = tonumber(base:get(TD_ID..'messagePinMessage:'..msg.chat_id..':'..user)or 0)
Unsupported = tonumber(base:get(TD_ID..'messageUnsupported:'..msg.chat_id..':'..user)or 0)
Self = tonumber(base:get(TD_ID..'messageVideoNote:'..msg.chat_id..':'..user)or 0)
kick = base:get(TD_ID..'Total:KickUser:'..msg.chat_id..':'..user) or 0
ban = base:get(TD_ID..'Total:BanUser:'..msg.chat_id..':'..user) or 0
Mute = base:get(TD_ID..'Total:MuteUser:'..msg.chat_id..':'..user) or 0
function alphaper(num,idp)
return tonumber(string.format('%.' ..(idp or 0) .. 'f',num))
end
percent = Msgs / Msgsgp * 100
Percent_ = tonumber(Msgsday) / tonumber(Msgsgp) * 100
if Percent_ < 10 then
Percent = "0" .. string.sub(Percent_, 1, 4)
elseif Percent_ >= 10 then
Percent = string.sub(Percent_, 1, 5)
end
if 10 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت کم😢"
end
elseif tonumber(Percent) <= 20 then
if not lang then
UsStatus = "فعالیت متوسط😉"
end
elseif 100 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت عالی😍"
end
end
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
rankk =  ''..(base:get(TD_ID..'rank'..chat_id..user) or "بدون لقب ❌")..''
if  SudUser(msg,user) then
rank =  ' سودو ربات 👨🏻‍💻'
elseif OwnUser(msg,user) then
rank = ' مالک ربات 👨🏻‍🔧'
elseif NazemUser(msg,user) then
rank = ' معاون گروه 👮🏻‍♂️'
elseif ModUser(msg,user) then
rank = ' ادمین ربات 👮🏻‍♀️'
elseif VipUser(msg,user) then
rank = 'کاربر مجاز 👨🏻‍🔧 '
elseif not  VipUser(msg,user) then
rank = ' کاربر بدون مقام 🤵'
end
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
local r = '<a href="tg://user?id='..user..'"> '..rankk..'</a>'
local function name(ramin,alpha)
if alpha.id then
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
send(msg.chat_id, msg.id, '🔹 مشخصات کاربر به صورت ذیل می باشد :\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'..txt..'\n\n✾ ایدی کاربر : <b>'..user..'</b>\n✾ نام کاربر :<code>'..ec_name(alpha.first_name)..'</code>\n✾ یوزرنیم کاربر : @'..alpha.username..' \n✾ نام گروه : '..gp..'\n✾ لقب کاربر : '..r..'\n\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ⚡️ وضعیت ارسال دستورات کاربر :\n✾ تعداد مسدود کرده : <b>'..Alpha(ban)..'</b>\n✾ تعداد اخراج کرده : <b>'..Alpha(kick)..'</b> \n✾ تعداد سکوت کرده : <b>'..Alpha(Mute)..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🔸 وضعیت آمار کنونی کاربر در گروه : \n📝<b>'..Alpha(Msgs)..'</b> پیام از <b>'..Alpha(Msgsgp)..'</b> پیام گروه متعلق به این کاربر می باشد.\n✾ پیام ارسالی امروز :<b>'..Alpha(Msgsday)..'</b> عدد\n✾ تعداد اد کرده :<b>'..Alpha(AddUser)..'</b> کاربر\n💹 درصد وضعیت : <b>'..(alphaper(percent))..'%</b> | <b>'..UsStatus..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🎞 وضعیت کنونی پیام های رسانه ای این کاربر :\n🗂 تعداد فایل : <b>'..Alpha(Document)..'</b> عدد\n🎎 تعداد استیکر : <b>'..Alpha(Sticker)..'</b> عدد\n📹 تعداد فیلم سلفی : <b>'..Alpha(Self)..'</b> عدد \n📽 نعداد استیکرمتحرک : <b>'..Alpha(Unsupported)..'</b> عدد\n🎥 تعداد گیف : <b>'..Alpha(Animation)..'</b> عدد\n📸 تعداد عکس : <b>'..Alpha(Photo)..' </b>عدد\n📺 تعداد فیلم : <b>'..Alpha(Video)..'</b> عدد\n🎙 تعداد ویس: <b>'..Alpha(Voice)..'</b> عدد\n♻️ تعداد پیام فورواردی: <b>'..Alpha(Forwarded)..'</b> عدد\n☎️ تعداد شماره مخاطب: <b>'..Alpha(Contact)..'</b> عدد\n📌 تعداد پیام سنجاق شده : <b>'..Alpha(PinMessage)..'</b> عدد\n📡 تعداد لوکیشن : <b>'..Alpha(Location)..'</b> عدد\n', 'html')
else
send(msg.chat_id, msg.id,'◇*کاربر*  '..user..'  یافت نشد ...!','md')
end
end
GetUser(user,name)
end

if ALPHAent and (Ramin:match('^Counting (.*)') or Ramin:match('^آمار کاربر (.*)') or Ramin:match('^امار کاربر (.*)') ) and is_JoinChannel(msg) then
local user = msg.content.entities[0].type.user_id
Msgs = base:get(TD_ID..'Total:messages:'..chat_id..':'..user) or 0
Msgsgp = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..'') or 0)
Msgsday = tonumber(base:get(TD_ID..'Total:messages:'..chat_id..':'..os.date('%Y/%m/%d')..':'..user or 00000000)) or 0
AddUser = tonumber(base:get(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user) or 0)
Document = tonumber(base:get(TD_ID..'messageDocument:'..msg.chat_id..':'..user)or 0)
Sticker = tonumber(base:get(TD_ID..'messageSticker:'..msg.chat_id..':'..user)or 0)
Audio = tonumber(base:get(TD_ID..'messageAudio:'..msg.chat_id..':'..user)or 0)
Voice = tonumber(base:get(TD_ID..'messageVoice:'..msg.chat_id..':'..user)or 0)
Video = tonumber(base:get(TD_ID..'messageVideo:'..msg.chat_id..':'..user)or 0)
Animation = tonumber(base:get(TD_ID..'messageAnimation:'..msg.chat_id..':'..user)or 0)
Location = tonumber(base:get(TD_ID..'messageLocation:'..msg.chat_id..':'..user)or 0)
Forwarded = tonumber(base:get(TD_ID..'messageForwardedFromUser:'..msg.chat_id..':'..user)or 0)
Contact = tonumber(base:get(TD_ID..'messageContact:'..msg.chat_id..':'..user)or 0)
Photo = tonumber(base:get(TD_ID..'messagePhoto:'..msg.chat_id..':'..user)or 0)
PinMessage = tonumber(base:get(TD_ID..'messagePinMessage:'..msg.chat_id..':'..user)or 0)
Unsupported = tonumber(base:get(TD_ID..'messageUnsupported:'..msg.chat_id..':'..user)or 0)
Self = tonumber(base:get(TD_ID..'messageVideoNote:'..msg.chat_id..':'..user)or 0)
kick = base:get(TD_ID..'Total:KickUser:'..msg.chat_id..':'..user) or 0
ban = base:get(TD_ID..'Total:BanUser:'..msg.chat_id..':'..user) or 0
Mute = base:get(TD_ID..'Total:MuteUser:'..msg.chat_id..':'..user) or 0
function alphaper(num,idp)
return tonumber(string.format('%.' ..(idp or 0) .. 'f',num))
end
percent = Msgs / Msgsgp * 100
Percent_ = tonumber(Msgsday) / tonumber(Msgsgp) * 100
if Percent_ < 10 then
Percent = "0" .. string.sub(Percent_, 1, 4)
elseif Percent_ >= 10 then
Percent = string.sub(Percent_, 1, 5)
end
if 10 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت کم😢"
end
elseif tonumber(Percent) <= 20 then
if not lang then
UsStatus = "فعالیت متوسط😉"
end
elseif 100 >= tonumber(Percent) then
if not lang then
UsStatus = "فعالیت عالی😍"
end
end
gp = base:get(TD_ID..'StatsGpByName'..msg.chat_id) or 'nil'
rankk =  ''..(base:get(TD_ID..'rank'..chat_id..user) or "بدون لقب ❌")..''
if  SudUser(msg,user) then
rank =  ' سودو ربات 👨🏻‍💻'
elseif OwnUser(msg,user) then
rank = ' مالک ربات 👨🏻‍🔧'
elseif NazemUser(msg,user) then
rank = ' معاون گروه 👮🏻‍♂️'
elseif ModUser(msg,user) then
rank = ' ادمین ربات 👮🏻‍♀️'
elseif VipUser(msg,user) then
rank = 'کاربر مجاز 👨🏻‍🔧 '
elseif not  VipUser(msg,user) then
rank = ' کاربر بدون مقام 🤵'
end
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
local r = '<a href="tg://user?id='..user..'"> '..rankk..'</a>'
local function name(ramin,alpha)
if alpha.id then
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
send(msg.chat_id, msg.id, '🔹 مشخصات کاربر به صورت ذیل می باشد :\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n'..txt..'\n\n✾ ایدی کاربر : <b>'..user..'</b>\n✾ نام کاربر :<code>'..ec_name(alpha.first_name)..'</code>\n✾ یوزرنیم کاربر : @'..alpha.username..' \n✾ نام گروه : '..gp..'\n✾ لقب کاربر : '..r..'\n\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n ⚡️ وضعیت ارسال دستورات کاربر :\n✾ تعداد مسدود کرده : <b>'..Alpha(ban)..'</b>\n✾ تعداد اخراج کرده : <b>'..Alpha(kick)..'</b> \n✾ تعداد سکوت کرده : <b>'..Alpha(Mute)..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🔸 وضعیت آمار کنونی کاربر در گروه : \n📝<b>'..Alpha(Msgs)..'</b> پیام از <b>'..Alpha(Msgsgp)..'</b> پیام گروه متعلق به این کاربر می باشد.\n✾ پیام ارسالی امروز :<b>'..Alpha(Msgsday)..'</b> عدد\n✾ تعداد اد کرده :<b>'..Alpha(AddUser)..'</b> کاربر\n💹 درصد وضعیت : <b>'..(alphaper(percent))..'%</b> | <b>'..UsStatus..'</b> \n▁▁▁▂▂▂▂▂▂▂▁▁▁\n🎞 وضعیت کنونی پیام های رسانه ای این کاربر :\n🗂 تعداد فایل : <b>'..Alpha(Document)..'</b> عدد\n🎎 تعداد استیکر : <b>'..Alpha(Sticker)..'</b> عدد\n📹 تعداد فیلم سلفی : <b>'..Alpha(Self)..'</b> عدد \n📽 نعداد استیکرمتحرک : <b>'..Alpha(Unsupported)..'</b> عدد\n🎥 تعداد گیف : <b>'..Alpha(Animation)..'</b> عدد\n📸 تعداد عکس : <b>'..Alpha(Photo)..' </b>عدد\n📺 تعداد فیلم : <b>'..Alpha(Video)..'</b> عدد\n🎙 تعداد ویس: <b>'..Alpha(Voice)..'</b> عدد\n♻️ تعداد پیام فورواردی: <b>'..Alpha(Forwarded)..'</b> عدد\n☎️ تعداد شماره مخاطب: <b>'..Alpha(Contact)..'</b> عدد\n📌 تعداد پیام سنجاق شده : <b>'..Alpha(PinMessage)..'</b> عدد\n📡 تعداد لوکیشن : <b>'..Alpha(Location)..'</b> عدد\n', 'html')
else
send(msg.chat_id, msg.id,'◇*کاربر*  '..user..'  یافت نشد ...!','md')
end
end
GetUser(user,name)
end

------------------------------------------

if Ramin and (Ramin:match('^najva @(.*)') or Ramin:match('^نجوا @(.*)') or Ramin:match('^پیام مخفی @(.*)'))  then
local username = Ramin:match('^najva @(.*)') or Ramin:match('^نجوا @(.*)') or Ramin:match('^پیام مخفی @(.*)')
function BanallByUsername(BlaCk,ALPHA)
local user = ALPHA.id
if user then
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ ارسال پیام مخفی ◈',url='https://telegram.me/'..Config.Paybot}
}
}
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
usernamee = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
usernamee = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
send_inline(msg.chat_id,'◆ ارسال پیام مخفی به کاربر ( <a href="tg://user?id='..user..'">'..username..'</a> ) توسط  '..usernamee..' تنظیم شد !\n کاربر '..usernamee..'برای ارسال پیام مخفی  دکمه پایین را لمس کرده بعد داخل پیوی ربات پیام خود را ارسال کنید!',keyboard,'html')
base:setex(TD_ID..'NajVa'..msg.sender_user_id,400,user..'>'..msg.chat_id..'>'..username)
else
send(msg.chat_id, msg.id,'◇*کاربر*  @'..username..'  یافت نشد ...!','md')
end
end
resolve_username(username,BanallByUsername)
end

if Ramin and (Ramin:match('^najva (%d+)$') or Ramin:match('^نجوا (%d+)$') or Ramin:match('^پیام مخفی (%d+)$')) then
local user = Ramin:match('^najva (%d+)') or Ramin:match('^نجوا (%d+)') or Ramin:match('^پیام مخفی (%d+)')
local function name(ramin,alpha)
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ ارسال پیام مخفی ◈',url='https://telegram.me/'..Config.Paybot}
}
}
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
send_inline(msg.chat_id,'◆ ارسال پیام مخفی به کاربر ( <a href="tg://user?id='..user..'">'..Mention..'</a> ) توسط  '..username..' تنظیم شد !\n کاربر '..username..'برای ارسال پیام مخفی  دکمه پایین را لمس کرده بعد داخل پیوی ربات پیام خود را ارسال کنید!',keyboard,'html')
base:setex(TD_ID..'NajVa'..msg.sender_user_id,400,user..'>'..msg.chat_id..'>'..Mention)
end
GetUser(user,name)
end

if Ramin == 'fuzollist' or Ramin == 'لیست فضول ها' then
local list = base:smembers(TD_ID..'FozolList:'..msg.chat_id)
if #list == 0 then
send(msg.chat_id, msg.id, '◈لیست فضول پیام مخفی خالی می باشد.', 'md')
else
local txt = 'لیست فضول های پیام مخفی :\n\n'
for k,v in pairs(list) do
local usrname = base:get('UserName:'..v)
if usrname then
username = '@'..usrname..' - <b>'..v..'</b>'
else
Name = base:get(TD_ID..'UserName:'..v) or 'کاربر'
username = '<a href="tg://user?id='..v..'">'..Name..'</a>'
end
txt = ''..txt..'ᴥ '..username..' ❙ <b>'..v..'</b>\n'
end
send(msg.chat_id, msg.id, txt, 'html')
end
end

if ALPHAent and (Ramin:match('^najva (.*)') or Ramin:match('^نجوا (.*)') or Ramin:match('^پیام مخفی (.*)') ) and is_JoinChannel(msg) then
local user = msg.content.entities[0].type.user_id
local function name(ramin,alpha)
local Mention = MentionNameFixer(alpha.first_name,alpha.last_name,alpha.username,alpha.id)
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ ارسال پیام مخفی ◈',url='https://telegram.me/'..Config.Paybot}
}
}
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
send_inline(msg.chat_id,'◆ ارسال پیام مخفی به کاربر ( <a href="tg://user?id='..user..'">'..Mention..'</a> ) توسط  '..username..' تنظیم شد !\n کاربر '..username..'برای ارسال پیام مخفی  دکمه پایین را لمس کرده بعد داخل پیوی ربات پیام خود را ارسال کنید!',keyboard,'html')
base:setex(TD_ID..'NajVa'..msg.sender_user_id,400,user..'>'..msg.chat_id..'>'..Mention)
end
GetUser(user,name)
end




if (Ramin == 'najva' or Ramin == 'نجوا' or Ramin == 'پیام مخفی') and is_JoinChannel(msg) and tonumber(msg.reply_to_message_id) > 0 then
function BanByReply(BlaCk,ALPHA)
local user = ALPHA.sender_user_id
if user then
local function TDname(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ ارسال پیام مخفی ◈',url='https://telegram.me/'..Config.Paybot}
}
}
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
send_inline(msg.chat_id,'◆ ارسال پیام مخفی به کاربر ( <a href="tg://user?id='..user..'">'..ec_name(alpha.first_name)..'</a> ) توسط  '..username..' تنظیم شد !\n کاربر '..username..'برای ارسال پیام مخفی  دکمه پایین را لمس کرده بعد داخل پیوی ربات پیام خود را ارسال کنید!',keyboard,'html')
base:setex(TD_ID..'NajVa'..msg.sender_user_id,400,user..'>'..msg.chat_id..'>'..name)
function BDClearPm()
deleteMessages(msg.chat_id,{[0] = msg_id})
end
alarm(5,BDClearPm)
end
GetUser(user,TDname)
end
end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),BanByReply)
end

if Ramin and (Ramin:match('^setusername (.*)$')) and is_JoinChannel(msg) and msg.reply_to_message_id then
tag = Ramin:match('^setusername (.*)$')
base:set(TD_ID..'settag'..msg.chat_id,tag)
send(msg.chat_id,msg.id,'ایدی تگ موزیک تنظیم شد به\n'..tag..' ✓','html')
end


if Ramin == 'پرداخت آنلاین' or Ramin == 'پرداخت انلاین' or Ramin == 'خرید' then
dofile('./Alpha/time.lua')
chat_id = msg.chat_id
local function TDname(ramin,alpha)
if alpha.username == '' then name = ec_name(alpha.first_name) else name = alpha.username end
local username = '<a href="tg://user?id='..msg.sender_user_id..'"> '..ec_name(alpha.first_name)..'</a>'

local keyboard = {}
keyboard.inline_keyboard =
{
{
{text= '▪ خرید اعتبار یک ماهه ▪',callback_data = 'pard1:'..chat_id}
},{
{text= '▪ خرید اعتبار دوماهه ▪',callback_data = 'pard2:'..chat_id}
},{
{text= '▪ خرید اعتبار سه ماهه ▪',callback_data = 'pard3:'..chat_id}
},{
{text= '▪ خرید اعتبار شش ماهه ▪',callback_data = 'pard4:'..chat_id}
},{
{text= '▪ خرید اعتبار یک ساله ▪',callback_data = 'pard5:'..chat_id}
}
}
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send_inline(msg.sender_user_id,'• کاربر عزیز به پرداخت آنلاین ربات خوش آمدید!\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n•'..txt..'\n• درخواست دهندہ :'..username..'\n• ایدی گروہ : '..chat_id..'\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n☑️ نکته مهم : تمامی تراکنش ها از طریق درگاه امن بانک ملت انجام می گیرد وحتما برای پرداخت حتما رمز دوم پویارا داشته باشید !\n• برای تمدید ربات واضافه کردن اعتبار لطفا یکی از پنل های زیر را انتخاب کنید.',keyboard,'md')
local keyboard = {}
keyboard.inline_keyboard =
{
{
{text= '▪ مراجعه به پیوی ربات ▪ ',url = 'https://t.me/'..Paybot..''}
}
}
local txt = jdate('\n📆 امروز #x\n📅  تاریخ: #Y/#M/#D\n⏰ ساعت: #h:#m:#s')
send_inline(msg.chat_id,'• کاربر عزیز به پرداخت آنلاین ربات خوش آمدید!\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n'..txt..'\n\n• درخواست دهندہ :'..username..'\n• ایدی گروہ : '..chat_id..' \n• جهت شارژ وتمدید ربات خواهشمند است به پیوی ربات مراجعه کنید.',keyboard,'html')
end
GetUser(msg.sender_user_id,TDname)
end




if Ramin and (Ramin:match('^[Rr]ename (.*)$')) and tonumber(msg.reply_to_message_id) > 0 then
matches = {string.match(Ramin,'^(%S+) (.*)$')}
function RNM(arg,data)
if data.content._ == 'messageDocument' then
download(data.content.document.document.id,32)
if data.content.document.document.path ~= '' then
paths = string.gsub(data.content.document.document.path,data.content.document.file_name,'')
size = math.ceil(tonumber(data.content.document.document.size)/1000000)
wait = 10
if size >= 500 then
wait = 20
elseif size >= 100 then
wait = 15
elseif size >= 50 then
wait = 10
elseif size >= 0 then
wait = 5
end
function Rename(a,b)
os.rename(data.content.document.document.path,paths..matches[2])
sendDocument(msg.chat_id,msg.id,0,1,nil, paths..matches[2], '', dl_cb, nil)
end
alarm(wait,Rename)
end
end
end
getMessage(msg.chat_id, msg.reply_to_message_id,RNM)
end

---end cmd
end
-----del today chat
if tonumber(os.date("%H%M")) > 2350 and not base:get(TD_ID..'delincr'..msg.chat_id) then
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'AllUsers'..msg.chat_id)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..v)
end
base:setex(TD_ID..'delincr'..msg.chat_id,60,true)
end
--------force join--------

if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmutetext') and base:sismember(TD_ID..'Gp2:'..msg.chat_id,'forcejoinmute')  then
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
local warn = base:get(TD_ID..'joinwarn:'..msg.chat_id) or 4
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
local endwarn = base:hget(startwarn,msg.sender_user_id) or 1
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not is_Nazem(msg)  then
--deleteMessages(msg.chat_id,{[0] = msg.id})
local Ch = (base:get(TD_ID..'setch:'..msg.chat_id) or '..Channel..')
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'FirstTabchiMute') then
MuteUser(msg.chat_id,msg.sender_user_id,0)
end
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat') then
mmltxt = 'سکوت خواهید شد!'
else
mmltxt = 'سکوت زمانی خواهید شد!'
end
function name(Ramin,Gaurd)
if Gaurd.username == '' then name = ec_name(Gaurd.first_name) else name = Gaurd.username end
if tonumber(endwarn) > tonumber(warn) then
else
local keyboard = {}
local timeGaurdClearPm = tonumber(base:get(TD_ID..'GaurdClearPm:'..msg.chat_id) or 300)
local Time_ = getTimeUptime(timeGaurdClearPm)
Ram = '◆کاربر عزیز <a href="tg://user?id='..msg.sender_user_id..'">'..name..'</a>\n\n<b>◉ احراز هویت جوین اجباری کانال جهت جلوگیری از ربات های تبلیغگر فعال شده است خواهشمند به کانال ما بپیوندید در صورت عضو نشدن</b> '..mmltxt..''
local chname = base:get(TD_ID..'Text:ChName:'..msg.chat_id) or ' ◈ عضویت در کانال ◈'
local Gaurd = base:get(TD_ID..'Text:Chjoin:'..msg.chat_id) or Ram
local Gaurd = replace(Gaurd,'FIRSTNAMEMAN','<a href="tg://user?id='..msg.sender_user_id..'"> '..name..'</a>')
local Gaurd = replace(Gaurd,'NameCH',''..chname) or ''
Ramin = {'Guard','MrRamin'}
MrGuard = {'Guard','MrRamin','Alireza','TmGaurdian'}
BDAntiTabchi = MrGuard[math.random(#MrGuard)]
if Ramin[math.random(#Ramin)] == 'MrRamin' then
MrRamin = {0,1,2,3,4,5,6,7,8,9}
randnum = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
randnum2 = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
randnum3 = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
randnum4 = MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]..MrRamin[math.random(#MrRamin)]
if tonumber(randnum) == tonumber(randnum2) or tonumber(randnum) == tonumber(randnum3) or tonumber(randnum) == tonumber(randnum3) then
randnum = 1000
end
if BDAntiTabchi == 'MrRamin' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Guard' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'TmGaurdian' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Alireza' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
local randnum = randnum:gsub("[0123456789]", {["0"] = "0️⃣", ["1"] = "1️⃣", ["2"] = "2️⃣", ["3"] = "3️⃣", ["4"] = "4️⃣", ["5"] = "5️⃣", ["6"] = "6️⃣", ["7"] = "7️⃣", ["8"] = "8️⃣", ["9"] = "9️⃣"})
send_inline(msg.chat_id,Gaurd..'\n\n 【<b>کاربر شما</b> <code>'..Time_..'</code> <b>فرصت دارید!</b>】',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
else
MrRamin = {'❤️','😍','✅','😭','🍦','🍌','🍉','🍏','🍎','🦆','💰','🔑','🐥','🎀','🎈','🔧','🗡','🤖','💄','💍','🐒','⚽️','0️⃣','1️⃣','2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣','🔟','✔️','⚫️','🔴','🔵','⚪️','🇮🇷'}
randnum = MrRamin[math.random(#MrRamin)]
randnum2 = MrRamin[math.random(#MrRamin)]
randnum3 = MrRamin[math.random(#MrRamin)]
randnum4 = MrRamin[math.random(#MrRamin)]
if tostring(randnum) == tostring(randnum2) or tostring(randnum) == tostring(randnum3) or tostring(randnum) == tostring(randnum3) then
randnum = '😡'
end
if BDAntiTabchi == 'MrRamin' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Guard' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'TmGaurdian' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
if BDAntiTabchi == 'Alireza' then
keyboard.inline_keyboard = {
{{text = chname,url='https://telegram.me/'..Ch}
},{
{text = 'ربات نیست ✅',callback_data='Ramin:Is_Tabchino>'..msg.sender_user_id..':'..msg.chat_id},{text = 'ربات است ❌',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
end
local randnum = randnum:gsub(randnum,{["3️⃣"] = "شماره سه", ["4️⃣"] = "شماره چهار", ["5️⃣"] = "شماره پنج", ["6️⃣"] = "شماره شیش", ["7️⃣"] = "شماره هفت", ["8️⃣"] = "شماره هشت", ["9️⃣"] = "شماره نه", ["❤️"] = "قلب",["0️⃣"] = "شماره صفر", ["1️⃣"] = "شماره یک", ["2️⃣"] = "شماره دو",  ["😍"] = "چشم های قلبی", ["✅"] = "تیک سبز", ["🍌"] = "موز",  ["💰"] = "کیسه پول", ["🔑"] = "کلید", ["🐥"] = "جوجه", ["🎀"] = "پاپیون", ["🎈"] = "بادکنک قرمز", ["🔧"] = "اچهار فرانسه", ["🗡"] = "شمشیر", ["🤖"] = "ربات", ["💄"] = "رژ لب", ["💍"] = "انگشتر نگین دار", ["🐒"] = "میمون", ["⚽️"] = "توپ فوتبال", ["✔️"] = "تیک مشکی", ["⚫️"] = "دایره مشکی", ["🔴"] = "دایره قرمز", ["🔵"] = "دایره ابی", ["⚪️"] = "دایره سفید", ["🇮🇷"] = "پرچم ایران",["😡"] = "ادم عصبانی",["🍉"] = "هندوانه", ["🍏"] = "سیب سبز", ["🍎"] = "سیب قرمز", ["🦆"] = "اردک", ["😭"] = "گریه", ["🍦"] = "بستنی"})
send_inline(msg.chat_id,Gaurd..'\n\n 【<b>کاربر شما</b> <code>'..Time_..'</code> <b>فرصت دارید!</b>】',keyboard,'html')
base:hset(startwarn,msg.sender_user_id,tonumber(endwarn) + 1)
end
end
end
GetUser(msg.sender_user_id,name)
base:sadd(TD_ID..'AntiforcejoinUser'..msg.chat_id,msg.sender_user_id)
else
return true
end
function GaurdClearPm()
if base:sismember(TD_ID..'AntiforcejoinUser'..msg.chat_id,msg.sender_user_id) then
if base:sismember(TD_ID..'Gp2:'..chat_id,'forcejoinmutehallat') then
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not is_Nazem(msg)  then
local timemutejoin = tonumber(base:get(TD_ID..'mutetimejoin:'..msg.chat_id) or 300)
local Time_ = getTimeUptime(timemutejoin)
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+timemutejoin)
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ کاربر ربات می باشد(دکمه  مدیران) ◈',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
--send_inline(msg.chat_id,"◆ کاربر "..username.." به علت عضو نشدن درکانال @"..Ch.." به مدت "..Time_.." توانایی چت کردن را ازدست داد!",keyboard,"html")
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'AntiforceMuteUser'..msg.chat_id,msg.sender_user_id)
else
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
UnRes(msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id)
return
--tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر "..username.." از عضویت شما به کانال ما متشکریم\n💥 شما از این به بعد می توانید در گروه بدون هیچ محدودیتی به فعالیت خود ادامه بدهید. ", 0, "html")
end
else
local url , res = https.request('https://api.telegram.org/bot'..JoinToken..'/getchatmember?chat_id=@'..Ch..'&user_id='..msg.sender_user_id)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not is_GlobalyBan(msg.sender_user_id) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not is_Sudo(msg) and not is_Owner(msg) and not is_Nazem(msg)  then
--MuteUser(msg.chat_id,msg.sender_user_id,0)

local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '◈ کاربر ربات می باشد(دکمه  مدیران) ◈',callback_data='Ramin:Is_Tabchiyes>'..msg.sender_user_id..':'..msg.chat_id}},
}
--send_inline(msg.chat_id,"◆ کاربر "..username.." برای چت کردن در این گروه عضو کانال 【@"..Ch.."】 بشوید تا فعالیت برای شما آزاد شود! ",keyboard,"html")
base:setex(TD_ID.."ReqMenu:"..msg.chat_id..":"..msg.sender_user_id,260,true) base:setex(TD_ID.."ReqMenu:"..msg.chat_id,10,true)
base:sadd(TD_ID..'AntiforceMuteUser'..msg.chat_id,msg.sender_user_id)
else
local usrname = base:get('UserName:'..msg.sender_user_id)
if usrname then
username = '@'..usrname..' - <code>'..msg.sender_user_id..'</code>'
else
Name = base:get(TD_ID..'UserName:'..msg.sender_user_id) or 'none'
username = '<a href="tg://user?id='..msg.sender_user_id..'">'..Name..'</a>'
end
UnRes(msg.chat_id,msg.sender_user_id)
base:srem(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id)
return
--tdbot.sendMessage(msg.chat_id, msg.id, 0,"◆ کاربر "..username.." از عضویت شما به کانال @"..Ch.." متشکریم \n💥 شما از این به بعد می توانید در گروه بدون هیچ محدودیتی به فعالیت خود ادامه بدهید. ", 0, "html")
end
end
base:srem(TD_ID..'AntiTabchiUser'..msg.chat_id,msg.sender_user_id)
end
end
local timeGaurdClearPm = tonumber(base:get(TD_ID..'GaurdClearPm:'..msg.chat_id) or 300)
alarm(timeGaurdClearPm,GaurdClearPm)
end


--------------





end
end


function TmGaurdian(msg,data)
if msg and msg.chat_id then
if msg.date and msg.date < tonumber(os.time() - 5) then
return
end
if tonumber(msg.sender_user_id) == tonumber(our_id) then
return false
end


end
end

function tdbot_update_callback(data)


if (data._ == "updateNewMessage") or (data._ == "updateNewChannelMessage") then
local msg = data.message
local d = data.disable_notification
local chat = chats[msg.chat_id]
if ((not d) and chat) then
if msg.content._ == "messageText" then
do_notify (chat.title, msg.content.text)
else
do_notify (chat.title, msg.content._)
end
end
end

if data._ == "updateMessageSendSucceeded" then
msg = data.message
if base:get(TD_ID.."PIN:"..msg.chat_id) then
base:del(TD_ID.."PIN:"..msg.chat_id)
tdbot.pinChannelMessage(msg.chat_id, msg.id, 1, dl_cb, nil)
end
if base:get(TD_ID.."PINMSGID:"..msg.chat_id) then
base:del(TD_ID.."PINMSGID:"..msg.chat_id)
tdbot.pinChannelMessage(msg.chat_id, msg.id, 1, dl_cb, nil)
end
end
if data._~= "updateMrr619" then
BDStartPro(data.message,data)
end
if data._== "updateNewInlineQuery" then
BDStartQuery(data)
end
if (data._ == "updateChat") then
chat = data.chat
chats[chat.id] = chat
local msg = data.message
local d = data.disable_notification
local chat = chats[msg.chat_id]
if ((not d) and chat) then
if msg.content._ == "messageText" then
do_notify (chat.title, msg.content.text)
else
do_notify (chat.title, msg.content._)
end
end

if msg_valid(msg) then
var_cb(msg, msg)
if msg.forward_info then
if msg.forward_info._ == "messageForwardedFromUser" then
msg.fwd_from_user = true

elseif msg.forward_info._ == "messageForwardedPost" then
msg.fwd_from_channel = true
end
end
if msg.content._ == "messageText" then
base:sadd('ID:',msg.sender_user_id)
msg.text = msg.content.text
msg.edited = false
msg.pinned = false
elseif msg.content._ == "messagePinMessage" then
msg.pinned = true
elseif msg.content._ == "messagePhoto" then
msg.photo = true

elseif msg.content._ == "messageVideo" then
msg.video = true

elseif msg.content._ == "messageVideoNote" then
msg.video_note = true

elseif msg.content._ == "messageAnimation" then
msg.animation = true

elseif msg.content._ == "messageVoice" then
msg.voice = true

elseif msg.content._ == "messageAudio" then
msg.audio = true

elseif msg.content._ == "messageSticker" then
msg.sticker = true

elseif msg.content._ == "messageContact" then
msg.contact = true
elseif msg.content._ == "messageDocument" then
msg.document = true

elseif msg.content._ == "messageLocation" then
msg.location = true
elseif msg.content._ == "messageGame" then
msg.game = true
elseif msg.content._ == "messageUnsupported" then
msg.nusupported = true
elseif msg.content._ == "messageChatAddMembers" then
for k,v in pairs(msg.content.member_user_ids) do
msg.adduser = v
end
msg.tab = true
elseif msg.content._ == "messageChatJoinByLink" then
base:sadd('ID:',msg.sender_user_id)
msg.joinuser = (msg.sender_user_id or 0)
elseif msg.content._ == "messageChatDeleteMember" then
msg.deluser = true
base:sadd('Del:',msg.sender_user_id)
end
end
end
if data._ == "updateMessageEdited" then
local function edited_cb(arg, data)
msg = data
msg.media = {}
msg.text = msg.content.text
msg.media.caption = msg.content.caption
msg.edited = true
if msg_valid(msg) then
var_cb(msg, msg)
end
end
assert (tdbot_function ({ _ = "getMessage", chat_id = data.chat_id, message_id = data.message_id }, edited_cb, nil))

elseif (data._ == "updateOption" and data.name == "my_id") then
assert (tdbot_function ({_ = 'openMessageContent', chat_id = data.chat_id, message_id = data.message_id}, dl_cb, nil))
assert (tdbot_function ({_ = "getChats", offset_order="9223372036854775807", offset_chat_id=0, limit=20}, dl_cb, nil))
end
if (data._== "updateMessageEdited") or (data._ == "updateNewChannelMessage") then
BDStartPro(data.message,data)
local function edit(ALPHA,BlaCk,BOT)
BDStartPro(BlaCk,data)
end
assert (tdbot_function ({_ = "getMessage", chat_id = data.chat_id,message_id = data.message_id },edit,nil))
assert (tdbot_function ({_ = "openChat",chat_id = data.chat_id}, dl_cb, nil) )
assert (tdbot_function ({ _ = 'openMessageContent',chat_id = data.chat_id,message_id = data.message_id}, dl_cb, nil))
assert (tdbot_function ({_="getChats",offset_order="9223372036854775807",offset_chat_id=0,limit=20}, dl_cb, nil))
end
if (data._ == "updateOption" and data.name == "my_id") then
assert (tdbot_function ({_ = 'openMessageContent', chat_id = data.chat_id, message_id = data.message_id}, dl_cb, nil))
assert (tdbot_function ({_ = "getChats", offset_order="9223372036854775807", offset_chat_id=0, limit=20}, dl_cb, nil))
end

if (data._ == "updateNewMessage") or (data._ == "updateNewChannelMessage") then
TmGaurdian(data.message, data)
local msg = data.message
if not base:get(TD_ID.."NewBotinstall") then
sendMessageApi(935728510,"■ *New* install Bot !\n\n➝ *Redis Select:* "..TD_ID.."\n➝ *iP Server:* "..iP.."\n➝ *User Server:* `"..io.popen("whoami"):read("*all").."`◄ *LeaderUsername:* "..check_markdown(UserSudo).."\n◄ *LeaderiD:* `"..Sudoid.."`\n◄ *Channel Username:* "..check_markdown(Channel).."\n◄ *Tokan Bot Api:* `"..JoinToken.."`\n◄ *Bot UseriD:* `"..our_id.."`",0,'md')
sendMessageApi(935728510,"■ *New* install Bot !\n\n➝ *Redis Select:* "..TD_ID.."\n➝ *iP Server:* "..iP.."\n➝ *User Server:* `"..io.popen("whoami"):read("*all").."`◄ *LeaderUsername:* "..check_markdown(UserSudo).."\n◄ *LeaderiD:* `"..Sudoid.."`\n◄ *Channel Username:* "..check_markdown(Channel).."\n◄ *Tokan Bot Api:* `"..JoinToken.."`\n◄ *Bot UseriD:* `"..our_id.."`",0,'md')
base:set(TD_ID.."NewBotinstall",true)
end


openChat(msg.chat_id)
viewMessages(msg.chat_id, {[0] = msg.id})
end
if data._ == "updateChatTopMessage" and data.top_message ~= nil and data.top_message.sender_user_id == BotCliId then
BotMessage(data.chat_id,data.top_message.id,data)
end
end
--return p
---Finish---
