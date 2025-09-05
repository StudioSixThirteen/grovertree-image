FROM php:8.2-cli

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip git openssh-client curl \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Terminus via Composer global
RUN composer global require pantheon-systems/terminus \
    && echo 'export PATH="$PATH:/root/.composer/vendor/bin"' >> /root/.bashrc

# Set path so terminus is available
ENV PATH="/root/.composer/vendor/bin:${PATH}"

CMD ["php", "-v"]

RUN ln -s /root/.composer/vendor/bin/terminus /usr/local/bin/terminus
