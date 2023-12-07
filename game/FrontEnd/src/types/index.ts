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
