# Практическая работа №4
## Тема: создать проект с использованием Cubit.
#### Цель работы: реализовать кликер если светлая тема за клик прибавляет +1 если темная тема прибавляется +2, реализовать список нажатий и при какой теме это было реализовано, всё должно находиться на одном экране.
#### Ход работы:
#### Создаем Cubit для перерисовывания и вычислений счетчика. Файл click_cubit.dart отвечает за значение счетчика, а click_state.dart отвечает за состояние счетчика.![image](https://user-images.githubusercontent.com/95757935/206034660-cca8ef04-a3a8-430b-8cd8-2cc3dce39286.png)
![image](https://user-images.githubusercontent.com/95757935/206034641-fe1e5c6a-a990-4200-baf5-83231c2816df.png)
#### Также создаем Cubit change_theme, который будет менять тему на светлую или темную. Change_theme_cubit изменят тему при нажатии на соответствующую кнопку. Файл change_theme_state содержит в себе состояния темы.
![image](https://user-images.githubusercontent.com/95757935/206034612-d47353d1-0659-437b-916b-fb43a1a123da.png)
![image](https://user-images.githubusercontent.com/95757935/206034600-1f89d39a-a024-4d3b-8369-5dc7025964ce.png)
#### И добавляем список изменений счетчика. Файл spisok_cubit добавляет записи в список, а spisok_state отвечает за состояние списка
![image](https://user-images.githubusercontent.com/95757935/206034557-b515302f-0d9a-413e-83c8-0703191294e0.png)
![image](https://user-images.githubusercontent.com/95757935/206034539-af3ac40f-2464-4f7a-a2e4-972e688c0348.png)
#### В файле main.dart необходимо объявить MultiBlocProvider и указать все используемые Cubit’ы
![image](https://user-images.githubusercontent.com/95757935/206034521-ffdbc030-ada6-4cd0-a915-a176ed8d8848.png)
#### Создаем версту cо счетчиком, кнопками для изменения счетчика, темы и списком.
![image](https://user-images.githubusercontent.com/95757935/206034477-e083a87a-ec34-47cd-8703-32b89e0149f0.png)
#### Результат работы:
![image](https://user-images.githubusercontent.com/95757935/206034448-ea8726b2-9bfc-4075-8d2e-d0bb84345130.png)
![image](https://user-images.githubusercontent.com/95757935/206034427-05aec3b1-be4c-4c3d-ab37-7a4eb8a45183.png)
#### Вывод: в ходе выполнения данной практической работы был реализован кликер: если светлая тема за клик прибавляет +1 если темная тема прибавляется +2, а также реализован список нажатий и при какой теме это было реализовано и всё находится на одном экране
