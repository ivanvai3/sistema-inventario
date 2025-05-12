IDE Utilizado
Visual Studio Code

Versión del Lenguaje de Programación Utilizado
PHP 7.4.10

Frameworks y Librerías Utilizadas
Laravel 8.83.27

Laravel Mix (Webpack 4)

Composer

NPM

Bootstrap 5

jQuery 3.6.0

DataTables 1.13.6

ApexCharts 3.37.1

Font Awesome 6

SweetAlert2 11.7.12

DBMS Utilizado y su Versión
MySQL 8.0.31 (XAMPP)

Paquetes y Librerías Utilizadas para Roles y Permisos
spatie/laravel-permission versión ^5.11.0

Lista de Pasos para Ejecutar el Proyecto
Clonar el repositorio

bash
Copiar
Editar
git clone [URL-del-repositorio]
cd [nombre-del-proyecto]
Instalar dependencias de PHP

bash
Copiar
Editar
composer install
Instalar dependencias de JavaScript

bash
Copiar
Editar
npm install
npm run dev
Configurar archivo .env

Copia el archivo .env.example a .env.

Configura la conexión a tu base de datos.

Generar la llave de la aplicación

bash
Copiar
Editar
php artisan key:generate
Ejecutar migraciones (si aplica)

bash
Copiar
Editar
php artisan migrate
Levantar el servidor de desarrollo

bash
Copiar
Editar
php artisan serve
