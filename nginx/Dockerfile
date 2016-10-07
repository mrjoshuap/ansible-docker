FROM fedora:latest

MAINTAINER mrjoshuap <mrjoshuap@redhat.com>

# do initial install and housekeeping
RUN dnf update -y \
    && dnf install -y nginx nginx-all-modules \
    && dnf clean all \
    && rm -rf /var/cache/yum/*

# copy our configuration into the container
COPY nginx.conf /etc/nginx/nginx.conf

# copy our site data into
COPY site /usr/share/nginx/html

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log


# Expose our normal ports (note that 443 is not configured...)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
