#!/bin/bash
elm-make ./src/Todo.elm --output dist/elm.js
elm-make ./src/Main.elm --output dist/main.js
