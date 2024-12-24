
# Proyecto de Gestión de Autos y Servicios de Mantenimiento

Este proyecto es una aplicación Rails para gestionar autos y sus servicios de mantenimiento. Proporciona una API para crear, leer, actualizar y eliminar autos, así como asociar servicios de mantenimiento a los autos.

## Requisitos

- Ruby 3.x
- Rails 6.x o superior
- SQLite (usado en el entorno de desarrollo y prueba)
- Node.js y Yarn (para gestionar los assets front-end)
  
## Instalación

### 1. Clonar el repositorio

Primero, clona este repositorio en tu máquina local:

```bash
git clone https://github.com/tu_usuario/proyecto.git
cd proyecto
```

### 2. Instalar dependencias
Ejecuta el siguiente comando para instalar las gemas necesarias para el proyecto:

```bash
bundle install
```
También instala las dependencias de JavaScript:

```bash
yarn install
```

### 3. Configuración de la base de datos
Crea y migra la base de datos:
```bash
rails db:create
rails db:migrate
rails db:seed
```
Este paso creará las tablas necesarias y llenará la base de datos con algunos datos iniciales.

### 4. Ejecutar el servidor
Para correr el servidor de desarrollo, utiliza:
```bash
bin/dev
```
Esto iniciará el servidor en http://localhost:3000.
## API Reference


# Uso de la API

La aplicación incluye una API para interactuar con los autos y sus servicios de mantenimiento. A continuación se detallan los puntos finales disponibles.

Para usar herramientas como Postman es necesario especificar 3 headers:

| Parameter | Type     | Description                |Ejemplo|
| :-------- | :------- | :------------------------- |:-------|
| `X-CSRF-Token` | `string` | **Required**. Se obtien de la etiqueta meta en header |emFOTjRXsB15V8Za...etc|



| Parameter | Type     | Description                |Ejemplo|
| :-------- | :------- | :------------------------- |:-------|
| `Cookie` | `string` | **Required**. Se obtiene de la cokie en el navegador|_maintenance_service_session=ei2hdVw7eX...etc|



| Parameter | Type     | Description                |Ejemplo|
| :-------- | :------- | :------------------------- |:-------|
| `Accept` | `string` | **Required**.|application/json|


## Endpoints de Autos

### GET /cars

Devuelve todos los autos en formato JSON.

Ejemplo de respuesta:
```json
[
  {
    "id": 1,
    "plate_number": "ABC123",
    "model": "Toyota",
    "year": 2020
  },
  {
    "id": 2,
    "plate_number": "DEF456",
    "model": "Honda",
    "year": 2021
  }
]
```

### GET /cars/:id

Devuelve los detalles de un auto específico por su id.

Ejemplo de respuesta:
```json
{
  "id": 1,
  "plate_number": "ABC123",
  "model": "Toyota",
  "year": 2020
}
```

### POST /cars

Crea un nuevo auto. Los parámetros requeridos son `plate_number`, `model` y `year`.

Ejemplo de cuerpo de la solicitud:
```json
{
    "plate_number": "XYZ789",
    "model": "Ford",
    "year": 2022
}
```

Ejemplo de respuesta:
```json
{
  "id": 3,
  "plate_number": "XYZ789",
  "model": "Ford",
  "year": 2022
}
```

### PUT /cars/:id

Actualiza los detalles de un auto existente.

Ejemplo de cuerpo de la solicitud:
```json
{
    "plate_number": "XYZ789",
    "model": "Ford",
    "year": 2023
}
```

Ejemplo de respuesta:
```json
{
  "id": 3,
  "plate_number": "XYZ789",
  "model": "Ford",
  "year": 2023
}
```

### DELETE /cars/:id

Elimina un auto específico por su id.

Ejemplo de respuesta:
```json
{
  "status": "no_content"
}
```

## Endpoints de Servicios de Mantenimiento

### GET /maintenance_car_services

Devuelve todos los servicios de mantenimiento asociados a un auto.

Ejemplo de respuesta:
```json
[
  {
    "id": 1,
    "car_id": 1,
    "description": "Oil Change",
    "date": "2024-01-01",
    "status": "completed"
  },
  {
    "id": 2,
    "car_id": 1,
    "description": "Tire Rotation",
    "date": "2024-02-01",
    "status": "completed"
  }
]
```

### POST /cars/:car_id/maintenance_car_services

Crea un servicio de mantenimiento para un auto específico. Este endpoint requiere el `car_id` como parámetro de la URL.

Ejemplo de cuerpo de la solicitud:
```json
{
    "description": "Brake Check",
    "date": "2024-03-01",
    "status": "completed"
}
```

Ejemplo de respuesta:
```json
{
  "id": 3,
  "car_id": 1,
  "description": "Brake Check",
  "date": "2024-03-01",
  "status": "completed"
}
```

### POST maintenance_car_services

Crea un servicio de mantenimiento para un auto específico.

Ejemplo de cuerpo de la solicitud:
```json
{

    "description": "Brake Check",
    "date": "2024-03-01",
    "status": "completed",
    "car_id: 1
}
```

Ejemplo de respuesta:
```json
{
  "id": 3,
  "car_id": 1,
  "description": "Brake Check",
  "date": "2024-03-01",
  "status": "completed"
}
```

# Autenticación (JWT)

Este proyecto también incluye un sistema de autenticación básica utilizando **JWT (JSON Web Token)**. Para obtener un token de autenticación, realiza una petición `POST` a:

## POST /auth/login

### Cuerpo de la solicitud:

```json
{
  "email": "usuario@dominio.com",
  "password": "contraseña"
}
```

### Respuesta:

Si la autenticación es exitosa, recibirás un token JWT:

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

Este token se almacena en cookies y se incluye en las solicitudes posteriores a la API