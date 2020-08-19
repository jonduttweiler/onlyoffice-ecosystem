server {
        #If no regular expression match is found, Nginx then selects the default server block 
	listen 80 default_server;
	listen [::]:80 default_server;

	server_name jduttweiler.documentserver.com;

	location / {
		proxy_pass http://localhost:8082/;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_updgrade;
                proxy_set_header Connection "Upgrade";
                proxy_set_header Host $host; 
                proxy_set_header X-Forwarded-Host jduttweiler.documentserver.com/quux;
	}
}
