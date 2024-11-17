#!/bin/bash

count_files() {
  ls -l | grep -c ^-
}

file_count=$(count_files)

echo "Bienvenue dans le jeu de devinettes !"
echo "Essayez de deviner combien de fichiers se trouvent dans le répertoire actuel."

while true; do
  read -p "Entrez votre estimation : " guess
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Veuillez entrer un nombre valide."
    continue
  fi
  if (( guess < file_count )); then
    echo "Trop bas ! Essayez à nouveau."
  elif (( guess > file_count )); then
    echo "Trop haut ! Essayez à nouveau."
  else
    echo "Félicitations ! Vous avez deviné correctement. Il y a $file_count fichier(s) dans le répertoire."
    break
  fi
done
