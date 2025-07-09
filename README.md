# Counter Contract

## Descripción

Este proyecto implementa un contrato inteligente en Clarity llamado `Counter`. El contrato permite a los usuarios incrementar un contador asociado a su dirección principal (`principal`) y consultar su valor actual.

## Estructura del Contrato

- **Mapa de datos (`Counters`)**: Almacena el contador de cada usuario, donde la clave es el principal del usuario y el valor es un número entero sin signo (`uint`).
- **Funciones públicas**:
  - `count-up`: Incrementa el contador del usuario en 1.
- **Funciones de solo lectura**:
  - `get-count`: Devuelve el valor actual del contador para un usuario específico.

---

## Pasos para Crear el Proyecto

### 1. Configuración del Entorno

1. **Instalar Docker**:
   - Asegúrate de tener Docker instalado y en ejecución en tu máquina. Puedes descargarlo desde [Docker](https://www.docker.com/).

2. **Instalar Clarinet**:
   - Clarinet es una herramienta para desarrollar contratos inteligentes en Clarity. Instálalo siguiendo las instrucciones oficiales: [Clarinet Documentation](https://docs.hiro.so/clarinet).

3. **Verificar Instalaciones**:
   - Verifica que Docker y Clarinet estén correctamente instalados ejecutando:
     ```bash
     docker --version
     clarinet --version
     ```

---

### 2. Crear el Proyecto

1. **Inicializar un Nuevo Proyecto**:
   - Crea un nuevo proyecto con Clarinet:
     ```bash
     clarinet new Counter
     ```
   - Esto generará una estructura básica de proyecto en un directorio llamado `Counter`.

2. **Navegar al Directorio del Proyecto**:
   - Cambia al directorio del proyecto:
     ```bash
     cd Counter
     ```

---

### 3. Implementar el Contrato

1. **Crear el Archivo del Contrato**:
   - Dentro del directorio `contracts`, crea un archivo llamado `Counter.clar`:
     ```bash
     touch contracts/Counter.clar
     ```

2. **Escribir el Código del Contrato**:
   - Copia y pega el siguiente código en el archivo `Counter.clar`:
     ```clarity
     ;; title: Counter
     ;; version: 1.0.0
     ;; summary: A simple counter contract
     ;; description: This contract implements a simple counter that can be incremented and decremented.

     (define-map Counters principal uint)

     (define-public (count-up)
       (ok (map-set Counters tx-sender (+ (get-count tx-sender) u1)))
     )

     (define-read-only (get-count (who principal))
       (default-to u0 (map-get? Counters who))
     )
     ```

---

### 4. Probar el Contrato

1. **Iniciar el Devnet**:
   - Inicia el entorno de desarrollo local:
     ```bash
     clarinet devnet start
     ```

2. **Ejecutar Pruebas**:
   - Escribe pruebas para el contrato en el archivo `tests/counter_test.ts` (o un archivo similar).
   - Ejecuta las pruebas con:
     ```bash
     clarinet test
     ```

---

### 5. Desplegar el Contrato

1. **Compilar el Contrato**:
   - Compila el contrato para verificar que no haya errores:
     ```bash
     clarinet check
     ```

2. **Desplegar en Devnet**:
   - Despliega el contrato en el entorno de desarrollo:
     ```bash
     clarinet devnet deploy
     ```

---

## Recursos Adicionales

- [Documentación de Clarity](https://docs.stacks.co/write-smart-contracts/clarity-language)
- [Clarinet Documentation](https://docs.hiro.so/clarinet)
- [Stacks Blockchain](https://stacks.co/)

---

