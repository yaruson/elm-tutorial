module Main exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)


-- МОДЕЛЬ


type alias Model =
    Bool


init : ( Model, Cmd Msg )
init =
    ( False, Cmd.none )



-- СООБЩЕНИЯ


type Msg
    = Expand
    | Collapse



-- ПРЕДСТАВЛЕНИЕ


view : Model -> Html Msg
view model =
    if model then
        div []
            [ button [ onClick Collapse ] [ text "Collapse" ]
            , text "Widget"
            ]
    else
        div []
            [ button [ onClick Expand ] [ text "Expand" ] ]



-- ОБНОВЛЕНИЕ


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )

        Collapse ->
            ( False, Cmd.none )



-- ПОДПИСКИ


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- ГЛАВНАЯ ФУНКЦИЯ


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
