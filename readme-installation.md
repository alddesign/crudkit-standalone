# CRUDKit Standalone Installation
## Prerequisites
* Webserver with PHP version >= 7.1 (PHP CLI should be available)
* Database including driver for PHP (mysql and sqlite work out of the box)

## Installation
* Extract/put the whole "crudkit" folder (this is your laravel root directory from now on) to your webservers <htdocs> directory.
	
## Next Steps
The next steps are the same as in [alddesign/crudkit](https://github.com/alddesign/crudkit)
So please check out: [alddesign/crudkit/readme-installation](https://github.com/alddesign/crudkit/blob/master/readme-installation.md) starting with "SETUP ON WEBSERVER"

## Additional notes
* If security is a thing, change the APP_KEY in the .env file in your laravel root direcory. Generate one by opening a cmd/terminal in your laravel root direcory and run `php artisan key:generate`

