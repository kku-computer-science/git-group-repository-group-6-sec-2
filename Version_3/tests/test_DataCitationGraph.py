import unittest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import re
import json
import time
import os

# ข้อมูลที่คาดหวัง (expected data)
with open("expected_data.txt", 'r', encoding='utf-8') as f:
                log_content = f.read()
                EXPECTED_CITED_DATA = json.loads(log_content)

class TestCitedData(unittest.TestCase):
    def setUp(self):
        # ตั้งค่า Chrome WebDriver เพื่อเก็บ logs
        capabilities = DesiredCapabilities.CHROME
        capabilities['goog:loggingPrefs'] = {'browser': 'ALL'}

        chrome_options = Options()
        chrome_options.add_argument("--enable-logging")

        # เริ่ม WebDriver
        self.driver = webdriver.Chrome(options=chrome_options)
        self.url = "http://127.0.0.1:8000/detail/eyJpdiI6IjNWVDFuU1F3WWg3WXhPemtoTjdDM3c9PSIsInZhbHVlIjoiYS9OZlNXYVYrU1pDRWVld3RDNC9TUT09IiwibWFjIjoiNjE5MmMyOTkzOTBjNWNmZGExZTVmMjcwYmQ5NzMwMWEzZjA3OGEyMTEzZDNkZTQ1NTMwZTZlNDMwMjY1YTVmNCIsInRhZyI6IiJ9"  # ใช้ URL จาก log
        print(f"Opening URL: {self.url}")

    def tearDown(self):
        # ปิด WebDriver หลังการทดสอบ
        self.driver.quit()
        print("WebDriver closed")

    def get_cited_data_from_console(self):
        self.driver.get(self.url)
        # รอให้หน้าโหลดและ JavaScript รัน
        time.sleep(5)

        # ตรวจสอบ browser logs
        logs = self.driver.get_log('browser')
        print(f"Total logs found: {len(logs)}")
        cited_data = []

        # บันทึก log แรกที่เจอลงในไฟล์
        log_file_path = "console_log.txt"
        if logs:
            first_log = logs[1]['message']
            print(f"First log message: {first_log}")
            with open(log_file_path, 'w', encoding='utf-8') as f:
                f.write(first_log)
            print(f"Log saved to {log_file_path}")

            with open("console_log.txt", 'r', encoding='utf-8') as f:
                log_content = f.read()
                # ใช้ regex เพื่อลบ URL และตัวเลขที่ไม่เกี่ยวข้อง
                data_str = re.sub(r"^https?://\S+ \d+:\d+ ", "", log_content)
                # แปลงข้อความ JSON เป็น list ของ dictionary
                cited_data = json.loads(data_str)
        else:
            print("Warning: No logs found.")

        if not cited_data:
            print("Warning: No cited data found in logs.")

        print(f"Raw cited data: {cited_data}")
        return cited_data

    def test_cited_data_matches_expected(self):
        # ดึงข้อมูลจาก console.log
        actual_data = self.get_cited_data_from_console()

        print(f"Actual data: {actual_data}")
        print(f"Expected data: {EXPECTED_CITED_DATA}")

        # เปรียบเทียบข้อมูลที่ได้กับข้อมูลที่คาดหวัง
        self.assertEqual(
            actual_data,
            EXPECTED_CITED_DATA,
            f"Data from console.log does not match expected data!\nExpected: {EXPECTED_CITED_DATA}\nActual: {actual_data}"
        )

if __name__ == "__main__":
    unittest.main()