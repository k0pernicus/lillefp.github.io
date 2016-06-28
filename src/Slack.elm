import Http
import Json.Decode as Json
import Task exposing (Task)

domain : String
domain = "lillefp"

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

requestInvitation : String -> Task Http.Error Bool
requestInvitation email =
  composeUri email
  |> Http.get reqDecoder


reqDecoder : Json.Decoder Bool
reqDecoder = Json.at ["ok"] Json.bool
