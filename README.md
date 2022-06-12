# TPChona
TP de smartcontracts
Integrantes:
 - Bautsita G
 - Bautista M

-------------------------------------

Opcionales:

a. Se podria modificar el mapping de las notas y hacer un mapping de otro mapping, donde una key sea el nombre de la materia y el value sea otro mapping con key numero de bimestre y value la nota. Tambien en el momento de agregar todo, verificar que el numero del bimestre sea mayor o igual a 1 y menor o igual a 4.

b. Creando un array de docentes autorizados y una funcion de agregarDocente(). En esta funcion se verifica que el que este agregando un docente este autorizado y se agregue. Cuando se necesite hacer algo donde un docente tiene que estar autorizado, checkee si la adress del msg.sender pertenezca al array de docentes con la funcion CheckIfDocenteIsOk().

c. Creando un evento "Deposit", despues una funcion de deposit() que pida la materia y la nota. Cuando un docente determina una nota en la funcion set_nota_materia(), se hace un emit a deposit() con la address del docente que hace el emit.

-------------------------------------

Links:

https://etherscan.io/address/0x33fed2De02042d86eB17bec89F17CE39a906525b
