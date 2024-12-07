DROP USER IF EXISTS 'rails_user'@'%';
CREATE USER 'rails_user'@'%' IDENTIFIED BY 'senha_segura';
GRANT ALL PRIVILEGES ON g_prod_development.* TO 'rails_user'@'%';
FLUSH PRIVILEGES;
