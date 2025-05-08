// Examen 1 Muñoz San Agustin Victoria Monserrat 320094187
#include <stdio.h>           // Librería para entrada y salida de datos (como printf y scanf)
#include <stdlib.h>          // Librería para funciones generales (como system)
#include <windows.h>         // Librería para funciones de Windows (como SetConsoleOutputCP)

// Definición de constantes para usar en todo el programa
#define meTotal 16384        // Memoria total simulada: 16 GB
#define meSO 4096            // Memoria reservada para el sistema operativo: 4 GB
#define nParticiones 9       // Número de particiones fijas para memoria estática
#define MAX_PROCESOS  100     // Máximo número de procesos para segmentación

// Declaración de funciones que se usarán más adelante
void menu();                 // Muestra el menú principal con los tipos de gestión de memoria
void portada();              // Muestra una bienvenida en pantalla
void caracteristicas();      // Muestra las características del sistema (memoria)
void memEstatica();          // Función que simula la memoria estática (espacios fijos)
void memDinamica();          // Función que simula la memoria dinámica (espacios variables)
void memPaginacion();        // Función que simula paginación (divide memoria en páginas)
void memSegmentacion();      // Función que simula segmentación (divide en código, datos y pila)

int main(int argc, char const *argv[]) {// Función principal del programa, donde todo inicia
    SetConsoleOutputCP(CP_UTF8); // Configura la consola para poder mostrar tildes y símbolos especiales
    portada();               
    caracteristicas();       
    int opcion;              // Variable para guardar la opción elegida por el usuario
    do {
        menu();              
        printf("Selecciona un método de Gestión de memoria con el que desees trabajar: ");
        scanf("%d", &opcion); // Guarda la opción elegida
        switch(opcion) {// Se ejecuta la función correspondiente según lo que el usuario eligió
            case 1:
                memEstatica();        // Ejecuta la simulación de memoria estática
                break;
            case 2:
                memDinamica();        // Ejecuta la simulación de memoria dinámica
                break;
            case 3:
                memPaginacion();      // Ejecuta la simulación de paginación
                break;
            case 4:
                memSegmentacion();    // Ejecuta la simulación de segmentación
                break;
            case 5:
                printf("Cerrando programa...\n"); // Finaliza el programa
                break;
            default:
                printf("Opción no válida, intente de nuevo.\n"); // Si elige algo incorrecto
                break;
        }
    } while(opcion != 5); // Mientras no elija "Salir", se repite el menú
    return 0; // Finaliza el programa
}

void portada() {
    system("cls"); // Limpia la pantalla (solo funciona en Windows)
    printf("______________________________________________________\n");
    printf("| Hola! Me alegra verte de nuevo en el brannviccc OS |\n");
    printf("______________________________________________________\n");
    printf("| Presione Enter para continuar...                   |\n");
    printf("______________________________________________________\n");
    getchar(); // Espera que el usuario presione Enter para continuar
}

void caracteristicas() {
    system("cls");
    printf("_____________________________________________\n");
    printf("| Características del sistema operativo:     |\n");
    printf("| 1.- Memoria: 16384 Mb                      |\n");     // Muestra la memoria total
    printf("| 2.- Memoria del Sistema Operativo:4096 Mb |\n");     // Memoria reservada para el SO
    printf("| 3.- Memoria base: 640 Kb                   |\n");     // Memoria convencional
    printf("| 4.- Memoria caché: 384 Kb                  |\n");     // Memoria caché
    printf("| 5.- Memoria para aplicaciones: 12288 Mb    |\n");     // Memoria disponible para procesos
    printf("_____________________________________________\n");
    printf("| Presione Enter para continuar...           |\n");
    printf("______________________________________________\n");
    getchar(); // Espera que el usuario presione Enter
}

