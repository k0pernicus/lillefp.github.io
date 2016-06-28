import Html exposing (Html, Attribute, div, input, text, button)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Slack exposing (requestInvitation)
import Task exposing (Task)
import Http
