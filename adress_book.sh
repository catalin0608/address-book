#!/bin/bash



add(){
    read -p "Enter name and surname: " name
    read -p "Enter phone number:  " phone
    read -p "Enter email adress: " email
    echo "Datele introduse sunt:"
    echo "Name and surname: $name"
    echo "Phone number: $phone"
    echo "Email adress: $email"
   # echo "Name and surname;Phone number;Email adress" >> data.txt
    echo "$name;$phone;$email" >> data.txt
    pause
}

list(){
    cat data.txt | column -t -s ';'
    pause
}



pause(){
    read -p "Press [Enter] key to continue..." fackEnterKey
}

show_menu(){
    clear
    echo "============================="
    echo "========= Meniu ============="
    echo "============================="
    echo "1. Add entries"
    echo "2. Search entries"
    echo "3. Edit entries"
    echo "4. Delete entries"
    echo "5. List all"
    echo "6. Exit"
}

read_menu(){
    local option
    read -p "Enter your option [1-6]: " option
    case $option in
        1) add;;
        2) search;;
        3) edit;;
        4) delete;;
        5) list ;;
        6) exit 0 ;;
        *) echo -e "Error option is not avaible"
     esac

}

while true
do
   show_menu
   read_menu
done


