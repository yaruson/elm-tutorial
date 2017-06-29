# Подробнее о функциях

## Переменные типа

Посмотрите на функцию со следующим определением:

```elm
indexOf : String -> List String -> Int
```

Эта гипотетическая функция принимает строку и список строк, и возвращает индекс, по которому данная строка была найдена в списке, либо -1, если не найдена.

Но что если нам придётся работать со списком целых чисел? Мы уже не сможем использовать эту функцию. Однако, мы можем сделать эту функцию __обобщённой__ с помощью __переменных типа__ или __дублёров__ вместо конкретных типов.

```elm
indexOf : a -> List a -> Int
```

После того как мы заменили `String` на `a`, определение функции теперь говорит, что `indexOf` принимает значение любого типа `a` и список такого же типа `a` и возвращает целое число. Покуда типы совпадают, компилятор не будет возражать. Вы можете вызывать `indexOf` со строкой и списком строк, либо целым числом и списком чисел, и всё будет работать.

Вот таким образом функции можно сделать более общими. Вы также можете использовать несоклько __переменных типов__:

```elm
switch : ( a, b ) -> ( b, a )
switch ( x, y ) =
  ( y, x )
```

Эта функция принимает кортеж из типов `a` и `b`, а возвращает кортеж из `b` и `a`. Все эти вызовы будут верными:

```elm
switch (1, 2)
switch ("A", 2)
switch (1, ["B"])
```

Стоит отметить, что для переменных типов можно использовать любой идентификатор в нижнем регистре, а `a` и `b` просто общепринятое обозначение. Например, следующее определение будет совершенно правильным:

```
indexOf : thing -> List thing -> Int
```

## Functions as arguments

Consider a signature like:

```elm
map : (Int -> String) -> List Int -> List String
```

This function:

- takes a function: the `(Int -> String)` part
- a list of integers
- and returns a list of strings

The interesting part is the `(Int -> String)` fragment. This says that a function must be given conforming to the `(Int -> String)` signature.

For example, `toString` from core is such function. So you could call this `map` function like:

```elm
map toString [1, 2, 3]
```

But `Int` and `String` are too specific. So most of the time you will see signatures using stand-ins instead:

```elm
map : (a -> b) -> List a -> List b
```

This function maps a list of `a` to a list of `b`. We don't really care what `a` and `b` represent as long as the given function in the first argument uses the same types.

For example, given functions with these signatures:

```elm
convertStringToInt : String -> Int
convertIntToString : Int -> String
convertBoolToInt : Bool -> Int
```

We can call the generic map like:

```elm
map convertStringToInt ["Hello", "1"]
map convertIntToString [1, 2]
map convertBoolToInt [True, False]
```
