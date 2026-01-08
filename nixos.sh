#!/usr/bin/env bash
# Script de instalacion de mi Configuracion de NixOS

USUARIOSCRIPT=$(whoami)

if [ "$USUARIOSCRIPT" == "root" ]; then
    echo "Por favor no ejecutar como root (o con sudo)"
    exit 1
fi

echo "Procediendo con la instalación para el usuario: $USUARIOSCRIPT..."

find . -type f -not -path '*/.*' -exec sed -i "s/solounrandom/$USUARIOSCRIPT/g" {} +

mkdir -p ~/.nixos-config
cp -r * ~/.nixos-config/

sudo nixos-rebuild switch --flake ~/.nixos-config#nix

