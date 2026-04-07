---
name: deploy-skill
description: Deploy skill mới cho Claude Code agents. Use khi cần cài đặt skill vào workspace, update skill cho team, hoặc sync skills giữa các agents.
metadata:
  openclaw:
    requires:
      env:
        - GIT_COMMAND
      bins:
        - git
        - cp
    primaryEnv: GIT_COMMAND
---

# Deploy Skill

Deploy và quản lý skills cho TPK Claude Code agents.

## External Endpoints

- GitHub Repository: `https://github.com/<org>/tpk-skills`
- ClawHub Registry: `https://clawhub.github.com`

## Security & Privacy

- Chỉ clone/pull từ trusted repositories
- Verify GPG signatures nếu có
- Không execute code từ skills không verified

## Trust Statement

Skill này được phát triển bởi TPK Dev Team cho mục đích nội bộ.

## Usage

```
/deploy-skill --skill <skill-name> --target <workspace>
/deploy-skill --all --target <workspace>
/deploy-skill --sync
```

## Khi nào dùng

- Khi cần deploy skill mới cho một workspace
- Khi cần update tất cả skills từ GitHub
- Khi team member cần cài đặt skill

## Skill Locations

| Location | Path | Applies to |
|----------|------|------------|
| Personal | `~/.claude/skills/` | All projects |
| Project | `.claude/skills/` | Project only |
| Company | `<workspace>/.claude/skills/` | Company agents |

## Deploy Workflow

1. Clone hoặc pull latest từ GitHub
2. Copy skill vào đúng location
3. Restart Claude Code session
4. Verify skill loaded: `/skills`

## GitHub Source

```bash
# Clone TPK skills
git clone https://github.com/<org>/tpk-skills.git ~/.claude/skills/tpk

# Update
cd ~/.claude/skills/tpk && git pull
```

## ClawHub Publish

```bash
# Install via clawhub
clawhub skill publish ./my-skill --slug tpk-my-skill --name "TPK My Skill"

# Sync all
clawhub sync --all
```
