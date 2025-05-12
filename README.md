Sistema de Gestión de Inventario
Este proyecto es un sistema de gestión de inventario que permite registrar productos, administrar stock y registrar movimientos de entrada y salida por tipo de usuario (Administrador o Almacenista).

Información del Desarrollo
IDE Utilizado
Visual Studio Code

Versión del Lenguaje de Programación Utilizado
PHP 7.4.10

DBMS Utilizado y Versión
MySQL 5.7.31

Requerimientos Previos
PHP 7.4 o superior

Composer

MySQL 5.7 o superior

Node.js y NPM (opcional para compilar assets)

Laravel 8.x

Pasos para Instalar y Ejecutar
Clonar el Repositorio

bash
Copiar
Editar
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_PROYECTO>
Instalar Dependencias

arduino
Copiar
Editar
composer install
npm install
npm run dev
Configurar el Entorno

Copia .env.example a .env

Configura las credenciales de tu base de datos en el archivo .env

Ejecuta:

vbnet
Copiar
Editar
php artisan key:generate
Ejecutar las Migraciones

nginx
Copiar
Editar
php artisan migrate
Crear los Roles Iniciales

Ingresa a Tinker:

nginx
Copiar
Editar
php artisan tinker
Ejecuta:

css
Copiar
Editar
\App\Models\Role::create(['name' => 'Administrador']);
\App\Models\Role::create(['name' => 'Almacenista']);
Levantar el Servidor de Desarrollo

nginx
Copiar
Editar
php artisan serve
