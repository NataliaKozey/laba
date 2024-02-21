Завдання: розробка Jenkins Pipeline

Мета: створення та налаштування Jenkins Pipeline для автоматизації процесу build, test та deploy застосунку в AWS. 
Налаштування нотифікацій на пошту та в Telegram, а також конфігурація webhook-тригера для мастер-гілки.



Основні завдання

Налаштування Jenkins:

Встановіть та налаштуйте Jenkins на вашому сервері.

![image1](https://github.com/NataliaKozey/laba/blob/master/lesson20/images/img.png)
Створіть новий Jenkins Pipeline job.

_Налаштовано два pipeline: один для налаштування сервера, інший для деплою application_
_jenkins.ansible
jenkins.app_
Інтеграція з Git:

Налаштуйте доступ Jenkins до вашого Git-репозиторію.

Конфігурація Pipeline для відстеження змін у мастер-гілці.


Build-етап:

Напишіть скрипт для збірки вашого застосунку.

Додайте цей скрипт до етапу build у Jenkins Pipeline.

_Для обраного application етап build немає_

Test-етап:

Інтегруйте інструменти автоматизованого тестування для перевірки якості коду.

_Налаштуйте виконання тестів у межах Pipeline._
 
Для обраного application виконная тестів без підключення до бази даних та певних налаштувань середовища не можливо провести.

Deploy-етап:

Налаштуйте автоматичне розгортання застосунку в AWS.

![image2](https://github.com/NataliaKozey/laba/blob/master/lesson20/images/img_2.png)

_деплой успішний_
![image4](https://github.com/NataliaKozey/laba/blob/master/lesson20/images/img_3.png)
Налаштування нотифікацій:

_Налаштуйте відправку електронних листів після завершення кожного Pipeline з посиланням на build і результатом.
Gmail налаштувати не вдалось_



Додаткове завдання

Налаштування Telegram-нотифікацій:

Створіть бота в Telegram.

Інтегруйте бота з Jenkins для відправки нотифікацій про стан Pipeline.
_Створено бота телеграм та налаштована відправка_

![image3](https://github.com/NataliaKozey/laba/blob/master/lesson20/images/img_1.png)


Webhook-тригер:

Налаштуйте webhook у вашому Git-репозиторії.

Конфігурація Jenkins для запуску Pipeline за кожного push у мастер-гілку.
![image5](https://github.com/NataliaKozey/laba/blob/master/lesson20/images/img_4.png)