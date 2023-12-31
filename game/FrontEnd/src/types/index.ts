export interface IRegiao {
  idregiao: number;
  nomer: string;
  descricao: string;
  tranca: boolean;
  imgtexto: string;
}

export interface ILocal {
  idlocal: number;
  idregiao: number;
  nomel: string;
  imgtexto: string;
}

export interface IPersonagem {
  id_personagem: number;
  idlocal: number;
  nome: string;
  dinheiro: number;
  tipop?: string;
  atq?: number;
  agilidade?: number;
  defesam?: number;
  defesa?: number;
}

export interface IPersonagemNaoJogavel {
  id_personagem: number;
  descricao: string;
  fala: string;
  imgtexto: string;
  tipopnj: string;
  nome: string;
}

export interface IPersonagemJogavel {
  id_personagem: number;
  hpatual: number;
  hpmax: number;
  menteatual: number;
  mentemax: number;
  arma: "Espada Longa";
  armadura: "Cota de Malha";
  acessorio1?: string;
  acessorio2?: string;
  nome: string;
}

export interface IInventario {
  id_personagem: number;
  dinatual: number;
  dinmax: number;
  capatual: number;
  captotal: number;
}

export interface Item {
  iditem: number;
  nome: string;
  descricao: string;
  valor: number;
  peso: number;
}

export interface ItemRPG {
  nome: string;
  quantidade: number;
  valortotal: number;
  datacompra: string;
}

export interface IParte {
  idparte: number;
  idpersonagem: number;
  tipoparte: string;
  hpmax: number;
  hpatual: number;
  probacerto: string;
}
