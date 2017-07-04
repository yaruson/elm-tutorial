module Main exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)


-- МОДЕЛЬ


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- СООБЩЕНИЯ


type Msg
    = Increment Int



-- ПРЕДСТАВЛЕНИЕ


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (Increment 2) ] [ text "+" ]
        , text (toString model)
        ]



-- ОБНОВЛЕНИЕ


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment howMuch ->
            ( model + howMuch, Cmd.none )



-- ПОДПИСКИ


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- ГЛАВНАЯ ФУНКЦИЯ


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
