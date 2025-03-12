import unittest
from unittest.mock import patch, MagicMock
import requests

# ฟังก์ชันที่เราต้องการทดสอบ
def get_wos_data(author_name):
    """ ฟังก์ชันเรียก API WOS เพื่อดึงข้อมูลผลงานวิจัยของผู้เขียน """
    url = f"https://api.clarivate.com/apis/wos-starter/v1/documents?db=WOS&q=AU={author_name}"
    
    try:
        response = requests.get(url, timeout=5)
        response.raise_for_status()
        return response.json()
    except requests.Timeout:
        return {"error": "Request timed out"}
    except requests.RequestException:
        return {"error": "API request failed"}

class TestWOSAPI(unittest.TestCase):

    @patch('requests.get')  # Mock requests.get() เพื่อไม่ต้องใช้ API จริง
    def test_mock_wos_response(self, mock_get):
        """ ทดสอบว่าฟังก์ชันสามารถดึงข้อมูลจาก WOS API และจัดการ JSON ได้ถูกต้อง """
        
        # Mock response ที่ต้องการให้ API ส่งคืน
        mock_response = {
            "status": "OK",
            "data": [
                {
                    "title": "An Efficient Deep Learning for Thai Sentiment Analysis",
                    "author": "J Khamphakdee, Seresangtakul, P",
                    "year": 2023,
                    "journal": "Journal of Data Science",
                    "doi": "10.3390/data8050090"
                }
            ]
        }

        # ตั้งค่าให้ mock API ตอบกลับ JSON ตามที่กำหนด
        mock_get.return_value = MagicMock(status_code=200, json=lambda: mock_response)

        # เรียกใช้งานฟังก์ชัน get_wos_data()
        result = get_wos_data("Seresangtakul P")

        # ตรวจสอบผลลัพธ์
        self.assertEqual(result, mock_response)

        # ตรวจสอบว่ามีการเรียก API ที่ URL ที่ถูกต้อง
        mock_get.assert_called_once_with("https://api.clarivate.com/apis/wos-starter/v1/documents?db=WOS&q=AU=Seresangtakul P", timeout=5)

    @patch('requests.get')
    def test_api_timeout(self, mock_get):
        """ ทดสอบการจัดการ Timeout เมื่อ API ใช้เวลานานเกินไป """
        mock_get.side_effect = requests.Timeout  # จำลองให้ API Timeout

        result = get_wos_data("Seresangtakul P")

        # คาดหวังว่าระบบต้องแจ้ง error เรื่อง Timeout
        self.assertEqual(result, {"error": "Request timed out"})

    @patch('requests.get')
    def test_api_error_handling(self, mock_get):
        """ ทดสอบกรณี API Request ล้มเหลว เช่น 500 Internal Server Error """
        mock_get.side_effect = requests.RequestException  # จำลอง Error

        result = get_wos_data("Seresangtakul P")

        # คาดหวังว่าระบบต้องแจ้ง error ว่า Request Failed
        self.assertEqual(result, {"error": "API request failed"})

if __name__ == "__main__":
    unittest.main()
