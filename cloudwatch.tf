# 1. Tópico SNS: vai alarmar e distribuir a notificação, o mensageiro.
resource "aws_sns_topic" "billing_alarm_topic"  {
  name = "topico_alarme_faturamento"
}

# 2. Inscrição no tópico: quem vai receber a notificação, no caso meu e-mail.
  resource "aws_sns_topic_subscription" "email_subscription" {
    topic_arn = aws_sns_topic.billing_alarm_topic.arn
    protocol = "email"
    endpoint = var.email_alerta
  }

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name = "Alarme-Fatura-5-Dolares"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "1"
metric_name = "EstimatedCharges"
namespace = "AWS/Billing"

period = "21600"
statistic = "Maximum"
threshold = "5.0" 
alarm_description = "Alarme disparado quando a fatura atingir ou ultrapassar  U$ 5 dólares."

dimensions = {
  currency = "USD"
}

alarm_actions = [aws_sns_topic.billing_alarm_topic.arn]
}