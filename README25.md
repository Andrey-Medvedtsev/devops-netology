
1. Найдите, где перечислены все доступные resource и data_source, приложите ссылку на эти строки в коде на гитхабе.<br/>
data_source:<br/>
https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go#L415 <br/>
resource:<br/>
https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go#L913
2. Для создания очереди сообщений SQS используется ресурс aws_sqs_queue у которого есть параметр name<br/>
* С каким другим параметром конфликтует name? Приложите строчку кода, в которой это указано.<br/>
ConflictsWith: []string{"name_prefix"} <br/>
https://github.com/hashicorp/terraform-provider-aws/blob/e162cdf3774a56db6bcde4ba242adc7c20ada877/internal/service/sqs/queue.go#L87 <br/>
* Какая максимальная длина имени?<br/> 
127 символов
https://github.com/hashicorp/terraform-provider-aws/blob/e162cdf3774a56db6bcde4ba242adc7c20ada877/internal/service/connect/queue.go#L60
* Какому регулярному выражению должно подчиняться имя?<br/>
if fifoQueue {<br/>
&emsp; &emsp; &emsp; 			re = regexp.MustCompile(`^[a-zA-Z0-9_-]{1,75}\.fifo$`)<br/>
} else {<br/>
&emsp; &emsp; &emsp; 			re = regexp.MustCompile(`^[a-zA-Z0-9_-]{1,80}$`)<br/>
}<br/>
https://github.com/hashicorp/terraform-provider-aws/blob/e162cdf3774a56db6bcde4ba242adc7c20ada877/internal/service/sqs/queue.go#L424<br/>