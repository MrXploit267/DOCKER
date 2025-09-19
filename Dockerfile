FROM alpine:latest
#The dockerfile builds
LABEL maintainer = "Me OFC"
LABEL description = "the flippin bum ahh image"
LABEL credits = "God, Me and Peaches aka Grok"

#Add group and users
RUN addgroup -g 15025 -S userz
RUN adduser -u 1002 -G userz -D peaches
RUN sed -i 's|root:/bin/ash|root:/sbin/nologin|' /etc/passwd

#INSTALL ttyd  and other essentials
RUN apk update && \
	apk add --no-cache ttyd bash openssh vsftpd freerdp samba jq  && \
	# remove cache pckages for size
	rm -rf /var/cache/apk/*

#install.sh file for python server and other ...focuses on run time validation and permissions
COPY install.sh ./install.sh
RUN chmod +x /install.sh && /install.sh && rm /install.sh
USER peaches 
EXPOSE 8080 7681 # 8080 for web access and 7681 for ttyd
HEALTHCHECK  --interval=30s --timeout=3s \
	CMD curl -f http://localhost:7681 || exit 1
CMD ["ttyd", "-p", "7681", "bash"]
