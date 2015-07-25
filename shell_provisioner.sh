
# checking if it is listening on port 80 
a=$(sudo lsof -i | grep nginx | head -n 1 | grep "*:http")
if [ -z "$a" ] 
then
echo "############################### Nginx is not listening at 80 ###############################"
else
echo "############################### Nginx is listening at 80 ###############################"
fi

