import React, { useState, useEffect } from 'react';
import { StyleSheet, View, Text, Button, TextInput, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';


export default function DataAccount() {
  // Estado para controlar se o usuário está logado ou não
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [nome, setNome] = useState('');
  const [password, setpassword] = useState('');
  const [email, setEmail] = useState('joao.silva@example.com');
  const [novoNome, setNovoNome] = useState(nome);
  const [novoEmail, setNovoEmail] = useState(email);

  useEffect(() => {
    // Verifica se o token está armazenado no AsyncStorage para determinar o estado de login
    const checkToken = async () => {
      const userToken = await AsyncStorage.getItem('userToken');
      if (userToken) {
        setIsLoggedIn(true);
      }
    };

    checkToken();
  }, []);

  // Função para atualizar os dados da conta
  const atualizarDados = () => {
    if (!novoNome || !novoEmail) {
      Alert.alert('Erro', 'Por favor, preencha todos os campos');
      return;
    }

    // Aqui, você pode fazer uma chamada para a API para atualizar os dados
    setNome(novoNome);
    setEmail(novoEmail);
    Alert.alert('Sucesso', 'Dados atualizados com sucesso!');
  };

  // Função para sair do sistema
  const sairDoSistema = async () => {
    try {
      await AsyncStorage.removeItem('userToken'); // Remove o token
      setIsLoggedIn(false); // Altera o estado de login
      Alert.alert('Sucesso', 'Você saiu do sistema');
    } catch (error) {
      console.error('Erro ao sair do sistema', error);
      Alert.alert('Erro', 'Houve um problema ao tentar sair.');
    }
  };

  // Função de login (simulação)
  const login = async () => {
    try {
      // Simulando o login com um token
      const userToken = 'simulated-token';
      await AsyncStorage.setItem('userToken', userToken); // Armazena o token
      setIsLoggedIn(true); // Altera o estado de login
      Alert.alert('Sucesso', 'Login realizado com sucesso!');
    } catch (error) {
      Alert.alert('Erro', 'Falha ao tentar logar.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>{isLoggedIn ? 'Dados da Conta' : 'Login'}</Text>

      {isLoggedIn ? (
        // Componente de Dados da Conta
        <View style={styles.dataContainer}>
          <Text style={styles.label}>Nome:</Text>
          <TextInput
            style={styles.input}
            value={novoNome}
            onChangeText={setNovoNome}
          />

          <Text style={styles.label}>E-mail:</Text>
          <TextInput
            style={styles.input}
            value={novoEmail}
            onChangeText={setNovoEmail}
            keyboardType="email-address"
          />

          <Button title="Atualizar Dados" onPress={atualizarDados} />
          <Button title="Sair" onPress={sairDoSistema} />
        </View>
      ) : (
        // Tela de Login
        <View style={styles.dataContainer}>
          <TextInput
            style={styles.input}
            placeholder="Usuário"
            value={novoEmail}
            onChangeText={setNovoEmail}
            keyboardType="email-address"
          />

          <TextInput
            style={styles.input}
            placeholder="Senha"
            secureTextEntry
            onChangeText={(text) => setpassword(text)}
          />

          <Button title="Entrar" onPress={login} />
        </View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#f4f4f4',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  dataContainer: {
    width: '100%',
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    marginBottom: 5,
    color: '#333',
  },
  input: {
    width: '100%',
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    borderRadius: 5,
    marginBottom: 15,
    paddingLeft: 10,
  },
});
