#!/bin/bash
# APT repo update script with backbone by EthanRDoesMC

# Initial info
echo ""
echo "Ametrine APT repo update script"
echo "Backbone by EthanRDoesMC; adapted by quiprr/ItHertzSoGood"
echo ""

# Prompt to update files
echo "Would you like to update the current repo configuration?"
select yn in "Yes" "No"; do
case $yn in
Yes ) break;;
No ) echo "OK."; exit; break;;
esac
done

# Remove Packages files
rm Packages
rm Packages.gz
rm Packages.bz2

# Recreate Packages files
dpkg-scanpackages --multiversion debs > Packages
gzip -c9 Packages > Packages.gz
bzip2 -c9 Packages > Packages.bz2

# Prompt to push to GitHub
echo "Done!"
echo ""
echo "Would you like to push the changes?"
select yn in "Yes" "No"; do
case $yn in
Yes ) break;;
No ) echo "OK."; exit; break;;
esac
done

# Pull origin
git pull origin master

# Add files
git add .

# Commit
git commit -m "Updated Packages files for new debs (via update.sh)"

# Push origin
git push origin master

exit