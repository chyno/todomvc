module App exposing (..)
import Html exposing (..)
import View exposing (..)
import Model exposing (..)

---- MODEL ----
      
---- PROGRAM ----
main : Program Never  Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }