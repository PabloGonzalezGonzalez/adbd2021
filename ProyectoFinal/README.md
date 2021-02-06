# Proyecto final: Ranking FIFPro

## Administración y Diseño de Bases de Datos

Grupo 5

Gabriel Melián Hernández

Pablo González González

María Candelaria Fariña Rodríguez

Danie Abréu García


## Introducción y descripción del caso

Nuestra Base de Datos va a llevar a cabo el almacenamiento de información
sobre las competiciones, equipos y jugadores de fútbol que tiene cada país.

Los requisitos que proponemos para la Base de Datos son:

Para llevar a cabo el registro de todos nuestros datos y de los jugadores, clubs y
competiciones por cada país que compone el organismo FIFA, debemos contemplar en primer lugar información esencial acerca de los jugadores, como el equipo al que pertenecen que solo puede ser uno mientras dure su contrato, su nacionalidad para poder contabilizar cuántos jugadores de cada país compiten en un país determinado y cuándo concluye su contrato para que pueda recibir ofertas de trabajo por parte de otros clubs, Un jugador podrá recibir un número ilimitado de ofertas, pero solo cuando no tenga contrato en vigor con algún club y sólo podrá aceptar una oferta de contrato, es decir, solo podrá pertenecer y competir para un club simultáneamente. Cabe destacar que un mismo club, no podrá hacer dos ofertas al mismo jugador sin haber transcurrido 1 semana desde que presentó la primera oferta, para dar tiempo al jugador y su entorno de meditar una respuesta y en caso de ser negativa, que el club pueda ofertar un nuevo contrato pasado el tiempo de decisión.

Por otra parte los equipos se registran teniendo en cuenta su Código de Club, que es único
para cada entidad y podrán participar en las competiciones de su país correspondiente, viéndose limitado a una participación en cada competición y estando las competiciones internacionales deshabilitadas por lo que solo se contemplarán aquellas competiciones de carácter nacional. Además se llevará un conteo de los jugadores pertenecientes a cada club, teniendo que ser este número obligatoriamente igual o menor a 25. También se tendrá en cuenta un valor del club en euros que vendrá determinado por el valor asociado a cada jugador de la plantilla no pudiendo ser este valor superior al permitido establecido por el Ranking FIFA en el que se encuentra el club. Por ejemplo un club que esté en la posición 200 del ranking, tendrá un límite de 1250 millones de euros como valor
de club, si este valor es superado, tendrá que vender activos de la plantilla para llevar a cabo una reducción del valor del club, para poder estar exento de sanciones administrativas por parte del comité de competición.

Continuando, se llevará a cabo un conteo de la información referente a las competiciones de cada país, teniendo en cuenta el número de clubs participantes y el país al que pertenece la competición. De igual manera, por cada país se recogerá la información referente a su posición en el ranking FIFA, y el número de competiciones, clubs y jugadores que compiten en ese país.

1. Un equipo puede estar en varias competiciones pero nunca dos veces en la misma.
2. Cada jugador solo puede estar en un equipo a la vez (contrato en vigor) pero puede haber
   pasado por varios equipos en el pasado.
3. No se contemplan competiciones internacionales.
4. Un jugador puede recibir ofertas de otros equipos, pero siempre y cuando su contrato con el
   club actual haya finalizado.
5. Un club ofertante no puede hacer dos ofertas a un mismo jugador sin que haya pasado una
   semana de por medio entre cada una de ellas.
6. El valor de un club no puede superar el límite establecido por su posición en el ranking FIFA.
7. El código de cada club es único para dicha entidad.
8. Los jugadores que compiten con una selección deberán pertenecer a un club.
9. Un club no puede jugar más partidos de una determinada competición que el número total de partidos de dicha competición.


## Documentos enlazados

[Documento del Modelo Conceptual](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/Modelo%20Conceptual-Grupo%205.pdf)

[Documento del Modelo Relacional](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/Modelo%20Relacional-Grupo5.pdf)

[Documento de Generación de Código](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/Scripts-Grupo5.pdf)

[Documento de Carga de Datos](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/Pruebas-Grupo5.pdf)

[Creación de tablas](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/CreacionTablas.sql)

[Carga de datos](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/carga_datos.sql)

[Triggers](https://github.com/PabloGonzalezGonzalez/adbd2021/blob/main/ProyectoFinal/Documentos/triggers.sql)

## Distribución de tareas

Este trabajo ha sido realizado mediante el grupo integro. Se han organizados sesiones de charla telemática y se ha trabajado en los puntos de una manera grupal. Las sesiones han sido señaladas en cada uno de los documentos.

Esta metodología de trabajo ha sido adaptada debido a los errores cometidos en tareas anteriores, donde se erró al dividir mucho el trabajo y, por lo tanto, quitando el factor colectivo de éste.
