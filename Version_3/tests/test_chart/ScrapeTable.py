import requests
from bs4 import BeautifulSoup
import json

def get_paper_details(url):
    # ส่ง request ไปยัง URL
    response = requests.get(url)
    if response.status_code != 200:
        print(f"ไม่สามารถดึงข้อมูลจาก {url} ได้ (Status Code: {response.status_code})")
        return None

    soup = BeautifulSoup(response.text, 'html.parser')
    
    # ค้นหา table ที่มี id="papersTable"
    papers_table = soup.find('table', id='papersTable')
    if not papers_table:
        print("ไม่พบตารางเปเปอร์ (papersTable)")
        return None

    all_papers = []
    tbody = papers_table.find('tbody')
    rows = tbody.find_all('tr') if tbody else []
    
    for row in rows:
        # ดึงชื่อเปเปอร์จาก <span class="paper_name">
        paper_name_tag = row.find('span', class_='paper_name')
        paper_name = paper_name_tag.get_text(strip=True) if paper_name_tag else "N/A"
        
        # ข้อมูลรายละเอียดจะอยู่ใน <div class="collapse"> ใน <td> เดียวกัน
        collapse_div = row.find('div', class_='collapse')
        if not collapse_div:
            continue

        # ดึงชื่อผู้แต่งทั้งหมดจากลิงก์ที่มี class "author"
        author_links = collapse_div.find_all('a', class_='author')
        authors = [a.get_text(strip=True) for a in author_links]
        if not authors:
            authors = ["No authors available"]

        # ดึงข้อมูล Document Type, Page, Journals และ Doi จาก <p> ที่มี class เฉพาะ
        doc_type_p = collapse_div.find('p', class_='document_type')
        document_type = (doc_type_p.get_text(strip=True).replace("Document Type:", "").strip()
                         if doc_type_p else "")
        
        page_p = collapse_div.find('p', class_='page')
        page = (page_p.get_text(strip=True).replace("Page:", "").strip()
                if page_p else "")
        
        journals_p = collapse_div.find('p', class_='journals')
        journals = (journals_p.get_text(strip=True).replace("Journals/Transactions:", "").strip()
                    if journals_p else "")
        
        doi_p = collapse_div.find('p', class_='doi')
        doi = (doi_p.get_text(strip=True).replace("Doi:", "").strip()
               if doi_p else "")
        
        # ดึงข้อมูล Source จาก <a class="source_name">
        source_a = collapse_div.find('a', class_='source_name')
        source = source_a.get_text(strip=True) if source_a else "Unknown"
        
        # ดึงข้อมูล Year จาก cell ของแถว
        tds = row.find_all("td")
        year = tds[2].get_text(strip=True) if len(tds) >= 3 else "N/A"

        paper_data = {
            "paper_name": paper_name,
            # "authors": authors,
            "document_type": document_type,
            "page": page,
            "journals": journals,
            "doi": doi,
            "source": source,
            "year": year
        }
        
        all_papers.append(paper_data)
    
    return all_papers

if __name__ == "__main__":
    # URL ของหน้า Research Profile (ปรับตามที่ใช้งาน)
    url = "http://127.0.0.1:8000/detail/eyJpdiI6InhyOXMwaFkwc21pZEpMRVlySVNkWmc9PSIsInZhbHVlIjoiN3ovTktqdndibnUxZFpHN2xDdGM3Zz09IiwibWFjIjoiODlkOGE1NmFkNDQ3MjBjNjAyOTA1MzVlZTU0NmZiNDcxOWViNzgwN2ExOWE4NjQ3OWEwZWYyM2UzOGQzYmQxNyIsInRhZyI6IiJ9"
    papers = get_paper_details(url)
    if papers is not None:
        output_file = "paper_details.json"
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(papers, f, ensure_ascii=False, indent=4)
        print(f"บันทึกข้อมูลเปเปอร์ทั้งหมด {len(papers)} รายการลงในไฟล์ {output_file}")
    else:
        print("ไม่พบข้อมูลเปเปอร์")
