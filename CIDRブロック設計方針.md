# CIDRブロック設計方針

## 目的
- 環境追加に柔軟に対応できること
- プロダクト追加に柔軟に対応できること
- AWSコンソールやTerraformコード上で直感的に理解できること
- ECS/Fargate、RDS、VPC Endpointなど将来的な拡張に耐えられること
- CIDR重複を防止すること

## 全体方針
- 全体CIDR: `10.0.0.0/8`
- 各環境に `/16` を割り当てる
- 第3オクテットでサービス種別を管理する
- 各サービス領域内で `/24` 単位でプロダクトへ割り当てる

## 環境ごとの割り当て
| 環境 | CIDR |
|---|---|
| CCOE | `10.10.0.0/16` |
| DEV | `10.20.0.0/16` |
| PRD | `10.30.0.0/16` |
| DR | `10.40.0.0/16` |
| SANDBOX | `10.50.0.0/16` |
| TEST | `10.60.0.0/16` |
| RESERVED | `10.70.0.0/16` ～ |

## 第3オクテットの用途割り当て
| 第3オクテット範囲 | 用途 |
|---|---|
| `0～9` | Public / ELB |
| `10～19` | Database |
| `20～39` | VPC Endpoint |
| `30～49` | Management |
| `40～59` | Security |
| `50～69` | Batch / Data |
| `60～79` | Shared |
| `100～199` | Application (ECS/EC2) |
| `200～255` | Reserved |

## 第3オクテットの詳細な意味

### Public / ELB
| CIDR | 用途 |
|---|---|
| `x.x.0.0/24` | Public-1a |
| `x.x.1.0/24` | Public-1c |
| `x.x.2.0/24` | ELB-1a |
| `x.x.3.0/24` | ELB-1c |

### Database
| CIDR | 用途 |
|---|---|
| `x.x.10.0/24` | DB-1 |
| `x.x.11.0/24` | DB-2 |
| `x.x.12.0/24` | DB-3 |

### Endpoint
| CIDR | 用途 |
|---|---|
| `x.x.30.0/24` | Endpoint-1a |
| `x.x.31.0/24` | Endpoint-1c |

## 利用予定サービス
- SSM
- SSMMessages
- EC2Messages
- ECR API
- ECR DKR
- CloudWatch Logs
- Secrets Manager
- KMS

### Management
| CIDR | 用途 |
|---|---|
| `x.x.40.0/24` | Bastion-1a |
| `x.x.41.0/24` | Bastion-1c |
| `x.x.42.0/24` | Management Shared |

### Security
| CIDR | 用途 |
|---|---|
| `x.x.50.0/24` | Inspection |
| `x.x.51.0/24` | Security Tools |

#### 利用例
- DAST
- OWASP ZAP
- 脆弱性診断
- WAF検証

### Batch / Data
| CIDR | 用途 |
|---|---|
| `x.x.60.0/24` | Batch |
| `x.x.61.0/24` | ETL |
| `x.x.62.0/24` | Glue |

### Shared
| CIDR | 用途 |
|---|---|
| `x.x.70.0/24` | Lambda |
| `x.x.71.0/24` | Monitoring |

### Application
| CIDR | 用途 |
|---|---|
| `x.x.100.0/24` | kintai |
| `x.x.101.0/24` | APP Product-B |
| `x.x.102.0/24` | APP Product-C |
| `x.x.103.0/24` | APP Product-D |
| `x.x.104.0/24` | APP Product-E |
| `x.x.105.0/24` | APP Product-F |

## 環境別割り当て例

### DEV 環境
- dev--common-vpc : `10.20.0.0/20`

| CIDR | 用途 |
|---|---|
| `10.20.0.0/24` | Public-1a |
| `10.20.1.0/24` | Public-1c |
| `10.20.2.0/24` | ELB-1a |
| `10.20.3.0/24` | ELB-1c |
| `10.20.10.0/24` | DB-1 |
| `10.20.11.0/24` | DB-2 |
| `10.20.30.0/24` | Endpoint-1a |
| `10.20.31.0/24` | Endpoint-1c |
| `10.20.40.0/24` | Bastion-1a |
| `10.20.41.0/24` | Bastion-1c |
| `10.20.42.0/24` | Management Shared |
| `10.20.50.0/24` | Inspection |
| `10.20.51.0/24` | Security Tools |
| `10.20.60.0/24` | Batch |
| `10.20.61.0/24` | ETL |
| `10.20.62.0/24` | Glue |
| `10.20.70.0/24` | Lambda |
| `10.20.71.0/24` | Monitoring |
| `10.20.100.0/24` | kintai |
| `10.20.101.0/24` | APP Product-B |
| `10.20.102.0/24` | APP Product-C |
| `10.20.103.0/24` | APP Product-D |

### PRD 環境
- VPC: `10.30.0.0/20`

| CIDR | 用途 |
|---|---|
| `10.30.0.0/24` | Public-1a |
| `10.30.1.0/24` | Public-1c |
| `10.30.2.0/24` | ELB-1a |
| `10.30.3.0/24` | ELB-1c |
| `10.30.10.0/24` | DB-1 |
| `10.30.11.0/24` | DB-2 |
| `10.30.30.0/24` | Endpoint-1a |
| `10.30.31.0/24` | Endpoint-1c |
| `10.30.40.0/24` | Bastion-1a |
| `10.30.41.0/24` | Bastion-1c |
| `10.30.42.0/24` | Management Shared |
| `10.30.50.0/24` | Inspection |
| `10.30.51.0/24` | Security Tools |
| `10.30.60.0/24` | Batch |
| `10.30.61.0/24` | ETL |
| `10.30.62.0/24` | Glue |
| `10.30.70.0/24` | Lambda |
| `10.30.71.0/24` | Monitoring |
| `10.30.100.0/24` | kintai |
| `10.30.101.0/24` | APP Product-B |
| `10.30.102.0/24` | APP Product-C |
| `10.30.103.0/24` | APP Product-D |

## 将来拡張方針
- 新規環境追加時は新しい `/16` を割り当てる
- 新規プロダクト追加時は同用途帯の空いている `/24` を割り当てる
- 第3オクテットの用途ルールは変更しない
- ECSサービス増加時は Application領域（`100～199`）を使用する
- 将来的な TGW、VPC Peering、Direct Connect 接続を考慮し、CIDR重複を発生させないこと

> このルールであれば、各環境で用途ごとにサブネットを整理しながら運用でき、長期的な拡張にも対応しやすい構成になります。
- 新規プロダクト追加時は同用途帯の空いている `/24` を割り当てる
- 第3オクテットの用途ルールは変更しない
- Database増加時は DB 領域（`10～19`）を使用する
- 将来的な TGW、VPC Peering、Direct Connect 接続を考慮し、CIDR重複を発生させないこと

> このルールであれば、1環境あたり最大255個近い用途・プロダクト単位のサブネットを整理しながら運用でき、長期的な拡張にも対応しやすい構成になります。
