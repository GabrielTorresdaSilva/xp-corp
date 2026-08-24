-- Criação e seleção do Banco de Dados
CREATE DATABASE IF NOT EXISTS xp_corp;
USE xp_corp;

-- 1. Tabela de Empresas
CREATE TABLE IF NOT EXISTS empresas (
    id_empresas INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(255) NOT NULL,
    senha_empresa VARCHAR(255) NOT NULL
);

-- 2. Tabela de Colaboradores (Gestores/Admins da Empresa)
CREATE TABLE IF NOT EXISTS colaborador (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador VARCHAR(255) NOT NULL,
    senha_colaborador VARCHAR(255) NOT NULL,
    empresas_id_empresas INT,
    FOREIGN KEY (empresas_id_empresas) REFERENCES empresas(id_empresas) ON DELETE CASCADE
);

-- 3. Tabela de Feedbacks
CREATE TABLE IF NOT EXISTS feedbacks (  
    id_feedbacks INT AUTO_INCREMENT PRIMARY KEY,
    comentarios VARCHAR(255),
    data_envio DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. Tabela de Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    empresa VARCHAR(255),
    senha VARCHAR(255) NOT NULL,
    nivel INT DEFAULT 1,
    pontuacao_total INT DEFAULT 0,
    xp_bar INT DEFAULT 0,
    feedbacks_id_feedbacks INT,
    FOREIGN KEY (feedbacks_id_feedbacks) REFERENCES feedbacks(id_feedbacks) ON DELETE SET NULL
);

-- 5. Tabela de Cargos
CREATE TABLE IF NOT EXISTS cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    horas_mes INT,
    funcionarios_id INT,
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id) ON DELETE CASCADE
);

-- 6. Tabela de Setores
CREATE TABLE IF NOT EXISTS setores (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome_setor VARCHAR(255) NOT NULL,
    funcionarios_id INT,
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id) ON DELETE CASCADE
);

-- 7. Tabela de Prazos de Metas
CREATE TABLE IF NOT EXISTS prazos_metas (
    idprazos_metas INT AUTO_INCREMENT PRIMARY KEY,
    nome_meta VARCHAR(255) NOT NULL,
    prazo_meta DATETIME
);

-- 8. Tabela de Metas e Desafios
CREATE TABLE IF NOT EXISTS metas_desafios (
    id_metas INT AUTO_INCREMENT PRIMARY KEY,
    nome_meta VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    pontos_recompensa INT DEFAULT 0,
    prazos_metas_idprazos INT,
    FOREIGN KEY (prazos_metas_idprazos) REFERENCES prazos_metas(idprazos_metas) ON DELETE SET NULL
);

-- 9. Tabela de Metas em Grupo
CREATE TABLE IF NOT EXISTS metas_desafios_grupo (
    id_meta INT AUTO_INCREMENT PRIMARY KEY,
    nome_meta VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

-- 10. Tabela de Relação (Funcionários x Metas)
CREATE TABLE IF NOT EXISTS funcionarios_has_metas_desafios (
    funcionarios_id INT,
    metas_desafios_id_metas INT,
    PRIMARY KEY (funcionarios_id, metas_desafios_id_metas),
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id) ON DELETE CASCADE,
    FOREIGN KEY (metas_desafios_id_metas) REFERENCES metas_desafios(id_metas) ON DELETE CASCADE
);

-- 11. Tabela de Premiações (Opcional)
CREATE TABLE IF NOT EXISTS premicao (
    idpremicao INT AUTO_INCREMENT PRIMARY KEY,
    recompenca VARCHAR(255) NOT NULL
);

-- 12. Tabela de Ranking
CREATE TABLE IF NOT EXISTS ranking (
    idRanking_mes INT AUTO_INCREMENT PRIMARY KEY,
    setores_funcionarios_id INT
);

-- 13. Tabela de Relação (Ranking x Premiação)
CREATE TABLE IF NOT EXISTS ranking_has_premicao (
    ranking_idRanking_mes INT,
    premicao_idpremicao INT,
    PRIMARY KEY (ranking_idRanking_mes, premicao_idpremicao),
    FOREIGN KEY (ranking_idRanking_mes) REFERENCES ranking(idRanking_mes) ON DELETE CASCADE,
    FOREIGN KEY (premicao_idpremicao) REFERENCES premicao(idpremicao) ON DELETE CASCADE
);