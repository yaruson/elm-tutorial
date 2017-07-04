> Материал на этой странице относится к Elm 0.18

# Сообщения с нагрзкой

Вы можете передавать нагрузку вместе с сообщениями:

```elm
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
```

Обратите внимание: теперь сообщению `Increment` требуется целое число:

```elm
type Msg
    = Increment Int
```

Теперь в представлении отправим сообщение с нагрузкой:

```elm
onClick (Increment 2)
```

И наконец, в функции обновления используем __сопоставление c образцом__ (pattern matching) чтобы извлечь нагрузку:

```elm
update msg model =
    case msg of
        Increment howMuch ->
            ( model + howMuch, Cmd.none )
```
