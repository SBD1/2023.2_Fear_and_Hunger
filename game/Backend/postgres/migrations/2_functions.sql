CREATE OR REPLACE FUNCTION criar_inventario()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO inventario (id_personagem) VALUES (NEW.id_personagem);
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

