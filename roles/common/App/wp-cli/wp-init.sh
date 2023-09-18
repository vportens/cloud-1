#!/bin/sh

sleep 20;

wp core install --path="/var/www/html" \
--url="https://wpvp.${DOMAIN}" \
--title="Local Wordpress By Docker Test viporten" \
--admin_user=${ADMIN_USER} \
--admin_password=${ADMIN_PASSWORD} \
--admin_email=${ADMIN_EMAIL} \
--allow-root;

wp post create --post_author='viporten' \
--post_title='Bienvenu sur mon SuperSiteWeb' \
--post_content='Ici tu trouveras ce qui ce fait de mieux en terme de site wordpress, car evidement de nombreuses annees d experience mon permit d aquerir un savoir infini' \
--post_status=publish \
--allow-root;

wp post create --post_author='gentleman1304' \
--post_type=page \
--post_title='here we are, 50 lessons on frogs' \
--post_content='here you will found all ressourceses to learn everything about frogs' \
--post_status=publish \
--allow-root;

wp theme install wp-content/themes/yith-wonder.zip --allow-root --activate;

tail -f /dev/null;