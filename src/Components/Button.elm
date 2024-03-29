
module Components.Button exposing (main)
-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Components.Clock


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
-- model == model of the module's "world"

type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Increment10
  | Decrement
  | Reset


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1
    
    Increment10 -> 
      model + 10

    Decrement ->
      model - 1
    
    Reset ->
      0



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Increment10 ] [ text "+10" ]
    , button [ onClick Reset ] [ text "reset" ]
    ]

