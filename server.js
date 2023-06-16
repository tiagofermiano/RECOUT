const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

const path = require('path')
app.use('/assets/', express.static('assets'))
app.use('/images/', express.static('images'))
app.use('/icones/', express.static('icones'))

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'recout',
});

console.log (connection)

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

app.get('/login', (req, res) => {
  res.sendFile(__dirname + '/pages/recout_login.html')
})
 
app.post('/login', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;
  
  connection.query("SELECT * FROM usuario where email = '" + email + "'" , function (err, rows, fields) {
    console.log("Results:", rows);
    if (!err) {
      if (rows.length > 0) {
        
        if ( rows[0].senha === password) {
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
app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000!')
})