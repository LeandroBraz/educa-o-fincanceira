/* eslint-disable indent */
/* eslint-disable object-curly-spacing */
/* eslint-disable comma-dangle */
/* eslint-disable key-spacing */
/* eslint-disable quotes */
/* eslint-disable semi */
/* eslint-disable space-before-function-paren */
/* eslint-disable no-multiple-empty-lines */
/* eslint-disable padded-blocks */
/* eslint-disable prefer-arrow-callback */
/* eslint-disable prefer-const */
/* eslint-disable no-unused-vars */
/* eslint-disable no-undef */
/* eslint-disable no-trailing-spaces */
/* eslint-disable camelcase */


const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const functions = require('firebase-functions');
const admin = require("firebase-admin");
const app = require("express")();

admin.initializeApp();
const dbUserAtivos = admin.firestore().collection("usuariosAtivos");
const dbDadosCompra = admin.firestore().collection("dadosCompra");
const dbTodos = admin.firestore().collection("todos");


app.get("/usuariosAtivos", function (request, response) {
  dbUserAtivos.get()
    .then(function (docs) {
      let usuariosAtivos = [];
      docs.forEach(function (doc) {
        usuariosAtivos.push({
          id: doc.id,
          ...doc.data()
        })
      })
      response.json(usuariosAtivos);
    });
})

app.get("/usuariosAtivos/:senha/:nome", function (request, response) {
  const nome = request.params.nome;
  const senha = request.params.senha;

  const query = dbUserAtivos.where('senha', '==', senha)
    .where('nome', '==', nome)
    .limit(1);

  query.get()
    .then(function (snapshot) {
      if (snapshot.empty) {
        response.status(404)
          .json({ error: 'Usuário não encontrado.' });
      } else {
        let usuarioEncontrado = null;
        snapshot.forEach(function (doc) {
          usuarioEncontrado = {
            id: doc.id,
            ...doc.data()
          };
        });
        response.json(usuarioEncontrado);
      }
    })
    .catch(function (error) {
      response.status(500)
        .json({ error: 'Ocorreu um erro ao obter o usuário.' });
    });
});

app.get("/todos", function (request, response) {
  dbTodos.get()
    .then(function (docs) {
      let todos = [];
      docs.forEach(function (doc) {
        todos.push({
          id: doc.id,
          ...doc.data()
        })
      })
      response.json(todos);
    });
})

app.post("/usuariosAtivos", function (request, response) {
  const userToAdd = {
    senha: request.body.senha,
    nome: request.body.nome,
    saldo: request.body.saldo,
    sexo: request.body.sexo,
    data_nasc: request.body.data_nasc,
    uuid: request.body.uuid, 
    fase: request.body.fase
  };

  dbUserAtivos.add(userToAdd)
    .then(function () {
      response.json({ general: "Works" });
    })
    .catch(function (error) {
      console.error("Error adding user: ", error);
      response.status(500).json({ error: "Failed to add user" });
    });
});

app.patch("/atualizarSaldo/:uuid/:saldo", function (request, response) {
  const uuid = request.params.uuid;
  const novoSaldo = parseFloat(request.params.saldo);

  if (!uuid) {
    response.status(400).json({ error: "UUID não fornecido" });
    return;
  }

  if (isNaN(novoSaldo)) {
    response.status(400).json({ error: "O saldo fornecido não é válido" });
    return;
  }

  const userRef = admin.firestore()
    .collection("usuariosAtivos")
    .where("uuid", "==", uuid);

  userRef
    .get()
    .then((querySnapshot) => {
      if (querySnapshot.empty) {
        response.status(404).json({ error: "Usuário não encontrado" });
      } else {
        const userDoc = querySnapshot.docs[0];
        userDoc.ref
          .update({ saldo: novoSaldo })
          .then(() => {
            response.json({ message: "Saldo atualizado com sucesso" });
          })
          .catch((error) => {
            console.error("Error updating saldo: ", error);
            response.status(500)
              .json(
                { error: "Falha ao atualizar saldo do usuário" });
          });
      }
    })
    .catch((error) => {
      console.error("Error fetching user: ", error);
      response.status(500).json({ error: "Falha ao consultar usuário" });
    });
});

