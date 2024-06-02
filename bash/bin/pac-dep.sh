#!/bin/bash

# Initialize an array to store removable packages
removable_packages=()

# Get a list of all installed packages
installed_packages=$(pacman -Qq)

# Loop through each installed package
for package in $installed_packages; do
    # Check if the package is a dependency of any other package
    required_by=$(pacman -Qi $package | grep "Required By" | awk '{print $4}')

    # If the package is not required by any other package (indicated by "None"), add it to the list of removable packages
    if [ "$required_by" == "None" ]; then
        removable_packages+=($package)
    fi
done

# Print the list of removable packages
printf "%s\n" "${removable_packages[@]}"
