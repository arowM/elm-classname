module Html.Attributes.Classname exposing
    ( classWith
    , classMixinWith
    )

{-| A brief module for custom `class` attributes.
It is usefull when using with CSS modules.

@docs classWith
@docs classMixinWith

-}

import Html exposing (Attribute)
import Html.Attributes as Attributes
import Mixin exposing (Mixin)


{-| Helper function to declare custom `class` function.

    myClass : String -> Attribute msg
    myClass =
        classWith (\name -> "prefix__" ++ name)

-}
classWith : (String -> String) -> String -> Attribute msg
classWith f =
    String.split " "
        >> List.map f
        >> String.join " "
        >> Attributes.class


{-| [Mixin](https://package.elm-lang.org/packages/arowM/elm-mixin/latest/) version of `classWith`.
-}
classMixinWith : (String -> String) -> String -> Mixin msg
classMixinWith f =
    Mixin.fromAttribute << classWith f
