# `gongniuai`

> 🤖 First AI agent using ANDA (Deepseek Framework)

## 🌍 README Translations

[English readme](./README.md) | [中文说明](./README_CN.md)

## 🤖 Introduction

`Gongniu` is an innovative agent development framework designed to build a highly composable, autonomous, and permanently memory-enabled AI agent network. By connecting agents across various industries, Anda aims to create a super AGI system, advancing artificial intelligence to higher levels.

![Anda Diagram](./anda_diagram.webp)

### ✨ Key Features

1. **Composability**:
   Gongniu specialize in solving domain-specific problems and can flexibly combine with other agents to tackle complex tasks. When a single agent cannot solve a problem alone, it collaborates with others to form a robust problem-solving network. This modular design allows Anda to adapt to diverse needs.

2. **Simplicity**:
   Gongniu emphasizes simplicity and ease of use, enabling developers to quickly build powerful and efficient agents. Non-developers can also create their own agents through simple configurations, lowering the technical barrier and inviting broader participation in agent development and application.

3. **Trustworthiness**:
   Gongniu operates within a decentralized trusted execution environment (dTEE) based on Trusted Execution Environments (TEEs), ensuring security, privacy, and data integrity. This architecture provides a highly reliable infrastructure for agent operations, safeguarding data and computational processes.

4. **Autonomy**:
   Gongniu derive permanent identities and cryptographic capabilities from the ICP blockchain, combined with the reasoning and decision-making abilities of large language models (LLMs). This allows agents to autonomously and efficiently solve problems based on their experiences and knowledge, adapting to dynamic environments and making effective decisions in complex scenarios.

5. **Perpetual Memory**:
   The memory states of Anda agents are stored on the ICP blockchain and within the trusted storage network of dTEE, ensuring continuous algorithm upgrades, knowledge accumulation, and evolution. This perpetual memory mechanism enables agents to operate indefinitely, even achieving "immortality", laying the foundation for a super AGI system.

### 🧠 Vision and Goals

Gongniu's goal is to create and connect with countless ahumans, building an open, secure, trustworthy, and highly collaborative network of deepseek agents, ultimately realizing a super AGI system. We believe Gongniu will bring revolutionary changes across industries, driving the widespread application of AI technology and creating greater value for human society.




#### For Non-Developers:

You can follow the agents in the `agents` directory. For example, [`anda_bot`](https://github.com/ldclabs/anda/tree/main/agents/anda_bot)—simply copy the [nitro_enclave](https://github.com/ldclabs/anda/tree/main/agents/anda_bot/nitro_enclave) folder, modify the `Character.toml` role definition and `Config.toml` runtime parameters, and deploy according to the tutorial.
The deployment process is currently complex, but we plan to launch a cloud service for one-click deployment in the future.

#### For Developers:

- Add more integration tools with external services in `tools`;
- Create more agent applications in `agents`;
- Or enhance the core engines `anda_core` and `anda_engine`.

### Related Projects

- [IC-TEE](https://github.com/ldclabs/ic-tee): 🔐 Make Trusted Execution Environments (TEEs) work with the Internet Computer.
- [IC-COSE](https://github.com/ldclabs/ic-cose): ⚙️ A decentralized COnfiguration service with Signing and Encryption on the Internet Computer.

## 📝 License

Copyright © 2025
`gongniuai/gongniuai` is licensed under the MIT License.
