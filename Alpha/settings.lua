function settings(msg,chat)
if base:sismember(TD_ID..'Gp:'..chat,'Del:Caption') then
Capdel = '🔐روشن' 
else
Capdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Caption') then
Capwarn = '🔐روشن'  
else
Capwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Caption') then
Capmute = '🔐روشن' 
else
Capmute = '🔓خاموش'  
end  
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Caption') then
Capkick = '🔐روشن' 
else 
Capkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Caption') then
Capban = '🔐روشن' 
else
Capban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Caption') then
Capsi = '🔐روشن' 
else
Capsi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Videomsg') then
V_notdel = '🔐روشن' 
else
V_notdel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Videomsg') then
V_notwarn = '🔐روشن' 
else
V_notwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Videomsg') then
V_notmute = '🔐روشن' 
else
V_notmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Videomsg') then
V_notkick = '🔐روشن' 
else
V_notkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Videomsg') then
V_notban = '🔐روشن' 
else
V_notban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Videomsg') then
V_notsi = '🔐روشن' 
else
V_notsi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Sticker') then
Stdel = '🔐روشن' 
else
Stdel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Sticker') then
Stwarn = '🔐روشن' 
else
Stwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Sticker') then
Stmute = '🔐روشن' 
else 
Stmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Sticker') then
Stkick = '🔐روشن' 
else
Stkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Sticker') then
Stban = '🔐روشن' 
else
Stban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Sticker') then
Stsi = '🔐روشن' 
else
Stsi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Stickers') then
Stsdel = '🔐روشن' 
else
Stsdel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Stickers') then
Stswarn = '🔐روشن' 
else
Stswarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Stickers') then
Stsmute = '🔐روشن' 
else
Stsmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Stickers') then
Stskick = '🔐روشن' 
else
Stskick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Stickers') then
Stsban = '🔐روشن' 
else
Stsban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Stickers') then
Stssi = '🔐روشن' 
else
Stssi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Contact') then
Condel = '🔐روشن' 
else
Condel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Contact') then
Conwarn = '🔐روشن' 
else
Conwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Contact') then
Conmute = '🔐روشن' 
else
Conmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Contact') then
Conkick = '🔐روشن' 
else
Conkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Contact') then
Conban = '🔐روشن' 
else
Conban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Contact') then
Consi = '🔐روشن' 
else
Consi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Document') then
Docdel = '🔐روشن' 
else
Docdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Document') then
Docwarn = '🔐روشن' 
else
Docwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Document') then
Docmute = '🔐روشن' 
else
Docmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Document') then
Dockick = '🔐روشن' 
else
Dockick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Document') then
Docban = '🔐روشن' 
else
Docban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Document') then
Docsi = '🔐روشن' 
else
Docsi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Voice') then
Voicedel = '🔐روشن' 
else
Voicedel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Voice') then
Voicewarn = '🔐روشن' 
else
Voicewarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Voice') then
Voicemute = '🔐روشن' 
else
Voicemute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Voice') then
Voicekick = '🔐روشن' 
else
Voicekick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Voice') then
Voiceban = '🔐روشن' 
else
Voiceban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Voice') then
Voicesi = '🔐روشن' 
else
Voicesi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Photo') then
Photodel = '🔐روشن' 
else
Photodel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Photo') then
Photowarn = '🔐روشن' 
else
Photowarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Photo') then
Photomute = '🔐روشن' 
else
Photomute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Photo') then
Photokick = '🔐روشن' 
else
Photokick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Photo') then
Photoban = '🔐روشن' 
else
Photoban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Photo') then
Photosi = '🔐روشن' 
else
Photosi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Game') then
Gamedel = '🔐روشن' 
else
Gamedel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Game') then
Gamewarn = '🔐روشن' 
else
Gamewarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Game') then
Gamemute = '🔐روشن' 
else
Gamemute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Game') then
Gamekick = '🔐روشن' 
else
Gamekick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Game') then
Gameban = '🔐روشن' 
else
Gameban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Game') then
Gamesi = '🔐روشن' 
else
Gamesi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Video') then
Videodel = '🔐روشن' 
else
Videodel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Video') then
Videowarn = '🔐روشن' 
else
Videowarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Video') then
Videomute = '🔐روشن' 
else
Videomute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Video') then
Videokick = '🔐روشن' 
else
Videokick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Video') then
Videoban = '🔐روشن' 
else
Videoban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Video') then
Videosi = '🔐روشن' 
else
Videosi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Audio') then
Musicdel = '🔐روشن' 
else
Musicdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Audio') then
Musicwarn = '🔐روشن' 
else
Musicwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Audio') then
Musicmute = '🔐روشن' 
else
Musicmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Audio') then
Musickick = '🔐روشن' 
else
Musickick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Audio') then
Musicban = '🔐روشن' 
else 
Musicban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Audio') then
Musicsi = '🔐روشن' 
else
Musicsi = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Gif') then
Gifdel = '🔐روشن' 
else
Gifdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Gif') then
Gifwarn = '🔐روشن' 
else
Gifwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Gif') then
Gifmute = '🔐روشن' 
else
Gifmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Gif') then
Gifkick = '🔐روشن' 
else
Gifkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Gif') then
Gifban = '🔐روشن' 
else
Gifban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Gif') then
Gifsi = '🔐روشن' 
else
Gifsi = '🔓خاموش' 
end

