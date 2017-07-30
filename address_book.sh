#!/bin/bash


delete(){
    read -p "Enter name: " name
    read -p "Enter surname: " surname
    echo " $name $surname will be deleted; Are you use [Y/N]"
    read -p "Please enter your choise Y or N " choose
    if [ $choose == "Y" ] 
    then
       sed -i  "/$name/{/$surname/d}" data.txt
    else
       pause
    fi
}


search_by_email(){
     read -p "Enter the email adress: " email
     grep $email data.txt | column -t -s ';'
     pause
}


search_by_phone(){
     read -p "Enter the phone number: " phone
     grep $phone data.txt | column -t -s ';'
     pause
}

search_by_surname(){
     read -p "Enter the surname: " surname
     grep $surname data.txt | column -t -s ';'
     pause
}


search_by_name(){
     read -p "Enter the name: " name
     grep $name data.txt | column -t -s ';'
     pause
}


search(){
     clear
     echo "1. Search by name"
     echo "2. Search by surname"
     echo "3. Search by phone number"
     echo "4. Serach by email adress"
     echo "5. Exit"
     local choise
     read -p "Please choose search criteria [1-4]: " choise
     case $choise in
          1) search_by_name;;
          2) search_by_surname;;
          3) search_by_phone;;
          4) search_by_email;;
          5) exit 0 ;;
          *) echo -e "Choise is not avaible"
     esac      
}

add(){
    read -p "Enter the name: " name
    read -p "Enter the surname: " surname
    read -p "Enter phone number:  " phone
    read -p "Enter email adress: " email
    echo "Datele introduse sunt:"
    echo "Name: $name"
    echo "Surname: $surname"
    echo "Phone number: $phone"
    echo "Email adress: $email"
   # echo "Name and surname;Phone number;Email adress" >> data.txt
    echo "$name;$surname;$phone;$email" >> data.txt
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


