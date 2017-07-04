> Материал на этой странице относится к Elm 0.18

# Сообщения (messages)

В предыдущем разделе мы создали приложение используя `Html.propgram`, которое было просто статическим Html. Теперь давайте создадим приложение, которое реагирует на пользовательское взаимодействие посредством сообщений.

```elm
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
```

This program is very similar to the previous program we did, but now we have two messages: `Expand` and `Collapse`. You can run this program by copying it into a file and opening it using Elm reactor. 

Let's look more closely at the `view` and `update` functions.

Эта программа очень похожа на предыдущую, но теперь у нас есть два сообщения: `Expand` и `Collapse`. Вы можете запустить эту программу скопировав исходный код в файл и открыв его в Elm reactor.

Посмотрим внимательнее на функции `view` и `update`.

### Представление (view)

```elm
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
```

Depending on the state of the model we show either the collapsed or the expanded view. 

Note the `onClick` function. As this view is of type `Html Msg` we can trigger messages of that type using `onClick`. Collapse and Expand are both of type Msg.

### Update

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )

        Collapse ->
            ( False, Cmd.none )
```

`update` реагирует на возможные сообщение. В зависимости от сообщения, она возвращает требуемое состояние. Когда приходит сообщение `Expand`, новое состояние будет `True` (развёрнуто). 

Далее мы посмотрим как __Html.program__ организует эти части вместе.
