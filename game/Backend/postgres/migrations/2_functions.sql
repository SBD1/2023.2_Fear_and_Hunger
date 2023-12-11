CREATE OR REPLACE FUNCTION criar_inventario()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO inventario (id_personagem,dinAtual) VALUES (NEW.id_personagem, 1000);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Agora, crie o gatilho que chama a função após a inserção em personagem_jogavel
CREATE TRIGGER trigger_criar_inventario
AFTER INSERT ON personagem_jogavel
FOR EACH ROW EXECUTE FUNCTION criar_inventario();



CREATE OR REPLACE FUNCTION check_exclusive_personagem_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Contador para o número total de subcategorias associadas
BEGIN
    -- Inicializa o contador como zero
    count_subcategories := 0;

    -- Verifica se o personagem existe em Personagem Não Jogável
    SELECT COUNT(*) INTO count_subcategories FROM personagem_nao_jogavel WHERE id_personagem = NEW.id_personagem;
    -- Verifica se o personagem existe em Personagem Jogável
    SELECT COUNT(*) INTO count_subcategories FROM personagem_jogavel WHERE id_personagem = NEW.id_personagem + count_subcategories;

    -- Se o contador for maior que 1, então o personagem está em mais de uma subcategoria
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'Um personagem não pode ser de mais de um tipo.';
    END IF;

    -- Se tudo estiver correto, permite a inserção ou atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_exclusive_personagem_type
BEFORE INSERT OR UPDATE ON personagem
FOR EACH ROW EXECUTE FUNCTION check_exclusive_personagem_type();



CREATE OR REPLACE FUNCTION check_exclusive_pnj_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Contador para o número total de subcategorias associadas
BEGIN
    -- Inicializa o contador como zero
    count_subcategories := 0;

    -- Verifica se o personagem existe na subcategoria Inimigo
    SELECT COUNT(*) INTO count_subcategories FROM inimigo WHERE id_personagem = NEW.id_personagem;
    -- Verifica se o personagem existe na subcategoria Lojista e adiciona ao contador
    SELECT COUNT(*) INTO count_subcategories FROM lojista WHERE id_personagem = NEW.id_personagem + count_subcategories;

    -- Se o contador for maior que 1, então o personagem está em mais de uma subcategoria
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'Um personagem não pode ser de mais de um tipo de PNJ.';
    END IF;

    -- Se tudo estiver correto, permite a inserção ou atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION check_exclusive_item_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Counter for the total number of associated subcategories
BEGIN
    -- Initialize the counter to zero
    count_subcategories := 0;

    -- Check if the item exists in the 'legal' subcategory
    SELECT COUNT(*) INTO count_subcategories FROM legivel WHERE idLegivel = NEW.idItem;
    -- Check if the item exists in the 'acessorio' subcategory
    SELECT COUNT(*) INTO count_subcategories FROM acessorio WHERE idAcessorio = NEW.idItem + count_subcategories;
    -- Check if the item exists in the 'arma' subcategory
    SELECT COUNT(*) INTO count_subcategories FROM arma WHERE idArma = NEW.idItem + count_subcategories;
    -- Check if the item exists in the 'armadura' subcategory
    SELECT COUNT(*) INTO count_subcategories FROM armadura WHERE idArmadura = NEW.idItem + count_subcategories;

    -- If the counter is greater than 1, then the item is in more than one subcategory
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'An item cannot be of more than one type.';
    END IF;

    -- If everything is correct, allow the insert or update
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_exclusive_item_type
BEFORE INSERT OR UPDATE ON item
FOR EACH ROW EXECUTE FUNCTION check_exclusive_item_type();


CREATE OR REPLACE PROCEDURE comprarItem(idPersonagem INT, idItemCompra INT)
LANGUAGE plpgsql
AS $$
DECLARE
    precoItem INT;
    pesoItem INT;
    dinheiroPersonagem INT;
    pesoAtual INT;
    qtdItemExistente INT;
BEGIN
    -- Obtém o preço e o peso do item
    SELECT valor, peso INTO precoItem, pesoItem FROM item WHERE idItem = idItemCompra;

    -- Obtém o dinheiro e o peso atual do personagem
    SELECT dinAtual, capAtual INTO dinheiroPersonagem, pesoAtual FROM inventario WHERE id_personagem = idPersonagem;

    -- Verifica se o personagem tem dinheiro suficiente
    IF dinheiroPersonagem < precoItem THEN
        RAISE EXCEPTION 'Dinheiro insuficiente';
    END IF;

    -- Atualiza o dinheiro e o peso no inventário
    UPDATE inventario SET 
        dinAtual = dinAtual - precoItem,
        capAtual = capAtual + pesoItem
    WHERE id_personagem = idPersonagem;

    -- Verifica se o item já existe no inventário
    SELECT quantidade INTO qtdItemExistente FROM compra WHERE id_personagem = idPersonagem AND idItem = idItemCompra;

    IF qtdItemExistente IS NOT NULL THEN
        -- Se o item já existe, incrementa a quantidade
        UPDATE compra SET 
            quantidade = quantidade + 1,
            valorTotal = valorTotal + precoItem
        WHERE id_personagem = idPersonagem AND idItem = idItemCompra;
    ELSE
        -- Se o item não existe, insere um novo registro
        INSERT INTO compra (id_personagem, idItem, quantidade, valorTotal)
        VALUES (idPersonagem, idItemCompra, 1, precoItem);
    END IF;

    COMMIT;
END;
$$;


CREATE OR REPLACE FUNCTION criar_partes_personagem()
RETURNS TRIGGER AS $$
BEGIN
    -- Insere duas pernas para o novo personagem
    FOR i IN 1..2 LOOP
        INSERT INTO Parte (idPersonagem, tipoParte, hpMax, hpAtual, probAcerto)
        VALUES (NEW.id_personagem, 'Perna', 100, 100, 0.7);
    END LOOP;
    
    -- Insere dois braços para o novo personagem
    FOR i IN 1..2 LOOP
        INSERT INTO Parte (idPersonagem, tipoParte, hpMax, hpAtual, probAcerto)
        VALUES (NEW.id_personagem, 'Braço', 100, 100, 0.8);
    END LOOP;

    -- Insere um torso para o novo personagem
    INSERT INTO Parte (idPersonagem, tipoParte, hpMax, hpAtual, probAcerto)
    VALUES (NEW.id_personagem, 'Torso', 200, 200, 0.5);
    
    -- Insere uma cabeça para o novo personagem
    INSERT INTO Parte (idPersonagem, tipoParte, hpMax, hpAtual, probAcerto)
    VALUES (NEW.id_personagem, 'Cabeça', 50, 50, 0.2);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_criar_partes_personagem
AFTER INSERT ON Personagem
FOR EACH ROW
EXECUTE FUNCTION criar_partes_personagem();
