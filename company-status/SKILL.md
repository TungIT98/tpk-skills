---
name: company-status
description: Kiểm tra trạng thái công ty và agents. Use khi cần xem agent nào đang chạy, trạng thái công ty, hoặc tổng quan hệ thống TPK.
metadata:
  openclaw:
    requires:
      env:
        - PAPERCLIP_API_URL
      bins:
        - curl
    primaryEnv: PAPERCLIP_API_URL
---

# Company Status Skill

Kiểm tra trạng thái các công ty và agents trong hệ thống TPK.

## External Endpoints

- Paperclip API: `${PAPERCLIP_API_URL}/api/companies`
- Agent List: `GET ${PAPERCLIP_API_URL}/api/companies/{companyId}/agents`

## Environment Variables

```bash
export PAPERCLIP_API_URL=http://127.0.0.1:3100
```

## Security & Privacy

- Chỉ đọc thông tin (GET requests)
- Không modify trạng thái agents
- API endpoint local, không public exposure

## Trust Statement

Skill này được phát triển bởi TPK Dev Team cho mục đích nội bộ.

## Usage

```
/company-status --company <company-id>
/company-status --all
/company-status --running
```

## Output Format

```
Company: <name>
├── CEO: <status>
├── CTO: <status>
├── Running: <list>
└── Idle: <count>
```

## Company IDs

- TPK ACI: `fe90b604-364f-480d-be10-6a529971db57`
- TPK Dev Studio: `7fbb2529-7d69-4177-bb6b-988404c35965`
- Company OS: `189b5ac9-ca25-4421-b6de-359d2df98909`
- VAT Systems: `87836d44-8223-415a-8ef9-14670a5a6336`

## Example Output

```json
{
  "TPK ACI": {
    "totalAgents": 10,
    "running": ["Production Manager", "Founding Engineer"],
    "idle": 8
  }
}
```
