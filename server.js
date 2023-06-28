const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

const path = require('path')

app.use(express.static('pages'));

app.use('/assets/', express.static('assets')) /* parte do tiago */
app.use('/pages/', express.static('pages')) /* parte do tiago */



const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'recout',
});

connection.connect(function (err) {
  if (!err){
    console.log("Conexão como o Banco realizada com sucesso!!!");
  } else{
    console.log("Erro: Conexão NÃO realizada", err);
  }
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/pages/recout_main.html')
})


 
app.post('/login', (req, res) => {
  let email = req.body.email;
  let senha = req.body.senha;
  
  connection.query("SELECT * FROM cliente where email = '" + email + "'" , function (err, rows, fields) {
    console.log("Results:", rows);
    if (!err) {
      if (rows.length > 0) {
        
        if ( rows[0].senha === senha) {
            res.send('Login com Sucesso!!!');
            } else {
             res.send('Senha incorreta');
            }
        
      } else {
        res.send('Login Falhou - Email não cadastrado');
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.send('Login failed');
    }
  });
});

app.post('/cadastro', (req, res) => {
  let nome = req.body.nome;
  let numero =req.body.numero;
  let cpf =req.body.cpf;
  let email = req.body.email;
  let senha = req.body.senha;
  
  connection.query( "INSERT INTO `cliente`( `nome`, `numero`, `cpf`, `email`, `senha`) VALUES  ('" + nome + "','" + sobrenome + "','" + cpf + "','" + email + "','" + senha + "')", function (err, rows, fields) {
    console.log("Results:", rows);
    if (!err) {
      console.log("Cadastro feito com sucesso!!");
      res.sendFile(__dirname + '/pages/recout_login.html')
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.send('Login failed');
    }
  });
});

app.listen(3002, () => {
  console.log('Servidor rodando na porta 3002!')
})