void menu() {
    system("cls");
    printf("\t\t\t\t--Tipos de gestión de memoria--\n");
    printf("1. Estático \n");      // Opción 1: particiones fijas
    printf("2. Dinámico\n");       // Opción 2: espacios flexibles según lo que se necesite
    printf("3. Paginación\n");     // Opción 3: divide en bloques pequeños llamados páginas
    printf("4. Segmentación\n");   // Opción 4: divide cada proceso por secciones
    printf("5. Salir\n");          // Opción 5: salir del programa
}

void memEstatica() {// Simulación de gestión de memoria estática (particiones fijas)
    system("cls");                      
    const int memoriaSO = 4096;         
    int mDisponible = memoriaSO;         // Variable que guarda cuánta memoria queda libre
    int particiones[nParticiones] = {256, 256, 512, 512, 512, 512, 640, 512, 384};// Definimos 9 particiones con diferentes tamaños (suman 4096 MB)
    int pUsadas[nParticiones] = {0};     // 0 = libre, 1 = ocupada
    int procesos[nParticiones] = {0};    // Almacena el tamaño de cada proceso en su partición
    int opcion;                          // Opción del submenú (asignar, quitar, salir)
    do {
        system("cls");                   
        // Calculamos cuánta memoria se ha usado ya y mostramos una barra
        int mUsada = memoriaSO - mDisponible;         // Memoria consumida
        int porcentaje = (mUsada * 100) / memoriaSO;  // % de uso
        int bloques = porcentaje / 10;                // Cada bloque = 10%
        printf("Memoria total disponible (SO): %d MB\n", memoriaSO);// Imprimimos el resumen de memoria
        printf("Memoria usada: %d MB\n", mUsada);
        printf("Uso de memoria del SO: [");
        for (int i = 0; i < 10; i++) {// Dibujamos 10 caracteres; '#' = ocupado, '-' = libre
            if (i < bloques) printf("#");
            else printf("-");
        }
        printf("] %d/%d MB\n\n", mUsada, memoriaSO);
        printf("Estado de las particiones:\n");// Mostramos el estado de cada partición
        for (int i = 0; i < nParticiones; i++) {
            if (pUsadas[i]) {
                int fragmento = particiones[i] - procesos[i];// Si está ocupada, calculamos fragmento interno
                printf(
                    "Partición %d: %4d MB - OCUPADA "
                    "(Proceso: %4d MB, Fragmento: %4d MB)\n",
                    i + 1, particiones[i], procesos[i], fragmento
                );
            } else {
                printf("Partición %d: %4d MB - LIBRE\n", i + 1, particiones[i]);// Si está libre, solo mostramos su tamaño
            }
        }
        printf(// Menú de acciones para memoria estática
            "\n1. Asignar proceso\n"
            "2. Quitar proceso\n"
            "3. Salir\n"
            "Seleccione una opción: "
        );
        scanf("%d", &opcion);
        switch (opcion) {
            case 1: { // Opción 1: Asignar un nuevo proceso
                int taProceso;
                printf("Ingrese el tamaño del proceso en MB: ");
                scanf("%d", &taProceso); 
                int mejorIndice = -1;       // Índice de la mejor partición encontrada
                int menorFragmento = 1000000000; 
                for (int i = 0; i < nParticiones; i++) {// Recorremos todas las particiones para encontrar la más ajustada
                    if (!pUsadas[i] && particiones[i] >= taProceso) {// Si la partición está libre y cabe el proceso...
                        int frag = particiones[i] - taProceso; 
                        if (frag < menorFragmento) {// Buscamos la fragmentación más pequeña
                            menorFragmento = frag;
                            mejorIndice = i;
                        }
                    }
                }
                if (mejorIndice != -1) {// Si encontramos una partición válida
                    if (taProceso <= mDisponible) {// Verificamos que haya memoria disponible en el SO
                        pUsadas[mejorIndice] = 1;// Marcamos como ocupada
                        procesos[mejorIndice] = taProceso; 
                        mDisponible -= taProceso;// Reducimos memoria disponible
                        printf("Proceso asignado a la partición %d.\n", mejorIndice + 1);
                    } else {
                        printf("No hay suficiente memoria del SO disponible.\n");
                    }
                } else {
                    printf("No hay partición disponible o suficientemente grande.\n");
                }
                getchar(); getchar(); // Pausa para que el usuario vea el mensaje
                break;
            }
            case 2: { // Opción 2: Quitar un proceso existente
                int num;
                printf("Ingrese el número de partición a liberar: ");
                scanf("%d", &num);
                if (num < 1 || num > nParticiones) {// Validamos que el número esté en el rango correcto
                    printf("Número de partición inválido.\n");
                } 
                else if (!pUsadas[num - 1]) {// Si la partición ya estaba libre
                    printf("La partición ya está libre.\n");
                } 
                else {
                    mDisponible += procesos[num - 1];// Liberamos la memoria del proceso
                    pUsadas[num - 1] = 0;       // Marcamos libre
                    procesos[num - 1] = 0;      // Borramos tamaño del proceso
                    printf("Partición %d liberada.\n", num);
                }
                getchar(); getchar(); // Pausa antes de refrescar la pantalla
                break;
            }
            case 3: // Opción 3: Salir de memEstatica()
                break;
            default:
                printf("Opción no válida.\n");
                getchar(); getchar(); // Pausa si la opción es incorrecta
                break;
        }
    } while (opcion != 3); // Repetir hasta que elija salir del submenú
} // Fin de memEstatica()

