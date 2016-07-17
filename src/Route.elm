module Route exposing (..)

import String exposing (split)
import Navigation


type Location
    = Home
    | Dashboard


type alias Model =
    Maybe Location


urlFor : Location -> String
urlFor loc =
    let
        url =
            case loc of
                Home ->
                    "/"

                Dashboard ->
                    "/dashboard"
    in
        "#" ++ url


locFor : Navigation.Location -> Maybe Location
locFor path =
    let
        segments =
            path.hash
                |> split "/"
                |> List.filter (\seg -> seg /= "" && seg /= "#")
    in
        case segments of
            [] ->
                Just Home

            [ "dashboard" ] ->
                Just Dashboard

            _ ->
                Nothing
