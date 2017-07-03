> Материал на этой странице относится к Elm 0.18

# Введение

Архитектура Elm — шаблон разработки, который используется при разработке фронтэнд-приложений. Он предлагает способ разработки самодостаточных компонентов которые можно переиспользовать, сочетать и собирать друг в друга бесконечным числом способов.

Для этого Elm предоставляет модуль `Html`. Это лучше объяснить на примере простого приложения.

Установите elm-html:

```elm
elm package install elm-lang/html
```

Создайте файл __App.elm__:

```elm
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
```

Запустить программу можно командой:

```bash
elm reactor
```

А затем открыть в браузере http://localhost:8000/App.elm

Здесь довольно много кода, чтобы просто вывести "Hello", но он поможет лучше понять структуру самых сложных приложений Elm.
