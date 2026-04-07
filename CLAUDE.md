# TPK Skills - CLAUDE.md

Repo này chứa các Claude Code skills dùng cho hệ thống TPK multi-company AI.

## Skills có sẵn

- `paperclip-sync/` - Đồng bộ context từ API
- `task-assign/` - Giao task cho agents
- `company-status/` - Kiểm tra trạng thái
- `deploy-skill/` - Deploy skills

## Cấu trúc

```
tpk-skills/
├── paperclip-sync/SKILL.md
├── task-assign/SKILL.md
├── company-status/SKILL.md
├── deploy-skill/SKILL.md
└── README.md
```

## Phát triển skill mới

1. Tạo folder mới: `<skill-name>/`
2. Tạo `SKILL.md` với frontmatter
3. Test với `/<skill-name>` trong Claude Code
4. Update README.md
5. Push lên GitHub

## Frontmatter format

```yaml
---
name: my-skill
description: Mô tả skill. Use khi [trigger phrases].
---
```
