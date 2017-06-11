
module View  exposing(..)
import Html exposing (..)

import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Keyed as Keyed
import Html.Lazy exposing (lazy, lazy2)
import Model exposing(..)
---- VIEW ----
view : Model -> Html Msg
view model =
    div []
        [ 
         h1 [] [ text "John Todo Application" ],
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
         div[][text "fooFooter goes hereter"]]
        
todoitemview : Entry -> Html Msg
todoitemview entry =
  li [][
    span [] [text entry.description],
    button [class "button-prmary", onClick (Remove entry.id)] [text "Delete"]
  ]

