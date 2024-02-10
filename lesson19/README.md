Роль 1 user_config: Створити юзера devops з групою itdep. Створити окремий ssh-ключ та додати його на сервер за допомогою ansible для отримання доступу до сервера з іншим ключем. Створити файл .bashrc, додати кастомізацію для користувача (кольори в консолі тощо).



Роль 2 install_ soft: Встановити допоміжні пакети, як-от mc, screen та tree та інші на ваш вибір.



Роль 3 web_server: Встановити та сконфігурувати nginx з кастомним конфігом, використовуючи template.



Роль 4 mysql_server: Встановити та сконфігурувати Mysql з користувачем для підключення зовні, та базу myapp.

![image1](https://github.com/NataliaKozey/laba/blob/master/lesson19/images/img.png)

Створіть кілька playbook для різних сценаріїв, коли вам треба все встановити з нуля, та налаштування пакетів та web_server окремо і окремо базу даних. 

![image2](https://github.com/NataliaKozey/laba/blob/master/lesson19/images/img_1.png)
![image3](https://github.com/NataliaKozey/laba/blob/master/lesson19/images/img_2.png)