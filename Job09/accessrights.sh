while IFS=, read -r uid prenon non mdp role; do

    if [ "$role" = "admin" ]; then
        # Création de l'utilisateur avec des privilèges de super utilisateur
        sudo useradd -m -G sudo "$prenon-$non"
        # Définition du mot de passe pour l'utilisateur
        echo "$prenon-$non:$mdp" | sudo chpasswd
    else
        # Création de l'utilisateur sans privilèges de super utilisateur
        sudo useradd -m "$prenon-$non"
        # Définition du mot de passe pour l'utilisateur
        echo "$prenon-$non:$mdp" | sudo chpasswd
    fi
done < Shell_Userlist.csv
