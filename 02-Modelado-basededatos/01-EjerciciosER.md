# Ejercicios del Modelo E-R

## Ejercicio 1.

Un hospital registra información de sus pacientes.
> De cada paciente se almacena lo siguiente:
- Identificador
- Nombre
- Fecha de nacimiento

> De cada expediente médico se debe almacenar:
- Número de expediente.
- Fecha de apertura.
- Tipo de sangre.

> Reglas del negocio:
- Cada paciente debe tener exactamente un expediente médico.
- Cada expediente médico pertenece a un único paciente.
- No puede existir un expediente sin paciente.
- No puede existir un paciente sin expediente.

### Solución del Ejercicio
![Solución Ej2](../img/ER/Ejercicio2.jpg)


## Ejercicio 2.

Una Universidad administra profesores y cursos

>De cada Profesor se almacena:

- numero de Profesor
- nombre
- especialidad

>De cada Curso se almacena:

- Número de Curso
- Nombre del Curso
- Créditos

>Reglas del negocio 

1. Un profesor puede impartir varios cursos
2. Un curso solamente puede ser impartido por un profesor
3. Puede existir un profesor que actualmente no imparta cursos
4. Todo curso debe estar asignado a un profesor

>Lo que se debe realizar:

- Identificar y Dibujar las Entidades
- Identificar y Dibujar la Relación **IMPARTE**
- Determinar la Razón de Cardinalidad
- Determinar la participación 


### Solución del Ejercicio
![Solución Ej2](../img/ER/Ejercicio2.jpg)


## Ejercicio 3

Una escuela administra alumnos y materias

>De cada Alumno se almacena:

- Matricula
- Nombre
- Semestre

>De cada Materia se almacena:

- Clave de la materia
- Nombre de la Materia
- Creditos

> Reglas del Negocio

1. Un alumno puede inscribirse en varias materias.
2. Una materia puede tener muchos alumnos inscritos
3. Puede existir una materia sin alumnos inscritos
4. Todo alumno debe estar inscrito en almenos una materia
5. De cada inscripción se desea almacenar:

    - Fecha de Inscripción 
    - Calificación Final

Nota: La relación se debe llamar **INSCRIBE**

### Solución del Ejercicio
![Solución Ej2](../img/ER/Ejercicio2.jpg)

## Ejercicio 4. 

Una empresa se dedica a la venta de productos al por mayor, y necesita registrar lo siguiente:

> De los clientes necesita almacenar:

- Identificador del cliente 
- Nombre del cliente, el cual es una persona moral 

> De los pedidos de Venta:

- Numero de pedido
- Fecha del pedido 

> De los productos:

- Numero de producto
- Nombre del producto
- Precio del Producto 

> Reglas del negocio 

1. Un cliente puede realizar muchos pedidos
2. Cada pedido pertenece a un solo cliente
3. Un pedido contiene varios productos
4. Un producto puede aparecer en muchos pedidos 
5. Un pedido debe contener al menos un producto
6. Un producto puede no haber sido vendido
7. El detalle del pedido no existe sin pedido
8. El detalle del pedido no existe sin producto
9. El detalle del pedido almacena cantidad vendida y precio de venta

### Solución del Ejercicio
![Solución Ej2](../img/ER/Ejercicio2.jpg)


