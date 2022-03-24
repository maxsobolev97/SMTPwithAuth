$serverSmtp = "example" 
$port = 25
$From = "example@example.ru" 
$To = "example@example.ru" 
$subject = "Письмо с вложением"
$user = "example"
$pass = "example"
$file = "D:\example.txt"
$att = New-object Net.Mail.Attachment($file)
$mes = New-Object System.Net.Mail.MailMessage
$mes.From = $from
$mes.To.Add($to) 
$mes.Subject = $subject 
$mes.IsBodyHTML = $true 
$mes.Body = "<h1>Тестовое письмо</h1>"
$mes.Attachments.Add($att) 
$smtp = New-Object Net.Mail.SmtpClient($serverSmtp, $port)
$smtp.EnableSSL = $false 
$smtp.Credentials = New-Object System.Net.NetworkCredential($user, $pass);
$smtp.Send($mes)
$a = $smtp.SendCompleted 
$att.Dispose()