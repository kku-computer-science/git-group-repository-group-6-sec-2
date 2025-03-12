import json
import csv
from collections import Counter

def extract_year_counts(input_file, json_output, csv_output):
    """
    อ่านข้อมูลจากไฟล์ JSON และสกัดจำนวนเอกสารตามปี
    จากนั้นบันทึกผลลัพธ์เป็น JSON และ CSV
    """
    try:
        # อ่านไฟล์ JSON
        with open(input_file, "r", encoding="utf-8") as f:
            papers = json.load(f)
        
        # ดึงค่าปีทั้งหมดจากข้อมูล
        years = [int(paper["year"]) for paper in papers if paper["year"].isdigit()]

        # นับจำนวนเอกสารต่อปี
        year_counts = dict(Counter(years))

        # จัดรูปแบบให้อยู่ในลำดับปีที่ถูกต้อง
        sorted_year_counts = dict(sorted(year_counts.items()))

        # สร้างโครงสร้างข้อมูลที่ต้องการ
        result = {
            "years": list(sorted_year_counts.keys()),
            "counts": list(sorted_year_counts.values())
        }

        # บันทึกเป็น JSON
        with open(json_output, "w", encoding="utf-8") as f:
            json.dump(result, f, ensure_ascii=False, indent=4)

        # บันทึกเป็น CSV
        with open(csv_output, "w", encoding="utf-8", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["Year", "Count"])
            for year, count in sorted_year_counts.items():
                writer.writerow([year, count])

        print(f"✅ ข้อมูลถูกบันทึกใน {json_output} และ {csv_output}")

    except Exception as e:
        print(f"❌ เกิดข้อผิดพลาด: {e}")

# เรียกใช้งานฟังก์ชัน
extract_year_counts(
    input_file="paper_details.json",
    json_output="year_counts.json",
    csv_output="year_counts.csv"
)
