server {
        #If no regular expression match is found, Nginx then selects the default server block 
	listen 80 default_server;
	listen [::]:80 default_server;

	server_name document-server.jduttweiler.com;

	location / {
		proxy_pass http://document-server:80/;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_updgrade;
                proxy_set_header Connection "Upgrade";
                proxy_set_header Host $host; 
                proxy_set_header X-Forwarded-Host document-server.jduttweiler.com/quux;
	}
}
