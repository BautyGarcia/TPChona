pragma solidity ^0.8.10;

contract Colegio {

    // Creo las variables que me pide
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => mapping (uint => uint)) private notas_materia;
    string[] private _nom_materias;
    uint[] private _bimestres;
    address[] private _docentes_autorizados;

    //Creo el constructor con las variables que pide
    constructor(string memory nombre_, string memory apellido_, string memory curso_) {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    //Devuelve el apellido del alumno
    function apellido() public view returns (string memory) {
        return _apellido;
    }

    //Agarra los parametros pasados por nombre_completo(), los junta y devuelve
    function AppendString(string memory a, string memory b, string memory c) public pure returns (string memory) {
        return string(abi.encodePacked(a,b,c));
    }

    //Agrega la address del docente al array de docentes autorizados
    function agregarDocente(address _address_docente) public {
        require(checkIfDocenteIsOk(_address_docente) == false, "El docente ya esta autorizado");
        _docentes_autorizados.push(_address_docente);
    }
    
    //Devuelve true si la address esta en el array de autorizados, sino devuelve false
    function checkIfDocenteIsOk(address _address_docente) public view returns (bool){
        uint _cantItems = _docentes_autorizados.length;
        bool isin = false;

        for (uint i = 0; i < _cantItems; i++){
            if (_docentes_autorizados[i] == _address_docente){
                isin = true;
            }
        }

        return isin;
    }

    //Devuelve el nombre completo del alumno
    function nombre_completo() public view returns (string memory) {
        return AppendString(_nombre, " ", _apellido);
    }

    //Devuelve el curso del alumno
    function curso() public view returns (string memory) {
        return _curso;
    }

    //Le permite AL DOCENTE poner la nota a una cierta materia
    function set_nota_materia(uint _nota, string memory _materia, uint _bimestre) public {
        
        require(_docente == msg.sender || checkIfDocenteIsOk(msg.sender) == true, "No Podes cambiar tu nota panflin");
        require(_bimestre < 5, "No es un numero valido para bimestre");
        require(_bimestre > 0, "No es un numero valido para bimestre");
        notas_materia[_materia][_bimestre] = _nota;
        _nom_materias.push(_materia);
        _bimestres.push(_bimestre);
    }

    //Devuelve la nota en base a la materia
    function nota_materia(string memory _materia, uint _bimestre) public view returns (uint) {
        
        
        uint _nota = notas_materia[_materia][_bimestre];   
        return _nota;
        
    }
    
    //Se fija si la nota de una cierta materia es mayor o igual a 60(6/10), devuelve true o false
    function aprobo(string memory _materia, uint _bimestre) public view returns (bool) {
        
        require (notas_materia[_materia][_bimestre] >= 60);
        return true;
       
    }

    //Ejecuta un FOR una cantidad de veces igual a la cantidad de registros en el mapping/array. 
    //Agarra la nota correspondiente y la suma a _notaParaPromedio y despues lo divide por la cantidad de registros en el mapping/array.
    function promedio() public view returns (uint) {

        uint _cantItems = _nom_materias.length;
        uint _notaParaPromedio;
        uint _notaFinal;


        
        for (uint i = 0; i < _cantItems; i++){
            _notaParaPromedio += notas_materia[_nom_materias[i]][_bimestres[i]];
        }

        _notaFinal = _notaParaPromedio / _cantItems;
        return _notaFinal;
        
    }
}