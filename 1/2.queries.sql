#Пусть на странице 30 постов
#Вывод первой страницы
SELECT * 
  FROM tbl_feed
  WHERE show_at <= NOW() AND  NOT ISNULL(show_at)
  ORDER BY show_at DESC
  LIMIT 30;
#Вывод 4-й страницы
SELECT * FROM tbl_feed
  WHERE show_at <= NOW() AND  NOT ISNULL(show_at)
  ORDER BY show_at DESC
  LIMIT 30, 90;

#Категории для второй новости
SELECT tbl_category.* 
  FROM tbl_category_feed
  LEFT JOIN tbl_category
    ON tbl_category_feed.category_id = tbl_category.id
  WHERE feed_id = 2; 
#Новости для второй категории
SELECT tbl_feed.*
  FROM tbl_category_feed
  LEFT JOIN tbl_feed
    ON tbl_category_feed.feed_id = tbl_feed.id
  WHERE category_id = 2;

#Количество лайков для второй новости
SELECT COUNT(*) 
  FROM tbl_like
  WHERE feed_id = 2;
#Пользователи лайкнувшие вторую новость
SELECT tbl_user.*
  FROM tbl_like
  LEFT JOIN tbl_user
    ON tbl_like.user_id = tbl_user.id
  WHERE feed_id = 2;
#Новости лайкнутые первым пользователем
SELECT tbl_feed.*
  FROM tbl_like
  LEFT JOIN tbl_feed
    ON tbl_like.feed_id = tbl_feed.id
  WHERE user_id = 1;

#Найти пользователей на u
SELECT *
  FROM tbl_user
  WHERE name LIKE 'u%';