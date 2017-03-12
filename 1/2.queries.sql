#����� �� �������� 30 ������
#����� ������ ��������
SELECT * 
  FROM tbl_feed
  WHERE show_at <= NOW() AND  NOT ISNULL(show_at)
  ORDER BY show_at DESC
  LIMIT 30;
#����� 4-� ��������
SELECT * FROM tbl_feed
  WHERE show_at <= NOW() AND  NOT ISNULL(show_at)
  ORDER BY show_at DESC
  LIMIT 30, 90;

#��������� ��� ������ �������
SELECT tbl_category.* 
  FROM tbl_category_feed
  LEFT JOIN tbl_category
    ON tbl_category_feed.category_id = tbl_category.id
  WHERE feed_id = 2; 
#������� ��� ������ ���������
SELECT tbl_feed.*
  FROM tbl_category_feed
  LEFT JOIN tbl_feed
    ON tbl_category_feed.feed_id = tbl_feed.id
  WHERE category_id = 2;

#���������� ������ ��� ������ �������
SELECT COUNT(*) 
  FROM tbl_like
  WHERE feed_id = 2;
#������������ ���������� ������ �������
SELECT tbl_user.*
  FROM tbl_like
  LEFT JOIN tbl_user
    ON tbl_like.user_id = tbl_user.id
  WHERE feed_id = 2;
#������� ��������� ������ �������������
SELECT tbl_feed.*
  FROM tbl_like
  LEFT JOIN tbl_feed
    ON tbl_like.feed_id = tbl_feed.id
  WHERE user_id = 1;

#����� ������������� �� u
SELECT *
  FROM tbl_user
  WHERE name LIKE 'u%';