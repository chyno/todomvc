
module View  exposing(..)
import Html exposing (..)

import Html.Attributes exposing (..)
import Html.Events exposing (..)
--import Html.Keyed as Keyed
--import Html.Lazy exposing (lazy, lazy2)
import Model exposing(..)
---- VIEW ----
view : Model -> Html Msg
view model =
    div []
        [ 

         ul [] (List.map todoitemview model.entries),
         input
            [ 
             placeholder "What needs to be done?"
            , autofocus True
            , value model.field
            , name "newTodo"
            , onInput UpdateField
            ]
         [],
         button [class "button-primary", onClick Add] [text "Add"],
        button [class "button-primary", onClick Remove] [text "Remove Selected"]
      ]
        
todoitemview : Entry -> Html Msg
todoitemview entry =
  li [style [("list-style","none")]][
    label 
    [style [("padding", "1px")]]
    [
      input [type_ "checkbox",  style [("margin-right", "4px")], checked entry.editing, onClick  (ToggleSelection (entry.id, not entry.editing)) ][],
      text  entry.description      
    ]
  ]

viewControlsCount : Int -> Html Msg
viewControlsCount entriesLeft =
    let
        item_ =
            if entriesLeft == 1 then
                " item"
            else
                " items"
    in
        span
            [ class "todo-count" ]
            [ strong [] [ text (toString entriesLeft) ]
            , text (item_ ++ " left")
            ]
