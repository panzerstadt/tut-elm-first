module Main exposing (main)

import Browser
import Html exposing (Attribute, Html, br, button, div, input, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- Main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Model =
    { content : String }


init : Model
init =
    { content = "" }



-- Update


type Msg
    = Change String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }

        Clear ->
            { model | content = "" }



-- View


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ Html.node "style" [] [ text css ]
        , div []
            [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
            , button [ onClick Clear ] [ text "clear" ]
            ]
        , br [] []
        , div []
            [ span [] [ text (String.reverse model.content) ]
            , if String.length model.content > 1 then
                span [] [ text (" : " ++ String.fromInt (String.length model.content) ++ " words") ]

              else
                span [] [ text "try typing something above!" ]
            ]
        ]



-- https://ellie-app.com/67vmrPtcygwa1


css =
    """
    .container {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    """
