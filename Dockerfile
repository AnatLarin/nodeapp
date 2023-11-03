FROM httpd:alpine

# Set the timezone
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Remove the default index.html
RUN rm -f /usr/local/apache2/htdocs/index.html

# Copy PHP application files
COPY src/index.php /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80