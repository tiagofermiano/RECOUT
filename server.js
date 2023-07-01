const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const app = express()
const oneDay = 1000 * 60 * 60 * 24;
const sessions = require('express-session');

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(sessions({
  secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
  saveUninitialized: true,
  cookie: { maxAge: oneDay },
  resave: false
}));

const path = require('path')

app.use(express.static('pages'));

// CONEXÃO COM O BANCO
// CONEXÃO COM O BANCO

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
    database: 'recout',
});

connection.connect(function (err) {
  if (!err) {
    console.log("Conexão como o Banco realizada com sucesso!!!");
  } else {
    console.log("Erro: Conexão NÃO realizada", err);
  }
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/pages/recout_perfil.html')
})

// FUNÇÕES PARA LOGIN
// FUNÇÕES PARA LOGIN

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/pages/recout_perfil.html')
})

app.get('/login', (req, res) => {
  res.sendFile(__dirname + '/pages/recout_login.html')
})

app.get('/cadastro', (req, res) => {
  res.sendFile(__dirname + '/pages/recout_cadastro.html')
})


app.post('/login', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;


  connection.query("SELECT * FROM cliente where email = '" + email + "'", function (err, rows) {
    if (!err) {
      if (email === rows[0].email && password === rows[0].password) {
        console.log('Senha OK');
        console.log(rows);
        session = req.session;
        session.id_user = req.body.email;
        console.log(req.session.id_user);
        res.redirect('/');
      } else {
        console.log('Senha errada');
        alert('Email ou senha incorreto')
      }

    }
  });

})

// FUNÇÕES PARA CADASTRO
// FUNÇÕES PARA CADASTRO

app.post('/cadastro', (req, res) => {
  let nome = req.body.nome;
  let numero = req.body.numero;
  let cpf = req.body.cpf;
  let email = req.body.email;
  let senha = req.body.senha;

  connection.query("INSERT INTO `cliente`(`nome`, `numero`, `cpf`, `email`,`senha`) VALUES  ('" + nome + "','" + numero + "','" + cpf + "','" + email + "','" + senha + "')", function (err, rows, fields) {
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

app.get('/infosperfil', (req, res) => {
  // Verificar se o usuário está autenticado
  if (!req.session.id_user) {
    res.status(401).json({ error: 'Usuário não autenticado' });
    return;
  }
  const email = req.session.id_user;
  
  connection.query(`SELECT nome, email FROM cliente WHERE email = '${email}'`, (error, results) => {
    if (error) {
      console.error('Erro ao executar consulta: ' + error.stack);
      return res.status(500).json({ error: 'Erro ao consultar banco de dados' });
    }
    const objeto = results[0];
    console.log(objeto);
    res.json(objeto);
  });
});


// CONFIGURANDO OBJETOS FILTROS
// CONFIGURANDO OBJETOS FILTROS

app.get('/dados', (req, res) => {
  connection.query('SELECT * FROM espaco WHERE id = 1', [1], (error, results) => {
    if (error) {
      console.error('Erro ao executar consulta: ' + error.stack);
      return res.status(500).json({ error: 'Erro ao consultar banco de dados' });
    }

    const objeto = results[0];
    res.json(objeto);
  });
});

app.listen(3002, () => {
    console.log('Servidor rodando na porta 3002!')
})