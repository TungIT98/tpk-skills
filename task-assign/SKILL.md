---
name: task-assign
description: Giao task cho agent trong Paperclip. Use khi cần assign công việc cho CEO, manager, hoặc sub-agent trong TPK companies.
metadata:
  openclaw:
    requires:
      env:
        - PAPERCLIP_API_URL
      bins:
        - curl
    primaryEnv: PAPERCLIP_API_URL
---

# Task Assign Skill

Giao task cho các agents trong hệ thống Paperclip AI.

## External Endpoints

- Paperclip API: `${PAPERCLIP_API_URL}/api/agents/{agentId}/heartbeat/invoke`

## Environment Variables

```bash
export PAPERCLIP_API_URL=http://127.0.0.1:3100
```

## Security & Privacy

- Chỉ gửi task đến agent IDs đã được xác thực
- Task content được gửi qua HTTPS nếu remote
- Không lưu trữ task history vĩnh viễn

## Trust Statement

Skill này được phát triển bởi TPK Dev Team cho mục đích nội bộ.

## Usage

```
/task-assign --agent <agent-id> --task <task-description>
```

## cách hoạt động

Task được gửi qua heartbeat endpoint:

```bash
curl -X POST $PAPERCLIP_API_URL/api/agents/{agentId}/heartbeat/invoke \
  -H "Content-Type: application/json" \
  -d '{"task": "Mô tả công việc"}'
```

## Agent IDs tham khảo

### TPK ACI
| Agent | ID |
|-------|-----|
| CEO | b0e897a5-cda9-4f37-8e2f-e985cb21ec3d |
| Production Manager | e3aad368-fab1-4da3-b287-3a65802d84ff |
| Founding Engineer | 7bb601dc-a0e0-4f37-9a63-1df7be1be013 |

### Company OS
| Agent | ID |
|-------|-----|
| CEO | 0d70bbe7-b566-4bd5-9b3b-58aae3d13d86 |
| DevOps Engineer | e64df159-0752-4a9a-9e50-2f8d9794740a |

### VAT Systems
| Agent | ID |
|-------|-----|
| CEO | de023f0a-eb0c-461a-898d-e40d84b1b06b |
| Backend Developer | 9ce6be80-dc9a-4be7-83ce-feb474d65975 |

## Ví dụ

```
/task-assign --agent b0e897a5 --task "Tạo báo cáo tuần này"
```