void memDinamica() {// Simulación de gestión de memoria dinámica (asignación exacta)
    system("cls");               // Limpia la pantalla al iniciar
    int mDisponible = meSO;      // Memoria total disponible para procesos (del SO)
    int procesos[100];           // Arreglo para guardar el tamaño de hasta 100 procesos
    int totalProcesos = 0;       // Contador de cuántos procesos hay actualmente
    int opcion;                  // Opción del submenú dinámico
    do {
        system("cls");         
        printf("Memoria disponible: %d MB\n\n", mDisponible);// Mostrar memoria disponible
        printf("Procesos actuales:\n");// Mostrar lista de procesos con su tamaño
        if (totalProcesos == 0) {
            printf("No hay procesos asignados.\n");
        } else {
            for (int i = 0; i < totalProcesos; i++) {
                printf("Proceso %d: %d MB\n", i + 1, procesos[i]);
            }
        }
        printf(// Menú de acciones para memoria dinámica
            "\n1. Asignar proceso\n"
            "2. Quitar proceso\n"
            "3. Salir\n"
            "Seleccione una opción: "
        );
        scanf("%d", &opcion);
        switch (opcion) {
            case 1: { // Asignar un proceso nuevo
                int taProceso;
                printf("Ingrese el tamaño del proceso en MB: ");
                scanf("%d", &taProceso);                
                if (taProceso <= mDisponible) {// Verificar si hay suficiente memoria libre
                    procesos[totalProcesos++] = taProceso; // Guardar tamaño
                    mDisponible -= taProceso;            // Restar de disponibles
                    printf("Proceso asignado correctamente.\n");
                } else {
                    printf("No hay suficiente memoria disponible.\n");
                }
                getchar(); getchar(); // Pausa para leer el mensaje
                break;
            }
            case 2: { // Eliminar un proceso existente
                if (totalProcesos == 0) {
                    printf("No hay procesos para eliminar.\n");
                } else {
                    int num;
                    printf("Ingrese el número de proceso a quitar (1-%d): ", totalProcesos);
                    scanf("%d", &num);                   
                    if (num < 1 || num > totalProcesos) {// Validar número de proceso
                        printf("Número inválido.\n");
                    } else {
                        int memLiberada = procesos[num - 1];  // Memoria que vamos a liberar
                        mDisponible += memLiberada;          // Sumamos al total disponible
                        for (int i = num - 1; i < totalProcesos - 1; i++) {// Movemos en el arreglo todos los procesos después del eliminado
                            procesos[i] = procesos[i + 1];
                        }
                        totalProcesos--;                     // Disminuir el contador
                        printf("Proceso %d eliminado. Se liberaron %d MB.\n", num, memLiberada);
                    }
                }
                getchar(); getchar(); // Pausa antes de refrescar
                break;
            }
            case 3: // Salir de la función memDinamica()
                break;
            default:
                printf("Opción no válida.\n");
                getchar(); getchar(); // Pausa si la opción es incorrecta
                break;
        }
    } while (opcion != 3); // Repetir hasta que elija salir
} // Fin de memDinamica()

