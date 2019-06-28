module dropbox

some sig Pasta{
	arquivos : set Arquivos
}

sig Usuario{}

sig Arquivos{
	usuarios: one Usuario,
	versaoAtual : one VersaoAtual,
	versoesAntigas : some VersaoAntiga,
}

sig Data{}
sig Hora{}

abstract sig Versoes{
	data: one Data,
	hora: one Hora
}

sig VersaoAtual extends Versoes{}
sig VersaoAntiga extends Versoes{}

fact{
	all a:Arquivos | one a.~arquivos
	all h:Hora | one h.~hora
	all d:Data | one d.~data

	all v:VersaoAtual | one v.~versaoAtual
	all v:VersaoAntiga | one v.~versoesAntigas
}

pred show {}

run show for 4

