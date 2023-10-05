export a=0
while [ $a -ne 10 ]
do
	((a ++))
	echo je suis un script qui arrive à faire une boucle $a
done
