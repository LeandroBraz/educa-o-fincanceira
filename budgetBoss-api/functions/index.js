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




const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const functions = require('firebase-functions');
const admin = require("firebase-admin");
const app = require("express")();

admin.initializeApp();
const dbUserAtivos = admin.firestore().collection("usuariosAtivos");
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
    uuid: request.body.uuid
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

exports.api = functions.https.onRequest(app)

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
