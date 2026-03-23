---
name: matlab-signal-processing-workflow
description: 自动化MATLAB信号处理工作流：从ChatGPT获取分环节MATLAB代码→本地运行迭代→生成完整HTML报告
---

# MATLAB Signal Processing Workflow

自动化工作流：从 ChatGPT 网页版获取 MATLAB 信号处理代码 → 本地运行调试 → 输出完整报告

## 工作流步骤

### 阶段1: MATLAB 处理方案设计
1. **问题分析** - 理解信号处理需求，拆分为处理环节
2. **方案设计** - 每个处理环节对应一个模块
3. **代码生成** - 每个环节单独一个.m文件

### 阶段2: 本地运行迭代
1. **保存代码** - 将ChatGPT生成的MATLAB代码保存为.m文件
2. **执行MATLAB** - 运行脚本捕获输出
3. **错误处理** - 如果有Error，将错误日志发回ChatGPT修复（最多8次迭代）
4. **成功确认** - 保存运行结果和中间输出

### 阶段3: 生成报告
输出 HTML 报告，包含：
- 问题背景分析
- 理论分析过程
- MATLAB 完整代码（可折叠）
- 运行结果
- 结论与建议

## 前置要求

### 环境配置
```bash
# MATLAB 路径
MATLAB_PATH=D:\Program Files\MATLAB\R2025b\bin\matlab.exe
```

### 工作目录
```
WORKDIR/
├── matlab/
│   ├── stage1_*.m    # 环节1代码
│   ├── stage2_*.m   # 环节2代码
│   ├── stage3_*.m   # 环节3代码
│   └── stage4_*.m   # 环节4代码
├── results/
│   ├── stage1_output.txt  # 环节1输出
│   └── ...
└── reports/
    └── Final_Report_*.html
```

## 使用方式

当用户请求：
- "帮我创建MATLAB信号处理代码"
- "从ChatGPT获取MATLAB代码并运行"
- "生成信号处理报告"

## 迭代流程

```
[发送问题] → [获取代码] → [保存.m文件] → [运行MATLAB]
                                                        ↓
                                              ┌───────────┐
                                              │ 有错误?   │
                                              └───────────┘
                           ↓                    ↓
                      [修复成功]             [发回修复]
                           │                    │
                           └────── 最多8次 ──────┘
```

## 注意事项

1. 每个环节单独一个.m文件
2. 每个环节打印中间结果到命令行或文件
3. 捕获完整错误信息用于迭代
4. MATLAB迭代最多8次，总迭代最多15次