if base:sismember(TD_ID..'Gp:'..chat,'Del:Edit') then
Editdel = '🔐روشن' 
else
Editdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Edit') then
Editwarn = '🔐روشن' 
else
Editwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Edit') then
Editmute = '🔐روشن' 
else
Editmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Edit') then 
Editkick = '🔐روشن' 
else
Editkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Edit') then
Editban = '🔐روشن' 
else
Editban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Edit') then
Editsi = '🔐روشن' 
else
Editsi = '🔓خاموش'  
end


if base:sismember(TD_ID..'Gp:'..chat,'Del:Fosh') then
Foshdel = '🔐روشن' 
else
Foshdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Fosh') then
Foshwarn = '🔐روشن' 
else
Foshwarn = '🔓خاموش'   
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Fosh') then
Foshmute = '🔐روشن' 
else
Foshmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Fosh') then
Foshkick = '🔐روشن' 
else
Foshkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Fosh') then
Foshban = '🔐روشن' 
else
Foshban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Fosh') then
Foshsi = '🔐روشن' 
else
Foshsi = '🔓خاموش'  
end


if base:sismember(TD_ID..'Gp:'..chat,'Del:Weblink') then
LinkWebdel = '🔐روشن' 
else
LinkWebdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Weblink') then
LinkWebwarn = '🔐روشن' 
else
LinkWebwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Weblink') then
LinkWebmute = '🔐روشن' 
else
LinkWebmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Weblink') then
LinkWebkick = '🔐روشن' 
else
LinkWebkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Weblink') then
LinkWebban = '🔐روشن' 
else
LinkWebban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Weblink') then
LinkWebsi = '🔐روشن' 
else
LinkWebsi = '🔓خاموش'   
end

 if base:sismember(TD_ID..'Gp:'..chat,'Del:Font') then
Fontdel = '🔐روشن' 
else
Fontdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Font') then
Fontwarn = '🔐روشن' 
else
Fontwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Font') then
Fontmute = '🔐روشن' 
else
Fontmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Font') then
Fontkick = '🔐روشن' 
else
Fontkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Font') then
Fontban = '🔐روشن' 
else
Fontban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Font') then
Fontsi = '🔐روشن' 
else
Fontsi = '🔓خاموش'   
end

if base:sismember(TD_ID..'Gp:'..chat,'Del:Link') then
Linkdel = '🔐روشن' 
else
Linkdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Link') then
Linkwarn = '🔐روشن' 
else
Linkwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Link') then
Linkmute = '🔐روشن' 
else
Linkmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Link') then
Linkkick = '🔐روشن' 
else
Linkkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Link') then
Linkban = '🔐روشن' 
else
Linkban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Link') then
Linksi = '🔐روشن' 
else
Linksi = '🔓خاموش'  
end


