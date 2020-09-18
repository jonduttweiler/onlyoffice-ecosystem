server {
	listen 80;
	listen [::]:80;

	server_name storage-inspector.jduttweiler.com;

	location / {
           proxy_pass http://storage-inspector:3000/;
	}
}


