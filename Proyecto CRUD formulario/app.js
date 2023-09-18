//variable

let listaEmpleados = [];

const objEmpleados = {
    id: '',
    nombre:'',
    puesto: ''
}

// variable cuando ingresa y cuando no
let editando = false;

// constante para elemento de formulario, imput y boton

const formulario = document.querySelector('#formulario');
const nombreImput = document.querySelector('#nombre');
const puestoImput = document.querySelector('#puesto');
const btnAgregar = document.querySelector('#btnAgregar');

// cuando detecte el submint va a llamar a la funcion
formulario.addEventListener('submit', validarFormulario);

// para que no se ejecute de forma automatica-- validando que tenga valor
function validarFormulario(evento){
    evento.preventDefault();
if(nombreImput.value === ''|| puestoImput.value === '')
    {
    alert('Todos los campos son obligatorios. ');
    return;
    }
    
    if (editando){
editarEmpleados();
    editando = false
    
}else{
    objEmpleados.id = Date.now();
    objEmpleados.nombre = nombreImput.value;
    objEmpleados.puesto = puestoImput.value;

    agregarEmpleados();
}

}

function agregarEmpleados(){
    listaEmpleados.push({...objEmpleados});

    mostrarEmpleados();
    formulario.reset();
    limpiarObjeto();
}
// Esta funcion limpia el formulario (no la lista de empleado)
function limpiarObjeto(){
   
    objEmpleados.id = '';
    objEmpleados.nombre = '';
    objEmpleados.puesto = '';

}


// hace refenrencia en que parte se agrega los elementos----'div-empleados'
function mostrarEmpleados(){

    limpiarHTML();

    const divEmpleados = document.querySelector('.div-empleados');

    listaEmpleados.forEach (empleados =>
    {
        const {id, nombre, puesto} = empleados;
        const parrafo = document.createElement('p');
        parrafo.textContent = `${id} - ${nombre} - ${puesto} - `;
        parrafo.dataset.id = id; // esto es para ver que parrafo se elimina
// botones editar borrar
//cargarEmpleados (); //carga el empleado automaticamente
        
const editarBoton = document.createElement('button');
editarBoton.onclick = () => cargarEmpleados(empleados);

editarBoton.textContent = 'Editar';
//clases en cssss
editarBoton.classList.add('btn','btn-editar');
parrafo.append(editarBoton);


const eliminarBoton = document.createElement('button');
eliminarBoton.onclick = () => eliminarEmpleados(id);

eliminarBoton.textContent = 'Eliminar';
//clases en css
eliminarBoton.classList.add('btn','btn-eliminar');
parrafo.append(eliminarBoton);


const hr = document.createElement('hr');
// nodo hijo -----.appendChild();
divEmpleados.appendChild(parrafo);
divEmpleados.appendChild(hr);

    });
}
function cargarEmpleados(empleados){
const {id , nombre, puesto} = empleados;
nombreImput.value = nombre;
puestoImput.value = puesto;

    objEmpleados.id = id;

formulario.querySelector('button[type="submit"]').textContent ='Actualizar';
editando = true;
}

function editarEmpleados(){
    objEmpleados.nombre = nombreImput.value;
    objEmpleados.puesto = puestoImput.value;

    listaEmpleados.map(empleados => {

        if (empleados.id === objEmpleados.id){
            empleados.id = objEmpleados.id;
            empleados.nombre = objEmpleados.nombre;
            empleados.puesto = objEmpleados.puesto;
        }


    });
    limpiarHTML();
    mostrarEmpleados();
// al monento de editar que cambie el boton a grgegar
    formulario.reset();
    formulario.querySelector('button[type="submit"]').textContent = 'Agregar'
    editando = false;
}


// filtrando elemento no iguales al id
function eliminarEmpleados (id) {
   
 listaEmpleados= listaEmpleados.filter(empleados => empleados.id !== id);
 limpiarHTML();
 mostrarEmpleados();
}


//elimina de uno en uno hasta que no detecte replica
function limpiarHTML(){

    const divEmpleados = document.querySelector('.div-empleados')
    while(divEmpleados.firstChild){
        divEmpleados.removeChild(divEmpleados.firstChild);
    }
}