if base:sismember(TD_ID..'Gp:'..chat,'Del:Username') then
Userdel = '🔐روشن' 
else
Userdel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Username') then
Userwarn = '🔐روشن' 
else
Userwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Username') then
Usermute = '🔐روشن' 
else
Usermute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Username') then
Userkick = '🔐روشن' 
else
Userkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Username') then
Userban = '🔐روشن' 
else
Userban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Username') then
Usersi = '🔐روشن' 
else
Usersi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Tag') then
Tagdel = '🔐روشن' 
else
Tagdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Tag') then
Tagwarn = '🔐روشن' 
else
Tagwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Tag') then
Tagmute = '🔐روشن' 
else
Tagmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Tag') then
Tagkick = '🔐روشن' 
else
Tagkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Tag') then
Tagban = '🔐روشن' 
else
Tagban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Tag') then
Tagsi = '🔐روشن' 
else
Tagsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Inline') then
Inlinedel = '🔐روشن' 
else
Inlinedel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Inline') then
Inlinewarn = '🔐روشن' 
else
Inlinewarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Inline') then
Inlinemute = '🔐روشن' 
else
Inlinemute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Inline') then
Inlinekick = '🔐روشن' 
else
Inlinekick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Inline') then
Inlineban = '🔐روشن' 
else
Inlineban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Inline') then
Inlinesi = '🔐روشن' 
else
Inlinesi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Forward') then 
Fwddel = '🔐روشن' 
else
Fwddel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Forward') then
Fwdwarn = '🔐روشن' 
else
Fwdwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Forward') then
Fwdmute = '🔐روشن' 
else
Fwdmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Forward') then
Fwdkick = '🔐روشن' 
else
Fwdkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Forward') then
Fwdban ='🔐روشن' 
else
Fwdban ='🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Forward') then
Fwdsi = '🔐روشن' 
else
Fwdsi = '🔓خاموش'  
end 
if base:sismember(TD_ID..'Gp:'..chat,'Del:Bots') then
Botdel = '🔐روشن' 
else
Botdel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Bots') then
Botwarn = '🔐روشن' 
else
Botwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Bots') then
Botmute = '🔐روشن' 
else
Botmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Bots') then
Botkick = '🔐روشن' 
else
Botkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Bots') then
Botban = '🔐روشن' 
else
Botban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Bots') then
Botsi = '🔐روشن' 
else
Botsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Spam') then
Spamdel = '🔐روشن' 
else
Spamdel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Spam') then
Spamwarn = '🔐روشن' 
else
Spamwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Spam') then
Spammute = '🔐روشن' 
else
Spammute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Spam') then
Spamkick = '🔐روشن' 
else
Spamkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Spam') then
Spamban = '🔐روشن' 
else
Spamban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Spam') then
Spamsi = '🔐روشن' 
else
Spamsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Persian') then
Fadel = '🔐روشن' 
else
Fadel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Persian') then
Fawarn = '🔐روشن' 
else
Fawarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Persian') then
Famute = '🔐روشن' 
else
Famute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Persian') then
Fakick = '🔐روشن' 
else
Fakick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Persian') then
Faban = '🔐روشن' 
else
Faban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Persian') then
Fasi = '🔐روشن' 
else
Fasi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:English') then
Endel = '🔐روشن' 
else
Endel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:English') then
Enwarn = '🔐روشن' 
else
Enwarn = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:English') then
Enmute = '🔐روشن' 
else
Enmute = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:English') then
Enkick = '🔐روشن' 
else
Enkick = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:English') then
Enban = '🔐روشن' 
else
Enban = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:English') then
Ensi = '🔐روشن' 
else
Ensi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Text') then
Textdel = '🔐روشن' 
else
Textdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Text') then
Textwarn = '🔐روشن' 
else
Textwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Text') then
Textmute = '🔐روشن' 
else
Textmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Text') then
Textkick = '🔐روشن' 
else
Textkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Text') then
Textban = '🔐روشن' 
else
Textban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Text') then
Textsi = '🔐روشن' 
else
Textsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Location') then
Locdel = '🔐روشن' 
else
Locdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Location') then
Locwarn = '🔐روشن' 
else
Locwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Location') then
Locmute = '🔐روشن' 
else
Locmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Location') then
Lockick = '🔐روشن' 
else
Lockick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Location') then
Locban = '🔐روشن' 
else
Locban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Location') then
Locsi = '🔐روشن' 
else 
Locsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Flood') then
Flooddel = '🔐روشن' 
else
Flooddel = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Flood') then
Floodwarn = '🔐روشن' 
else
Floodwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Flood') then
Floodmute = '🔐روشن' 
else
Floodmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Flood') then
Floodkick = '🔐روشن' 
else
Floodkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Flood') then
Floodban = '🔐روشن' 
else
Floodban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Flood') then
Floodsi = '🔐روشن' 
else
Floodsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Mention') then
Mentiondel = '🔐روشن' 
else
Mentiondel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Mention') then
Mentionwarn = '🔐روشن' 
else
Mentionwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Mention') then
Mentionmute = '🔐روشن' 
else
Mentionmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Mention') then
Mentionkick = '🔐روشن' 
else
Mentionkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Mention') then
Mentionban = '🔐روشن' 
else
Mentionban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Mention') then
Mentionsi = '🔐روشن' 
else
Mentionsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Hyper') then
Hyperdel = '🔐روشن' 
else
Hyperdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Hyper') then
Hyperwarn = '🔐روشن' 
else
Hyperwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Hyper') then
Hypermute = '🔐روشن' 
else
Hypermute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Hyper') then
Hyperkick = '🔐روشن' 
else
Hyperkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Hyper') then
Hyperban = '🔐روشن' 
else
Hyperban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Hyper') then
Hypersi = '🔐روشن' 
else
Hypersi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Channelpost') then
Channelpostdel = '🔐روشن' 
else
Channelpostdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Channelpost') then
Channelpostwarn = '🔐روشن' 
else
Channelpostwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Channelpost') then
Channelpostmute = '🔐روشن' 
else
Channelpostmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Channelpost') then
Channelpostkick = '🔐روشن' 
else
Channelpostkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Channelpost') then
Channelpostban = '🔐روشن' 
else
Channelpostban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Channelpost') then
Channelpostsi = '🔐روشن' 
else
Channelpostsi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Biolink') then
Biolinkdel = '🔐روشن' 
else
Biolinkdel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Number') then
Number = '🔐روشن' 
else
Number = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Biolink') then
Biolinkwarn = '🔐روشن' 
else
Biolinkwarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Biolink') then
Biolinkmute = '🔐روشن' 
else
Biolinkmute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Biolink') then
Biolinkkick = '🔐روشن' 
else
Biolinkkick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Biolink') then
Biolinkban = '🔐روشن' 
else
Biolinkban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Biolink') then
Biolinksi = '🔐روشن' 
else
Biolinksi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp:'..chat,'Del:Malware') then
Malwaredel = '🔐روشن' 
else
Malwaredel = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Warn:Malware') then
Malwarewarn = '🔐روشن' 
else
Malwarewarn = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Mute:Malware') then
Malwaremute = '🔐روشن' 
else
Malwaremute = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Kick:Malware') then
Malwarekick = '🔐روشن' 
else
Malwarekick = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Ban:Malware') then
Malwareban = '🔐روشن' 
else
Malwareban = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Silent:Malware') then
Malwaresi = '🔐روشن' 
else
Malwaresi = '🔓خاموش'  
end
if base:sismember(TD_ID..'Gp2:'..chat,'Welcomeon') then
welcome = '🔐روشن' 
else
welcome = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Lock:Cmd') then
cmd = '🔐روشن' 
else 
cmd = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp:'..chat,'Lock:TGservice') then
tg = '🔐روشن' 
else 
tg = '🔓خاموش' 
end 
if base:sismember(TD_ID..'Gp:'..chat,'Lock:Poll') then
poll = '🔐روشن' 
else
poll = '🔓خاموش' 
end 
if base:sismember(TD_ID..'Gp:'..chat,'Del:Dice') then
tas = '🔐روشن' 
else 
tas = '🔓خاموش' 
end 
if base:sismember(TD_ID..'Gp:'..chat,'Del:Reply') then
reply = '🔐روشن' 
else 
reply = '🔓خاموش' 
end 
if base:sismember(TD_ID..'Gp:'..chat,'Lock:Dozd') then
dozd = '🔐روشن' 
else
dozd = '🔓خاموش' 
end
if base:sismember(TD_ID..'Gp2:'..chat,'Mute_All') then
muteall = '🔐روشن' 
else
muteall = '🔓خاموش'  
end 

