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