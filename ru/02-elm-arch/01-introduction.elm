module App exposing (..)

import Html exposing (Html, div, text, program)


-- МОДЕЛЬ


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )



-- СООБЩЕНИЯ


type Msg
    = NoOp



-- ПРЕДСТАВЛЕНИЕ


view : Model -> Html Msg
view model =
    div []
        [ text model ]



-- ОБНОВЛЕНИЕ


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



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
