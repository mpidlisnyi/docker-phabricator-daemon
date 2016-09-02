Container for [Phabricator](https://phacility.com/phabricator/) daemon (php daemon)

Examples of docker-compose.yml for testing on one node
```
version: '2'
services:
  nginx:
    image: <put here name of nginx frontend image>
    environment:
      - FASTCGI_PASS=php:9000
    ports:
     - "80:80"
     - "443:443"
    links:
     - php
  php:
    image: <put here name of php fpm phabricator image>
    environment:
      - MYSQL_HOST=mysql
      - MYSQL_USER=root
      - MYSQL_PASS=root
      - PHABRICATOR_BASE_URI=https://phabricator.mycompany.com/
      - PYGMENTS_ENABLED=true
      - PHABRICATOR_TIMEZONE=America/New_York
      - MSMTP_FROM=noreply@mycompany.net
      - MSMTP_DOMAIN=mycompany.net
      - MSMTP_HOST=smtp.mycompany.net
      - MSMTP_PORT=25
      - MSMTP_USER=mycompany
      - MSMTP_PASSWORD=mycompany_pass
      - AUTH_REQUIRE_APPROVAL=false
      - AUTH_REQUIRE_EMAIL_VERIFICATION=false
    volumes:
     - /var/repo:/var/repo
    links:
     - mysql
  daemon:
    image: <put here name of this image>
    environment:
      - MYSQL_HOST=mysql
      - MYSQL_USER=root
      - MYSQL_PASS=root
      - PHABRICATOR_BASE_URI=https://phabricator.mycompany.com/
      - PHABRICATOR_TIMEZONE=America/New_York
      - MSMTP_FROM=noreply@mycompany.net
      - MSMTP_DOMAIN=mycompany.net
      - MSMTP_HOST=smtp.mycompany.net
      - MSMTP_PORT=25
      - MSMTP_USER=mycompany
      - MSMTP_PASSWORD=mycompany_pass
      - AUTH_REQUIRE_APPROVAL=false
      - AUTH_REQUIRE_EMAIL_VERIFICATION=false
    volumes:
     - /var/repo:/var/repo
    links:
     - mysql
  mysql:
    image: mysql:5.7
    environment:
      - MYSQL_PASSWORD=phabricator_pw
      - MYSQL_ROOT_PASSWORD=root
```

in this case /var/repo is volume which shared between daemon and php containers

ssh image of phabricator claster will be soon
