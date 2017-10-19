-------------------------------------------------------------- exemple 01
type Login     = String
type Password  = String
type AvatarURL = String
type UserId    = Integer

userInfo :: Login -> Password -> AvatarURL -> UserId -> String
loginIN :: EmptyInfo -> WithLogin
passwIN :: WithLogin -> AndWithPassword
avatrIN :: AndWithPassword -> AndWithAvatarURL   

type EmptyInfo        = Login -> Password -> AvatarURL -> UserId -> String
type WithLogin        =          Password -> AvatarURL -> UserId -> String
type AndWithPassword  =                      AvatarURL -> UserId -> String
type AndWithAvatarURL =                                   UserId -> String

loginIN emptyInfo  =  emptyInfo "Denis"
passwIN infoLogin  = infoLogin "12345zX"
avatrIN infoPassword  = infoPassword "http://dshevchenko.ru/avatar.png"

userInfo login password avatarURL userId =
    " Full info about user: @" ++ (show userId) ++ "$" ++
    "\n login: " ++ login ++
    "\n password: " ++ password ++
    "\n avatar URL: " ++ avatarURL

main =
    let userId = 1234
        infoLogin     = loginIN userInfo 
        infoPassword  = passwIN infoLogin 
        infoAvatarURL = avatrIN infoPassword 
        allAboutUser  = infoAvatarURL userId
    in
    putStrLn allAboutUser
    
-------------------------------------------------------------------------------