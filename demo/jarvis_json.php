<?php

header('Content-Type: text/html; charset=utf-8');


 

include 'conexao.php';

$conexao = new ConexaoBD('mysql');

extract($_GET);

switch ($action) {
	case 'addPergunta':

		$sql_pergunta = $conexao->sql("SELECT * FROM perguntas WHERE pergunta LIKE '%$pergunta%'");
		$qtd_pergunta = $conexao->numRows($sql_pergunta);

		if ($qtd_pergunta>0) {
			$sql_pergunta = $conexao->sql("SELECT * FROM perguntas WHERE pergunta LIKE '%$pergunta%'");
			$r_pergunta = $conexao->retorno($sql_pergunta);	
			$id_pergunta = $r_pergunta['id'];
		} else {
			$insert = array('pergunta' => $pergunta );
			$conexao->mysql_insert('perguntas',$insert);

			$id_pergunta = $conexao->mysql_lastid();
			
		}

		$retorno['pergunta'] = $pergunta;
		$retorno['id_pergunta'] = $id_pergunta;
		

		echo json_encode($retorno);
		break;
	
	case 'addResposta':
		$insert = array('id_pergunta' => $id_pergunta,
						 'resposta' => str_replace("'", "", $resposta ) );
		
		$conexao->mysql_insert('respostas',$insert);

		$retorno['pergunta'] = $pergunta;
		$retorno['id_pergunta'] = $id_pergunta;
		$retorno['resposta'] = $resposta;
		echo json_encode($retorno);
		break;

	case 'responder':
	// echo "SELECT * FROM perguntas WHERE pergunta LIKE '%$pergunta%'";
		$sql_pergunta = $conexao->sql("SELECT * FROM perguntas WHERE pergunta LIKE '%$pergunta%'");
		$qtd_pergunta = $conexao->numRows($sql_pergunta);
		

		if ($qtd_pergunta>0) {
			$sql_pergunta = $conexao->sql("SELECT * FROM perguntas WHERE pergunta LIKE '%$pergunta%'");
			$pergunta = $conexao->retorno($sql_pergunta);
			$id_pergunta = $pergunta['id'];

			$sql_resposta = $conexao->sql("SELECT * FROM respostas WHERE id_pergunta= '$id_pergunta' ORDER BY RAND() LIMIT 1");
			$resposta = $conexao->retorno($sql_resposta);

			$retorno['resposta'] = $resposta['resposta'];
		} else {
			$retorno['resposta'] = 'Não sei te responder';
		}

		echo json_encode($retorno);
		break;
}
 ?>