FROM httpd:alpine

# Set the timezone
ENV TZ=Europe/Kiev

# Update and install PHP and Apache PHP module
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
      echo $TZ > /etc/timezone && \
        apk update && \
          apk add --no-cache php-apache2 && \
            rm -rf /var/cache/apk/* && \
              rm -f /usr/local/apache2/htdocs/index.html && \
                sed -i '/LoadModule php_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                    apk cache -v sync

COPY httpd.conf /usr/local/apache2/conf/httpd.conf 
COPY src/index.php /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80