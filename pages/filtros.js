 // Consulta o banco de dados para obter o objeto desejado
 connection.query('SELECT * FROM espaco WHERE id = 1', [1], (error, results) => {
  if (error) {
    console.error('Erro ao executar consulta: ' + error.stack);
    return;
  }

  // O objeto é retornado nos resultados
  const objeto = results[0];

  // Exibe o objeto na tela
  console.log(objeto);
});