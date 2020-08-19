server {
	listen 80;
	listen [::]:80;

	server_name jduttweiler.storageservice.com;

	location / {
           proxy_pass http://localhost:8083/;
	}
}