------------------------------


if base:get(TD_ID.."sg:link"..chat) == "del" then 
 settings_link = "❌حذف" 
 elseif base:get(TD_ID.."sg:link"..chat) == "mute" then 
 settings_link = "📵سکوت"  
 elseif base:get(TD_ID.."sg:link"..chat) == "warn" then 
 settings_link = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:link"..chat) == "ban" then 
 settings_link = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:link"..chat) then 
 settings_link = "غیرفعال" 
 end 
 
 if base:get(TD_ID.."sg:web"..chat) == "del" then 
 settings_web = "❌حذف" 
 elseif base:get(TD_ID.."sg:web"..chat) == "mute" then 
 settings_web = "📵سکوت" 
 elseif base:get(TD_ID.."sg:web"..chat) == "warn" then 
 settings_web = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:web"..chat) == "ban" then 
 settings_web = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:web"..chat) then 
 settings_web = "غیرفعال" 
 end  
 
 if base:get(TD_ID.."sg:hyper"..chat) == "del" then 
 settings_hyper = "❌حذف" 
 elseif base:get(TD_ID.."sg:hyper"..chat) == "mute" then 
 settings_hyper = "📵سکوت" 
 elseif base:get(TD_ID.."sg:hyper"..chat) == "warn" then 
 settings_hyper = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:hyper"..chat) == "ban" then 
 settings_hyper = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:hyper"..chat) then 
 settings_hyper = "غیرفعال" 
 end  
 
 
 if base:get(TD_ID.."sg:biolink"..chat) == "del" then  
 settings_biolink = "❌حذف" 
 elseif base:get(TD_ID.."sg:biolink"..chat) == "mute" then 
 settings_biolink = "📵سکوت" 
 elseif base:get(TD_ID.."sg:biolink"..chat) == "warn" then 
 settings_biolink = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:biolink"..chat) == "ban" then 
 settings_biolink = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:biolink"..chat) then 
 settings_biolink = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:bot"..chat) == "del" then 
 settings_bot = "❌حذف" 
 elseif base:get(TD_ID.."sg:bot"..chat) == "mute" then 
 settings_bot = "📵سکوت" 
 elseif base:get(TD_ID.."sg:bot"..chat) == "warn" then 
 settings_bot = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:bot"..chat) == "ban" then 
 settings_bot = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:bot"..chat) then 
 settings_bot = "غیرفعال" 
 end 
 
 if base:get(TD_ID.."sg:edit"..chat) == "del" then 
 settings_edit = "❌حذف" 
 elseif base:get(TD_ID.."sg:edit"..chat) == "mute" then 
 settings_edit = "📵سکوت" 
 elseif base:get(TD_ID.."sg:edit"..chat) == "warn" then 
 settings_edit = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:edit"..chat) == "ban" then 
 settings_edit = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:edit"..chat) then 
 settings_edit = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:fwd"..chat) == "del" then 
 settings_fwd = "❌حذف" 
 elseif base:get(TD_ID.."sg:fwd"..chat) == "mute" then 
 settings_fwd = "📵سکوت" 
 elseif base:get(TD_ID.."sg:fwd"..chat) == "warn" then 
 settings_fwd = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:fwd"..chat) == "ban" then 
 settings_fwd = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:fwd"..chat) then 
 settings_fwd = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:post"..chat) == "del" then 
 settings_post = "❌حذف" 
 elseif base:get(TD_ID.."sg:post"..chat) == "mute" then 
 settings_post = "📵سکوت" 
 elseif base:get(TD_ID.."sg:post"..chat) == "warn" then 
 settings_post = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:post"..chat) == "ban" then 
 settings_post = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:post"..chat) then 
 settings_post = "غیرفعال" 
 end 
 
  if base:get(TD_ID.."sg:tag"..chat) == "del" then 
 settings_tag = "❌حذف" 
 elseif base:get(TD_ID.."sg:tag"..chat) == "mute" then 
 settings_tag = "📵سکوت" 
 elseif base:get(TD_ID.."sg:tag"..chat) == "warn" then 
 settings_tag = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:tag"..chat) == "ban" then 
 settings_tag = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:tag"..chat) then 
 settings_tag = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:user"..chat) == "del" then 
 settings_user = "❌حذف" 
 elseif base:get(TD_ID.."sg:user"..chat) == "mute" then 
 settings_user = "📵سکوت" 
 elseif base:get(TD_ID.."sg:user"..chat) == "warn" then 
 settings_user = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:user"..chat) == "ban" then 
 settings_user = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:user"..chat) then 
 settings_user = "غیرفعال" 
 end 
 
 
 
 if base:get(TD_ID.."sg:sticker"..chat) == "del" then 
 settings_sticker = "❌حذف" 
 elseif base:get(TD_ID.."sg:sticker"..chat) == "mute" then 
 settings_sticker = "📵سکوت" 
 elseif base:get(TD_ID.."sg:sticker"..chat) == "warn" then 
 settings_sticker = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:sticker"..chat) == "ban" then 
 settings_sticker = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:sticker"..chat) then 
 settings_sticker = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:stickers"..chat) == "del" then 
 settings_stickers = "❌حذف" 
 elseif base:get(TD_ID.."sg:stickers"..chat) == "mute" then 
 settings_stickers = "📵سکوت" 
 elseif base:get(TD_ID.."sg:stickers"..chat) == "warn" then 
 settings_stickers = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:stickers"..chat) == "ban" then 
 settings_stickers = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:stickers"..chat) then 
 settings_stickers = "غیرفعال" 
 end 
 
 
 
 if base:get(TD_ID.."sg:voice"..chat) == "del" then 
 settings_voice = "❌حذف" 
 elseif base:get(TD_ID.."sg:voice"..chat) == "mute" then 
 settings_voice = "📵سکوت" 
 elseif base:get(TD_ID.."sg:voice"..chat) == "warn" then 
 settings_voice = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:voice"..chat) == "ban" then 
 settings_voice = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:voice"..chat) then 
 settings_voice = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:music"..chat) == "del" then 
 settings_music = "❌حذف" 
 elseif base:get(TD_ID.."sg:music"..chat) == "mute" then 
 settings_music = "📵سکوت" 
 elseif base:get(TD_ID.."sg:music"..chat) == "warn" then 
 settings_music = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:music"..chat) == "ban" then 
 settings_music = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:music"..chat) then 
 settings_music = "غیرفعال" 
 end 
 
 
 
 if base:get(TD_ID.."sg:mention"..chat) == "del" then 
 settings_mention = "❌حذف" 
 elseif base:get(TD_ID.."sg:mention"..chat) == "mute" then 
 settings_mention = "📵سکوت" 
 elseif base:get(TD_ID.."sg:mention"..chat) == "warn" then 
 settings_mention = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:mention"..chat) == "ban" then 
 settings_mention = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:mention"..chat) then 
 settings_mention = "غیرفعال" 
 end 
 
 
 
 if base:get(TD_ID.."sg:self"..chat) == "del" then 
 settings_self = "❌حذف" 
 elseif base:get(TD_ID.."sg:self"..chat) == "mute" then 
 settings_self = "📵سکوت" 
 elseif base:get(TD_ID.."sg:self"..chat) == "warn" then 
 settings_self = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:self"..chat) == "ban" then 
 settings_self = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:self"..chat) then 
 settings_self = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:photo"..chat) == "del" then 
 settings_photo = "❌حذف" 
 elseif base:get(TD_ID.."sg:photo"..chat) == "mute" then 
 settings_photo = "📵سکوت" 
 elseif base:get(TD_ID.."sg:photo"..chat) == "warn" then 
 settings_photo = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:photo"..chat) == "ban" then 
 settings_photo = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:photo"..chat) then 
 settings_photo = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:gif"..chat) == "del" then 
 settings_gif = "❌حذف" 
 elseif base:get(TD_ID.."sg:gif"..chat) == "mute" then 
 settings_gif = "📵سکوت" 
 elseif base:get(TD_ID.."sg:gif"..chat) == "warn" then 
 settings_gif = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:gif"..chat) == "ban" then 
 settings_gif = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:gif"..chat) then 
 settings_gif = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:film"..chat) == "del" then 
 settings_film = "❌حذف" 
 elseif base:get(TD_ID.."sg:film"..chat) == "mute" then 
 settings_film = "📵سکوت" 
 elseif base:get(TD_ID.."sg:film"..chat) == "warn" then 
 settings_film = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:film"..chat) == "ban" then 
 settings_film = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:film"..chat) then 
 settings_film = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:contact"..chat) == "del" then 
 settings_contact = "❌حذف" 
 elseif base:get(TD_ID.."sg:contact"..chat) == "mute" then 
 settings_contact = "📵سکوت" 
 elseif base:get(TD_ID.."sg:contact"..chat) == "warn" then 
 settings_contact = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:contact"..chat) == "ban" then 
 settings_contact = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:contact"..chat) then 
 settings_contact = "غیرفعال" 
 end 
 
 
 
 if base:get(TD_ID.."sg:game"..chat) == "del" then 
 settings_game = "❌حذف" 
 elseif base:get(TD_ID.."sg:game"..chat) == "mute" then 
 settings_game = "📵سکوت" 
 elseif base:get(TD_ID.."sg:game"..chat) == "warn" then 
 settings_game = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:game"..chat) == "ban" then 
 settings_game = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:game"..chat) then 
 settings_game = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:file"..chat) == "del" then 
 settings_file = "❌حذف" 
 elseif base:get(TD_ID.."sg:file"..chat) == "mute" then 
 settings_file = "📵سکوت" 
 elseif base:get(TD_ID.."sg:file"..chat) == "warn" then 
 settings_file = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:file"..chat) == "ban" then 
 settings_file = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:file"..chat) then 
 settings_file = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:loc"..chat) == "del" then 
 settings_loc = "❌حذف" 
 elseif base:get(TD_ID.."sg:loc"..chat) == "mute" then 
 settings_loc = "📵سکوت" 
 elseif base:get(TD_ID.."sg:loc"..chat) == "warn" then 
 settings_loc = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:loc"..chat) == "ban" then 
 settings_loc = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:loc"..chat) then 
 settings_loc = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:caption"..chat) == "del" then 
