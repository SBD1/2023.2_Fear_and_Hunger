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
