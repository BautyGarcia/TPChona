# TPChona
TP de smartcontracts
Integrantes:
 - Bautsita G
 - Bautista M

-------------------------------------

Opcionales:

a. Se podria modificar el mapping de las notas y hacer un mapping de otro mapping, donde una key sea el nombre de la materia y el value sea otro mapping con key numero de bimestre y value la nota. Tambien en el momento de agregar todo, verificar que el numero del bimestre sea mayor o igual a 1 y menor o igual a 4.

b. Creando un array de docentes autorizados y una funcion de agregarDocente(). En esta funcion se verifica que el que este agregando un docente este autorizado y se agregue. Cuando se necesite hacer algo donde un docente tiene que estar autorizado, checkee si la adress del msg.sender pertenezca al array de docentes.

c. Usando el evento "Deposit", cuando un docente determina una nota en la funcion set_nota_materia(), se hace un deposit con la adress del docente, el nombrede la materia como id, para que este sea unico, y como uint value la nota correspondiente. Despues hacer un emit de ese deposit para confirmar la creacion del transaction log en la blockchain. 

-------------------------------------

Links:

https://etherscan.io/address/0x33fed2De02042d86eB17bec89F17CE39a906525b
