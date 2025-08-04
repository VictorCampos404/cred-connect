#  Cred Connect
Olá, eu sou **Victor Campos** e gostaria primeiramente de agradecer a oportunidade de mostrar meus conhecimentos. O desafio se trata de um aplicativo em Flutter para uma fintech que
oferece microempréstimos para clientes de baixa renda.

### **Versões**:

-   Flutter  3.32.8 (channel stable)
-   Dart 3.8.1

### **Instruções para build**:

# 1. Clone o repositório
git clone https://github.com/VictorCampos404/cred-connect.git
cd cred-connect

# 2. Instale as dependências
flutter pub get

# 3. Rode o projeto em um emulador ou dispositivo conectado
flutter run

### **Como gerar o APK**:

- flutter build apk --release

### **Links**:

-   APK: https://drive.google.com/file/d/1lTzzkl6pvoDuWasweHfG-vd-IumpKs4N/view?usp=sharing

-   Vídeo mostrando o app: https://drive.google.com/file/d/1_uRnZzSvWyGWPcVXOmCnlHvBLmqJoLlC/view?usp=sharing

### **Arquitetura utilizada: Clean Architecture**:

Com o objetivo de melhorar a escalabilidade e legibilidade, somado ao desacoplamento e modularização das camadas.

![Flutter TDD Clean Architecture Course – Explanation & Project Structure](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)

Nesse projeto as camadas da Clean Architecture são:

-   *Camada Presentation*: 

    -   Responsável por apresentar a interface (UI) ao usuário final. 

    -   Possui  controllers, widgets e telas. 

    -   Controller: Responsável por controlar a interação do usuário na interface, além de coordenar a comunicação com os casos de uso. 

    -   Tela: Interface visual que permite o usuário interagir com a aplicação. 

    -   Widget: Elemento visual  componentizado porque será utilizado diversas vezes pelas telas. 

-   *Camada Domain*: 

    -   Possui  repositories e usecases. 

    -   Repository: Define contratos (interfaces) para acessar dados e separa a lógica de acesso a dados das implementações específicas (como API, banco de dados local). 

    -   Usecase: É independente da UI e dos detalhes de implementação do banco de dados e contém a lógica de negócios da aplicação. 

-   *Camada Data*: 

    -   Possui  datasources, DTOs e implemented repositories. 

    -   Data Source: Se trata de uma fonte de dados, sendo responsável pela conexão com a API, bancos de dados locais, etc. 

    -   DTO: O objeto de transferência de dados é utilizado para mapear a resposta da API ou banco de dados local. 

    -   Implemented Repository: Faz a comunicação entre a camada Domain e Data.

### **Gerenciamento de estados:**:

-   Utilizei o Provider, por eu possuir maior domínio.

### **Mock de dados:**:

-   Utilizei o shared_preferences para criar o LocalDatabaseService e salvar todos os dados localmente.
