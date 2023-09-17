#!/bin/bash

while true; do
    # Obtenir le prix actuel du bitcoin depuis l'API CoinGecko
    bitcoin_price=$(curl -s -H "Accept: application/json" "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd" | jq -r '.bitcoin.usd')

    if [ -z "$bitcoin_price" ]; then
        echo "Impossible d'obtenir le prix du bitcoin depuis l'API. Veuillez réessayer plus tard."
        exit 1
    fi

    echo "Le prix actuel du bitcoin est de $bitcoin_price USD."

    read -p "Le prix du bitcoin va-t-il monter (M) ou descendre (D) dans les prochaines minutes ? (M/D) " choice

    case $choice in
        [Mm]*)
            echo "Attendez et voyez si vous avez raison..."
            # Vous pouvez ici mettre en place une logique pour vérifier si le prix réel du bitcoin monte.
            # Par exemple, vous pouvez comparer le prix actuel avec un prix futur obtenu de l'API.
            # Si le prix monte, le joueur gagne, sinon il perd.
            # Pour cet exemple, nous supposerons que le joueur gagne toujours.
            echo "Bravo, vous avez raison ! Le prix du bitcoin a monté."
            ;;
        [Dd]*)
            echo "Attendez et voyez si vous avez raison..."
            # Vous pouvez ici mettre en place une logique pour vérifier si le prix réel du bitcoin descend.
            # Pour cet exemple, nous supposerons que le joueur gagne toujours.
            echo "Bravo, vous avez raison ! Le prix du bitcoin a descendu."
            ;;
        *)
            echo "Veuillez choisir M pour monter ou D pour descendre."
            ;;
    esac

    read -p "Voulez-vous jouer à nouveau ? (Oui/Non) " play_again
    if [ "$play_again" != "Oui" ] && [ "$play_again" != "oui" ]; then
        break
    fi
done

echo "Merci d'avoir joué au jeu du bitcoin !"

