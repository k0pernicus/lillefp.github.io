module Slack exposing (requestInvitation)


{-|
# Useless documentation
@docs requestInvitation
-}

-- qualified importation
import Http
import Json.Decode as Json
import Task exposing (Task)

domain : String
domain = "lillefp"

-- It is unsafe but... fuck OAuth for this :v
token : String
token = "xoxp-18108277383-18102718260-54864902961-5691d32a4f"

composeUri : String -> String
composeUri email =
  "https://"
  ++ domain
  ++ ".slack.com/api/users.admin.invite"
  ++ "?email=" ++ email
  ++ "&token=" ++ token
  ++ "&set_active=true"

{-| Send an invitation (as an http query)
-}
requestInvitation : String -> Task Http.Error Bool
requestInvitation email =
  composeUri email
  |> Http.get reqDecoder


reqDecoder : Json.Decoder Bool
reqDecoder = Json.at ["ok"] Json.bool
