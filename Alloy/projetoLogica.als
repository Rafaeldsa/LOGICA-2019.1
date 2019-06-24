module dropbox

sig Usuario {
	arquivos: set ArquivoUpado
}

sig ArquivoUpado {
	data: one Data,
	modificacao: one Data,
	uCriador: one Usuario,
	versoes: set Versao
}


sig Data {
	dia: one Dia,
}

sig Dia {
	horas: one Hora
}

sig Hora{
	minutos: one Minuto
}
sig Minuto {
	segundos: one Segundo
}
sig Segundo{}

abstract sig Versao {}
sig VersaoAtual extends Versao{}
sig VersaoAnterior extends Versao {}

fact {
	-- Definições sobre o usuário


	-- Definições sobre arquivo
	all a:ArquivoUpado | one a.~arquivos
	
	-- Definições sobre versão
	all v:Versao | one v.~versoes
	-- Definir versão atual só um arquivo e maior que 0
	-- Definir versão anterior só um arquivo


	-- Definições sobre tempo
	all d:Data | one d.~data
	all d:Dia | one d.~dia
	all h:Hora | one h.~horas
	all m:Minuto | one m.~minutos
	all s:Segundo | one s.~segundos
}

-- Criar Usuario


pred show[] {

}

run show for 3
