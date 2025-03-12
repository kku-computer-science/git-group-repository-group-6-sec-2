import re
import json
import time
import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# ✅ ตั้งค่า Selenium ให้ดึง console log
chrome_options = Options()
chrome_options.set_capability("goog:loggingPrefs", {"browser": "ALL"})

driver = webdriver.Chrome(options=chrome_options)
driver.get("http://127.0.0.1:8000/detail/eyJpdiI6IklXb2dEMUxxODc3VEdtZVdSemRIdXc9PSIsInZhbHVlIjoiZDlhTmxUUFJGMzh2Z3BvV3ArcFI3dz09IiwibWFjIjoiYTcxODM1ZTgxMGY5YTI3YmJlYzNkMWM1MGIwY2NkOThmZDY4MjM2OTNiMWIxMTA0YmE1MmMwODRmNjcyY2RhNSIsInRhZyI6IiJ9")

# ✅ รอให้ JavaScript โหลดข้อมูลใน Console
time.sleep(5)  # ปรับเวลาให้เหมาะสม

# ✅ ดึง console log ทั้งหมด
logs = driver.get_log("browser")

# ✅ ใช้ Regex ดึง JSON จาก log ที่มี "ALL_DATA_JSON::"
pattern = re.compile(r'ALL_DATA_JSON::(.+)$', re.DOTALL)
all_data = None  # ตัวแปรสำหรับเก็บ JSON

for entry in logs:
    message = entry.get("message", "").strip()  # ลบช่องว่าง
    
    # ✅ Debug: ดูว่า Log มีค่าอะไร
    print(f"📝 Log Message: {message}")

    match = pattern.search(message)
    if match:
        raw_json_str = match.group(1).strip()  # ดึง JSON ออกจากข้อความ log

        try:
            # ✅ แก้ปัญหา Escape Backslash และ Quote เกินมา
            fixed_json_str = raw_json_str.replace('\\"', '"').rstrip('"')

            # ✅ แปลง JSON
            all_data = json.loads(fixed_json_str)
            print("✅ JSON Data Extracted Successfully!")
            break  # พบ JSON แล้วหยุด loop ทันที
        except json.JSONDecodeError as e:
            print("❌ JSON decode error:", e)
            print("⏩ Raw JSON String (fixed):", fixed_json_str)  # Debug ดูข้อความจริงที่ดึงมา

driver.quit()


current_dir = os.getcwd()
print(f"📂 Python Running in: {current_dir}")

output_file = os.path.join(current_dir, "all_data.json")
# ✅ บันทึกข้อมูลลงไฟล์ JSON
if all_data:
    with open("all_data.json", "w", encoding="utf-8") as f:
        json.dump(all_data, f, indent=4, ensure_ascii=False)

    print("✅ All Data JSON saved to 'all_data.json'")
else:
    print("⚠️ ไม่พบข้อมูล ALL_DATA_JSON:: ใน Console Log")  