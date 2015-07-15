
# checking if it is listening on port 80 
a=$(sudo lsof -i | grep nginx | head -n 1 | grep "*:http")
if [ -z "$a" ] 
then
echo "############################### Nginx is not listening at 80 ###############################"
else
echo "############################### Nginx is listening at 80 ###############################"
fi


# testing if the admin group have privileges 
admin_present=$(sudo grep "%admin ALL=(ALL) ALL" /etc/sudoers)

if [ -z "$admin_present" ] 
then
echo "############################### adding the admin group to sudoers ###############################"
sudo echo "%admin ALL=(ALL) ALL" >> /etc/sudoers
else
echo "############################### admin group has sudo privileges ###############################"
fi


# testing if the vagrant user has privileges.
# adds passwordless privilege if not yet added.
vagrant_string="vagrant	ALL=(ALL) NOPASSWD: ALL"
vagrant_present=$(sudo grep "$vagrant_string" /etc/sudoers)

if [ -z "$vagrant_present" ] 
then
echo "############################### adding the vagrant to sudoers ###############################"
sudo echo "$vagrant_string" >> /etc/sudoers
else
echo "############################### vagrant already has sudo privileges ###############################"
fi


