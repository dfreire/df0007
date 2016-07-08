#!/bin/bash
elm-make ./src/Todo.elm --output dist/elm.js
elm-make ./src/MyApp.elm --output dist/myapp.js
