#! /bin/bash

print_title(){
	echo Deploy Script
	echo "- - - - - - - - - - -"
}

print_date(){
	echo Date: $(date +'%d-%m-%Y %H-%M-%S')
	echo "- - - - - - - - - - -"
}
run_apache2() {
	pgrep -x apache2 >/dev/null && echo "APACHE2 is running" || echo "APATCHE not running"
}
install_package(){
	sudo apt-get install -y $1
	echo "- - - - - - - - - -- "
}
apt_update(){
	sudo apt-get update
	echo "- - - - - - - - - - -"
}
remove_old_site(){
	if [ ! -d /var/www/html/.git ]; then
         sudo rm -f /var/www/html/index.html
	fi
	echo "- - - - - - - - - - -"
}
clone_website_code(){
	if [ ! -d /var/www/html/.git ]; then
	 sudo  git clone https://github.com/octocat/Spoon-Knife /var/www/html/
	fi
	echo "- -- - - - - - - - - -"
}


print_title
print_date
apt_update
install_package git
install_package apache2
run_apache2
remove_old_site
clone_website_code

echo "The end of script"
