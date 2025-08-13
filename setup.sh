#!/usr/bin/env bash
set -e

go install github.com/a-h/templ/cmd/templ@latest
bun install tailwindcss @tailwindcss/cli
bunx tailwindcss -i ./style.css -o ./doc/output.css 
