# 🛑 AWS Billing Alarm (Zero Surpresas na Fatura)

Quem nunca teve aquele mini-infarto ao olhar a fatura da nuvem no fim do mês que atire a primeira pedra. 

Criei este projeto para resolver exatamente isso: automatizar a criação de um alarme de faturamento na AWS usando **Terraform**. A ideia é simples e direta: se o gasto estimado da conta passar de um limite de segurança (configurei 5 dólares por padrão), o CloudWatch dispara um alerta para o seu e-mail na hora.

Foi um laboratório excelente para consolidar conceitos de **Infraestrutura como Código (IaC)** e colocar em prática a mentalidade de SRE, garantindo que o controle de custos já nasça junto com a infraestrutura.

## 🛠️ O que está rodando debaixo do capô?
- **Terraform:** Para orquestrar tudo de forma declarativa, sem precisar clicar em painéis.
- **Amazon CloudWatch:** Configuramos um alarme focado na métrica global de `EstimatedCharges`.
- **Amazon SNS:** O tópico que faz o roteamento da notificação e envia o e-mail.

## 🔒 Segurança (Porque ninguém quer vazar chaves)
Estruturei este repositório aplicando regras de ouro de segurança de infraestrutura:
- **Zero Hardcoding:** O e-mail que recebe os alertas não fica solto no código. Ele é injetado dinamicamente via variáveis.
- **Gitignore Blindado:** O arquivo de estado (`terraform.tfstate`), que costuma guardar informações sensíveis da conta, e o arquivo de variáveis secretas estão bloqueados e nunca sobem para o GitHub.

---

## 🚀 Como usar na sua própria conta

Se quiser clonar o projeto para proteger a sua própria conta da AWS, o passo a passo é rápido:

**1. Clone o repositório**
```bash
git clone [https://github.com/terraform-aws-billing-alarm](https://github.com/727wag/terraform-aws-billing-alarm.git)
cd terraform-aws
