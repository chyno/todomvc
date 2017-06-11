module Model exposing (..)

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
      UpdateField String |
      Remove Int

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
    Remove id -> 
     { model |  entries = (List.filter (\itm -> itm.id /= id) model.entries) 
                    
      } ! []
      

