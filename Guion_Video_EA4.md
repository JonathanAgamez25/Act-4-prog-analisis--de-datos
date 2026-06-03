# Guion de video - Evidencia de Aprendizaje 4

Duración sugerida: 5 a 7 minutos.

## 1. Introducción

Buenos días. Somos Jonatan Ávila y Estiven Trujillo. En esta evidencia presentamos el proyecto PyPI Catalog, una solución de análisis de datos que extrae, transforma, enriquece y visualiza información de paquetes Python publicados en PyPI.

El objetivo fue convertir metadatos públicos de librerías en indicadores útiles para apoyar decisiones técnicas, especialmente cuando un equipo necesita seleccionar dependencias para un proyecto de software o análisis de datos.

## 2. Necesidad y solución

El problema principal es que PyPI contiene miles de paquetes y, al elegir una librería, no basta con mirar el nombre o la descripción. También es importante conocer su madurez, cantidad de releases, complejidad de dependencias, licencia, soporte de Python 3 y trazabilidad del repositorio.

Nuestra solución fue construir un flujo basado en CRISP-DM: primero entendimos la necesidad, luego extrajimos datos desde PyPI, los almacenamos en MySQL, enriquecimos la información con nuevas variables y finalmente conectamos la base de datos a Power BI.

## 3. Explicación del código

En el archivo `scrapper.py` se encuentra la función `get_pypi_data`, que recibe el nombre de un paquete, construye la URL pública de PyPI, consulta la página con `requests` y analiza el HTML con `BeautifulSoup`.

La función extrae datos como el nombre, el resumen y la versión actual. También maneja respuestas no exitosas y páginas incompletas retornando `None`, lo que evita que el proceso falle ante un paquete no disponible.

La conexión con base de datos se organiza mediante SQLAlchemy y variables de entorno para usuario, clave, host y nombre de la base de datos. Esto mejora la mantenibilidad y evita dejar la configuración completamente fija dentro del código.

Como valor agregado, agregamos `requirements.txt`, pruebas unitarias en `tests/test_scrapper.py` y un workflow de GitHub Actions en `.github/workflows/ci.yml`. Esto permite ejecutar validaciones automáticas cada vez que se suben cambios al repositorio.

## 4. Base de datos y transformaciones

La base `pypi_catalog` contiene 42 paquetes organizados en 8 categorías. La tabla `categorias` clasifica los dominios funcionales y la tabla `paquetes` almacena metadatos originales y campos enriquecidos.

Entre las transformaciones más importantes están el nivel de madurez, la complejidad de dependencias, la normalización de licencias, el soporte de Python 3, la presencia de repositorio asociado y los años desde la primera versión.

## 5. Demostración de Power BI

En Power BI mostramos primero las tarjetas KPI: total de paquetes, categorías, paquetes maduros y soporte Python 3.

Luego revisamos los gráficos por categoría, nivel de madurez, complejidad y licencia. Por ejemplo, el dataset tiene 33 paquetes maduros y 9 estables. La complejidad está balanceada: 14 paquetes de complejidad baja, 14 media y 14 alta.

También destacamos que los 42 paquetes soportan Python 3, 39 tienen repositorio asociado, el promedio de dependencias es 17.76, `hypothesis` tiene el mayor número de releases y `Twisted` presenta el mayor número de dependencias.

## 6. Conclusiones

Como conclusión, el proyecto demuestra que el scraping por sí solo no es suficiente: el valor aparece cuando los datos se limpian, se estructuran y se enriquecen para responder preguntas concretas.

Power BI permitió transformar la base en un tablero entendible e interactivo. La metodología CRISP-DM nos dio una ruta ordenada de trabajo y la adición de versionamiento, pruebas e integración continua fortalece la calidad profesional de la entrega.

## Checklist antes de grabar

- Abrir `scrapper.py`, el dump SQL, el tablero `.pbix` y el repositorio.
- Verificar que el audio del micrófono sea claro.
- Grabar en una pantalla limpia, sin notificaciones.
- Mostrar el tablero con filtros e indicadores principales.
- Cerrar con resultados concretos, no solo con descripcion del proceso.