settings_caption = "❌حذف" 
 elseif base:get(TD_ID.."sg:caption"..chat) == "mute" then 
 settings_caption = "📵سکوت" 
 elseif base:get(TD_ID.."sg:caption"..chat) == "warn" then 
 settings_caption = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:caption"..chat) == "ban" then 
 settings_caption = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:caption"..chat) then 
 settings_caption = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:inline"..chat) == "del" then 
 settings_inline = "❌حذف" 
 elseif base:get(TD_ID.."sg:inline"..chat) == "mute" then 
 settings_inline = "📵سکوت" 
 elseif base:get(TD_ID.."sg:inline"..chat) == "warn" then 
 settings_inline = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:inline"..chat) == "ban" then 
 settings_inline = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:inline"..chat) then 
 settings_inline = "غیرفعال" 
 end 
 
 
 ---------------------------------------
 if base:get(TD_ID.."sg:txt"..chat) == "del" then 
 settings_txt = "❌حذف" 
 elseif base:get(TD_ID.."sg:txt"..chat) == "mute" then 
 settings_txt = "📵سکوت" 
 elseif base:get(TD_ID.."sg:txt"..chat) == "warn" then 
 settings_txt = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:txt"..chat) == "ban" then 
 settings_txt = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:txt"..chat) then 
 settings_txt = "غیرفعال" 
 end 
 
 

 
