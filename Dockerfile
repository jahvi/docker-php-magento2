FROM php:7.0

RUN apt-get update && apt-get install -y \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libmcrypt-dev \
    libxslt-dev \
    libzip-dev \
    curl \
    build-essential

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g eslint
