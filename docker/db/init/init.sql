DROP USER IF EXISTS 'rails_user'@'%';
CREATE USER 'rails_user'@'%' IDENTIFIED BY '05092004';
GRANT ALL PRIVILEGES ON g_prod_development.* TO 'rails_user'@'%';
FLUSH PRIVILEGES;