--------------------------------

  if base:get(TD_ID.."sg:english"..chat) == "del" then 
 settings_english = "❌حذف" 
 elseif base:get(TD_ID.."sg:english"..chat) == "mute" then 
 settings_english = "📵سکوت" 
 elseif base:get(TD_ID.."sg:english"..chat) == "warn" then 
 settings_english = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:english"..chat) == "ban" then 
 settings_english = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:english"..chat) then 
 settings_english = "غیرفعال" 
 end 
 if base:get(TD_ID.."sg:farsi"..chat) == "del" then 
 settings_farsi = "❌حذف" 
 elseif base:get(TD_ID.."sg:farsi"..chat) == "mute" then 
 settings_farsi = "📵سکوت" 
 elseif base:get(TD_ID.."sg:farsi"..chat) == "warn" then 
 settings_farsi = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:farsi"..chat) == "ban" then 
 settings_farsi = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:farsi"..chat) then 
 settings_farsi = "غیرفعال" 
 end 
 
 
 if base:get(TD_ID.."sg:malware"..chat) == "del" then 
 settings_malware = "❌حذف" 
 elseif base:get(TD_ID.."sg:malware"..chat) == "mute" then 
 settings_malware = "📵سکوت" 
 elseif base:get(TD_ID.."sg:malware"..chat) == "warn" then 
 settings_malware = "⚠️اخطار"  
 elseif base:get(TD_ID.."sg:malware"..chat) == "ban" then 
 settings_malware = "🚫مسدود" 
 elseif not base:get(TD_ID.."sg:malware"..chat) then 
 settings_malware = "غیرفعال" 
 end 

