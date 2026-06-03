import unittest
from unittest.mock import Mock, patch

import scrapper


HTML = """
<html>
  <body>
    <h1 class="package-header__name">requests 2.34.2</h1>
    <p class="package-description__summary">Python HTTP for Humans.</p>
  </body>
</html>
"""


class ScrapperTests(unittest.TestCase):
    def test_get_database_url_uses_configured_defaults(self):
        self.assertTrue(scrapper.get_database_url().startswith("mysql+pymysql://pypi_user:"))
        self.assertTrue(scrapper.get_database_url().endswith("@localhost/pypi_catalog"))

    @patch("scrapper.requests.get")
    def test_get_pypi_data_extracts_package_metadata(self, mock_get):
        response = Mock(status_code=200, text=HTML)
        mock_get.return_value = response

        data = scrapper.get_pypi_data("requests")

        self.assertEqual(
            data,
            {
                "nombre": "requests",
                "resumen": "Python HTTP for Humans.",
                "version_actual": "2.34.2",
            },
        )
        mock_get.assert_called_once()

    @patch("scrapper.requests.get")
    def test_get_pypi_data_returns_none_when_page_fails(self, mock_get):
        mock_get.return_value = Mock(status_code=404, text="")

        self.assertIsNone(scrapper.get_pypi_data("paquete-inexistente"))


if __name__ == "__main__":
    unittest.main()
