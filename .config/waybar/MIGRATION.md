# Conky → Waybar 迁移指南

## 🔄 从 Conky 迁移到 Waybar

这个指南帮助你从原来的 Conky 配置平滑迁移到 Waybar。

## 📦 依赖对比

### Conky 需要
```
- conky >= 1.10.8
- jq
- audacious (音乐播放器)
- Roboto 字体
- curl
```

### Waybar 需要
```
- waybar
- jq
- curl
- Roboto 字体 (可选)
```

**结论**: Waybar 所需的依赖**更少**，更轻量级。

## ⚙️ 安装步骤

### 1. 安装 Waybar

```bash
# Fedora Sway Atomic
rpm-ostree install waybar jq curl

# 重启系统使更改生效
sudo systemctl reboot
```

### 2. 验证安装

```bash
waybar --version
jq --version
```

### 3. 启动 Waybar

```bash
# 一次性启动测试
~/.config/waybar/start.sh

# 或直接启动
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css
```

## 🎯 配置迁移

### 原 Conky 布局

```
Enif.conf (左上角)
├── 时间/日期
├── 问候语
├── 天气信息
└── 网络速度

ProcessPanel.conf (右下角)
├── CPU 使用率
├── 内存使用率
└── 前5进程
```

### 新 Waybar 布局

```
config.jsonc
├── enif-main (ID: 左上角)
│   ├── greeting
│   ├── clock#time
│   ├── clock#date
│   ├── custom/weather-main
│   └── custom/network-stats
│
└── enif-process (ID: 右下角)
    ├── cpu
    ├── memory
    └── custom/process-top
```

## 🎨 样式迁移

### Conky 配置
```lua
color1 = '#141b1e',  -- 背景
color2 = '#6cbfbf',  -- 强调色 (青)
color3 = '#dadada',  -- 文字
```

### Waybar CSS
```css
background: rgba(20, 27, 30, 0.95);  /* #141b1e */
color: #dadada;
#custom-weather-main { color: #6cbfbf; }
```

**迁移**: 颜色方案**完全保留**，只是转换为 CSS 语法。

## 📝 功能对应表

| 功能 | Conky | Waybar |
|------|-------|--------|
| 时间显示 | `${time %I:%M}` | `clock#time` |
| 日期显示 | `${time %A}` | `clock#date` |
| 天气 | `execi 300 ~/.config/conky/Enif/scripts/weather.sh` | `custom/weather-main` |
| 网络速度 | `${downspeedf ens160}` | `custom/network-stats` |
| CPU | Top 进程脚本 | `custom/process-top` |
| 内存 | `${mem}` | `memory` 模块 |
| 问候语 | `execi 600 ~/.config/conky/Enif/scripts/Greeting.sh` | `custom/greeting` |

## 🔧 常见调整

### 改变位置

编辑 `~/.config/waybar/config.jsonc`:

```jsonc
// 改变窗口位置（从左上改到右上）
"position": "top",        // 保持上方
"margin-left": 30,        // 改为 margin-right: 30
```

### 改变更新频率

```jsonc
"custom/weather-main": {
  "interval": 300,  // 改为 600 表示 10 分钟更新一次
}
```

### 改变文字大小

编辑 `~/.config/waybar/style.css`:

```css
#custom-weather-main {
  font-size: 14px;  /* 改为更大或更小 */
}
```

## 🐛 问题排查

### Waybar 未显示

1. 检查 Sway 配置：
   ```bash
   swaymsg -t get_outputs
   ```

2. 检查配置语法：
   ```bash
   waybar -c ~/.config/waybar/config.jsonc --log-level debug
   ```

### 天气不显示

1. 检查缓存：
   ```bash
   cat ~/.cache/weather.json | jq .
   ```

2. 验证 API 密钥：
   ```bash
   curl "api.openweathermap.org/data/2.5/weather?lat=22.2855&lon=114.1577&appid=YOUR_KEY&units=metric"
   ```

### 网络速度不更新

1. 检查网络接口：
   ```bash
   ip link show
   ```

2. 编辑脚本使用正确的接口

## 💾 备份

建议备份原 Conky 配置：

```bash
# 按照你的偏好备份
cp -r ~/.config/conky ~/.config/backup/conky.backup.$(date +%s)
```

## 🚀 自动启动

### 在 Sway 中自动启动 Waybar

编辑 `~/.config/sway/config`:

```bash
# 启动 Waybar
exec $HOME/.config/waybar/start.sh
```

### 作为 Sway 的系统栏

如果要替代 Sway 的状态栏，可以修改配置：

```bash
# ~/.config/sway/config
bar {
    # 注释掉原来的 bar 配置
    # status_command i3status
}

# 改用 Waybar
exec $HOME/.config/waybar/start.sh
```

## ✅ 迁移检查清单

- [ ] Waybar 已安装
- [ ] `jq` 和 `curl` 已安装
- [ ] 所有脚本都可执行 (`chmod +x`)
- [ ] Weather 脚本中的 API 密钥已更新
- [ ] Network interface 设置正确
- [ ] Sway 配置已更新（可选）
- [ ] 颜色和样式符合偏好
- [ ] 已测试所有模块正常工作

## 📚 更多资源

- [Waybar GitHub](https://github.com/Alexays/Waybar)
- [Sway 文档](https://swaywm.org/Documentation/man-pages/)
- [CSS 选择器参考](https://www.w3schools.com/cssref/css_selectors.php)

---

**提示**: 保持原 Conky 配置，直到你完全适应 Waybar！