-------spam---------------
if base:get(TD_ID.."Del:Spam"..chat) == "del" then  
 settings_spam = "❌حذف" 
 elseif base:get(TD_ID.."Del:Spam"..chat) == "mute" then 
 settings_spam = "📵سکوت" 
 elseif base:get(TD_ID.."Del:Spam"..chat) == "warn" then  
 settings_spam = "⚠️اخطار"  
 elseif not base:get(TD_ID.."Del:Spam"..chat) then 
 settings_spam = "🔓خاموش"  
 end 
  
 if base:get(TD_ID.."Del:Flood"..chat) == "del" then 
 settings_flood = "❌حذف" 
 elseif base:get(TD_ID.."Del:Flood"..chat) == "mute" then 
 settings_flood = "📵سکوت"  
 elseif base:get(TD_ID.."Del:Flood"..chat) == "warn" then 
 settings_flood = "⚠️اخطار"   
 elseif not base:get(TD_ID.."Del:Flood"..chat) then 
 settings_flood = "🔓خاموش" 
 end  
 if not base:get(TD_ID..'JoinMSG:Time:'..chat) then 
 TIME_JoinMSG = "15" 
 else 
 TIME_JoinMSG = base:get(TD_ID..'JoinMSG:Time:'..chat) 
 end 
 if not base:get(TD_ID..'Flood:Time:'..chat) then 
 TIME_CHECK = "2" 
 else 
 TIME_CHECK = base:get(TD_ID..'Flood:Time:'..chat) 
 end 
 if not base:get(TD_ID..'Flood:Max:'..chat) then 
 MSG_MAX = "6" 
 else 
 MSG_MAX = base:get(TD_ID..'Flood:Max:'..chat) 
 end 
 if not base:get(TD_ID..'Warn:Max:'..chat) then 
 warn = "5" 
 else 
 warn = base:get(TD_ID..'Warn:Max:'..chat) 
 end 
  
 if not base:get(TD_ID..'NUM_CH_MAX:'..chat) then  
 CH_MAX = "400" 
 else 
 CH_MAX = base:get(TD_ID..'NUM_CH_MAX:'..chat) 
 end 
 if base:get(TD_ID.."sg:locktabalpha"..chat) == "lock" then 
 dozdanti = '🔐روشن'  
 else 
 dozdanti = '🔓خاموش'   
 end 
------------------------
if base:sismember(TD_ID..'Gp2:'..chat,'forceadd') then  
 forceadd = '🔐روشن' 
 else 
 forceadd = '🔓خاموش' 
 end 
 
 if not base:get(TD_ID..'Force:Max:'..chat) then 
 Add_MAX = "10" 
 else 
 Add_MAX = base:get(TD_ID..'Force:Max:'..chat) 
 end 
 if not base:get(TD_ID..'Force:Pm:'..chat) then 
 forcepm = "3" 
 else 
 forcepm = base:get(TD_ID..'Force:Pm:'..chat) 
 end 
 if base:sismember(TD_ID..'Gp2:'..chat,'force_NewUser') then 
 Ramin = 'همه کاربران'  
 else 
 Ramin ='کاربر جدید' 
 end 
---------------------------
if base:sismember(TD_ID..'Gp2:'..chat,'forcejoin') then 
 forcejoin = '🔐روشن'
 else 
 forcejoin = '🔓خاموش'
 end 
 if base:sismember(TD_ID..'Gp2:'..chat,'forcejoinduc') then 
 forcejoinduc = '🔐روشن'
 else 
 forcejoinduc = '🔓خاموش'
 end 
 if not base:get(TD_ID..'joinwarn:'..chat) then 
 JoinWarn = "4" 
 else 
 JoinWarn = base:get(TD_ID..'joinwarn:'..chat) 
 end 
------------------------------

if base:sismember(TD_ID..'Gp2:'..chat,'automuteall') then
auto = '🔐روشن'
else 
auto = '🔓خاموش'
end
if base:sismember(TD_ID..'Gp2:'..chat,'PanelPv') then
pvpnl = '🔐روشن'
else 
pvpnl = '🔓خاموش'
end
if base:sismember(TD_ID..'Gp2:'..chat,'kickbotpm') then
botpm = '🔐روشن'
else 
botpm = '🔓خاموش'
end
if base:sismember(TD_ID..'Gp2:'..chat,'MsgCheckPm') then
lockpm = '🔐روشن'
else 
lockpm = '🔓خاموش' 

end
if base:get(TD_ID..'freeinstall') then
freeinstall = '✓'
else 
freeinstall = '✘' 
end

--Panel Sudo
if base:sismember(TD_ID..'PnlSudo:','add') and base:sismember(TD_ID..'PnlSudo:','rem') and base:sismember(TD_ID..'PnlSudo:','نصب') and base:sismember(TD_ID..'PnlSudo:','لغو نصب') then 
add = '✘'
else
add = '✓'
end
if base:sismember(TD_ID..'PnlSudo:','send groups') and base:sismember(TD_ID..'PnlSudo:','ارسال به گروها') then
send = '✘'
else
send = '✓'
end
if base:sismember(TD_ID..'PnlSudo:','fwd groups') and base:sismember(TD_ID..'PnlSudo:','فوروارد به گروها') then 
fwd = '✘'
else
fwd = '✓'
end
if base:sismember(TD_ID..'PnlSudo:','clean gbans') and base:sismember(TD_ID..'PnlSudo:','پاکسازی لیست گلوبال') then
gbans = '✘'
else
gbans = '✓'
end
if base:sismember(TD_ID..'PnlSudo:','joinchannel off') and base:sismember(TD_ID..'PnlSudo:','جوین چنل خاموش') and base:sismember(TD_ID..'PnlSudo:','joinchannel on') and base:sismember(TD_ID..'PnlSudo:','جوین چنل روشن') then 
joinch = '✘'
else
joinch = '✓'
end
if base:sismember(TD_ID..'PnlSudo:','kickall') and base:sismember(TD_ID..'PnlSudo:','اخراج همه') then
kickall = '✘'
else
kickall = '✓'
end
if base:sismember(TD_ID..'PnlSudo:','charge') and base:sismember(TD_ID..'PnlSudo:','شارژ') then
chargegp = '✘'
else
chargegp = '✓'
end 
--Limit Cmd
if base:sismember(TD_ID..'LimitCmd:'..chat,'ban') and base:sismember(TD_ID..'LimitCmd:'..chat,'مسدود') then 
ban = 'عدم دسترسی📍'
bane = 'دردسترس'
else
ban = 'عدم دسترسی' 
bane = 'دردسترس📍'
end

