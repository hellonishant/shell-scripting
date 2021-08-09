#!/usr/bin/env bash

if [[ ! $(id -u) -eq 0 ]]; then
  echo 'You must be root to execute this script'
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || exit 1
fi

# Get the username from the user
read -p 'Enter the username for the new user: ' USERNAME

# Get the name of the user
read -p 'Enter the name of the user: ' NAME

# Get the Password for the user
read -p 'Enter the password for the new user: ' PASSWORD

# Creating the new user

if useradd -D ${USERNAME} -mc "${NAME}"; then
  echo "The user could not be created"
fi

# Create the password for the user

if echo ${PASSWORD} | passwd --stdin "${USERNAME}"; then
  echo "The password for the user could not be created"
fi

passwd -e "${USERNAME}"

# Display the username, password and the name of the newly created user.
echo "A new user ${NAME} is created with username ${USERNAME} with password ${PASSWORD} "

exit 0
