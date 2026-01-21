#!/usr/bin/env bash
set -euo pipefail

# Password length score checker
# Score baseras ENBART på längd (tecken).
# Inget sparas, inget loggas.

read -rsp "Skriv lösenord (döljs): " pw
echo

len=${#pw}
score=0
rating=""

# Trappsteg (justera om du vill)
if (( len < 8 )); then
  score=10
  rating="Mycket svagt"
elif (( len < 12 )); then
  score=30
  rating="Svagt"
elif (( len < 16 )); then
  score=60
  rating="Okej"
elif (( len < 20 )); then
  score=80
  rating="Starkt"
else
  score=100
  rating="Mycket starkt"
fi

echo "--- Resultat ---"
echo "Längd: $len tecken"
echo "Score: $score/100"
echo "Betyg: $rating"
