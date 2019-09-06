**Terraform e AWS**

Neste repositorio estão os arquivos referenciados no artigo do linkedin de titulo *AWS com Terraform, será?*

Itens a serem ajustados 

Alterar o arquivo *variables.tf* para refletir sua access_key, secret_key e a região são paulo (sa-east-1)

Gerar a chave a key pair aws através do aws cli com auxilio do script aws.sh.

Ajustar o arquivo sg_sa-east-1.tf com seu IP publico externo para que o script check-status-http.sh possa fazer o check da aplicação provisionada no EC2.

E o mais importante de tudo, destruir os recursos quando não forem mais necessários.

