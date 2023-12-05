CREATE OR REPLACE FUNCTION check_exclusive_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Contador para o número total de subcategorias associadas
BEGIN
    -- Inicializa o contador como zero
    count_subcategories := 0;

    -- Verifica se o item existe em Consumivel
    SELECT COUNT(*) INTO count_subcategories FROM Consumivel WHERE ItemID = NEW.ItemID;
    -- Verifica se o item existe em Legivel
    SELECT COUNT(*) INTO count_subcategories FROM Legivel WHERE ItemID = NEW.ItemID + count_subcategories;
    -- Verifica se o item existe em Acessorio
    SELECT COUNT(*) INTO count_subcategories FROM Acessorio WHERE ItemID = NEW.ItemID + count_subcategories;
    -- Verifica se o item existe em Arma
    SELECT COUNT(*) INTO count_subcategories FROM Arma WHERE ItemID = NEW.ItemID + count_subcategories;
    -- Verifica se o item existe em Armadura
    SELECT COUNT(*) INTO count_subcategories FROM Armadura WHERE ItemID = NEW.ItemID + count_subcategories;

    -- Se o contador for maior que 1, então o item está em mais de uma subcategoria
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'Um item não pode ser de mais de um tipo.';
    END IF;

    -- Se tudo estiver correto, permite a inserção ou atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_exclusive_type
BEFORE INSERT OR UPDATE ON Item
FOR EACH ROW EXECUTE FUNCTION check_exclusive_type();




CREATE OR REPLACE FUNCTION check_exclusive_hab_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Contador para o número total de subcategorias associadas
BEGIN
    -- Inicializa o contador como zero
    count_subcategories := 0;

    -- Verifica se a habilidade existe em Ataque
    SELECT COUNT(*) INTO count_subcategories FROM Ataque WHERE HabilidadeID = NEW.HabilidadeID;
    -- Verifica se a habilidade existe em Passiva
    SELECT COUNT(*) INTO count_subcategories FROM Passiva WHERE HabilidadeID = NEW.HabilidadeID + count_subcategories;
    -- Verifica se a habilidade existe em Suporte
    SELECT COUNT(*) INTO count_subcategories FROM Suporte WHERE HabilidadeID = NEW.HabilidadeID + count_subcategories;

    -- Se o contador for maior que 1, então a habilidade está em mais de uma subcategoria
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'Uma habilidade não pode ser de mais de um tipo.';
    END IF;

    -- Se tudo estiver correto, permite a inserção ou atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_exclusive_hab_type
BEFORE INSERT OR UPDATE ON Habilidade
FOR EACH ROW EXECUTE FUNCTION check_exclusive_hab_type();



CREATE OR REPLACE FUNCTION check_exclusive_personagem_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Contador para o número total de subcategorias associadas
BEGIN
    -- Inicializa o contador como zero
    count_subcategories := 0;

    -- Verifica se o personagem existe em Personagem Não Jogável
    SELECT COUNT(*) INTO count_subcategories FROM PersonagemNaoJogavel WHERE PersonagemID = NEW.PersonagemID;
    -- Verifica se o personagem existe em Personagem Jogável
    SELECT COUNT(*) INTO count_subcategories FROM PersonagemJogavel WHERE PersonagemID = NEW.PersonagemID + count_subcategories;

    -- Se o contador for maior que 1, então o personagem está em mais de uma subcategoria
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'Um personagem não pode ser de mais de um tipo.';
    END IF;

    -- Se tudo estiver correto, permite a inserção ou atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_exclusive_personagem_type
BEFORE INSERT OR UPDATE ON Personagem
FOR EACH ROW EXECUTE FUNCTION check_exclusive_personagem_type();




CREATE OR REPLACE FUNCTION check_exclusive_pnj_type()
RETURNS TRIGGER AS $$
DECLARE
    count_subcategories INT; -- Contador para o número total de subcategorias associadas
BEGIN
    -- Inicializa o contador como zero
    count_subcategories := 0;

    -- Verifica se o personagem não jogável existe em Inimigo
    SELECT COUNT(*) INTO count_subcategories FROM Inimigo WHERE PNJID = NEW.PNJID;
    -- Verifica se o personagem não jogável existe em Lojista
    SELECT COUNT(*) INTO count_subcategories FROM Lojista WHERE PNJID = NEW.PNJID + count_subcategories;

    -- Se o contador for maior que 1, então o personagem não jogável está em mais de uma subcategoria
    IF count_subcategories > 1 THEN
        RAISE EXCEPTION 'Um personagem não jogável não pode ser de mais de um tipo.';
    END IF;

    -- Se tudo estiver correto, permite a inserção ou atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_exclusive_pnj_type
BEFORE INSERT OR UPDATE ON PersonagemNaoJogavel
FOR EACH ROW EXECUTE FUNCTION check_exclusive_pnj_type();
