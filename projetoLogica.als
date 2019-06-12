module dropbox

sig Usuario {
	arquivos: set ArquivoUpado
}


sig ArquivoUpado {
	data:               one Data,
	modificacao:   one Data,
	uCriador:        one Usuario,
	versoes:          set Versao
}



sig Data {
	dia:          one Dia,
	hora:       one Hora,
	minuto :   one Minuto,
	segundo: one Segundo
}

sig Dia {}
sig Hora{}
sig Minuto {}
sig Segundo{}

abstract sig Versao {}
sig VersaoAtual extends Versao{}
sig VersaoAnterior extends Versao {}

fact {
	-- Definições sobre o usuário
	all u:Usuario | some u.arquivos

	-- Definições sobre arquivo
	all a:ArquivoUpado | one a.~arquivos
	
	-- Definições sobre versão
	all v:Versao | one v.~versoes
	-- Definir versão atual só um arquivo e maior que 0
	-- Definir versão anterior só um arquivo


	-- Definições sobre tempo
	all d:Data        | one d.~data
	all s:Segundo  | one s.~segundo
	-- Definir dia sempre tem um arquivo
	-- Definir hora sempre tem um arquivo
	-- Definir minuto sempre tem um arquivo
	-- Definir Data só um arquivo

}



pred show[] {

}

run show for 2