void memPaginacion() {// Simulación de gestión de memoria con paginación (memoria dividida en páginas)
    system("cls");             
    int taPagina;                // Tamaño de cada página de memoria
    printf("Ingrese el tamaño de cada página (MB): ");
    scanf("%d", &taPagina);     // El usuario ingresa el tamaño de las páginas
    if (taPagina <= 0 || taPagina > meSO) {// Validamos que el tamaño de la página sea válido
        printf("Tamaño de página inválido.\nPresione Enter...");
        getchar(); getchar();
        return; // Salimos si el tamaño de página no es válido
    }
    int numPaginas = meSO / taPagina; // Calculamos el número de páginas necesarias
    int paginas[numPaginas];             // Array para las páginas de memoria (-1 si libre)
    int procesos[100];                   // Array para los tamaños de los procesos
    int paginasProceso[100][100];        // Páginas que ocupa cada proceso
    int totalProcesos = 0;               // Total de procesos asignados
    for (int i = 0; i < numPaginas; i++) paginas[i] = -1;// Inicializamos todas las páginas como libres
    int opcion;
    do {
        system("cls");
        printf("Memoria del SO: %d MB dividida en %d páginas de %d MB\n", meSO, numPaginas, taPagina);// Mostrar información sobre la memoria y las páginas
        printf("Páginas:\n");
        for (int i = 0; i < numPaginas; i++) {// Mostramos el estado de cada página (libre u ocupada)
            if (paginas[i] == -1) 
                printf("Página %d: LIBRE\n", i + 1);
            else 
                printf("Página %d: Ocupada por proceso %d\n", i + 1, paginas[i] + 1);
        }
        printf("\nProcesos actuales:\n");// Mostramos los procesos y cuántas páginas ocupan
        if (totalProcesos == 0) {
            printf("No hay procesos.\n");
        } else {
            for (int i = 0; i < totalProcesos; i++) {
                printf("Proceso %d: %d MB (ocupa %d páginas)\n", i + 1, procesos[i],
                    (procesos[i] + taPagina - 1) / taPagina); // Calculamos cuántas páginas ocupa el proceso
            }
        }
        printf("\n1. Asignar proceso\n2. Quitar proceso\n3. Salir\nSeleccione una opción: ");// Menú de opciones para gestionar la memoria
        scanf("%d", &opcion);
        switch (opcion) {
            case 1: { // Asignar un proceso
                int taProceso;
                printf("Ingrese el tamaño del proceso en MB: ");
                scanf("%d", &taProceso);
                int paginasNecesarias = (taProceso + taPagina - 1) / taPagina;// Calculamos el número de páginas necesarias para el proceso
                int libres = 0;
                for (int i = 0; i < numPaginas; i++) // Contamos cuántas páginas libres hay
                    if (paginas[i] == -1) libres++;            
                if (paginasNecesarias > libres) {// Si no hay suficientes páginas libres
                    printf("No hay suficientes páginas disponibles (%d requeridas, %d libres).\n",
                        paginasNecesarias, libres);
                } else {
                    procesos[totalProcesos] = taProceso;   // Guardamos el tamaño del proceso
                    int cont = 0;
                    for (int i = 0; i < numPaginas && cont < paginasNecesarias; i++) {
                        if (paginas[i] == -1) {       // Si la página está libre
                            paginas[i] = totalProcesos; // Asignamos la página al proceso
                            paginasProceso[totalProcesos][cont++] = i; // Guardamos la página que ocupa
                        }
                    }
                    printf("Proceso %d asignado usando %d páginas.\n", totalProcesos + 1, paginasNecesarias);
                    totalProcesos++; // Incrementamos el total de procesos
                }
                getchar(); getchar();
                break;
            }
            case 2: { // Eliminar un proceso
                if (totalProcesos == 0) {
                    printf("No hay procesos para eliminar.\n");
                    getchar(); getchar();
                    break;
                }
                int num;
                printf("Ingrese el número de proceso a eliminar (1 a %d): ", totalProcesos);
                scanf("%d", &num);
                if (num < 1 || num > totalProcesos) {
                    printf("Número inválido.\n");
                } else {
                    int paginasOcupadas = (procesos[num - 1] + taPagina - 1) / taPagina;// Calculamos cuántas páginas ocupa el proceso                 
                    for (int i = 0; i < paginasOcupadas; i++) {// Liberamos las páginas ocupadas por el proceso
                        int pag = paginasProceso[num - 1][i];
                        paginas[pag] = -1; // Marcamos la página como libre
                    }
                    printf("Proceso %d eliminado y %d páginas liberadas.\n", num, paginasOcupadas);
                    for (int i = num - 1; i < totalProcesos - 1; i++) {// Compactamos el arreglo de procesos
                        procesos[i] = procesos[i + 1];
                        for (int j = 0; j < 100; j++) {
                            paginasProceso[i][j] = paginasProceso[i + 1][j];
                        }
                    }
                    for (int i = 0; i < numPaginas; i++) {// Actualizamos las referencias en las páginas
                        if (paginas[i] > num - 1) paginas[i]--; // Desplazamos las páginas de los procesos
                    }
                    totalProcesos--; // Reducimos el contador de procesos
                }
                getchar(); getchar();
                break;
            }
            case 3: // Salir de la función memPaginacion()
                break;
            default:
                printf("Opción no válida.\n");
                getchar(); getchar(); // Pausa si la opción es incorrecta
                break;
        }
    } while (opcion != 3); // Repetir hasta que elija salir
} // Fin de memPaginacion()

