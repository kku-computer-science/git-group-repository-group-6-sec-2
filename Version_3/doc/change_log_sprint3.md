# CHANGELOG SPRINT#3
### [05/02/2025 - 25/02/2025]
[ระบบจัดการข้อมูลงานวิจัย]
## Product Backlog Item 
    Item No.1: The system can no longer connect to the APIs/retrieve the information from the API of the major publications DB such as WOS, SCOPUS, Google Scholar, and TCI
    
    Item No.3: The visualization of the publication status is netheir match to what is on Google Scholar nor SCOPUS.

### การพัฒนาด้านการเชื่อมต่อข้อมูลและ API
- ปรับปรุงการทำงานของ controller และ service  
- เพิ่ม route สำหรับดึงข้อมูลจาก API  
- เพิ่ม ApiDatabaseController สำหรับการดึงข้อมูล  
- เพิ่มการเชื่อมต่อ API  
- ปรับปรุง SCOPUS API, WOS API, TCI API ให้สามารถดึงข้อมูลได้  
- ปรับปรุง Google Scholar API ให้สามารถใช้งานได้

### การพัฒนาระบบจัดการข้อมูล
- เพิ่มระบบ environment สำหรับการทำงานในโหมด development และ production  
- เพิ่มการเก็บข้อมูลในรูปแบบ JSON  
- เพิ่มระบบจัดการข้อมูล research profile แบบ bulk insert และ upsert  
- เพิ่มการคำนวณ hi0-index ใน Tab ของ Google Scholar  
- เพิ่ม model User_Cited_Year สำหรับเก็บข้อมูลการอ้างอิงตามปี  
- เพิ่มการแสดงผลข้อมูลการอ้างอิง (Summary citations)  

### การปรับปรุงโครงสร้างและการทดสอบ  
- ปรับโครงสร้างไฟล์ data.sql ให้เหมาะสม  
- เพิ่มระบบทดสอบ (UAT test.robot, UA_Published_Research.robot)  
- ปรับปรุง definition of done  
- เพิ่ม A-dapt blueprint sprint3  
- เพิ่ม SourceCodeVersion_1/tests  

### การปรับปรุง UI/UX  
- ปรับปรุงหน้า researchprofiles.blade.php ให้สามารถใช้งานและแสดงผลได้ดีขึ้น  
- เพิ่ม branch สำหรับการพัฒนา (chart) 
- แก้ไข  publicationChart และเพิ่ม citationChart โดยให้ก่อนกดที่กราฟแสดงข้อมูลแค่5ปีล่าสุด
- เพิ่มฟังก์ชันกดสลับระหว่างกราฟ และฟังก์ชันเมื่อกดกราฟจะมีpop up แสดงปีที่มีข้อมูลทั้งหมด

