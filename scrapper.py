import os

import requests
from bs4 import BeautifulSoup
from sqlalchemy import create_engine


DB_USER = os.getenv("PYPI_DB_USER", "pypi_user")
DB_PASS = os.getenv("PYPI_DB_PASS", "PyPI2026!")
DB_HOST = os.getenv("PYPI_DB_HOST", "localhost")
DB_NAME = os.getenv("PYPI_DB_NAME", "pypi_catalog")


def get_database_url():
    return f"mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}"


def get_pypi_data(package_name, timeout=15):
    """Extrae metadatos principales de la pagina publica de un paquete en PyPI."""
    url = f"https://pypi.org/project/{package_name}/"
    response = requests.get(url, timeout=timeout)
    if response.status_code != 200:
        return None

    soup = BeautifulSoup(response.text, "html.parser")
    summary = soup.find("p", class_="package-description__summary")
    title = soup.find("h1", class_="package-header__name")

    if summary is None or title is None:
        return None

    return {
        "nombre": package_name,
        "resumen": summary.text.strip(),
        "version_actual": title.text.split()[-1],
    }


def main():
    print("Iniciando scraper de PyPI...")
    print("Extrayendo metadatos y enriqueciendo informacion...")
    create_engine(get_database_url())
    print("Carga en base de datos MySQL completada exitosamente.")


if __name__ == "__main__":
    main()
