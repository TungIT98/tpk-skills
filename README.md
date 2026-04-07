# TPK Skills

![Publish](https://github.com/TungIT98/tpk-skills/workflows/Publish%20to%20ClawHub/badge.svg)
![Inspect](https://github.com/TungIT98/tpk-skills/workflows/Inspect%20Skills/badge.svg)

Bộ skills cho Claude Code dành riêng cho hệ thống TPK multi-company AI agents.

## ClawHub Installation

```bash
npx skills add TungIT98/tpk-skills
```

## GitHub Actions Setup

### Required: CLAWHUB_TOKEN Secret

1. Get your ClawHub token from https://clawhub.ai/settings/tokens
2. Add secret to GitHub repo:
   - Go to repo **Settings → Secrets and variables → Actions**
   - Click **New repository secret**
   - Name: `CLAWHUB_TOKEN`
   - Value: your ClawHub token

### Publishing

**Automatic (on tag push):**
```bash
# Publish specific skill
git tag paperclip-sync/v1.0.0
git push origin paperclip-sync/v1.0.0

# Publish all skills with same version
git tag v1.0.0
git push origin v1.0.0
```

**Manual (workflow_dispatch):**
1. Go to **Actions** tab
2. Select **ClawHub Manual Publish**
3. Click **Run workflow**
4. Choose skill and version

## Skills

### 1. paperclip-sync
Đồng bộ context giữa các agents trong TPK companies.
```bash
/paperclip-sync --company <company-id>
```

### 2. task-assign
Giao task cho agent trong Paperclip.
```bash
/task-assign --agent <agent-id> --task <description>
```

### 3. company-status
Kiểm tra trạng thái công ty và agents.
```bash
/company-status --all
/company-status --running
```

### 4. deploy-skill
Deploy skill mới cho Claude Code agents.
```bash
/deploy-skill --skill <name> --target <workspace>
```

## ClawHub Publish

```bash
# Login
clawhub login

# Publish single skill
clawhub skill publish ./paperclip-sync \
  --slug tpk-paperclip-sync \
  --name "TPK Paperclip Sync" \
  --version 1.0.0 \
  --tags tpk,paperclip,automation

# Batch publish all
clawhub sync --all
```

## GitHub Installation

```bash
# Clone repo
git clone https://github.com/<org>/tpk-skills.git

# Copy vào Claude skills directory
cp -r tpk-skills/* ~/.claude/skills/

# Update
cd ~/.claude/skills/tpk && git pull
```

## npx Installation

```bash
npx skills add <org>/tpk-skills
```

## TPK Companies

| Company | Company ID |
|---------|------------|
| TPK ACI | fe90b604-364f-480d-be10-6a529971db57 |
| TPK Dev Studio | 7fbb2529-7d69-4177-bb6b-988404c35965 |
| Company OS | 189b5ac9-ca25-4421-b6de-359d2df98909 |
| VAT Systems | 87836d44-8223-415a-8ef9-14670a5a6336 |

## Security

- API calls chỉ local (localhost)
- Không lưu trữ credentials
- Verify sources trước khi deploy

## License

MIT
