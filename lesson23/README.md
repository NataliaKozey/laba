Розгорнути вебзастосунок на AWS EC2 інстансі, використовуючи Terraform для створення 
інфраструктури

Ansible для налаштування середовища та Jenkins для автоматизації розгортання.
_Використовувався наданий приклад для встановлення jenkins з використанням своїх credentials та pipelines_
![image1](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_14.png)
![image2](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_16.png)
Використовуючи Terraform code з попереднього завдання, створіть сервер для Jenkins.
_На aws створено vpc та instance ec2 jenkins-instance, 
app-instance було створено пізніше за допомогою pipeline terraform_

![image3](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img.png)
![image4](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_1.png)
Створіть роль та playbook, в якому викликатимете роль, для встановлення та конфігурації Jenkins 
(встановити залежності, встановити Jenkins та плагіни).

_Також за допомогою ansible було встановлено на сервер jenkins ansible та terraform_
![image5](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_2.png)
Налаштувати три Jenkins Pipeline:
_стоворені всі необхідні credentials_
![image6](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_3.png)
_три pipeline
використувується окремий repository git
https://github.com/NataliaKozey/JeinkinsFiles.git_
![image7](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_4.png)
Запускає Terraform code для створення сервера для застосунку (окрема vpc + app-server).

![image8](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_9.png)
![image9](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_10.png)
Запускає ansible на вашому Application-сервері для конфігурації сервера, підготовки до розгортання 
застосунку. Це може бути як застосунок на сервері, так і контейнер.
![image10](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_7.png)
![image10](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_8.png)
Робить білд і деплой на Application-сервер вашого застосунку. Використовуйте параметри для запуску 
ваших пайплайнів.
![image12](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_11.png)
![image13](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_12.png)
![image14](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_13.png)
В результаті application
![image15](https://github.com/NataliaKozey/laba/blob/master/lesson23/images/img_15.png)
