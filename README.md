# Actividad 4 - PyPI Catalog

Este repositorio contiene la entrega consolidada de la Actividad 4 del curso de análisis de datos. El proyecto extrae metadatos de paquetes Python publicados en PyPI, los transforma y enriquece en una base MySQL, y los presenta en un tablero de Power BI.

## Contenido

- `Avila_Jonatan_Trujillo_Estiven_EA4.docx`: informe técnico editable.
- `Avila_Jonatan_Trujillo_Estiven_EA4.pdf`: informe técnico en PDF.
- `Avila_Jonatan_Trujillo_Estiven_EA4.pbix`: tablero de Power BI.
- `pypi_catalog_completo.sql`: dump de la base enriquecida.
- `scrapper.py`: código del scraper.
- `requirements.txt`: dependencias del proyecto.
- `tests/test_scrapper.py`: pruebas unitarias.
- `.github/workflows/ci.yml`: integración continua.
- `Checklist_Entrega_EA4.md`: lista de verificación final.

## Validación local

```bash
python -m unittest discover -s tests -v
```

El workflow de GitHub Actions instala dependencias y ejecuta las pruebas automáticamente en cada push o pull request.
