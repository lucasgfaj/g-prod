# Projeto G-PROD

Este projeto implementa uma aplicação **Ruby on Rails** em um ambiente virtualizado utilizando **Multipass**. O objetivo é oferecer uma solução escalável e distribuída com três máquinas virtuais: Cliente, Servidor e Banco de Dados.

## Pré-requisitos

Antes de iniciar, você precisará instalar:

- [Multipass](https://multipass.run/) - Virtualização leve para gerenciar máquinas virtuais.
- [Ruby on Rails](https://rubyonrails.org/) - Framework usado para a aplicação web.
- [Git](https://git-scm.com/) - Para clonar o repositório e gerenciar código.
- [Bind9](https://www.isc.org/bind/) - Para gerenciar DNS.
- EasyCA - Para autoridade de certificação e gerenciamento de certificados (Configurações detalhadas no [Notion](https://www.notion.so/G-Prod-1247901150778088857aef1f16d92aba?pvs=4)).
  
## Instruções de Instalação

Siga as instruções detalhadas no Notion para configurar as máquinas virtuais e a aplicação:

[**Instruções de Instalação no Notion**](https://www.notion.so/G-Prod-1247901150778088857aef1f16d92aba?pvs=4)

> **Atenção**: Os IPs das VMs e a chave privada mostrados no Notion foram usados exclusivamente para este projeto e não são válidos para qualquer outro uso.

## Arquitetura

O projeto G-PROD é composto por três VMs interconectadas, cada uma desempenhando uma função específica:

1. **VM Cliente**: Exibe o front-end da aplicação e realiza as requisições.
2. **VM Servidor**: Hospeda a aplicação Ruby on Rails.
3. **VM Banco de Dados**: Armazena os dados, usando MySQL como sistema de gerenciamento.

A aplicação estará disponível no endereço da **VM Servidor**.

## Contribuições

Contribuições são sempre bem-vindas! Se encontrar um bug ou tiver sugestões de melhorias, abra uma issue ou envie um pull request.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.
