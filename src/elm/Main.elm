module Main exposing (..)
import Html exposing (..)
import View exposing (..)
import Model exposing (..)
import Template exposing (..)
---- MODEL ----
      
---- PROGRAM ----
main : Program Never  Model Msg
main =
    Html.program
        { init = init
        , view = templateview
        , update = update
        , subscriptions = \_ -> Sub.none
        }