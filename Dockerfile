# Pull base image.
FROM centos:7
# Install MySQL.
RUN yum update -y && yum clean all
RUN yum install -y httpd httpd-tools
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf 
# Expose ports.
EXPOSE 8081
# Define default command.
CMD ["httpd", "-D", "FOREGROUND"]
