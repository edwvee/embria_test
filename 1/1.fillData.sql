#добавляем посты
INSERT INTO `tbl_feed` VALUES (1,'title1','content1','2017-03-10 15:02:51'),
  (2,'title2','content2','2017-03-10 15:02:51');
#добавляем категории
INSERT INTO `tbl_category` VALUES (1,'category1'),(2,'category2'),(3,'category3');
#назначаем постам категории
INSERT INTO `tbl_category_feed` (category_id, feed_id) VALUES (1,1),(2,2),(3,2);
#добавляем пользователей
INSERT INTO `tbl_user` VALUES (1,'user1'),(2,'user2'),(3,'user3');
#добавляем лайки
INSERT INTO `tbl_like` VALUES (1,1,1),(2,2,2),(3,2,3);
