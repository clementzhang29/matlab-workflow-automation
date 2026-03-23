# 🤖 MATLAB Signal Processing Workflow Automation

[![OpenClaw](https://img.shields.io/badge/Powered%20by-OpenClaw-blue.svg)](https://github.com/openclaw)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2020a+-orange.svg)](https://www.mathworks.com/)

> 🎯 自动化工作流：从ChatGPT获取MATLAB代码 → 本地运行 → 错误修复 → 成功运行

本项目提供了一套完整的自动化工作流，用于将ChatGPT生成的MATLAB信号处理代码在本地自动运行、调试和修复。

## 📋 功能特点

- ✅ **自动化代码获取** - 从ChatGPT网页版自动获取MATLAB代码
- ✅ **本地运行调试** - 自动执行MATLAB脚本并捕获输出
- ✅ **错误自动修复** - 将运行错误发回ChatGPT修复，最多8次迭代
- ✅ **完整工作流闭环** - 实现代码生成→运行→修复的自动化

## 🔄 工作流程

```
[发送需求] → [ChatGPT生成] → [保存.m文件] → [运行MATLAB]
                                                      ↓
                                            ┌─────────────┐
                                            │  有错误?     │
                                            └─────────────┘
                               ↓                    ↓
                          [修复成功]             [发回修复]
                               │                    │
                               └────── 最多8次 ─────┘
```

## 🚀 快速开始

### 环境要求

- MATLAB R2020a 或更高版本
- OpenClaw 自动化框架
- ChatGPT 账号

### 使用步骤

1. **打开ChatGPT** - 使用浏览器自动化工具打开 chat.openai.com
2. **发送需求** - 描述你需要生成的MATLAB代码
3. **复制代码** - 点击复制按钮获取完整代码
4. **保存文件** - 将代码保存为 `.m` 文件
5. **运行测试** - 执行MATLAB并检查结果

详细使用说明请参考 [MATLAB_Workflow_Skill.html](./MATLAB_Workflow_Skill.html)

## 📁 项目结构

```
.
├── MATLAB_Workflow_Skill.html   # 完整的工作流说明文档
├── README.md                    # 本文件
└── .git/                       # Git仓库
```

## 💡 应用场景

本工作流不仅适用于MATLAB，还可用于以下软件的联合调试：

| 软件 | 场景 |
|------|------|
| 🔬 **Python** | 数据分析、机器学习脚本 |
| 🔧 **Simulink** | 系统仿真模型 |
| 📡 **FPGA工具** | Vivado/Quartus联合调试 |
| 🎮 **ROS** | 机器人仿真 |
| 📊 **LabVIEW** | 虚拟仪器控制 |

## 🔧 核心技术

- **浏览器自动化** - 通过OpenClaw控制ChatGPT网页
- **进程管理** - MATLAB进程启动、监控、关闭
- **错误捕获** - 完整的错误堆栈跟踪
- **迭代修复** - 最多8次的自动修复机制

## 📝 错误处理示例

### 示例1: 函数名错误

```
错误: 未定义函数 'uispinner_BUG'
修复: 将 uispinner_BUG 改为 uispinner
```

### 示例2: 路径错误

```
错误: 无法找到文件
修复: 检查并修正文件路径
```

## 🤝 贡献指南

欢迎提交Issue和Pull Request！

## 📜 许可证

MIT License

## 👨‍💻 作者

- OpenClaw Agent: zl (专利工程师)

---

*⭐ 如果这个项目对你有帮助，请给个Star！*