if base:sismember(TD_ID..'LimitCmd:'..chat,'mute') and base:sismember(TD_ID..'LimitCmd:'..chat,'سکوت') then 
b = 'عدم دسترسی📍'
be = 'دردسترس'
else
b = 'عدم دسترسی' 
be = 'دردسترس📍'
end
if base:sismember(TD_ID..'LimitCmd:'..chat,'warn') and base:sismember(TD_ID..'LimitCmd:'..chat,'اخطار') then 
wn = 'عدم دسترسی📍'
wnee = 'دردسترس'
else 
wn = 'عدم دسترسی'
wnee = 'دردسترس📍'
end
if base:sismember(TD_ID..'LimitCmd:'..chat,'muteall') and base:sismember(TD_ID..'LimitCmd:'..chat,'تعطیل کردن') and base:sismember(TD_ID..'LimitCmd:'..chat,'unmuteall') and base:sismember(TD_ID..'LimitCmd:'..chat,'بازکردن') then 
muall = 'عدم دسترسی📍'
mallee = 'دردسترس'
else
muall = 'عدم دسترسی'
mallee = 'دردسترس📍'
end
if base:sismember(TD_ID..'LimitCmd:'..chat,'cmgall') and base:sismember(TD_ID..'LimitCmd:'..chat,'پاکسازی') then 
c = 'عدم دسترسی📍'
cee = 'دردسترس'
else 
c = 'عدم دسترسی'
cee = 'دردسترس📍' 
end
if base:sismember(TD_ID..'LimitCmd:'..chat,'vip') and base:sismember(TD_ID..'LimitCmd:'..chat,'ویژه') then 
v = 'عدم دسترسی📍'
vee = 'دردسترس'
else  
v = 'عدم دسترسی'
vee = 'دردسترس📍'
end
if base:sismember(TD_ID..'LimitCmd:'..chat,'lock') and base:sismember(TD_ID..'LimitCmd:'..chat,'del') and base:sismember(TD_ID..'LimitCmd:'..chat,'silent') and base:sismember(TD_ID..'LimitCmd:'..chat,'kick') and
base:sismember(TD_ID..'LimitCmd:'..chat,'unlock') and
base:sismember(TD_ID..'LimitCmd:'..chat,'ddel')and base:sismember(TD_ID..'LimitCmd:'..chat,'dwarn') and base:sismember(TD_ID..'LimitCmd:'..chat,'dmute') and base:sismember(TD_ID..'LimitCmd:'..chat,'dsilent') and base:sismember(TD_ID..'LimitCmd:'..chat,'dkick') and base:sismember(TD_ID..'LimitCmd:'..chat,'dban') and
base:sismember(TD_ID..'LimitCmd:'..chat,'قفل') and base:sismember(TD_ID..'LimitCmd:'..chat,'حذف')and base:sismember(TD_ID..'LimitCmd:'..chat,'سایلنت') and base:sismember(TD_ID..'LimitCmd:'..chat,'اخراج')then 
lo = 'عدم دسترسی📍'
loee = 'دردسترس'
else
lo = 'عدم دسترسی'
loee = 'دردسترس📍'
end

if base:sismember(TD_ID..'Gp:'..chat,'Lock:Join') then
joins = '🔐روشن'
else 
joins = '🔓خاموش'
end
if base:sismember(TD_ID..'Gp:'..chat,'forceadd') then
if base:sismember(TD_ID..'Gp2:'..chat,'diamondlang') then
force = '#On' 
else
force = '#فعال'
end
else
if base:sismember(TD_ID..'Gp2:'..chat,'diamondlang') then
force = '#OFF'
else
force = '#غیرفعال'
end
end
if base:sismember(TD_ID..'Gp:'..chat,'forcejoin') then
if base:sismember(TD_ID..'Gp2:'..chat,'diamondlang') then
join = '#On'
else
join = '#فعال'
end
else
if base:sismember(TD_ID..'Gp2:'..chat,'diamondlang') then
join = '#OFF'
else
join = '#غیرفعال'
end
end
local expire = base:ttl(TD_ID.."ExpireData:"..chat)
if expire == -1 then
if base:sismember(TD_ID..'Gp2:'..chat,'diamondlang') then
EXPIRE = 'Unlimited'
else
EXPIRE = 'نامحدود'
end
else
local d = math.floor(expire / day ) + 1
if base:sismember(TD_ID..'Gp2:'..chat,'diamondlang') then
EXPIRE = ""..d.." Day"
else
EXPIRE = ""..d.." روز"
end
end
end