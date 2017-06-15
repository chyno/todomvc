module BaseView exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import View exposing (..)
import Model exposing (..)

baseview : Model -> Html Msg
baseview model =
  div 
    [class "table-container"]
    [
      div 
      [class "table-block footer-push"] 
      [
        div 
        [class "container"]
        [
          div 
          [class "row"]
          [
            div
            [class "one-half column", style [("margin-top", "25%")]]
             [
               text "hello world"
             ]
          ]
        ]
    ],
    div
    [class "table-block"]
    [
        div 
        [class "container"]
        [
            footer [id "footer", class "twelve columns"]
            [text "footer text"]
        ]

    ]
  ]
   