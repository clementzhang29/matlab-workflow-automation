# 🤖 AI Agent 软件联合调试自动化框架

> 🎯 基于OpenClaw的自动化工作流：AI生成代码 → 本地运行 → 错误修复 → 成功运行

本框架提供了一套通用的自动化方法，可以将AI生成的代码在本地软件中自动运行、调试和修复。

---

## 📋 支持的软件

| 软件 | 状态 | 脚本 |
|------|------|------|
| 🔬 MATLAB | ✅ 已支持 | chatgpt_matlab_workflow.ps1 |
| 🐍 Python | 🔄 可扩展 | (待开发) |
| 🔧 Simulink | 🔄 可扩展 | (待开发) |
| 📡 FPGA工具 | 🔄 可扩展 | (待开发) |

---

## 🚀 在OpenClaw中使用

### 步骤1: 安装Skill

将 `skill_matlab_workflow.md` 复制到OpenClaw的skills目录：

```bash
cp skill_matlab_workflow.md ~/.openclaw/skills/matlab-signal-processing-workflow/SKILL.md
```

### 步骤2: 触发Skill

当需要MATLAB信号处理时，说出触发词：
- "帮我创建MATLAB信号处理代码"
- "从ChatGPT获取MATLAB代码并运行"
- "生成信号处理报告"

### 步骤3: 自动执行

OpenClaw会自动：
1. 打开ChatGPT浏览器
2. 发送代码需求
3. 复制代码并保存为.m文件
4. 执行MATLAB
5. 捕获错误并自动修复（最多8次）
6. 确认成功运行

---

## 📖 MATLAB工作流详解

### 核心脚本

| 脚本 | 功能 |
|------|------|
| `chatgpt_matlab_workflow.ps1` | 核心自动化脚本 |
| `run_gui_test.m` | MATLAB错误捕获脚本 |
| `MATLAB_Workflow_Skill.html` | 完整使用教程 |

### 执行流程

```
用户请求 → Skill触发 → 浏览器自动化 
         → ChatGPT获取代码 → 复制粘贴
         → 保存.m文件 → 执行MATLAB
         → 捕获输出 → 成功/错误?
         → 修复迭代(最多8次) → 完成
```

---

## 🔄 泛化：添加新软件支持

### 1. 创建软件配置

```powershell
# config.json
{
    "software": "Python",
    "exe_path": "python.exe",
    "file_extension": ".py",
    "workspace": "C:\\Users\\...\\python_scripts",
    "run_command": "python {filename}",
    "error_patterns": [
        "Error:",
        "Traceback (most recent call last):"
    ]
}
```

### 2. 创建运行脚本

```powershell
# run_software_test.ps1
param(
    [string]$software = "python",
    [string]$scriptPath
)

# 启动软件
$process = Start-Process -FilePath "python.exe" `
    -ArgumentList $scriptPath `
    -NoNewWindow -PassThru -Wait

# 捕获输出
if ($process.ExitCode -ne 0) {
    # 提取错误信息
    $errorMsg = $process.StandardError.ReadToEnd()
    # 返回错误进行修复
    return @{success=$false; error=$errorMsg}
}

return @{success=$true}
```

### 3. 创建错误修复循环

```powershell
# auto_fix_loop.ps1
param(
    [int]$maxIterations = 8
)

for ($i = 1; $i -le $maxIterations; $i++) {
    Write-Host "迭代 $i/$maxIterations"
    
    # 运行代码
    $result = Run-SoftwareCode
    
    if ($result.success) {
        Write-Host "成功!" -ForegroundColor Green
        break
    } else {
        # 发送错误到AI修复
        $fixedCode = Send-ToAI -error $result.error
        Save-Code -content $fixedCode
    }
}
```

---

## 🎯 快速开始示例

### MATLAB信号处理

```powershell
# 1. 打开ChatGPT
browser open https://chat.openai.com

# 2. 发送需求
browser type "请帮我生成一个MATLAB GUI程序，用于..."

# 3. 复制代码
clipboard copy

# 4. 保存并运行
cd C:\Users\zhangchun\Documents\MATLAB
matlab.exe -r "my_script; exit"
```

### Python数据分析

```powershell
# 1. 打开ChatGPT
browser open https://chat.openai.com

# 2. 发送需求
browser type "请帮我生成Python数据分析代码..."

# 3. 复制代码
clipboard copy

# 4. 保存并运行
python analysis.py
```

---

## 📁 项目文件说明

```
.
├── README.md                      # 本文件
├── skill_matlab_workflow.md      # MATLAB Workflow Skill定义
├── MATLAB_Workflow_Skill.html    # 完整HTML教程
│
├── 核心脚本/
│   ├── chatgpt_matlab_workflow.ps1    # MATLAB自动化主脚本
│   ├── run_gui_test.m                 # MATLAB错误捕获
│   └── get_clipboard.ps1              # 剪贴板工具
│
├── 辅助脚本/
│   ├── chatgpt_matlab_browser_automation.ps1
│   ├── chatgpt_matlab_full_automation.ps1
│   └── send_to_matlab.ps1
│
└── 测试脚本/
    ├── run_gui.ps1
    ├── test_error_flow.ps1
    └── test_matlab_error.ps1
```

---

## 🔧 环境配置

### OpenClaw配置

```yaml
# config.yaml
skills:
  matlab-workflow:
    enabled: true
    matlab_path: D:\Program Files\MATLAB\R2025b\bin\matlab.exe
    workspace: C:\Users\zhangchun\Documents\MATLAB
    
browser:
  chatgpt_url: https://chat.openai.com
  headless: false
```

### MATLAB配置

```matlab
% startup.m
addpath('C:\Users\zhangchun\Documents\MATLAB');
```

---

## 💡 最佳实践

1. **错误捕获要完整** - 包含行号、堆栈、错误类型
2. **迭代次数限制** - 最多8次，避免无限循环
3. **版本兼容性** - 检查软件版本，选择兼容的代码
4. **结果验证** - 实际运行并验证输出
5. **日志记录** - 记录每次迭代的结果

---

## 🤝 贡献指南

欢迎添加更多软件的支持！

1. Fork本仓库
2. 创建新分支 `git checkout -b software-name`
3. 添加软件配置文件和脚本
4. 提交Pull Request

---

## 📜 许可证

MIT License

## 👨‍💻 作者

- zl (专利工程师) - OpenClaw Agent
