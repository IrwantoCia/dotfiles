#!/bin/sh

# Use this for FCITX5
qdbus "org.fcitx.Fcitx5" "/controller" "org.fcitx.Fcitx.Controller1.CurrentInputMethod")

if [[ "$INPUT" == "keyboard-br" ]]; then
    echo "PT-BR"
elif [[ "$INPUT" == "mozc" ]]; then
    echo "日本語"
elif [[ "$INPUT" == "" ]]; then
    echo "NONE"
fi
