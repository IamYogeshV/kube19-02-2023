FROM centos:latest
MAINTAINER awsyogeshv@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
ADD https://www.google.com/url?sa=i&url=https%3A%2F%2Ftamil.samayam.com%2Freligion%2Ftamil-festivals%2Fpillayar-chaturthi-need-to-check-these-things-before-buying-a-vinayagar-statue%2Farticleshow%2F77657835.cms&psig=AOvVaw13ToI2P2HhaBBdtqqXqzbA&ust=1679421601403000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCOj0lpGL6_0CFQAAAAAdAAAAABAE /var/www/html/
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22