typedef struct {// Definimos la estructura ProcesoSegmentado para representar los procesos segmentados en memoria
    int id;       // Identificador único del proceso
    int tamano;   // Tamaño total del proceso en MB
    int codigo;   // Parte del proceso destinada a código (80% del total)
    int datos;    // Parte del proceso destinada a datos (10% del total)
    int pila;     // Parte del proceso destinada a la pila (10% del total)
} ProcesoSegmentado;

void memSegmentacion() {// Función que simula la gestión de memoria por segmentación
    system("cls"); // Limpia la pantalla al iniciar
    // Definimos un arreglo para almacenar los procesos segmentados
    ProcesoSegmentado procesos[MAX_PROCESOS]; // Arreglo para hasta MAX_PROCESOS procesos
    int totalProcesos = 0;  // Contador de procesos actuales
    int mDisponible = meSO; // Memoria disponible para asignar a los procesos
    printf("Memoria total: %d MB\n", meSO);// Muestra la memoria total y la memoria disponible para procesos
    printf("Memoria disponible para procesos: %d MB\n", mDisponible);
    int opcion;  // Variable para capturar la opción elegida en el menú
    do {
        printf("\n--- MENÚ SEGMENTACIÓN ---\n");// Menú de opciones para gestionar la segmentación
        printf("1. Agregar proceso\n");
        printf("2. Eliminar proceso\n");
        printf("3. Mostrar procesos\n");
        printf("0. Salir\n");
        printf("Opción: ");
        scanf("%d", &opcion); // Captura la opción elegida
        switch(opcion) {// Evaluamos la opción seleccionada por el usuario
            case 1: { // Opción 1: Agregar un nuevo proceso
                int taProceso;
                printf("\nIngrese el tamaño del proceso en MB: ");
                scanf("%d", &taProceso);  // El usuario ingresa el tamaño del proceso
                if (taProceso <= 0) {// Validación: El tamaño del proceso no puede ser 0 o negativo
                    printf("Tamaño inválido.\n");
                    break;  // Si el tamaño es inválido, salimos de esta iteración
                }
                if (taProceso <= mDisponible) {// Verificamos que haya suficiente memoria disponible para el proceso
                    ProcesoSegmentado nuevo;// Creamos un nuevo proceso y asignamos su tamaño
                    nuevo.id = totalProcesos + 1;            // ID único del proceso
                    nuevo.tamano = taProceso;               // Tamaño total del proceso
                    nuevo.codigo = taProceso * 0.8;         // 80% del proceso es código
                    nuevo.datos = taProceso * 0.1;          // 10% para datos
                    nuevo.pila = taProceso * 0.1;           // 10% para la pila
                    procesos[totalProcesos++] = nuevo;// Añadimos el proceso al arreglo de procesos y actualizamos la memoria disponible
                    mDisponible -= taProceso;  // Restamos el tamaño del proceso de la memoria disponible
                    printf("\nProceso #%d de %d MB segmentado en:\n", nuevo.id, taProceso);// Mostramos información sobre el proceso recién agregado
                    printf("  Código: %d MB\n", nuevo.codigo);
                    printf("  Datos: %d MB\n", nuevo.datos);
                    printf("  Pila: %d MB\n", nuevo.pila);
                    printf("Memoria restante: %d MB\n", mDisponible);  // Mostramos la memoria restante
                } else {
                    printf("\nMemoria insuficiente para el proceso de %d MB.\n", taProceso);// Si no hay suficiente memoria, mostramos un mensaje de error
                }
                break;
            }
            case 2: { // Opción 2: Eliminar un proceso existente
                if (totalProcesos == 0) {
                    printf("\nNo hay procesos para eliminar.\n");
                    break;  // Si no hay procesos, no podemos eliminar ninguno
                }
                printf("\nProcesos actuales:\n");// Mostramos la lista de procesos actuales
                for (int i = 0; i < totalProcesos; i++) {
                    printf("ID %d - %d MB\n", procesos[i].id, procesos[i].tamano);
                }
                int idEliminar;
                printf("Ingrese el ID del proceso a eliminar: ");
                scanf("%d", &idEliminar);  // El usuario ingresa el ID del proceso a eliminar
                int encontrado = 0;
                for (int i = 0; i < totalProcesos; i++) {// Buscamos el proceso por su ID y lo eliminamos
                    if (procesos[i].id == idEliminar) {
                        mDisponible += procesos[i].tamano;  // Liberamos la memoria del proceso eliminado                        
                        for (int j = i; j < totalProcesos - 1; j++) {// Desplazamos los procesos en el arreglo para "eliminar" el proceso
                            procesos[j] = procesos[j + 1];  // Mover procesos
                        }
                        totalProcesos--;  // Reducimos el contador de procesos
                        encontrado = 1;
                        printf("Proceso #%d eliminado. Memoria disponible: %d MB\n", idEliminar, mDisponible);
                        break;  // Terminamos la búsqueda y eliminación
                    }
                }
                if (!encontrado) {// Si no se encontró el proceso, mostramos un mensaje de error
                    printf("No se encontró el proceso con ID %d\n", idEliminar);
                }
                break;
            }
            case 3: { // Opción 3: Mostrar todos los procesos actuales
                if (totalProcesos == 0) {
                    printf("\nNo hay procesos almacenados.\n");
                } else {
                    printf("\nProcesos actuales:\n");
                    // Mostramos información detallada de cada proceso
                    for (int i = 0; i < totalProcesos; i++) {
                        printf("ID %d - %d MB (Código: %d, Datos: %d, Pila: %d)\n",
                               procesos[i].id,
                               procesos[i].tamano,
                               procesos[i].codigo,
                               procesos[i].datos,
                               procesos[i].pila);
                    }
                }
                break;
            }
            case 0: // Opción 0: Salir del esquema de segmentación
                printf("\nSaliendo del esquema de segmentación.\n");
                break;
            default: // Si el usuario ingresa una opción no válida
                printf("Opción no válida.\n");
        }
    } while(opcion != 0);  // Continuar el bucle hasta que elija salir
    printf("Presione Enter para volver al menú...");
    getchar(); getchar();  // Pausa antes de regresar al menú principal
}