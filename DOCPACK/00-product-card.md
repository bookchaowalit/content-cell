---
title: solo-content — Product Card
doc_id: CARD-solo-content
doc_type: product-card
verdict: invest
version: 0.1
date: 2026-10-11
status: ร่างเพื่อพิจารณา
owner: Product owner (Book Dev)
---

# solo-content — Product Card

## 1. สรุปคุณค่าในหนึ่งประโยค

ทะเบียนงานคอนเทนต์ ปฏิทินเผยแพร่ ตอนของซีรีส์ และ metric ต่อตอน เพื่อวางแผนและวัดผลการผลิตคอนเทนต์

## 2. ปัญหาและผู้ใช้เป้าหมาย

แผนคอนเทนต์และผลลัพธ์กระจายอยู่ในไฟล์/ตารางเดิม ผู้ใช้คือเจ้าของและทีม marketing ของ Book Dev

## 3. สิ่งที่ทำได้จริงตอนนี้

- REST `/v1/contents`, `/v1/content-calendars`, `/v1/content-series-episodes`, `/v1/content-series-episode-metrics`
- ตัวกรองตาม `content_type`, `status`, `related_niche_id`, `repurpose_from` ฯลฯ
- ทุกการเขียนผ่านลำดับ precheck → เปลี่ยนข้อมูลในเครื่อง → execution บน empire-platform → commit → finish พร้อม row hash และ RLS แบบบังคับต่อ workspace (ตาม README)

## 4. หลักฐานสถานะ

| รายการ | ค่า |
|---|---|
| Stack | Python, FastAPI, PostgreSQL (Neon) |
| Commit | 2 ครั้ง (2026-10-11 ถึง 2026-10-11) |
| ซอร์สโค้ด | 15 ไฟล์ / 2208 บรรทัด |
| เทสต์ | 2 ไฟล์ (ไม่ได้รันในงานนี้) |
| CI | ไม่มี workflow |
| Deploy config | Railway (Serverless) + Neon; ทะเบียน `online-systems.yaml` ระบุสถานะ online (ไม่ได้ probe สดในงานนี้) |
| Live URL | ดูทะเบียน `online-systems.yaml` (ไม่ได้ probe สด) |

## 5. คุณค่าและจุดต่าง

- เป็นส่วนหนึ่งของสถาปัตยกรรม decentralize ที่ 1 domain = 1 cell จึงเปลี่ยนหรือขายแยกได้
- ใช้สิทธิ์/audit กลางร่วมกันโดยไม่ต้องเขียนใหม่ต่อ cell
- **[สมมติฐาน]** มูลค่าเชิงรายได้ยังไม่พิสูจน์ — ใช้เป็นระบบของเจ้าของก่อน

## 6. ช่องว่างสำคัญ

- พึ่ง empire-platform ตัวเดียว: ถ้า platform ล่ม cell เขียนไม่ได้ (fail closed)
- ไม่มี workflow เผยแพร่ในตัว (เก็บข้อมูลอย่างเดียว)
- เทสต์มี 2 ไฟล์ (contract)

## 7. คำตัดสิน

**`invest`** — เป็นแกนข้อมูลของ domain ที่ระบบ Solo Empire ใช้จริงและตาม cell contract เดียวกัน จะเปลี่ยนเป็น `showcase` หากเจ้าของยุบ domain นี้หรือย้ายไปรวมกับ cell อื่น

## 8. ขั้นต่อไป

1. ผูกกับช่องทางเผยแพร่จริงหรือยุบรวม
2. ย้ายข้อมูลปฏิทินเดิมเข้ามาและตรวจนับแถว

## การอนุมัติ

| บทบาท | สถานะ | วันที่ | ลงนาม |
|---|---|---|---|
| Product owner (Book Dev) | รอพิจารณา | — | ________ |

## แหล่งข้อมูล

- `README.md`
- `cell.yaml`
- `tests/`
