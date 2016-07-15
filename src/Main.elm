module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (..)
import Route
import Navigation
import Home
import Dashboard
import Helpers exposing (link)


type alias Model =
    { route : Route.Model }


type Msg
    = NoOp


init : Maybe Route.Location -> ( Model, Cmd Msg )
init location =
    let
        route =
            Route.init location
    in
        { route = route
        }
            ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    let
        body =
            case model.route of
                Just (Route.Home) ->
                    Home.view

                Just (Route.Dashboard) ->
                    Dashboard.view

                Nothing ->
                    text "Not found!"
    in
        div []
            [ navigationView model
            , body
            ]


navigationView : Model -> Html Msg
navigationView model =
    let
        linkListItem linkData =
            li [] [ link linkData ]
    in
        nav []
            [ ul []
                (List.map linkListItem links)
            ]


links : List ( Route.Location, String )
links =
    [ ( Route.Home, "Home" )
    , ( Route.Dashboard, "Dashboard" )
    ]


main : Program Never
main =
    Navigation.program (Navigation.makeParser Route.locFor)
        { init = init
        , update = update
        , urlUpdate = updateRoute
        , subscriptions = subscriptions
        , view = view
        }


updateRoute : Maybe Route.Location -> Model -> ( Model, Cmd Msg )
updateRoute route model =
    { model | route = route } ! []
