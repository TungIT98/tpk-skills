---
name: paperclip-sync
description: Đồng bộ context giữa các agents trong TPK companies. Use khi cần cập nhật CLAUDE.md từ API, kiểm tra thông tin công ty, hoặc sync trạng thái agents.
metadata:
  openclaw:
    requires:
      env:
        - PAPERCLIP_API_URL
      bins:
        - curl
    primaryEnv: PAPERCLIP_API_URL
---

# Paperclip Sync Skill

Đồng bộ context và trạng thái giữa các agents trong hệ thống TPK multi-company.

## External Endpoints

- Paperclip API: `${PAPERCLIP_API_URL}/api/companies` (default: `http://127.0.0.1:3100`)
- Agent Heartbeat: `POST ${PAPERCLIP_API_URL}/api/agents/{agentId}/heartbeat/invoke`

## Environment Variables

Đặt biến môi trường trước khi dùng:
```bash
export PAPERCLIP_API_URL=http://127.0.0.1:3100
```

## Security & Privacy

- API calls chỉ thực hiện local (localhost)
- Không lưu trữ API keys
- Chỉ đọc thông tin, không modify agents

## Trust Statement

Skill này được phát triển bởi TPK Dev Team cho mục đích nội bộ.

## Usage

```
/paperclip-sync --company <company-id>
/paperclip-sync --all
/paperclip-sync --agent <agent-id>
```

## API Endpoints

```bash
# List companies
curl $PAPERCLIP_API_URL/api/companies

# Company agents
curl $PAPERCLIP_API_URL/api/companies/{companyId}/agents

# Agent heartbeat
curl -X POST $PAPERCLIP_API_URL/api/agents/{agentId}/heartbeat/invoke
```

## TPK Companies

| Company | ID | Workspace |
|---------|-----|-----------|
| TPK ACI | fe90b604-364f-480d-be10-6a529971db57 | tpk-content-agency |
| TPK Dev Studio | 7fbb2529-7d69-4177-bb6b-988404c35965 | tkp-dev-studio |
| Company OS | 189b5ac9-ca25-4421-b6de-359d2df98909 | company-os |
| VAT Systems | 87836d44-8223-415a-8ef9-14670a5a6336 | vat-systems |

## Sync Workflow

1. Gọi API lấy danh sách agents
2. So sánh với CLAUDE.md hiện tại
3. Cập nhật status, thông tin mới
4. Báo cáo thay đổi
