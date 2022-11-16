
# Практическая работа №2
## Тема: реализация классов, отвечающих за базу данных.
#### Цель работы: реализовать функции инициализации базы данных для всех платформ, создания таблиц, обновления таблиц, заполнения таблиц данными, удаления базы данных, а также реализовать таблицы для предметной области «Склад».
#### Ход работы:
#### Создаем инфологическую модель для предметной области «Склад»
![image](https://user-images.githubusercontent.com/95757935/202258147-45923c11-ea93-4476-8743-f678eb26a775.png)
#### Прописываем зависимости необходимые для работы с базой данных в файле pubspec.yaml.
![image](https://user-images.githubusercontent.com/95757935/202258156-143c9ee9-fe61-4e34-9886-ae766188fb3c.png)
#### Создаем файл data_base_request.dart и в нем пишем запросы для создания таблиц в базе данных и запрос для удаления таблиц из базы данных.
![image](https://user-images.githubusercontent.com/95757935/202258176-6a8474a0-da1b-45a7-ad06-7a9ef9ef27e0.png)
#### Создаем файлы, в которых прописываем сущности для будущих моделей.
![image](https://user-images.githubusercontent.com/95757935/202258188-6c98ddd0-2c36-439e-a632-54b83b890e1a.png)
#### Пример сущности
![image](https://user-images.githubusercontent.com/95757935/202258200-41c679ba-5fb1-4c28-b27e-df051e674b77.png)
#### Теперь на основе сущностей создаем модели
![image](https://user-images.githubusercontent.com/95757935/202258250-f07c0d6c-b510-464f-be1b-ccd36fb35ffd.png)
#### Пример модели
![image](https://user-images.githubusercontent.com/95757935/202258301-9fb8452c-1c50-4ad8-8da8-33fb000535bc.png)
#### В файле data_base_helper.dart реализуем функции инициализации базы данных для всех платформ, создания таблиц, обновления таблиц, заполнения таблиц данными, удаления базы данных
#### Функция init отвечает за инициализацию базы данных для всех платформ
![image](https://user-images.githubusercontent.com/95757935/202257966-8f7576bf-0cfa-4d4b-89ce-2dcf011184cb.png)
#### Функция onCreateTable отвечает за создание таблиц в базе данных
![image](https://user-images.githubusercontent.com/95757935/202257917-017caf84-30a9-440a-a0e2-0c5350a26c68.png)
#### Функция onUpgrateTable отвечает за обновление таблиц
![image](https://user-images.githubusercontent.com/95757935/202257863-64989a4d-684e-48bb-af38-f4e13bdb6653.png)
#### Функция onUpgrateTable отвечает за обновление таблиц
![image](https://user-images.githubusercontent.com/95757935/202257840-ff4cc9af-6399-46f8-b87e-fd7f242c9545.png)
#### Функция onInitTable лотвечает за заполнение таблиц данными
![image](https://user-images.githubusercontent.com/95757935/202257760-ec3687b7-680d-4192-ac91-07ef99f96fb2.png)
#### Функция onDropDataBase отвечает удаление базы данных
![image](https://user-images.githubusercontent.com/95757935/202257657-23242580-03bb-4788-95cc-5e16f0963bf0.png)
#### Результат работы программы
![image](https://user-images.githubusercontent.com/95757935/202257354-7dd57f22-73c6-4d8e-9947-bac4cb5efdcb.png)
#### Вывод: в ходе выполнения данной практической работы были реализованы функции инициализации базы данных для всех платформ, создания таблиц, обновления таблиц, заполнения таблиц данными, удаления базы данных, а также реализовать таблицы для предметной области «Склад».