app.patch("/atualizarFase/:uuid/:fase", function (request, response) {
  const uuid = request.params.uuid;
  const fase = (request.params.fase);

  if (!uuid) {
    response.status(400).json({ error: "UUID não fornecido" });
    return;
  }

  const userRef = admin.firestore()
    .collection("usuariosAtivos")
    .where("uuid", "==", uuid);

  userRef
    .get()
    .then((querySnapshot) => {
      if (querySnapshot.empty) {
        response.status(404).json({ error: "Usuário não encontrado" });
      } else {
        const userDoc = querySnapshot.docs[0];
        userDoc.ref
          .update({ fase: fase })
          .then(() => {
            response.json({ message: "Fase atualizada com sucesso" });
          })
          .catch((error) => {
            console.error("Error updating fase: ", error);
            response.status(500)
              .json(
                { error: "Falha ao atualizar fase do usuário" });
          });
      }
    })
    .catch((error) => {
      console.error("Error fetching user: ", error);
      response.status(500).json({ error: "Falha ao consultar usuário" });
    });
});


app.post("/dadosCompra", function (request, response) {
  const saleToAdd = {
    uuid: request.body.uuid,
    uuid_usuario: request.body.uuid_usuario,
    canal_youtube: request.body.canal_youtube,
    canal_twitter: request.body.canal_twitter,
    canal_instagram: request.body.canal_instagram,
    canal_facebook: request.body.canal_facebook,
    produto_servicos: request.body.produto_servicos,
    produto_emergencia: request.body.produto_emergencia,
    produto_duraveis: request.body.produto_duraveis,
    produto_especiais: request.body.produto_especiais
  };

  dbDadosCompra.add(saleToAdd)
    .then(function () {
      response.json({ general: "Works" });
    })
    .catch(function (error) {
      console.error("Error adding user: ", error);
      response.status(500).json({ error: "Failed to add dados compra" });
    });
});

app.patch("/atualizarinformacao/:uuid_usuario/:dadoParaAtualizacao/:tipo",
  function (request, response) {

    const uuid_usuario = request.params.uuid_usuario;
    const tipo = request.params.tipo;
    
    let dadoParaAtualizacao;

    if (request.params.dadoParaAtualizacao === "true") {
      dadoParaAtualizacao = true;
    } else if (request.params.dadoParaAtualizacao === "false") {
      dadoParaAtualizacao = false;
    } else {
      dadoParaAtualizacao = parseFloat(request.params.dadoParaAtualizacao);
    }

    if (!uuid_usuario) {
      response.status(400).json({ error: "UUID não fornecido" });
      return;
    }

    const userRef = admin.firestore()
      .collection("dadosCompra")
      .where("uuid_usuario", "==", uuid_usuario);

    userRef
      .get()
      .then((querySnapshot) => {
        if (querySnapshot.empty) {
          response.status(404).json({ error: "Usuário não encontrado" });
        } else {
          const propiedadeName = tipo

          const userDoc = querySnapshot.docs[0];
          userDoc.ref
            .update({ [propiedadeName]: dadoParaAtualizacao })
            .then(() => {
              response.json({ message: "dado atualizado com sucesso" });
            })
            .catch((error) => {
              console.error("Error updating dado: ", error);
              response.status(500)
                .json(
                  { error: "Falha ao atualizar dado do dado" });
            });
        }
      })
      .catch((error) => {
        console.error("Error fetching user: ", error);
        response.status(500).json({ error: "Falha ao consultar dadoss" });
      });
  });

app.get("/dadosCompra/:uuid_usuario/", function (request, response) {
  const uuid_usuario = request.params.uuid_usuario;

  const query = dbDadosCompra.where('uuid_usuario', '==', uuid_usuario)
    .limit(1);

  query.get()
    .then(function (snapshot) {
      if (snapshot.empty) {
        response.status(404)
          .json({ error: 'dados não encontrado.' });
      } else {
        let usuarioEncontrado = null;
        snapshot.forEach(function (doc) {
          usuarioEncontrado = {
            id: doc.id,
            ...doc.data()
          };
        });
        response.json(usuarioEncontrado);
      }
    })
    .catch(function (error) {
      response.status(500)
        .json({ error: 'Ocorreu um erro ao obter os Dados.' });
    });
});

exports.api = functions.https.onRequest(app)

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
