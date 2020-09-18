server {
	listen 80;
	listen [::]:80;

	server_name storage-service.jduttweiler.com;

	location / {
           proxy_pass http://storage-service:8083/;
	}
}


