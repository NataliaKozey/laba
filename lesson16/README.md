Створення бази даних та колекцій:

2. Назвіть базу даних як gymDatabase
   Команда
   use gymDatabase
3. Створіть колекції: clients, memberships, workouts, trainers
Команди
   db.createCollection('clients')
   db.createCollection('memberships')
   db.createCollection('workouts')
   db.createCollection('trainers')
   ![image1](https://github.com/NataliaKozey/laba/blob/master/lesson16/images/img.png)
   5. Заповнення колекцій даними:
   Додайте кілька записів до кожної колекції
   Команди
      db.clients.insertMany([
      { client_id: 1, name: 'Alex', age: 32, email: 'alex@gmail.com' },
      { client_id: 2, name: 'Max', age: 18, email: 'max@gmail.com' },
      { client_id: 3, name: 'John', age: 45, email: 'john@gmail.com' }
      ])

       db.memberships.insertMany([
       { membership_id: 1, client_id: 1, start_date: new Date('2024-01-01'), end_date: new Date('2024-12-31'), type: 'annual' },
       { membership_id: 2, client_id: 2, start_date: new Date('2024-01-01'), end_date: new Date('2024-02-01'), type: 'monthly' },
       { membership_id: 3, client_id: 3, start_date: new Date('2024-02-01'), end_date: new Date('2024-02-01'), type: 'monthly' }
       ])

      db.workouts.insertMany([
      { workout_id: 1, description: "yoga", difficulty: "medium" },
      { workout_id: 2, description: "aerobics", difficulty: "height" },
      { workout_id: 3, description: "pilates", difficulty: "medium" }
      ])

      db.trainers.insertMany([
      { trainer_id: 1, name: "Max", specialization: "medium" },
      { trainer_id: 2, name: "Iren", specialization: "height" },
      { trainer_id: 3, name: "Oleg", specialization: "medium" }
      ])
      ![image1](https://github.com/NataliaKozey/laba/blob/master/lesson16/images/img_1.png)
      ![image1](https://github.com/NataliaKozey/laba/blob/master/lesson16/images/img_3.png)
6. Запити:
Знайдіть всіх клієнтів віком понад 30 років

db.clients.find({ age: { $gt: 30 } })

Перелічіть тренування із середньою складністю

db.workouts.find({ difficulty: 'medium' })

Покажіть інформацію про членство клієнта з певним client_id

db.memberships.find({ client_id: 1 })
![image1](https://github.com/NataliaKozey/laba/blob/master/lesson16/images/img_2.png)