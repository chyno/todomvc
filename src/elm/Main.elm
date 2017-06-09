module App exposing (..)
import Html exposing (..)
 
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Keyed as Keyed
import Html.Lazy exposing (lazy, lazy2)
import Json.Decode as Json
import String
import Task
---- MODEL ----

-- The full application state of our todo app.
type alias Model =
    { entries : List Entry
    , field : String
    , uid : Int
    , visibility : String
    }

type alias Entry =
    { description : String
    , completed : Bool
    , editing : Bool
    , id : Int
    }

emptyModel : Model
emptyModel =
    { entries = []
    , visibility = "All"
    , field = ""
    , uid = 0
    }


newEntry : String -> Int -> Entry
newEntry desc id =
    { description = desc
    , completed = False
    , editing = False
    , id = id
    }

init :  ( Model, Cmd Msg )
init  =
    (emptyModel, Cmd.none )

---- UPDATE ----
type Msg
    = NoOp |
      Add |
      UpdateField String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
       ( model, Cmd.none )
    Add ->
      { model
                | uid = model.uid + 1
                , field = ""
                , entries =
                    if String.isEmpty model.field then
                      model.entries
                    else
                      model.entries ++ [ newEntry model.field model.uid ]
      } ! []
    UpdateField val ->
      {model | field = val} ! []
      

---- VIEW ----
view : Model -> Html Msg
view model =
    div []
        [ 
         h1 [] [ text "Hello from Todo" ],
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
         button [onClick Add] [text "Add"],
         div[][text "footer"]]
        
todoitemview : Entry -> Html msg
todoitemview entry =
  li [][text entry.description]

---- PROGRAM ----
main : Program Never  Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }