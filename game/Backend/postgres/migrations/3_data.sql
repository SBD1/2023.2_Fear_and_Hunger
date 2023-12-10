-- Inserir dados na tabela regiao
INSERT INTO
    regiao (nomeR, descricao, tranca)
VALUES
    (
        'Praça Central',
        'Aqui é o centro da cidade. Aonde a população costumava se reunir para conversar e comercializar.',
        FALSE
    ),
    (
        'Igreja',
        'A única igreja da cidade. Aqui os moradores dedicavam preces a All-mer, o último dos deuses antigos, também conhecido como "aquele que ascendeu".',
        TRUE
    ),
    (
        'Floresta',
        'O bosque que fica ao redor da cidade.',
        FALSE
    );
    -- (
    --     'Circo',
    --     'Um lugar que antes era usado para diversão e entretenimento, mas que atualmente tem um aspecto sinistro e abandonado.',
    --     TRUE
    -- ),
    -- (
    --     'Truques e mágica Dr. Kefer',
    --     'Um pequeno edifício de aparência desgastada.',
    --     FALSE
    -- ),
    -- (
    --     'Livraria',
    --     'A livraria comercializava todo tipo de livro dos mais variados assuntos.',
    --     FALSE
    -- ),
    -- (
    --     'Casa do lenhador',
    --     'A casa do lenhador do vilarejo',
    --     FALSE
    -- );

INSERT INTO
    Local (idRegiao, nomeL, imgTexto)
VALUES
    (
        1,
        'Fonte',
        'A Fonte da Praça Central é um ponto emblemático que representa o coração pulsante da cidade. Antigamente, era o local preferido da população para se reunir, trocar histórias, discutir negócios e aproveitar a companhia uns dos outros. Rodeada por bancas agora abandonadas e uma majestosa árvore, a Fonte era o epicentro da vida social e comercial da cidade. Seus arredores testemunharam gerações de moradores que se reuniam aqui para compartilhar suas alegrias e desafios, tornando-a um símbolo duradouro da comunidade e da história da Praça Central.'
    ),
    (
        1,
        'Bancas abandonadas',
        'As Bancas Abandonadas na Praça Central são testemunhas silenciosas de um passado vibrante e agitado. Onde antes o comércio fervilhava e os vendedores ofereciam suas mercadorias em um animado mercado ao ar livre, agora permanece o vazio e o abandono. Essas bancas outrora coloridas e cheias de vida estão agora cobertas de poeira e desprovidas de sua antiga vitalidade. Através do tempo, a Praça Central foi o epicentro do comércio e da interação social, mas as Bancas Abandonadas são um lembrete melancólico do que já foi, um contraste entre o passado movimentado e o presente silencioso da cidade.'
    ),
    (
        1,
        'Árvore da Praça',
        'Diz-se que a  Árvore da Praça tem mais de um século de idade, testemunhando eventos importantes e segredos compartilhados ao longo do tempo. Seus troncos retorcidos e casca rugosa contam histórias que são passadas de boca em boca. Com suas raízes profundamente enraizadas na cultura da cidade, esta árvore é mais do que apenas um elemento paisagístico; ela é um símbolo de conexão, sombra e continuidade na Praça Central.'
    );

INSERT INTO
    Local (idRegiao, nomeL, imgTexto)
VALUES
    (
        2,
        'Entrada',
        'A entrada da igreja, única na cidade, é um portal majestoso para a espiritualidade. Suas portas de madeira entalhada são adornadas com símbolos e cenas da ascensão de All-mer, o último dos deuses antigos. Acima, um arco de pedra com figuras angélicas simboliza a conexão entre os mundos terreno e espiritual. Ao lado, duas estátuas de pedra de All-mer guardam a entrada, representando sua majestosa ascensão e poder divino. O caminho florido que leva até lá evoca paz e reverência, preparando os visitantes para a comunhão espiritual no interior.'
    ),
    (
        2,
        'Interior',
        'O interior da igreja é um santuário de serenidade e devoção. Altas colunas de pedra se elevam para sustentar um teto abobadado, adornado com afrescos delicadamente pintados que contam as histórias de All-mer e sua ascensão divina. A luz suave penetra através dos vitrais coloridos, lançando um arco-íris de cores sobre os bancos de madeira enfileirados, convidando os fiéis a um momento de reflexão e oração.'
    ),
    (
        2,
        'Altar',
        'O altar, um grande mural retrata All-mer em sua forma glorificada, cercado por símbolos celestiais e terrenos. O espaço em frente ao altar, frequentemente usado para cerimônias e preces, é aberto e acolhedor, facilitando uma conexão coletiva entre os adoradores e o divino.'
    );

INSERT INTO
    Local (idRegiao, nomeL, imgTexto)
VALUES
    (
        3,
        'Entrada',
        'A entrada da floresta, emerge como um umbral sombrio e inquietante para um reino de mistérios e medos ancestrais. As árvores retorcidas e imponentes formam um arco quase ameaçador, com galhos entrelaçados que se assemelham a dedos esqueléticos estendendo-se para o céu encoberto. A luz do sol raramente penetra essa cortina de folhagem densa, criando um crepúsculo perpétuo que envolve o caminho com uma penumbra desconcertante.'
    ),
    (
        3,
        'Interior',
        'À medida que se adentra mais profundamente, a trilha se torna mais sinuosa e menos definida, levando os visitantes a um labirinto de sombras e incertezas. A floresta parece guardar segredos antigos e histórias esquecidas, onde cada sussurro do vento e movimento furtivo nas sombras pode ser o prenúncio de horrores ocultos. Neste cenário, a entrada da floresta é mais do que um simples começo de trilha; é um convite ao coração de um pesadelo natural, onde o medo e o fascínio caminham lado a lado.'
    );
    

-- Primeiro, inserimos um personagem que será jogável
INSERT INTO
    personagem (nome, idLocal, tipoP, dinheiro)
VALUES
    ('Jogador Heroico', 1, 'personagem_jogavel', 1000) RETURNING id_personagem;

-- Suponha que o ID retornado seja 1, usamos esse ID para inserir na tabela PersonagemJogavel
INSERT INTO
    personagem_jogavel (
        id_personagem,
        hpAtual,
        hpMax,
        menteAtual,
        menteMax,
        arma,
        armadura
    )
VALUES
    (
        1,
        100,
        100,
        50,
        50,
        'Espada Longa',
        'Cota de Malha'
    );

-- Em seguida, inserimos um personagem que não será jogável
INSERT INTO
    personagem (nome, idLocal, tipoP)
VALUES
    ('NPC Misterioso', 1, 'personagem_nao_jogavel') RETURNING id_personagem;

-- Suponha que o ID retornado seja 2, usamos esse ID para inserir na tabela PersonagemNaoJogavel
INSERT INTO
    personagem_nao_jogavel (
        id_personagem,
        descricao,
        fala,
        imgTexto,
        tipoPnj
    )
VALUES
    (
        2,
        'Um misterioso Logista que oferece conselhos.',
        'Olá, aventureiro!',
        'imagem_do_npc.png',
        'Lojista'
    );

-- Inserting items into the 'item' table
INSERT INTO
    item (nome, descricao, valor, peso)
VALUES
    (
        'Espada Longa',
        'Uma espada longa e afiada.',
        150,
        5
    ),
    (
        'Capa da Invisibilidade',
        'Uma capa que torna o usuário invisível.',
        500,
        1
    ),
    (
        'Escudo de Bronze',
        'Um escudo resistente feito de bronze.',
        100,
        10
    ),
    (
        'Botas de Velocidade',
        'Botas que aumentam a agilidade do usuário.',
        200,
        2
    ),
    (
        'Elmo de Guerra',
        'Um elmo protege a cabeça durante a batalha.',
        80,
        3
    );

-- Now, inserting into the 'acessorio' table, assuming the 'idAcessorio' matches 'idItem'
INSERT INTO
    acessorio (idAcessorio, detalhe)
VALUES
    (
        (
            SELECT
                idItem
            FROM
                item
            WHERE
                nome = 'Capa da Invisibilidade'
        ),
        'Torna o usuário invisível por curtos períodos de tempo.'
    ),
    (
        (
            SELECT
                idItem
            FROM
                item
            WHERE
                nome = 'Botas de Velocidade'
        ),
        'Aumenta a agilidade do usuário ao correr.'
    );

-- Inserting into the 'arma' table
INSERT INTO
    arma (idArma, ataque, defesa)
VALUES
    (
        (
            SELECT
                idItem
            FROM
                item
            WHERE
                nome = 'Espada Longa'
        ),
        10,
        0
    );

-- Inserting into the 'escudo' (assuming it is a type of 'arma') table
INSERT INTO
    arma (idArma, ataque, defesa)
VALUES
    (
        (
            SELECT
                idItem
            FROM
                item
            WHERE
                nome = 'Escudo de Bronze'
        ),
        2,
        5
    );

-- Inserting into the 'armadura' table
INSERT INTO
    armadura (idArmadura, defesaFisica, defesaMagica)
VALUES
    (
        (
            SELECT
                idItem
            FROM
                item
            WHERE
                nome = 'Elmo de Guerra'
        ),
        3,
        1
    );

COMMIT;