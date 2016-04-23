module Main (..) where

import Signal
import NativeUi as Ui
import NativeUi as Ui
import NativeUi.NativeApp as NativeApp
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Elements exposing (..)
import NativeUi.Properties exposing (..)
import NativeUi.Handlers exposing (..)


app : Signal Ui.NativeUi
app =
  NativeApp.start { model = model, view = view, update = update }


main : Signal Ui.NativeUi
main =
  app


type alias Model =
  Int


model : Model
model =
  9000


view : Signal.Address Action -> Model -> Ui.NativeUi
view address count =
  NativeUi.Elements.view
    [ Ui.style [ Style.alignItems "center" ]
    ]
    [ text
        [ Ui.style [ Style.marginBottom 30 ] ]
        [ Ui.string ("This is written in Elm :)") ]
    , image
        [ Ui.style
            [ Style.height 64
            , Style.width 64
            , Style.marginBottom 30
            ]
        , source "https://raw.githubusercontent.com/futurice/spiceprogram/master/assets/img/logo/chilicorn_no_text-128.png"
        ]
        []
    , text
        [ Ui.style
            [ Style.textAlign "center"
            , Style.marginBottom 30
            ]
        ]
        [ Ui.string ("Counter: " ++ toString count)
        ]
    , NativeUi.Elements.view
        [ Ui.style
            [ Style.width 175
            , Style.flexDirection "row"
            , Style.justifyContent "space-between"
            ]
        ]
        [ button address Decrement "#d33" "-1"
        , button address Increment "#3d3" "+1"
        , button address Increment100 "#3d3" "+100"
        ]
    ]


type Action
  = Increment
  | Increment100
  | Decrement


update : Action -> Model -> Model
update action model =
  case action of
    Increment ->
      model + 1

    Increment100 ->
      model + 100

    Decrement ->
      model - 1


button : Signal.Address Action -> Action -> String -> String -> Ui.NativeUi
button address action color content =
  text
    [ Ui.style
        [ Style.color "white"
        , Style.textAlign "center"
        , Style.backgroundColor color
        , Style.paddingTop 5
        , Style.paddingBottom 5
        , Style.width 40
        , Style.fontWeight "bold"
        , Style.shadowColor "#000"
        , Style.shadowOpacity 0.25
        , Style.shadowOffset 1 1
        , Style.shadowRadius 5
        , Style.transform { defaultTransform | rotate = Just "10deg" }
        ]
    , onPress address action
    ]
    [ Ui.string content ]
