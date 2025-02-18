import React, { useState, useEffect } from 'react';
import { StyleSheet, View, Text, TextInput, Button, TouchableOpacity, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const LoginAccount: React.FC = () => {
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const [isLoggedIn, setIsLoggedIn] = useState(false); // Estado para controlar a troca de componentes

  useEffect(() => {
    // Verifica se há um token salvo no AsyncStorage
    const checkToken = async () => {
      const userToken = await AsyncStorage.getItem('userToken');
      if (userToken) {
        setIsLoggedIn(true); // Se houver token, define o estado como logado
      }
    };

    checkToken();
  }, []);

  // Função para login com e-mail e senha usando fetch
  const loginComEmailSenha = async () => {
    try {
      const response = await fetch('http://192.168.1.248:8000/api/token/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          username: email,
          password: senha,
        }),
      });

      const data = await response.json();
      const userToken = data.access; // Supondo que a resposta da API tenha um campo `access`
      await AsyncStorage.setItem('userToken', userToken); // Salvando o token no AsyncStorage

      setIsLoggedIn(true); // Mudando o estado para logado
      Alert.alert('Login', 'Login realizado com sucesso!');
    } catch (error) {
      console.error(error);
      Alert.alert('Erro', 'Falha ao fazer login. Verifique seus dados e tente novamente.');
    }
  };

  // Função para deslogar
  const logout = async () => {
    await AsyncStorage.removeItem('userToken');
    setIsLoggedIn(false); // Mudando o estado para deslogado
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>{isLoggedIn ? 'Data Account' : 'Login'}</Text>

      {isLoggedIn ? (
        // Componente de "DataAccount" exibido quando o usuário está logado
        <View>
          <Text>Bem-vindo ao Data Account</Text>
          <Button title="Logout" onPress={logout} />
        </View>
      ) : (
        // Componente de Login exibido quando o usuário não está logado
        <View>
          <TextInput
            style={styles.input}
            placeholder="Usuário"
            value={email}
            onChangeText={setEmail}
            keyboardType="email-address"
            autoCapitalize="none"
          />

          <TextInput
            style={styles.input}
            placeholder="Senha"
            value={senha}
            onChangeText={setSenha}
            secureTextEntry
          />

          <Button title="Entrar" onPress={loginComEmailSenha} />

          <TouchableOpacity onPress={() => Alert.alert('Recuperar Senha')}>
            <Text style={styles.link}>Esqueceu a senha?</Text>
          </TouchableOpacity>
        </View>
      )}
    </View>
  );
};

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
    marginBottom: 30,
  },
  input: {
    width: 250,
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    borderRadius: 5,
    marginBottom: 15,
    paddingLeft: 10,
  },
  link: {
    color: '#007BFF',
    textDecorationLine: 'underline',
  },
});

export default LoginAccount;
