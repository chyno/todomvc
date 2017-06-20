port module Main exposing (..)
import Html exposing (..)
import View exposing (..)
import Model exposing (..)
import Template exposing (..)
---- MODEL ----


port setStorage : Model -> Cmd msg

updateWithStorage : Msg -> Model -> ( Model, Cmd Msg )
updateWithStorage msg model =
    let
        ( newModel, cmds ) =
            update msg model
    in
        ( newModel
        , Cmd.batch [ setStorage newModel, cmds] )

---- PROGRAM ----
main : Program (Maybe Model) Model Msg
main =
    Html.programWithFlags
     { 
          init = init
        , view = view
        , update = updateWithStorage
        , subscriptions = \_ -> Sub.none
    }