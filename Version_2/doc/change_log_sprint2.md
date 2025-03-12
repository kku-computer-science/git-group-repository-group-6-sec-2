# CHANGELOG SPRINT#2
### [19/02/2025 - 25/02/2025]
[ระบบจัดการข้อมูลงานวิจัย]
## Product Backlog Item 
    No.1: The system can no longer connect to the APIs/retrieve the information from the API of the major publications DB such as WOS, SCOPUS, Google Scholar, and TCI
    

### การพัฒนาด้านการเชื่อมต่อข้อมูลและ API
- อัพเดต WOS service และปรับปรุงไฟล์ .gitignore
- เพิ่มไฟล์ API_SE.postman_collection.json และสร้าง test report ของ API Scopus, WOS
- เพิ่มการค้นหาด้วยชื่อเรื่องในกรณีไม่มี DOI ในบริการ API ต่าง ๆ (WOS, Scopus, Google Scholar)
- เพิ่มการจัดการ DOI, การค้นหาแบบ Full-text และการลิงก์ผู้เขียนในฟังก์ชันบันทึกงานวิจัย (Google Scholar, Scopus, TCI, WOS)
- ปรับ threshold การจับคู่ paper ใน GoogleScholarAPIService
- ปรับปรุงการค้นหา author โดยใช้ first name ใน ScopusAPIService
- ปรับการจัดการข้อมูล author ใน TciAPIService, ScopusAPIService, WosAPIService, GoogleScholarAPIService
- รองรับการใช้ชื่อภาษาไทยใน TciAPIService

### การปรับปรุงและแก้ไขระบบแสดงผลข้อมูล
- แก้ไขหน้า index paper โดยเพิ่มอนิเมชั่น loading และ success/error popup หลังจากที่กด call paper
- แก้ไขการคำนวณรวมข้อมูลในหน้าโปรไฟล์ให้รวมเมตริกเพิ่มเติม
- แก้ไขชื่อตัวแปรของงานวิจัย Google Scholar และปรับการคำนวณผลรวมให้เรียบง่ายขึ้น
- ปรับเกณฑ์ความคล้ายคลึง (similarity threshold) สำหรับการจับคู่บทความใน GoogleScholarAPIService
- ลบไฟล์ที่ไม่จำเป็น (idAuthor.txt)
- ลบการอ้างอิงโฟลเดอร์ที่ล้าสมัยจากการตั้งค่าโปรเจกต์
- ลบการตั้งค่าที่ไม่จำเป็นของ PHPUnit และปรับการตั้งค่าเครื่องมือตรวจสอบโค้ด
- แก้ไขค่า $year2 ใน ProfileController.php
- เพิ่มการแสดงจำนวนงานวิจัยจาก Google Scholar ในหน้าโปรไฟล์
- เพิ่มคอลัมน์ user_scholar_id ใน $fillable
- เพิ่มการรวมจำนวนงานวิจัยจาก Google Scholar

### การปรับปรุงประสิทธิภาพระบบ
- เพิ่มการจัดการแคช (clear & optimize)

### การทดสอบระบบ
- เพิ่ม Test Jenkins
- สร้างไฟล์ UAT_test.robot
- Test Api โดยใช้ postman 

### การปรับปรุงการค้นหาและข้อมูลนักวิจัย
- ปรับปรุงการค้นหานักวิจัย รวมถึงการจับคู่ชื่อย่อและอัพเดต author records
- เพิ่มข้อมูล first name และ last name ใน author