module Template exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import View exposing  (..)


templateview : Model -> Html Msg
templateview model =
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
            [class "one-half column", style [("margin-top", "10%")]]
             [
               view model
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
            [text "Written by John Chynoweth"]
        ]

    ]
  ]
   